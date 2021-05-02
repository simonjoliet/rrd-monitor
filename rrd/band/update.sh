#!/bin/bash

. /home/simon/rrd/band/this.conf

var=$(perl $FILE/band/speedtest.pl)

rrdtool update $FILE/$SUPENAME/band.rrd N:$var
