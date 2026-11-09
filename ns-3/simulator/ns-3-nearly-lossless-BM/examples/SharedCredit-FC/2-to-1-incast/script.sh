#!/usr/bin/env bash

set -euo pipefail

SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

CONFIG_FILE="$SCRIPT_DIR/../config.sh"
source "$CONFIG_FILE"

config_file="$SCRIPT_DIR/2-to-1-incast_config.txt"
output_dir="$OUTPUT/2-to-1-incast"
output_file="$output_dir/2-to-1-incast.out"
flowthroughput_file="$output_dir/flowthroughput.txt"
temporary_config="$(mktemp /tmp/2-to-1-incast-config.XXXXXX.txt)"

cleanup() {
    rm -f "$temporary_config"
}
trap cleanup EXIT

mkdir -p "$output_dir" "$SCRIPT_DIR/monitor_output"
sed "s|^FLOWTHROUGHPUT_MON_FILE .*|FLOWTHROUGHPUT_MON_FILE $flowthroughput_file|" \
    "$config_file" > "$temporary_config"

cd "$NS3"
./waf --run "2-to-1-incast --conf=$temporary_config" > "$output_file"

analysis_python="${PYTHON:-python3}"
if ! "$analysis_python" -c "import matplotlib, numpy, pandas" 2>/dev/null; then
    analysis_python="/usr/bin/python3"
fi

"$analysis_python" "$SIMULATION_ROOT/ns-3/simulator/py-script/2-to-1-incast-flow-throughput.py" \
    --input "$flowthroughput_file"

echo "Experiment output: $output_file"
echo "Throughput data:  $flowthroughput_file"
