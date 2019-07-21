#!/bin/bash

file='/sys/class/backlight/intel_backlight/brightness'
sudo chmod 777 "$file"
if [ "$1" = 'n' ] #2> /dev/null
then
    sudo echo 7770 > "$file"
elif [ "$1" = 'd' ] #2> /dev/null
then
    sudo echo 3000 > "$file"
elif [ ! -z `echo $1 | egrep "^[0-9]+$"` ]
then
    if [ "$1" -lt 7770 ] && [ "$1" -gt 3000 ]
    then
        sudo echo $1 > "$file"
    else
        echo "Invalid brightness. Must be 3000 < brightness < 7770 (if you know what you're doing then not :P)"
    fi
else
    echo "Usage: $0 <d/n>"
fi
sudo chmod 755 "$file"