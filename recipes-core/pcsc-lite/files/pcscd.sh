#!/bin/sh
### BEGIN INIT INFO
# Provides:             pcscd
# Required-Start:	udev
# Required-Stop:	udev
# Default-Start:        2 3 4 5
# Default-Stop:		0 1 6
# Short-Description:    Daemon to access a smart card using PC/SC
# Description:          The PC/SC daemon is used to dynamically
#                       allocate/deallocate reader drivers at runtime and manage
#                       connections to the readers.
### END INIT INFO

DAEMON=/usr/sbin/pcscd
NAME=pcscd
DESC="PCSC Daemon"
PIDFILE=/var/run/pcscd/pcscd.pid
ARGS=""

test -f $DAEMON || exit 0

case "$1" in
    start)
	echo -n "Starting $DESC: $NAME"
	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $ARGS
	echo "."
	;;

    stop)
	echo -n "Stopping $DESC: $NAME"
	start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $DAEMON
	echo "."
	;;

    restart)
	$0 stop
	sleep 1
	$0 start
	;;

    *)
	echo "Usage: $0 {start|stop|restart}"
	exit 1
	;;
esac

exit 0
