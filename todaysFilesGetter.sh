#!/bin/bash
cd /Users/azouz/Documents/
touch `date "+%D"`_files
find /Users/azouz/Desktop/ . -size 50k -type f -newer $(date "+%D")_files > /Users/azouz/Documents/`date "+%D"`_files
