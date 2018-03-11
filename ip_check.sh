#!/bin/bash

function ip_up_down(){
  ping -W 2 -c 2 $1 > /dev/null
  if [ $? -eq 0 ]; then
    echo $1" is up."
  else
    echo $1" is down."
  fi
}

ip_up_down 127.0.0.1
