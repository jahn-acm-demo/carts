#!/bin/bash
#######################################################################
# Makes loop to curl requests for passed in URL
# 
# Arguments:
# $1 = URL to request
# $2 = Number of loops (optional - defaults to 1)
# $3 = Wait time in seconds between requests (optional - defaults to 0)
#
# example:  ./smokeTest.sh http://<some ip>/carts/1/items 3 1
#######################################################################

url=$1
loops=$2
waittime=$3

if [ -z "$1" ]
  then
    echo Aborting: Missing required argument for url to call
    exit 1
fi

if [ -z "$2" ]
  then
    loops=1
fi

if [ -z "$3" ]
  then
    waittime=0
fi

c=1
echo Calling $url - $loops times - with $waittime second wait time
while [ $c -le $loops ]
do
  status_code=$(curl --write-out %{http_code} --silent --output /dev/null $url)
  if [[ "$status_code" -ne 200 ]] ; then
    echo Aborting: got bad url response
    exit 1
  fi
  sleep $waittime;
  c=$(( c + 1 ))
done;
echo Complete
exit 0