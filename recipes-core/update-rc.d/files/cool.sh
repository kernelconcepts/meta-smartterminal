#!/bin/sh
### BEGIN INIT INFO
# Provides:             cool
# Required-Start:	devpts
# Required-Stop:
# Default-Start:        S
# Default-Stop:
### END INIT INFO


(i2cset -y 11 0x41 3 0xfd

while [ 1 ]
do
	temp="$(vcgencmd measure_temp | cut -d'=' -f 2 | cut -d'.' -f 1)"
	#echo $temp
	if [ $temp -lt "65" ]
	then
		i2cset -y 11 0x41 1 0x00
		#echo Cooler off
	fi
	if [ $temp -gt "70" ]
	then
		i2cset -y 11 0x41 1 0x02
		#echo Cooler on
	fi
	sleep 10
done)&
