SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

CONFIG_FILE="$SCRIPT_DIR/../config.sh"
source $CONFIG_FILE

configFile=$EXAMPLE_DIR/2-star-topo/2-star-topo_config.txt
outputFile=$EXAMPLE_DIR/2-star-topo/monitor_output/2-star-topo.out
FLOWTHROUGHPUT_PATH="$OUTPUT/2-star-topo/flowthroughput.txt"

mkdir -p $OUTPUT/2-star-topo

sed -i "s|^FLOWTHROUGHPUT_MON_FILE .*|FLOWTHROUGHPUT_MON_FILE $FLOWTHROUGHPUT_PATH|" "$configFile"

cd $NS3

./waf
./waf --run "2-star-topo --conf=$configFile" > $outputFile
# gdb --args build/examples/SharedCredit-FC/ns3.39-$1-optimized --conf=$configFile

echo "##################################"
echo "#      EXPERIMENTS FINISHED      #"
echo "##################################"