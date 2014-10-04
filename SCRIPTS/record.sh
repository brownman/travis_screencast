#http://www.commandlinefu.com/commands/matching/ffmpeg/ZmZtcGVn/sort-by-votes
# capture fullscreen using SERVER: alsa or pulseaudio
#http://linuxers.org/tutorial/how-convert-video-files-various-other-video-formats-using-ffmpeg
#http://forum.videohelp.com/threads/277807-Useful-FFmpeg-Syntax-Examples
ffx-full-hw() { 
	FFX_WIN_FULL=$(xwininfo -root | grep 'geometry' |awk '{print $2;}')	# record fullscreen
	commander ffmpeg -f $SERVER -ac $FFX_MONO \
	-i $FFX_HW -f x11grab -r $FFX_FPS -s $FFX_WIN_FULL -i $DISPLAY \
	-acodec $FFX_AUDIO -vcodec $FFX_VIDEO \
       	-preset $FFX_PRESET -crf $FFX_CRF -threads $FFX_THREADS \
	-vf $FFX_SCALE \
	-y $FFX_OUTPUT \
	-t $FFX_TIMEOUT \
	$FFX_OUTPUT
}
ffx-full-pa() { ffmpeg -f $SERVER -ac $FFX_MONO \
	-i $FFX_PULSE -f x11grab -r $FFX_FPS -s $FFX_WIN_FULL -i :0.0 \
	-acodec $FFX_AUDIO -vcodec $FFX_VIDEO \
       	-preset $FFX_PRESET -crf $FFX_CRF -threads $FFX_THREADS \
	-vf $FFX_SCALE \
	-y $FFX_OUTPUT
}

# capture single window, use mouse cursor to select window you want to record
ffx-winselect-hw() { 
	FFX_INFO=$(xwininfo -frame)

	ffmpeg -f $SERVER -ac $FFX_MONO \
	-i $FFX_HW -f x11grab -r $FFX_FPS \
	-s $(echo $FFX_INFO | grep -oEe 'geometry [0-9]+x[0-9]+'\
	| grep -oEe '[0-9]+x[0-9]+') \
	-i :0.0+$(echo $FFX_INFO | grep -oEe 'Corners:\s+\+[0-9]+\+[0-9]+' \
	| grep -oEe '[0-9]+\+[0-9]+' | sed -e 's/\+/,/' ) \
	-acodec $FFX_AUDIO -vcodec $FFX_VIDEO \
       	-preset $FFX_PRESET -crf $FFX_CRF -threads $FFX_THREADS \
	-vf $FFX_SCALE \
	-y $FFX_OUTPUT
}
ffx-winselect-pa() { 
	FFX_INFO=$(xwininfo -frame)

	ffmpeg -f $SERVER -ac $FFX_MONO \
	-i $FFX_PULSE -f x11grab -r $FFX_FPS \
	-s $(echo $FFX_INFO | grep -oEe 'geometry [0-9]+x[0-9]+'\
	| grep -oEe '[0-9]+x[0-9]+') \
	-i :0.0+$(echo $FFX_INFO | grep -oEe 'Corners:\s+\+[0-9]+\+[0-9]+' \
	| grep -oEe '[0-9]+\+[0-9]+' | sed -e 's/\+/,/' ) \
	-acodec $FFX_AUDIO -vcodec $FFX_VIDEO \
       	-preset $FFX_PRESET -crf $FFX_CRF -threads $FFX_THREADS \
	-vf $FFX_SCALE \
	-y $FFX_OUTPUT
}

#record
record_simple(){
 commander "avconv -t $FFX_TIMEOUT -f x11grab -r 25 -s 1024x768 -i $DISPLAY -vcodec huffyuv $FFX_OUTPUT"
}
record_recordmydesktop(){
local file_product=$dir_product/session.ogv
	
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
#kill 0
commander killall recordmydesktop
while pgrep -x recordmydesktop > /dev/null ; do sleep 1; done # wait for transcoding


}

steps(){
#record_simple 
#&& ffx-full-hw
record_recordmydesktop
}

steps
