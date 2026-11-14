#!/usr/bin/env python3
"""绘制 switch 8 四个端口的 parked_credit 普通折线图（不堆叠）。

安装依赖：python3 -m pip install matplotlib
运行：python3 plot_parked_credit.py

日志路径固定在 LOG_PATH，默认读取脚本同目录的 2-star-topo.out。
支持无桌面环境的 Linux 服务器；图片默认保存到脚本同目录。
每个端口独立解析并绘制。同端口同时间取最后一条记录，普通折线
连接相邻观测点，不求累计和，也不使用 total_parked_credit。
"""

from pathlib import Path
import re
import sys


# ===== 可修改的配置 =====
SCRIPT_DIR = Path(__file__).resolve().parent
LOG_PATH = Path("/home/pnic/bm/nearly-lossless-BM/ns-3/simulator/ns-3-buffer-oversubscription/examples/SharedCredit-FC/2-star-topo/monitor_output/2-star-topo.out")

# 如需使用服务器上的绝对路径，将上一行改为：
# LOG_PATH = Path("/data/logs/2-star-topo.out")
SWITCH_ID = 8
PORTS = (1, 2, 3, 4)
OUTPUT_PATH = SCRIPT_DIR / f"switch{SWITCH_ID}_parked_credit.png"
TIME_SCALE = 1e-3  # 默认原始 Time 单位为 ns，乘以 1e-3 转为 us。
TIME_UNIT = "us"

# 单词边界确保 parked_credit 不会匹配到 total_parked_credit。
FIELD_PATTERN = re.compile(r"\b(Time|node|port|parked_credit)\s+(\S+)")


def read_port_data(log_path, switch_id=SWITCH_ID, ports=PORTS):
    """返回 {端口: [(原始时间, parked_credit), ...]} 和有效日志条数。"""
    series = {port: [] for port in ports}
    count = 0
    previous_time = None
    with Path(log_path).open("r", encoding="utf-8", errors="replace") as stream:
        for line_number, line in enumerate(stream, 1):
            if "parked_credit" not in line:
                continue
            fields = dict(FIELD_PATTERN.findall(line))
            if fields.get("node") != str(switch_id) or "parked_credit" not in fields:
                continue
            try:
                port = int(fields["port"])
                if port not in series:
                    continue
                time = int(fields["Time"])
                credit = int(fields["parked_credit"])
            except (KeyError, ValueError) as exc:
                raise ValueError(f"第 {line_number} 行的时间、端口或 parked_credit 无效。") from exc
            if time < 0 or credit < 0:
                raise ValueError(f"第 {line_number} 行出现负时间或负 parked_credit。")
            if previous_time is not None and time < previous_time:
                raise ValueError(f"第 {line_number} 行时间倒退，请检查是否拼接了多次仿真日志。")
            previous_time = time
            count += 1
            points = series[port]
            if points and points[-1][0] == time:
                points[-1] = (time, credit)
            else:
                points.append((time, credit))

    missing = [str(port) for port, points in series.items() if not points]
    if missing:
        raise ValueError(
            f"switch {switch_id} 缺少端口 {', '.join(missing)} 的 parked_credit 数据。"
        )
    return series, count


def draw_port_data(series, output_path):
    import matplotlib
    matplotlib.use("Agg")  # 无需 DISPLAY 或图形界面。
    import matplotlib.pyplot as plt
    from matplotlib.ticker import StrMethodFormatter

    colors = ("#3978B8", "#DA8541", "#329B91", "#9271B2")
    line_styles = ("-", "--", "-.", ":")
    with plt.rc_context({"font.family": "DejaVu Sans", "font.size": 11,
                         "axes.spines.top": False, "axes.spines.right": False}):
        fig, ax = plt.subplots(figsize=(13, 6), constrained_layout=True)
        for index, (port, points) in enumerate(series.items()):
            times = [time * TIME_SCALE for time, _ in points]
            credits = [credit for _, credit in points]
            ax.plot(times, credits, label=f"port{port}",
                    color=colors[index % len(colors)],
                    linestyle=line_styles[index % len(line_styles)],
                    linewidth=1.5, alpha=0.9,
                    marker="o" if len(points) == 1 else None)
        ax.set_title(f"Switch {SWITCH_ID} | Parked credit by port", pad=18,
                     fontsize=17, fontweight="bold", loc="left")
        ax.set_xlabel(f"Time ({TIME_UNIT})")
        ax.set_ylabel("parked_credit")
        ax.yaxis.set_major_formatter(StrMethodFormatter("{x:,.0f}"))
        peak = max(value for points in series.values() for _, value in points)
        ax.set_ylim(0, max(peak, 1) * 1.15)  # 顶部留出图例空间，避免遮挡折线。
        ax.margins(x=0.01)
        ax.grid(True, color="#DFE5EA", linewidth=0.7, alpha=0.8)
        ax.set_axisbelow(True)
        ax.legend(ncol=4, loc="upper right", frameon=True)
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        fig.savefig(output_path, dpi=200, facecolor="white")
        plt.close(fig)


def main():
    try:
        if OUTPUT_PATH.resolve() == LOG_PATH.resolve():
            raise ValueError("输出路径不能与输入日志相同。")
        series, count = read_port_data(LOG_PATH)
        draw_port_data(series, OUTPUT_PATH)
    except ImportError:
        sys.exit("缺少绘图库，请运行：python3 -m pip install matplotlib")
    except (OSError, ValueError) as exc:
        sys.exit(f"错误：{exc}")
    print(f"switch {SWITCH_ID}: 读取 {count} 条 parked_credit 记录")
    for port, points in series.items():
        values = [value for _, value in points]
        print(f"port{port}: {len(points)} 个时间点，parked_credit 范围 {min(values)}–{max(values)}")
    print(f"已生成：{OUTPUT_PATH}")


if __name__ == "__main__":
    main()
