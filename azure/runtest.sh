#!/bin/bash

#######################################################################
#  runs jmeter script
# 
# Arguments:
# $1 = jMeterPath e.g. /jmeter
# $2 = scriptName e.g. /scripts/carts_load.jmx
# $3 = serverUrl e.g. http://<some ip>
# $4 = serverPort (optional, defaults to 80)
# $5 = DT_LTN e.g. LoadTest_123 (where 123 = build number)
# $6 = VUCount (optional, defaults to 1)
# $7 = LoopCount (optional, defaults to 1)
#
#######################################################################
# reference
# https://jmeter.apache.org/usermanual/get-started.html#non_gui
# -n = non-guid mode
# -t = script name
# -l = sample log file
# -e = generate dashboard report 
# -o = folder for dashboard
# https://jmeter.apache.org/usermanual/get-started.html#override
# -J[prop_name]=[value] = local Jmeter property
#######################################################################

jMeterPath=$1
scriptName=$2
serverUrl=$3
serverPort=$4
DT_LTN=$5
VUCount=$6
LoopCount=$7

# validate required arguments
if [ -z "$jMeterPath" ]; then
  echo "Usage: Arg 1 needs to be valid jmeter path"
  exit 1
fi
if [ -z "$scriptName" ]; then
  echo "Usage: Arg 2 needs to be valid script name with optional path"
  exit 1
fi
if [ -z "$serverUrl" ]; then
  echo "Usage: Arg 3 needs to be a url to application under test"
  exit 1
fi
# set default values if not passed in
if [ -z "$serverPort" ]; then
  serverPort=80
fi
if [ -z "$VUCount" ]; then
  VUCount=1
fi
if [ -z "$LoopCount" ]; then
  LoopCount=1
fi
if [ -z "$DT_LTN" ]; then
  DT_LTN=MyLoadTestName
fi

echo ***************************************************
echo "Running with:"
echo "jMeterPath : $jMeterPath"
echo "scriptName : $scriptName"
echo "serverUrl  : $serverUrl"
echo "serverPort : $serverPort"
echo "DT_LTN     : $DT_LTN"
echo "VUCount    : $VUCount"
echo "LoopCount  : $LoopCount"
echo ***************************************************

.$jMeterPath/bin/jmeter.sh -n -t $scriptName -l result.tlf -JSERVER_URL="$serverUrl" -JSERVER_PORT="$serverPort" -JDT_LTN="$DT_LTN" -JVUCount="$VUCount" -JLoopCount="$LoopCount"