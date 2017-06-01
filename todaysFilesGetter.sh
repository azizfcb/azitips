#!/bin/bash
cd /Users/azouz/Documents/
touch -t `date +%m%d0000` file-date-reference
find /Users/azouz/ -size +50k -type f -newer file-date-reference > /Users/azouz/Documents/$(date +"%Y-%m-%d")_files_list
rm file-date-reference
