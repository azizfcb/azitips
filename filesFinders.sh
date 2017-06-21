#!/bin/bash
cd /Users/azouz/Documents/
touch -t `date +%m%d0000` file-date-reference
if [ "$1" == "today" ] && [ "$#" -eq 1 ]
then
  find /Users/azouz/Downloads/ -size +2M -type f -newer file-date-reference -print0 | xargs -0 du -sh | sort -nr > /Users/azouz/Documents/$(date +"%Y-%m-%d")_files_list
else
  find /Users/azouz/Downloads/ -size +2M -type f -print0 | xargs -0 du -sh | sort -nr > /Users/azouz/Documents/$(date +"%Y-%m-%d")_files_list
fi
rm file-date-reference
