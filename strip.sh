#!/bin/bash

tput clear

# List of file / dir tests here
# https://stackoverflow.com/questions/638975/how-do-i-tell-if-a-regular-file-does-not-exist-in-bash


echo "Running Checks..."
echo "Checking Permissions ...."


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
else
  echo "OK - Running with sudo permissions"
fi


FILE=nodrm.isml     

if [ -f $FILE ]; then
   echo "OK - File $FILE exists - removing"
   rm nodrm.isml
else
   echo "KO - File $FILE does not exist - new file will be created."
fi

# echo "/var/www/shared/live/a/channel1/channel1.isml" | cut -d'/' -f1-7

pathname=`echo $1 | cut -d'/' -f1-7`
filename=`echo $1 | cut -d'/' -f8`
echo -n "OK - Pathname: "
echo "$pathname"
echo -n "OK - Filename: "
echo "$filename"


if [ -d "$pathname" ]; then
    echo "OK - Directory $pathname exists"
else 
    echo "KO - Diretory $pathname  does not exist"
fi 


FILE="$1"
if [ -f $FILE ]; then
   echo "OK - File $FILE exists"
else
   echo "KO - File $FILE does not exist."
   exit
fi

read x

while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ "`echo "$line" | grep -o mpd_inline_drm`" == "mpd_inline_drm" ]]; then
     echo "Removing§: mpd_inline_drm"
    elif [[ "`echo "$line" | grep -o hls_no_audio_only`" == "hls_no_audio_only" ]]; then
     echo "Removing: hls_no_audio_only"
    elif [[ "`echo "$line" | grep -o mpd_inline_drm`" == "mpd_inline_drm" ]]; then
     echo "Removing: hls_no_audio_onlyasf"
    elif [[ "`echo "$line" | grep -o mpd_inline_drm`" == "mpd_inline_drm" ]]; then 
     echo "Removing: hls_no_audio_onlsfay" 
    else
     echo $line >> "$pathname/nodrm.isml"
    fi  
done < "$filename"


ls -las "$pathname/"
