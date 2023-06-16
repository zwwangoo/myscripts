#!/bin/bash

$SHELL -l -c "sudo service xl2tpd status | grep active"
if [ $? != 0 ]; then
	sudo service xl2tpd start
	sleep 2
fi

sudo sh -c 'echo "c gs" > /var/run/xl2tpd/l2tp-control'

dests=(
192.168.40.0 \
192.168.51.0 \
192.168.52.0 \
192.168.200.0 \
192.168.220.0 \
192.168.236.0 \
192.168.238.0 \
192.168.239.0 \
192.168.240.0 \
192.168.241.0 \
192.168.242.0 \
172.16.52.0)

for dest in "${dests[@]}"
do
	sudo route add -net $dest netmask 255.255.255.0 dev ppp0
done

echo "start l2tp gs ppp0"
