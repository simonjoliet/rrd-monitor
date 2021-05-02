#!/bin/bash

. /home/simon/rrd/rrd.conf

rrdtool create $FILE/bandwidth/bandwidth.rrd -s 60 \
DS:down:GAUGE:120:0:65535 \
RRA:AVERAGE:0.5:1:2880
