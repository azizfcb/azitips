#!/bin/bash
cd /Users/azouz/Documents/
touch -t `date +%m%d0000` $(date +"%Y-%m-%d")-files
find /Users/azouz/ -size +50k -type f -newer $(date +"%Y-%m-%d")-files > /Users/azouz/Documents/$(date +"%Y-%m-%d")_files_list
