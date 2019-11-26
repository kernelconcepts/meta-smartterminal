#!/bin/sh 
### BEGIN INIT INFO
# Provides:             backlight
# Required-Start:	devpts
# Required-Stop:
# Default-Start:        S
# Default-Stop:
### END INIT INFO

BL_POWER=/sys/class/backlight/backlight/bl_power

if [ -e $BL_POWER ]; then
	/bin/echo 0 > $BL_POWER
fi

export TMPDIR=/mnt/.splash

(usleep 500000; psplash-write "PROGRESS 60")&
(sleep 1; psplash-write "PROGRESS 70") &
