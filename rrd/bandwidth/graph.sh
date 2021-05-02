#!/bin/bash

. /home/simon/rrd/rrd.conf

rrdtool graph $OUTPUT/bandwidth.png \
        -t "Bandwidth" -v "Mbps" \
        --start="now-1d" \
        --end="now" \
        --height="200" \
        --width="700" \
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
        "DEF:download=$FILE/bandwidth/bandwidth.rrd:down:AVERAGE" \
        "CDEF:shading2=download,0.98,*" "AREA:shading2#00F900:Down" \
        "GPRINT:download:LAST:Last\: %5.2lf Mbps" \
        "GPRINT:download:MIN:Min\: %5.2lf Mbps" \
        "GPRINT:download:MAX:Max\: %5.2lf Mbps" \
        "GPRINT:download:AVERAGE:Avg\: %5.2lf Mbps" \
        "CDEF:shading10=download,0.90,*" "AREA:shading10#00E100" \
        "CDEF:shading15=download,0.85,*" "AREA:shading15#00D200" \
        "CDEF:shading20=download,0.80,*" "AREA:shading20#00C300" \
        "CDEF:shading25=download,0.75,*" "AREA:shading25#00B400" \
        "CDEF:shading30=download,0.70,*" "AREA:shading30#00A500" \
        "CDEF:shading35=download,0.65,*" "AREA:shading35#009600" \
        "CDEF:shading40=download,0.60,*" "AREA:shading40#008700" \
        "CDEF:shading45=download,0.55,*" "AREA:shading45#007800" \
        "CDEF:shading50=download,0.50,*" "AREA:shading50#006900" \
        "CDEF:shading55=download,0.45,*" "AREA:shading55#005A00" \
        "CDEF:shading60=download,0.40,*" "AREA:shading60#004B00" \
        "CDEF:shading65=download,0.35,*" "AREA:shading65#003C00" \
        "CDEF:shading70=download,0.30,*" "AREA:shading70#002D00" \
        "CDEF:shading75=download,0.25,*" "AREA:shading75#001800" \
        "CDEF:shading80=download,0.20,*" "AREA:shading80#000F00" \
        "CDEF:shading85=download,0.15,*" "AREA:shading85#000000" >/dev/null
