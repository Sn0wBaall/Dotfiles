#!/bin/bash

user=$(whoami)

ip_address=$(/bin/cat /home/$user/.config/bin/target | awk '{print $1}')
machine_name=$(/bin/cat /home/$user/.config/bin/target | awk '{print $2}')
 
if [ $ip_address ] && [ $machine_name ]; then
  echo "%{F#bb9af7}󰓾%{F#7aa2f7} $ip_address - $machine_name"
elif [ $ip_address ];then
  echo "%{F#bb9af7}󰓾%{F#7aa2f7} $ip_address"
else
    echo "%{F#bb9af7}󰓾%{F#7aa2f7} No target"
fi

