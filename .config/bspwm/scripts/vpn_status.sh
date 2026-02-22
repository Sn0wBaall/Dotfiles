#!/bin/sh
  
 IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
  
 if [ "$IFACE" = "tun0" ]; then
     echo "%{F#bb9af7}󰆧%{F#7aa2f7} $(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')"
 else
      echo "%{F#bb9af7}󰆧%{F#7aa2f7} Disconnected"

 fi

