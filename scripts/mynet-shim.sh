#!/bin/bash

# Check if we have our device passed in
if [ $# -eq 0 ]; then
  echo "Please enter your network interface"
  exit 1
fi

sudo ip link add mynet-shim link $1 type macvlan mode bridge
sudo ip addr add 192.168.0.8/32 dev mynet-shim
sudo ip link set mynet-shim up
sudo ip route add 192.168.0.0/24 dev mynet-shim
