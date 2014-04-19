#!/usr/bin/env sh

echo "stopping cabanaboy..."
exec ssh cabanaboy sudo shutdown
sleep 1
echo ""

echo "killing host-utility"
exec killall host-utility

return 1

