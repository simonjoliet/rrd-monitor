#!/bin/bash

. /home/simon/rrd/rrd.conf

rrdtool create $FILE/ping/ping.rrd -s 60 \
DS:ping:GAUGE:120:0:65535 \
RRA:AVERAGE:0.5:1:2880
