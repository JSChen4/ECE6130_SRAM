#!/bin/ksh


# generated at: Fri Oct 25 13:20:34 2024
# 
unset CDS_W3264_LIBPATH
unset W3264_USER_PATH
unset W3264_USER_LIBPATH
unset OS_ID
unset REL_VERSION

LOGDIR="/nethome/jchen3014/ECE6130_Updated/ECE6130_LAB/Cadence/logs_jchen3014/logs0/"
OUTPUTLOG="/nethome/jchen3014/ECE6130_Updated/ECE6130_LAB/Cadence/logs_jchen3014/logs0/distributedPlot.fnxSession0.log"
export CDSHOME="/tools/software/cadence/ic/latest"

env >$LOGDIR/distributedPlot.fnxSession0.env.log 2>/dev/null
BLDVER="`$CDSHOME/bin/srrversion -build 2>/dev/null `"

#
if [ -z "$DISPLAY" ]; then
    export DISPLAY=130.207.232.27:233
fi

#

if [ "$BLDVER" =  "" ]; then
    echo "[`date`] Error: target machine (`hostname`) cannot run ViVA. Probably wrong system.">$LOGDIR/distributedPlot.fnxSession0.err
    sync $LOGDIR/distributedPlot.fnxSession0.err
    exit 1
fi
#
$CDSHOME/bin/srrversion -sysinfo >>$LOGDIR/distributedPlot.fnxSession0.env.log 2>/dev/null
$CDSHOME/bin/srrversion -envinfo >>$LOGDIR/distributedPlot.fnxSession0.env.log 2>/dev/null
#
# Check for X11 connectivity....
ERR="`srrversion -x11`"
if [ "$ERR" != "OK" ]; then
    echo "[`date`] Error: $ERR.">$LOGDIR/distributedPlot.fnxSession0.err
    exit 1
fi
# 
# 
export CDN_VIVA_SERVICE_LINGER_TIME=60
export CDN_VIVA_SERVICE_SEND_JSON_GRPC=1
# 
CMD="$CDSHOME/bin/viva  -brokerAddress ece-linlabsrv01.ece.gatech.edu:37135 -tag e7479f4f024ce067c10e5b0e52f2f95a -axlsession fnxSession0 -libCellView Tutorial:myInverter:maestro -adeService distribuedPlot -noautostart  -distributedPlot 1 -log /nethome/jchen3014/ECE6130_Updated/ECE6130_LAB/Cadence/logs_jchen3014/logs0/distributedPlot.0.log -no-ciw -nocdsinit -viva-service 000143E78B008E70EF2803E3E662FC18BC4D60B5D54DCC37D27E6FA78410926AD02470F28B50992BD92E69ED90048F74DD2F32AE9C019928D92E01F85C7D2F64DB5600001DB4"


WORK_DIR=/nethome/jchen3014/ECE6130_Updated/ECE6130_LAB/Cadence
if [ -d $WORK_DIR ]; then
    cd $WORK_DIR
    $CMD &
    PID=$!
    wait $PID
fi


