#!/bin/bash

mac=$1

# get IP from mac addr
line=`grep $mac /var/lib/misc/dnsmasq.leases`
ip=`echo $line | awk '{print $3}'`
if [ -z "$ip" ]; then
    echo 1
fi

# ping ip
ping -c 1 $ip > /dev/null
echo $?
