#!/usr/bin/env python3
"""从仿真文本日志绘制 switch 8 四个端口的 granted_credit 折线图。

安装依赖：python3 -m pip install numpy matplotlib
运行示例：python3 plot_granted_credit.py
阶梯折线：python3 plot_granted_credit.py --step

日志路径固定在下面的 LOG_PATH 中，保留服务器上的日志位置。
默认图片也保存到脚本同目录，可在无图形界面的 Linux 服务器上运行。

四个端口各自绘制一条线，放在同一张图中，不堆叠，不绘制 credit_pool。
granted_credit 是当前状态值，不是增量，不能沿时间累加。
每条相关记录更新该端口和共享池，其余端口保持最近值；同一时刻
保留按日志顺序更新后的最终状态。所有端口都有观测后才开始画图。
默认将日志 Time 解释为 ns，并以 us 显示；可用参数修改时间单位。
"""

import argparse
from pathlib import Path
import re


SCRIPT_DIR = Path(__file__).resolve().parent
# 固定日志路径，不通过命令行传入，也不受启动时的工作目录影响。
# 如果日志在服务器的其他位置，可改为：LOG_PATH = Path("/data/logs/2-star-topo.out")
LOG_PATH = Path("/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-buffer-oversubscription/examples/SharedCredit-FC/2-star-topo/monitor_output/2-star-topo.out")

PORT_ORDER = (4, 3, 2, 1)
FIELD_PATTERN = re.compile(
    r"\b(Time|node|port|granted_credit|credit_pool)\s+(\S+)"
)
SECONDS_PER_UNIT = {"ns": 1e-9, "us": 1e-6, "ms": 1e-3, "s": 1.0}


def read_snapshots(log_path, switch_id=8):
    """返回 [(time, port4, port3, port2, port1, pool), ...] 和记录数量。"""
    current = {port: None for port in PORT_ORDER}
    snapshots = []
    matched_records = 0
    previous_time = None

    with Path(log_path).open("r", encoding="utf-8", errors="replace") as log:
        for line_number, line in enumerate(log, start=1):
            if "granted_credit" not in line or "credit_pool" not in line:
                continue
            fields = dict(FIELD_PATTERN.findall(line))
            if fields.get("node") != str(switch_id):
                continue
            try:
                time = int(fields["Time"])
                port = int(fields["port"])
                granted = int(fields["granted_credit"])
                pool = int(fields["credit_pool"])
            except (KeyError, ValueError) as exc:
                raise ValueError(
                    f"第 {line_number} 行的时间、端口或 credit 字段无效。"
                ) from exc
            if min(time, granted, pool) < 0:
                raise ValueError(f"第 {line_number} 行出现负时间或负 credit。")
            if previous_time is not None and time < previous_time:
                raise ValueError(
                    f"第 {line_number} 行时间倒退：{time} < {previous_time}；"
                    "请检查是否拼接了多次仿真日志。"
                )
            previous_time = time
            matched_records += 1

            if port in current:
                current[port] = granted
            # credit_pool 属于交换机，只使用本条日志的最新值，不能按端口求和。
            # 未观测到的端口不能假定为 0；等待所有端口至少出现一次。
            if any(value is None for value in current.values()):
                continue
            snapshot = (time, *(current[p] for p in PORT_ORDER), pool)
            if snapshots and snapshots[-1][0] == time:
                snapshots[-1] = snapshot
            else:
                snapshots.append(snapshot)

    if not snapshots:
        missing = [str(p) for p, value in current.items() if value is None]
        raise ValueError(
            f"未找到 switch {switch_id} 的完整 credit 状态；"
            f"缺少端口：{', '.join(missing)}。"
        )
    return snapshots, matched_records


def plot_snapshots(snapshots, output_path, switch_id, input_unit, display_unit,
                   linear=True):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    from matplotlib.ticker import FuncFormatter, MaxNLocator
    import numpy as np

    data = np.asarray(snapshots, dtype=np.float64)
    time = data[:, 0] * (SECONDS_PER_UNIT[input_unit] / SECONDS_PER_UNIT[display_unit])
    # 只取四个端口的原始状态值，排除最后一列 credit_pool。
    values = data[:, 1:1 + len(PORT_ORDER)]
    colors = ("#3978B8", "#329B91", "#E5A34B", "#9271B2")
    labels = [f"port{p} granted_credit" for p in PORT_ORDER]

    with plt.rc_context({"font.family": "DejaVu Sans", "font.size": 11,
                         "axes.spines.top": False, "axes.spines.right": False,
                         "axes.edgecolor": "#CBD2DA", "text.color": "#243547",
                         "axes.labelcolor": "#243547", "xtick.color": "#526172",
                         "ytick.color": "#526172"}):
        fig, ax = plt.subplots(figsize=(14, 7.2), dpi=180)
        fig.subplots_adjust(left=0.085, right=0.975, bottom=0.14, top=0.77)
        fig.text(0.085, 0.93, f"Switch {switch_id} | Granted credit by port",
                 fontsize=22, weight="bold")
        fig.text(0.085, 0.882,
                 "Four ports on one axis; each line shows its own granted_credit",
                 fontsize=11, color="#526172")

        for index, (label, color) in enumerate(zip(labels, colors)):
            ax.plot(time, values[:, index], color=color, linewidth=1.4, label=label,
                    drawstyle="default" if linear else "steps-post",
                    marker="o" if len(time) == 1 else None, markersize=4)

        ax.set_xlabel(f"Time ({display_unit})", labelpad=12)
        ax.set_ylabel("Granted credit (bytes)", labelpad=12)
        ax.yaxis.set_major_formatter(FuncFormatter(lambda value, _: f"{value:,.0f}"))
        ax.yaxis.set_major_locator(MaxNLocator(nbins=6))
        ax.grid(axis="y", color="#DFE5EA", linewidth=0.7)
        ax.set_axisbelow(True)
        ax.set_ylim(0, max(float(values.max()), 1) * 1.035)
        if len(time) > 1:
            ax.set_xlim(time[0], time[-1])
        else:
            ax.set_xlim(time[0] - 0.5, time[0] + 0.5)
        ax.legend(loc="lower left", bbox_to_anchor=(0, 1.025), ncol=4,
                  frameon=False, fontsize=10, borderaxespad=0,
                  handlelength=2, columnspacing=1.5)
        mode = "Linear interpolation" if linear else "Step plot; values held until next update"
        fig.text(0.085, 0.045,
                 f"{mode}.  Each line = one port's granted credit in bytes.",
                 fontsize=10, color="#657384")

        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        fig.savefig(output_path, dpi=200, facecolor="white")
        plt.close(fig)


def main():
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("-o", "--output", type=Path,
                        help="输出路径，支持 .png/.svg/.pdf；默认保存到脚本同目录")
    parser.add_argument("--switch-id", type=int, default=8, help="交换机编号，默认：8")
    parser.add_argument("--input-time-unit", choices=SECONDS_PER_UNIT, default="ns",
                        help="日志 Time 的单位，默认按 ns 解释")
    parser.add_argument("--time-unit", choices=SECONDS_PER_UNIT, default="us",
                        help="图上时间单位，默认：us")
    style = parser.add_mutually_exclusive_group()
    style.add_argument("--linear", dest="linear", action="store_true",
                       help="使用普通折线连接观测点（默认）")
    style.add_argument("--step", dest="linear", action="store_false",
                       help="使用阶梯线，保持状态值直到下次更新")
    parser.set_defaults(linear=True)
    args = parser.parse_args()
    output = args.output or SCRIPT_DIR / f"switch{args.switch_id}_granted_credit.png"
    if output.resolve() == LOG_PATH.resolve():
        parser.error("输出路径不能与输入日志相同。")
    try:
        snapshots, count = read_snapshots(LOG_PATH, args.switch_id)
        plot_snapshots(snapshots, output, args.switch_id, args.input_time_unit,
                       args.time_unit, args.linear)
    except ImportError:
        parser.exit(1, "缺少绘图库，请运行：python3 -m pip install numpy matplotlib\n")
    except (OSError, ValueError) as exc:
        parser.exit(1, f"错误：{exc}\n")

    print(f"switch {args.switch_id}: {count} 条记录，{len(snapshots)} 个时间点")
    print(f"Time 范围：{snapshots[0][0]}–{snapshots[-1][0]} {args.input_time_unit}")
    for index, port in enumerate(PORT_ORDER, start=1):
        values = [row[index] for row in snapshots]
        print(f"port{port} granted_credit：{min(values)}–{max(values)} bytes")
    print(f"已生成：{output.resolve()}")


if __name__ == "__main__":
    main()
