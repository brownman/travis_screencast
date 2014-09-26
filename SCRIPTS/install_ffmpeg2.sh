#http://www.jedi.be/blog/2010/08/30/capturing-the-screen-of-your-virtual-machines-using-x-vnc-rdp-or-native/


install(){
wget http://www.ffmpeg.org/releases/ffmpeg-0.6.tar.gz

 cd ffmpeg-0.6
#./configure --enable-x11grab --enable-gpl

 sudo apt-get install xorg-libXext
 sudo apt-get install xorg-libXfixes
./configure --enable-x11grab --enable-gpl --enable-nonfree --extra-cflags="-I/opt/local/include -I/opt/local/include/X11"  --extra-ldflags=-L/opt/local/lib
make 
sudo make install

}

run(){
./ffmpeg -f x11grab -vc x264  -s xga -r 30 -b 2000k -g 300 -i :1.0 session-recording.avi
./ffmpeg -f x11grab -vc x264  -s wsxga -r 30 -b 2000k -g 300 -i :1.0 session-recording.avi
}

steps(){
install
run
}

steps
