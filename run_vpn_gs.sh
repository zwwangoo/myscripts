#!/bin/bash

# 检查 xl2tpd 服务是否处于活动状态，如果不是则启动
if ! sudo service xl2tpd status | grep -q "active"; then
    sudo service xl2tpd start
    sleep 2
fi

# 发送命令到 xl2tpd 控制器
sudo sh -c 'echo "c gs" > /var/run/xl2tpd/l2tp-control'
sleep 1

# 定义目标子网列表
dests=(
    192.168.40.0
    192.168.51.0
    192.168.52.0
    192.168.200.0
    192.168.220.0
    192.168.236.0
    192.168.238.0
    192.168.239.0
    192.168.240.0
    192.168.241.0
    192.168.242.0
    172.16.52.0
)

# 添加路由表项，仅当路由不存在时
for dest in "${dests[@]}"; do
    if ! sudo ip route show | grep -q "$dest"; then
        sudo route add -net "$dest" netmask 255.255.255.0 dev ppp0
    fi
done

echo "l2tp gs ppp0 已启动"
