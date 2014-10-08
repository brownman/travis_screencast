
record_recordmydesktop(){
local file_product=$file_input
local options="--width $WIDTH --height $HEIGHT  \ 
--full-shots --fps 15  \
--channels 1 \
--device pulse \
--v_quality 63 \
--s_quality 10 \
--v_bitrate 2000000 \
--no-wm-check \
 --no-cursor  \
--output=$file_product"

commander recordmydesktop $options &
commander sleep $FFX_TIMEOUT
commander killall recordmydesktop
while pgrep -x recordmydesktop > /dev/null ; do sleep 1; done # wait for transcoding
}
 
convert_from_ogv(){
PRESET='--encoder x264 --vb 1800 --ab 128 --maxWidth $WIDTH --maxHeight $HEIGHT --two-pass --optimize'
#PRESET2="-e x264 -q 20.0 -E faac -B 128 -6 dpl2 -w 1280 --loose-crop --loose-anamorphic --x264-preset veryfast --h264-profile high --h264-level 4.1"    
#convert to .mp4
commander "HandBrakeCLI -i $file_input -o $file_output ${PRESET}"
# convert to .webm (WebM/vp8)
commander ffmpeg -i $file_output \
  -acodec libvorbis -ac 2 -ab 96k -ar 44100 \
  -b:v 345k -s ${WIDTH}x${HEIGHT} $2 $dir_product/session.webm
}



steps(){
commander ffmpeg -version
commander record_recordmydesktop
commander convert_from_ogv
}


steps
