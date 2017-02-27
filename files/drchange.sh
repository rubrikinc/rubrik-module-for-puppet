#!/usr/bin/sh
if ping -q -c 1 -W 1 google.com >/dev/null; then
  echo "The network is up"
else
 nmcli con add type ethernet con-name dr_connection ifname ens192 ip4 172.17.52.220/22 gw4 172.17.52.1
fi
