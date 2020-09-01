#!/usr/bin/bash

if [ ! -f "/data/no_ota_updates" ]; then
    /usr/bin/touch /data/no_ota_updates
fi

if [ ! -f "/system/fonts/opensans_regular.ttf" ]; then
    sleep 3
    mount -o remount,rw /system
  	cp -rf /data/openpilot/selfdrive/assets/fonts/opensans* /system/fonts/
    cp -rf /data/openpilot/font/fonts.xml /system/etc/fonts.xml
    chmod 644 /system/etc/fonts.xml
  	chmod 644 /system/fonts/opensans*
    mount -o remount,r /system
	
	setprop persist.sys.locale ko-KR
  	setprop persist.sys.local ko-KR
	setprop persist.sys.timezone Asia/Seoul
fi

export PASSIVE="0"
exec ./launch_chffrplus.sh
