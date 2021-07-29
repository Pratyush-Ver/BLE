#!/bin/sh

#Bluetooth device init over USB-CDC

dev_id=$(ls /dev | grep ttyACM)

if [[ -n $dev_id ]]; then
  echo "BT module present"
  d="/dev/"$dev_id
  btattach -B $d -S 1000000 -P h4 &
  sleep 3
  btmgmt --index 0 static-addr FF:00:00:00:00:FF
  btmgmt --index 0 auto-power
  python3 T_lescan_OK.py
  echo "DONE"
else
  echo "No device found"
fi
