 
commander "export DISPLAY=:99.0"
commander "sh -e /etc/init.d/xvfb start"
commander dbus-launch pulseaudio --start

#commander  "recordmydesktop --no-cursor  --output=session.ogv &"
#` use_sh screencast ` &
byzanz-record --duration=60 --x=0 --y=0 --width=1280 --height=800 $file_product
#/tmp/screencast/15_24_16_18_09_14.gif 



