SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

CONFIG_FILE="$SCRIPT_DIR/../config.sh"
source $CONFIG_FILE

configFile=$EXAMPLE_DIR/1-pingpong/1-pingpong_config.txt
outputFile=$EXAMPLE_DIR/1-pingpong/monitor_output/1-pingpong.out
FLOWTHROUGHPUT_PATH="$OUTPUT/1-pingpong/flowthroughput.txt"

mkdir -p $OUTPUT/1-pingpong

sed -i "s|^FLOWTHROUGHPUT_MON_FILE .*|FLOWTHROUGHPUT_MON_FILE $FLOWTHROUGHPUT_PATH|" "$configFile"

cd $NS3

./waf
./waf --run "1-pingpong --conf=$configFile" > $outputFile
# gdb --args build/examples/SharedCredit-FC/ns3.39-$1-optimized --conf=$configFile

echo "##################################"
echo "#      EXPERIMENTS FINISHED      #"
echo "##################################"