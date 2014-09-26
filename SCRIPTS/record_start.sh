

#util_x11=$(which xvfb)
#commander $util_x11 -screen 0 1024x768x24


#https://wiki.ubuntu.com/ScreenCasts/RecordMyDesktop
#commander recordmydesktop --width 640 --height 480 -x 200 -y 200 --full-shots --fps 15   --channels 1 --device pulse --v_quality 63 --s_quality 10 --v_bitrate 2000000   --delay 10
#commander  "recordmydesktop --no-cursor  --output=session.ogv &"
record0(){
options="--width $WIDTH --height $HEIGHT  \ 
--full-shots --fps 15  \
--channels 1 \
--device pulse \
--v_quality 63 \
--s_quality 10 \
--v_bitrate 2000000 \
--no-wm-check \
 --no-cursor  \
--output=$file_product"

commander recordmydesktop $options

}
#--delay $timeout_record \


record1(){

local util=byzanz-record
local util1=byzanz-playback

depend $util
depend $util1

local file_product1=$dir_product/session.byzanz #debug extension: <filename>.byzanz
local timeout_record1=20 #seconds


commander "$util -v \
--duration=$timeout_record1 \
--x=0 --y=0 \
--width=$WIDTH --height=$HEIGHT \
$file_product1 --cursor" 


commander  $util1 $file_product1 $dir_product/session.gif
}
#--cursor=NULL
#--display=$DISPLAY
#/tmp/screencast/15_24_16_18_09_14.gif 


#record1 &

record0 &
sleep $timeout_record
#kill 0
killall recordmydesktop
while pgrep -x recordmydesktop > /dev/null ; do sleep 1; done # wait for transcoding

