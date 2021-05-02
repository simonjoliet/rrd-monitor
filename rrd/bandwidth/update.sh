#!/bin/bash

. /home/simon/rrd/bandwidth/this.conf

var=$(perl $FILE/$SUPENAME/speedtest.pl)

rrdtool update $FILE/$SUPENAME/$SUPENAME.rrd N:$var
