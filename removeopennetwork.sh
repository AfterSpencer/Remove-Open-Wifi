#!/bin/sh

openwifi="xfinitywifi"

en=`networksetup -listallhardwareports | grep -E 'Wi-Fi|AirPort' -A 1 | grep Device | awk '{print $NF}'`
guest=`networksetup -listpreferredwirelessnetworks $en | grep "$openwifi" | awk '{print $NF}'`

if [ "$guest" == $openwifi ]
then
echo "$openwifi  connected, disconnecting"

networksetup -removepreferredwirelessnetwork $en $openwifi
networksetup -setairportpower $en off
sleep 5
networksetup -setairportpower $en on

else

echo "Not connected to $openwifi, exiting"

fi



