 
commander "export DISPLAY=:99.0"
commander "sh -e /etc/init.d/xvfb start"
commander dbus-launch pulseaudio --start

util_x11=$(which xvfb)
commander $util_x11 -screen 0 1024x768x24
#https://wiki.ubuntu.com/ScreenCasts/RecordMyDesktop
#commander recordmydesktop --width 640 --height 480 -x 200 -y 200 --full-shots --fps 15   --channels 1 --device pulse --v_quality 63 --s_quality 10 --v_bitrate 2000000   --delay 10
#commander  "recordmydesktop --no-cursor  --output=session.ogv &"
options="--width 640 --height 480  \ 
--full-shots --fps 15  \
--channels 1 \
--device pulse \
--v_quality 63 \
--s_quality 10 \
--v_bitrate 2000000 \
--delay $timeout_record \
--outoput=$file_product"

commander recordmydesktop $options


record1(){
use assert
util=byzanz-record
depend $util
commander $util -v --duration=$timeout_record --x=0 --y=0 --width=1280 --height=800 $file_product --cursor
}
#--cursor=NULL
#--display=$DISPLAY
#/tmp/screencast/15_24_16_18_09_14.gif 



