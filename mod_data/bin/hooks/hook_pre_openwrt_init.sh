#!/bin/sh

# ---- TEMPLATE ----

# Hook for modifcation stuff before 
#          piratebox/bin/install  ... openwrt 
# is started


if [ !  -f $1 ] ; then 
  echo "Config-File $1 not found..." 
  exit 255
fi

#Load config
. $1 

#Load openwrt-common config and procedures file!
. /etc/piratebox.common


# You can uncommend this line to see when hook is starting:
 echo "------------------ Running $0 ------------------"

# Overwrite VARS from /etc/piratebox.common & run configuration
 pb_wireless_ssid=$PIRATECHEST_SSID
 pb_hostname=$HOST
 #Setting stuff 
 pb_netconfig
 uci commit


