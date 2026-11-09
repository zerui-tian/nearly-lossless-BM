import argparse
import os
import warnings

warnings.filterwarnings("ignore", message="Unable to import Axes3D.*")
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
REPO_ROOT = os.path.realpath(os.path.join(SCRIPT_DIR, "../../.."))
DEFAULT_DATA = os.path.join(
    REPO_ROOT,
    "ns-3/simulator/result/data/2-to-1-incast/flowthroughput.txt",
)
DEFAULT_GRAPH = os.path.join(
    REPO_ROOT,
    "ns-3/simulator/result/graph/2-to-1-incast-flow-throughput.png",
)
DEFAULT_SUMMARY = os.path.join(
    REPO_ROOT,
    "ns-3/simulator/result/data/2-to-1-incast/throughput-summary.csv",
)

FLOW_LABELS = {
    10000: "Flow 0 -> 2 (port 10000)",
    10001: "Flow 1 -> 2 (port 10001)",
}
COLORS = {
    10000: "#2274A5",
    10001: "#C23B22",
}
LINE_STYLES = {
    10000: (0, (4, 2)),
    10001: (0, (2, 1)),
}

plt.rcParams.update(
    {
        "font.size": 12,
        "axes.titlesize": 13,
        "axes.labelsize": 12,
        "xtick.labelsize": 11,
        "ytick.labelsize": 11,
        "legend.fontsize": 10,
    }
)


def parse_args():
    parser = argparse.ArgumentParser(
        description="Analyze per-flow throughput for the 2-to-1 incast experiment."
    )
    parser.add_argument("--input", default=DEFAULT_DATA, help="flowthroughput.txt path")
    parser.add_argument("--output", default=DEFAULT_GRAPH, help="output graph path")
    parser.add_argument("--summary", default=DEFAULT_SUMMARY, help="output CSV path")
    parser.add_argument("--sid", type=int, default=3, help="shared-link sender node")
    parser.add_argument("--rid", type=int, default=2, help="shared-link receiver node")
    parser.add_argument(
        "--flow-ids", type=int, nargs="+", default=[10000, 10001], help="flow IDs"
    )
    return parser.parse_args()


def load_link_data(file_path, sid, rid, flow_ids):
    columns = ["sid", "rid", "flow_id", "throughput_Gbps", "time_ns"]
    data = pd.read_csv(file_path, sep=r"\s+", names=columns)
    data = data[
        (data["sid"] == sid)
        & (data["rid"] == rid)
        & (data["flow_id"].isin(flow_ids))
    ].copy()
    if data.empty:
        raise ValueError(
            f"No samples found for link {sid}->{rid} and flow IDs {flow_ids}"
        )

    missing = sorted(set(flow_ids) - set(data["flow_id"].unique()))
    if missing:
        raise ValueError(f"No samples found for flow IDs: {missing}")

    data["time_us"] = data["time_ns"] / 1_000.0
    return data.sort_values(["time_ns", "flow_id"])


def summarize(data, flow_ids, link_capacity_gbps=100.0):
    rows = []
    for flow_id in flow_ids:
        samples = data[data["flow_id"] == flow_id]
        active = samples[samples["throughput_Gbps"] > 0]
        if active.empty:
            rows.append(
                {
                    "flow_id": flow_id,
                    "active_samples": 0,
                    "mean_active_Gbps": 0.0,
                    "std_active_Gbps": 0.0,
                    "peak_Gbps": 0.0,
                    "first_active_us": np.nan,
                    "last_active_us": np.nan,
                }
            )
            continue

        rows.append(
            {
                "flow_id": flow_id,
                "active_samples": len(active),
                "mean_active_Gbps": active["throughput_Gbps"].mean(),
                "std_active_Gbps": active["throughput_Gbps"].std(ddof=0),
                "peak_Gbps": active["throughput_Gbps"].max(),
                "first_active_us": active["time_us"].min(),
                "last_active_us": active["time_us"].max(),
            }
        )

    summary = pd.DataFrame(rows)
    rates = data.pivot_table(
        index="time_ns",
        columns="flow_id",
        values="throughput_Gbps",
        aggfunc="sum",
        fill_value=0.0,
    ).reindex(columns=flow_ids, fill_value=0.0)
    active_rates = rates[rates.sum(axis=1) > 0]
    if not active_rates.empty:
        numerator = active_rates.sum(axis=1) ** 2
        denominator = len(flow_ids) * (active_rates**2).sum(axis=1)
        fairness = (numerator / denominator.replace(0, np.nan)).mean()
        mean_total = active_rates.sum(axis=1).mean()
    else:
        fairness = np.nan
        mean_total = 0.0

    aggregate = {
        "mean_total_Gbps": mean_total,
        "mean_link_utilization_pct": mean_total / link_capacity_gbps * 100.0,
        "mean_jain_fairness": fairness,
    }
    return summary, aggregate


def plot_rates(data, flow_ids, output_path, sid, rid):
    fig, axis = plt.subplots(figsize=(7.2, 3.8))
    for flow_id in flow_ids:
        samples = data[data["flow_id"] == flow_id]
        axis.plot(
            samples["time_us"],
            samples["throughput_Gbps"],
            linewidth=1.6,
            color=COLORS.get(flow_id),
            linestyle=LINE_STYLES.get(flow_id, "--"),
            label=FLOW_LABELS.get(flow_id, f"Flow {flow_id}"),
        )

    axis.set_title(f"2-to-1 incast on shared link {sid} -> {rid}")
    axis.set_xlabel("Time (us)")
    axis.set_ylabel("Throughput (Gbps)")
    axis.set_ylim(bottom=0)
    axis.set_xlim(left=0)
    axis.grid(True, linestyle="--", alpha=0.45)
    axis.legend(frameon=False, ncol=2, loc="upper center")
    fig.tight_layout()

    os.makedirs(os.path.dirname(os.path.realpath(output_path)), exist_ok=True)
    fig.savefig(output_path, dpi=300, bbox_inches="tight")
    plt.close(fig)


def main():
    args = parse_args()
    data = load_link_data(args.input, args.sid, args.rid, args.flow_ids)
    summary, aggregate = summarize(data, args.flow_ids)

    os.makedirs(os.path.dirname(os.path.realpath(args.summary)), exist_ok=True)
    summary.to_csv(args.summary, index=False, float_format="%.3f")
    plot_rates(data, args.flow_ids, args.output, args.sid, args.rid)

    print(summary.to_string(index=False, float_format=lambda value: f"{value:.3f}"))
    print(
        "Aggregate: "
        f"mean total={aggregate['mean_total_Gbps']:.3f} Gbps, "
        f"utilization={aggregate['mean_link_utilization_pct']:.2f}%, "
        f"Jain fairness={aggregate['mean_jain_fairness']:.4f}"
    )
    print(f"Graph:   {args.output}")
    print(f"Summary: {args.summary}")


if __name__ == "__main__":
    main()
