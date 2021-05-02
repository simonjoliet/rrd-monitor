#!/bin/bash

. /home/simon/rrd/rrd.conf

UPDATECMD=$(ping -c 3 -w 6 $HOST | grep rtt | awk -F "/" '{ print $5 }' )

rrdtool update $FILE/ping/ping.rrd N:$UPDATECMD
