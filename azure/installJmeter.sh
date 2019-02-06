#!/bin/bash
#######################################################################
#  installs jmeter 
#######################################################################

wget http://mirror.nbtelecom.com.br/apache/jmeter/binaries/apache-jmeter-5.0.tgz
tar -xvzf apache-jmeter-5.0.tgz
mv apache-jmeter-5.0/ jmeter/

echo "***************************************************"
echo "Java version:"
bash java -version
echo "jMeter version:"
bash jmeter/bin/jmeter.sh -v
echo "***************************************************"