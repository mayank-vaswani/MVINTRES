echo "shuting down connection"
sudo ip link set down $(ifconfig |grep -o '^[^ ]\+'| tr -d ':'| tr -d 'lo')

echo "processes"
for pid in /proc/[0-9]*; do
echo "id: $pid"
cat  "$pid/cmdline"
echo ""
ls -l "$pid/fd"
echo ""
echo "subproces(if any):"
ls "$pid/task"
echo ""
done
