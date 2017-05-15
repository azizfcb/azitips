#!/bin/bash
if [ $# != 1  ]; then
	echo "Pinger needs One argument, exactly!"
else
	ping -c 1 $1 &>/dev/null
        if [ "${?}" -eq 68 ]; then
            echo "Pinger couldnt resolve the Adress/Url, Sorry"
        else
            ping -c 1 $1 | grep -o -m 1 '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
        fi
fi
