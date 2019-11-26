#!/bin/sh

if [ "$#" -ne 2 ]
then
  echo "Usage: $0 VendorId ProductId" >&2
  exit 1
fi

modprobe cp210x
echo $1 $2 > /sys/module/cp210x/drivers/usb-serial\:cp210x/new_id
