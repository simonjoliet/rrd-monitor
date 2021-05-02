#!/bin/bash

. /home/simon/rrd/bandwidth/this.conf

$FILE/$SUPENAME/update.sh
$FILE/$SUPENAME/graph.sh
