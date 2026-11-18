import os
import pandas as pd
import matplotlib.pyplot as plt


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
REPO_ROOT = os.path.realpath(os.path.join(SCRIPT_DIR, "../../.."))
save_dir = os.path.join("/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-buffer-oversubscription/examples/SharedCredit-FC/2-star-topo")
os.makedirs(save_dir, exist_ok=True)

# ================= 颜色配置（与 sendingrate 完全一致） =================
COLORS = [
    '#2274A5',
    '#32936F',
    '#FFBF00',
    '#C00000',
]

# ================= 字体配置 =================
plt.rcParams.update({
    "font.size": 17,
    "axes.titlesize": 17,
    "axes.labelsize": 17,
    "xtick.labelsize": 17,
    "ytick.labelsize": 17,
    "legend.fontsize": 17,
})

# ================================
# 2. 绘图函数
# ================================
def plot_flowthroughput(
    file_path,
    save_path,
    target_sid,
    target_rid,
    flow_ids
):
    """
    绘制指定 sid / rid 下多个 flow 的 throughput 曲线
    """

    df = pd.read_csv(
        file_path,
        sep=r"\s+",
        names=["sid", "rid", "flow_id", "throughput_Gbps", "time_ns"],
    )

    # ======= 筛选 sid / rid =======
    df = df[(df["sid"] == target_sid) & (df["rid"] == target_rid)]

    if df.empty:
        print("[跳过] 无匹配 sid/rid 数据")
        return

    # ======= 时间单位转换 =======
    df["time_ms"] = df["time_ns"] / 1e3

    # flow_id 排序，保证颜色稳定
    flow_ids = sorted(flow_ids)

    plt.figure(figsize=(4.5, 3))

    for idx, fid in enumerate(flow_ids):
        flow_df = df[df["flow_id"] == fid]
        if flow_df.empty:
            continue

        plt.plot(
            flow_df["time_ms"],
            flow_df["throughput_Gbps"],
            linewidth=2,
            color=COLORS[idx],
            label=f"flow {fid}"   # ✅ 统一命名
        )

    # ================= 坐标与风格 =================
    plt.xlabel("Time (μs)")
    plt.ylabel("Throughput (Gbps)")
    plt.ylim(0, 100)
    plt.xlim(0, 500)

    plt.grid(True, linestyle="--", alpha=0.6)
    
    plt.legend(
        loc='upper center',
        bbox_to_anchor=(0.5, 1),
        frameon=False,
        ncol=2,
        borderaxespad=0.1,
        columnspacing=0.6,
        handletextpad=0.3,
        labelspacing=0.12
    )

    plt.savefig(save_path, dpi=300, bbox_inches="tight")
    plt.close()

    print("[OK] 保存图像:", save_path)


# ================================
# 3. 主流程
# ================================
# ================================
# 3. 主流程：分别绘制四个方向
# ================================
file_path = (
    "/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/"
    "result/data/2-star-topo/flowthroughput.txt"
)

if not os.path.isfile(file_path):
    raise FileNotFoundError(f"找不到吞吐量数据文件：{file_path}")

# (源侧交换机, 中心交换机, flow_id, 方向名称)
tasks = [
    (4, 8, 10000, "0-to-1"),
    (5, 8, 10001, "1-to-2"),
    (6, 8, 10002, "2-to-3"),
    (7, 8, 10003, "3-to-0"),
]

for sid, rid, fid, direction in tasks:
    save_path = os.path.join(
        save_dir,
        f"flow-throughput-{direction}-{fid}.png"
    )

    plot_flowthroughput(
        file_path=file_path,
        save_path=save_path,
        target_sid=sid,
        target_rid=rid,
        flow_ids=[fid],
    )

print("\nThroughput draw finish")
