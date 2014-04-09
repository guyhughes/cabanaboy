#!/usr/bin/env sh

echo "starting cabanaboy..."
exec VBoxHeadless -s cabanaboy -v off &

echo ""

echo "starting host-utility"
exec host-utility &

return 1

