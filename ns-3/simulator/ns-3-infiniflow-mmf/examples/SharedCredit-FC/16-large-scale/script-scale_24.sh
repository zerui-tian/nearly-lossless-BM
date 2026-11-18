
SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

CONFIG_FILE="$SCRIPT_DIR/../config.sh"
source "$CONFIG_FILE"

HEADER_FILE="$NS3/src/point-to-point/model/global-config.h"

Q_CNT_VALUE=1000
F_CNT_VALUE=1000
P_CNT_VALUE=64

modelNames=("W3" "W4")
loadNums=("40" "80")

# 基准容量：1,600,000 字节
BUFFER_BASE=$((64 * 2 * 100 * 1000 / 8))

# 使用整数表示倍数的 10 倍，避免 Bash 浮点计算
# 对应：0.2、0.6、1.0、1.4、1.8、2.2
BUFFER_FACTORS_X10=(2 6 10 14 18 22)

# 基础路径
base_dir="$EXAMPLE_DIR/16-large-scale"
config_dir="$base_dir/16-large-scale_config_temp"
flow_dir="$base_dir/flow"
output_dir="$OUTPUT/16-large-scale/infiniflow-mmf"
config_template="$config_dir/config-scale-common.txt"
config_file="$config_dir/config-scale.txt"

mkdir -p "$output_dir/fct" \
         "$output_dir/output" \
         "$output_dir/qlen" \

# 检查必要文件
for required_file in "$HEADER_FILE" "$config_template"; do
    if [[ ! -f "$required_file" ]]; then
        echo "Required file not found: $required_file" >&2
        exit 1
    fi
done

# 修改头文件中的宏定义
sed -i "s/#define Q_CNT [0-9]*/#define Q_CNT $Q_CNT_VALUE/" "$HEADER_FILE"
sed -i "s/#define F_CNT [0-9]*/#define F_CNT $F_CNT_VALUE/" "$HEADER_FILE"
sed -i "s/#define P_CNT [0-9]*/#define P_CNT $P_CNT_VALUE/" "$HEADER_FILE"
sed -i "s/#define OUTPUT_1 [0-9]*/#define OUTPUT_1 0/" "$HEADER_FILE"

cd "$NS3" || {
    echo "Failed to enter NS3 directory"
    exit 1
}

# BUFFER_SIZE 从配置读取，因此只需编译一次
./waf || {
    echo "Compilation failed"
    exit 1
}

completed_runs=0
failed_runs=0
skipped_runs=0

for model in "${modelNames[@]}"; do
    for load in "${loadNums[@]}"; do

        flow_file="$flow_dir/${model}_load${load}.txt"

        if [[ ! -f "$flow_file" ]]; then
            echo "Warning: Flow file $flow_file not found, skipping..."
            skipped_runs=$((skipped_runs + ${#BUFFER_FACTORS_X10[@]}))
            continue
        fi

        # 按负载选择监控参数，替代原来未定义的 trace_idx
        if [[ "$load" == "40" ]]; then
            QLEN_DUMP_INTERVAL=50000
            QLEN_MON_INTERVAL=5000
            QLEN_MON_END=5000000
        else
            QLEN_DUMP_INTERVAL=30000
            QLEN_MON_INTERVAL=3000
            QLEN_MON_END=3000000
        fi

        # 每个模型、负载组合遍历 6 档 buffer
        for factor_x10 in "${BUFFER_FACTORS_X10[@]}"; do

            buffer_size=$((BUFFER_BASE * factor_x10 / 10))
            run_tag="${model}_load${load}_buffer${buffer_size}"

            echo "=================================="
            echo "Running experiment: $run_tag"
            echo "BUFFER_SIZE: $buffer_size bytes"
            echo "=================================="

            # 生成配置文件
            {
                # 先删除公共配置中将被覆盖的配置项，避免重复
                awk '
                    !($1 ~ /^(FLOW_FILE|FCT_OUTPUT_FILE|QLEN_MON_FILE|QLEN_DUMP_INTERVAL|QLEN_MON_INTERVAL|QLEN_MON_END|BUFFER_SIZE)$/)
                ' "$config_template"

                printf '\n'
                echo "FLOW_FILE $flow_file"
                echo "FCT_OUTPUT_FILE $output_dir/fct/${run_tag}.txt"
                echo "QLEN_MON_FILE $output_dir/qlen/${run_tag}.txt"
                echo "QLEN_DUMP_INTERVAL $QLEN_DUMP_INTERVAL"
                echo "QLEN_MON_INTERVAL $QLEN_MON_INTERVAL"
                echo "QLEN_MON_END $QLEN_MON_END"
                echo "BUFFER_SIZE $buffer_size"
            } > "$config_file"

            # 运行实验，标准输出和错误输出均保存到日志
            if ./waf --run "16-large-scale --conf=$config_file" \
                > "$output_dir/output/${run_tag}.out" 2>&1; then

                completed_runs=$((completed_runs + 1))
                echo "Experiment $run_tag completed successfully"
            else
                failed_runs=$((failed_runs + 1))
                echo "Experiment $run_tag failed!"
                echo "See: $output_dir/output/${run_tag}.out"
            fi

        done
    done
done

echo "##################################"
echo "Completed: $completed_runs"
echo "Failed:    $failed_runs"
echo "Skipped:   $skipped_runs"
echo "##################################"

if (( failed_runs > 0 || skipped_runs > 0 )); then
    exit 1
fi