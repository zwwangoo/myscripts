#!/bin/bash

sudo service xl2tpd start
sleep 2

sudo sh -c 'echo "c gs" > /var/run/xl2tpd/l2tp-control'
sleep 1

sudo route add -net 192.168.40.0 netmask 255.255.255.0 dev ppp0
sudo route add -net 192.168.51.0 netmask 255.255.255.0 dev ppp0
sudo route add -net 192.168.52.0 netmask 255.255.255.0 dev ppp0
sudo route add -net 192.168.200.0 netmask 255.255.255.0 dev ppp0
sudo route add -net 192.168.220.0 netmask 255.255.255.0 dev ppp0
sudo route add -net 192.168.236.0 netmask 255.255.255.0 dev ppp0
sudo route add -net 192.168.238.0 netmask 255.255.255.0 dev ppp0
sudo route add -net 192.168.239.0 netmask 255.255.255.0 dev ppp0
sudo route add -net 192.168.240.0 netmask 255.255.255.0 dev ppp0
sudo route add -net 192.168.241.0 netmask 255.255.255.0 dev ppp0
sudo route add -net 192.168.242.0 netmask 255.255.255.0 dev ppp0

echo "start l2tp gs ppp0"
