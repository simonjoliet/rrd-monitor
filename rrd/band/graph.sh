#!/bin/bash

. /home/simon/rrd/rrd.conf

rrdtool graph $OUTPUT/band.png \
        -t "Bandwidth" -v "Mbps" \
        --start="now-1d" \
        --end="now" \
        --height="200" \
        --width="550" \
        --font DEFAULT:0:Helvetica \
        --font-render-mode light \
        -c "BACK#FFFFFF" \
        -c "SHADEA#000000" \
        -c "SHADEB#000000" \
        -c "FONT#000000" \
        -c "CANVAS#202020" \
        -c "GRID#666666" \
        -c "MGRID#AAAAAA" \
        -c "FRAME#202020" \
        -c "ARROW#FFFFFF" \
        "DEF:download=$FILE/band/band.rrd:down:AVERAGE" \
        "CDEF:shadingD2=download,0.98,*" "LINE:shadingD2#F900F9:Download" \
        "GPRINT:download:LAST:Last\: %5.2lf Mbps" \
        "GPRINT:download:MIN:Min\: %5.2lf Mbps" \
        "GPRINT:download:MAX:Max\: %5.2lf Mbps" \
        "GPRINT:download:AVERAGE:Avg\: %5.2lf Mbps" \
        "CDEF:shadingD10=download,0.90,*" "AREA:shadingD10#E100E1" \
        "CDEF:shadingD15=download,0.85,*" "AREA:shadingD15#D200D2" \
        "CDEF:shadingD20=download,0.80,*" "AREA:shadingD20#C300C3" \
        "CDEF:shadingD25=download,0.75,*" "AREA:shadingD25#B400B4" \
        "CDEF:shadingD30=download,0.70,*" "AREA:shadingD30#A500A5" \
        "CDEF:shadingD35=download,0.65,*" "AREA:shadingD35#960096" \
        "CDEF:shadingD40=download,0.60,*" "AREA:shadingD40#870087" \
        "CDEF:shadingD45=download,0.55,*" "AREA:shadingD45#780078" \
        "CDEF:shadingD50=download,0.50,*" "AREA:shadingD50#690069" \
        "CDEF:shadingD55=download,0.45,*" "AREA:shadingD55#5A005A" \
        "CDEF:shadingD60=download,0.40,*" "AREA:shadingD60#4B004B" \
        "CDEF:shadingD65=download,0.35,*" "AREA:shadingD65#3C003C" \
        "CDEF:shadingD70=download,0.30,*" "AREA:shadingD70#2D002D" \
        "CDEF:shadingD75=download,0.25,*" "AREA:shadingD75#180018" \
        "CDEF:shadingD80=download,0.20,*" "AREA:shadingD80#0F000F" \
        "CDEF:shadingD85=download,0.15,*" "AREA:shadingD85#000000" \
        "DEF:upload=$FILE/band/band.rrd:upload:AVERAGE" \
        "CDEF:shadingU2=upload,0.98,*" "LINE:shadingU2#00F9F9:Upload" \
        "GPRINT:upload:LAST:Last\: %5.2lf Mbps" \
        "GPRINT:upload:MIN:Min\: %5.2lf Mbps" \
        "GPRINT:upload:MAX:Max\: %5.2lf Mbps" \
        "GPRINT:upload:AVERAGE:Avg\: %5.2lf Mbps" \
        "CDEF:shadingU10=upload,0.90,*" "AREA:shadingU10#E1E100" \
        "CDEF:shadingU15=upload,0.85,*" "AREA:shadingU15#D2D200" \
        "CDEF:shadingU20=upload,0.80,*" "AREA:shadingU20#C3C300" \
        "CDEF:shadingU25=upload,0.75,*" "AREA:shadingU25#B4B400" \
        "CDEF:shadingU30=upload,0.70,*" "AREA:shadingU30#A5A500" \
        "CDEF:shadingU35=upload,0.65,*" "AREA:shadingU35#969600" \
        "CDEF:shadingU40=upload,0.60,*" "AREA:shadingU40#878700" \
        "CDEF:shadingU45=upload,0.55,*" "AREA:shadingU45#787800" \
        "CDEF:shadingU50=upload,0.50,*" "AREA:shadingU50#696900" \
        "CDEF:shadingU55=upload,0.45,*" "AREA:shadingU55#5A5A00" \
        "CDEF:shadingU60=upload,0.40,*" "AREA:shadingU60#4B4B00" \
        "CDEF:shadingU65=upload,0.35,*" "AREA:shadingU65#3C3C00" \
        "CDEF:shadingU70=upload,0.30,*" "AREA:shadingU70#2D2D00" \
        "CDEF:shadingU75=upload,0.25,*" "AREA:shadingU75#181800" \
        "CDEF:shadingU80=upload,0.20,*" "AREA:shadingU80#0F0F00" \
        "CDEF:shadingU85=upload,0.15,*" "AREA:shadingU85#000000">/dev/null
