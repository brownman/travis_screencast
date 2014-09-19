 
commander "export DISPLAY=:99.0"
commander "sh -e /etc/init.d/xvfb start"
commander dbus-launch pulseaudio --start

util_x11=$(which xvfb)
commander $util_x11 -screen 0 1024x768x24

#commander  "recordmydesktop --no-cursor  --output=session.ogv &"
#` use_sh screencast ` &
use assert
util=byzanz-record
depend $util
commander $util -v --duration=$timeout_record --x=0 --y=0 --width=1280 --height=800 $file_product --cursor
#--cursor=NULL
#--display=$DISPLAY
#/tmp/screencast/15_24_16_18_09_14.gif 



