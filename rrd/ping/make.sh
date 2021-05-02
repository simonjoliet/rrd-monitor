#!/bin/bash

. /home/simon/rrd/rrd.conf

$FILE/ping/update.sh
$FILE/ping/graph.sh
