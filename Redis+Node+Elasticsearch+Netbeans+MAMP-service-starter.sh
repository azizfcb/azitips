#!/bin/bash
pass="no"

read -t 10 -p "Do you want to start MAMP Pro?" input
if [ "$input" == $pass  ]; then
	echo " OKAY MAMP Pro? not started "
else
	echo " OK Elasticsearch  STARTED! "
	open /Applications/MAMP\ PRO/MAMP\ PRO.app/
fi
read -t 10 -p "Do you want to start Netbeans?" input
if [ "$input" == $pass  ]; then
	echo " OKAY Netbeans? not started "
else
	echo " OK Netbeans STARTED! "
	nohup /Applications/NetBeans/NetBeans\ 8.1.app/Contents/MacOS/netbeans &
	 
fi
read -t 10 -p "Do you want to start Elasticsearch?" input
if [ "$input" == $pass  ]; then
	echo " OKAY Elasticsearch not started "
else
	echo " OK Elasticsearch  STARTED! "
	nohup elasticsearch </dev/null &>/dev/null &
fi
read -t 10 -p "Do you want to start Redis?" pass
if [ "$input" == $pass  ]; then
	echo " OKAY Redis not started "
else
	echo " OK Redis STARTED! "
	cd /Applications/MAMP/htdocs/redis-3.2.5
	nohup src/redis-server </dev/null &>/dev/null &
fi
read -t 10 -p "Do you want to start NodeJS?" input
if [ "$input" == $pass  ]; then
	echo " OKAY NodeJS not started "
else
	echo " OK NodeJS STARTED! "
	nohup node /Users/azouz/Desktop/projects/tracking/server.js </dev/null &>/dev/null &
fi