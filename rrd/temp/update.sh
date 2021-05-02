#!/bin/bash

. /home/simon/rrd/rrd.conf

UPDATECMD=$(cat /sys/class/thermal/thermal_zone0/temp )

rrdtool update $FILE/temp/temp.rrd N:$UPDATECMD
