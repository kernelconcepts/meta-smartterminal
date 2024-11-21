#! /bin/sh
set -e

# VM writeback
echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs';

# HDMI off
/usr/bin/tvservice -o

