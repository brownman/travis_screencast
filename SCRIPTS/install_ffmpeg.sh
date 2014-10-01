
#https://gist.github.com/holms/7009218
#https://help.ubuntu.com/community/CompilingSoftware
#http://www.zoharbabin.com/build-and-install-ffmpeg-and-x264-on-debian-squeeze-the-dumb-guide/

#set -e
$cmd_trap_err

add_sources(){
echo "deb http://www.deb-multimedia.org wheezy main non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://www.deb-multimedia.org wheezy main non-free"  | sudo tee -a /etc/apt/sources.list
commander sudo gpg --keyserver pgpkeys.mit.edu --recv-key  07DC563D1F41B907
commander sudo gpg -a --export 07DC563D1F41B907 | sudo apt-key add -
sudo apt-get update
sudo apt-get install deb-multimedia-keyring # if this aborts, try again 
}


set_env(){
 mkdir -p /usr/local/share/ffmpeg 
}


install_sources(){
# Go to local source directory
cd /usr/local/src
sudo apt-get install \
  -y                  \
  libfaad-dev         \
  faad                \
  faac                \
  libfaac0            \
  libfaac-dev         \
  libmp3lame-dev      \
  x264                \
  libx264-dev         \
  libxvidcore-dev     \
  build-essential     \
  checkinstall
 
# Install all build dependencies for ffmpeg
}

install_from_source(){
#sudo apt-get build-dep ffmpeg
#apt-get source ffmpeg
#cd ffmpeg-*
#./configure 
#
#cd ..
install build-essential yasm 
echo libgpac-dev subversion git-core 
echo \
libdirac-dev libgsm1-dev libschroedinger-dev libspeex-dev libvorbis-dev libopenjpeg-dev \
libdc1394-22-dev libsdl1.2-dev zlib1g-dev texi2html libfaac-dev libfaad-dev libmp3lame-dev \
libtheora-dev libxvidcore4-dev libopencore-amrnb-dev libopencore-amrwb-dev libvpx-dev \
libfreetype6-dev frei0r-plugins-dev librtmp-dev libaacplus-dev libx264-dev libavdevice-dev libavfilter-dev \
libavformat-dev libavutil-dev

git clone --depth 1 git://source.ffmpeg.org/ffmpeg
cd ffmpeg
commander ./configure --enable-shared  --enable-gpl --enable-libx264
commander make
commander make install

}
# a fix
 
# Generate the debian package (*.deb)
#commander checkinstall -D --install=no --pkgname=ffmpeg-full --autodoinst=yes -y
 
# if after this step you'll probably will get an error
# libavcodec/libx264.c:492: undefined reference to `x264_encoder_open_125'
# here's a solution:
mp4_static(){
# apt-get remove x264
git clone --depth=1 git://git.videolan.org/x264.git
cd x264
./configure --enable-shared
#./configure --enable-static --enable-shared
make
make install
ldconfig
#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/src/x264/libx264.a 

}

 

configure1(){
 ./configure --enable-gpl \
--enable-nonfree --enable-libfaac --enable-libgsm --enable-libmp3lame \
--enable-libtheora --enable-libvorbis --enable-libx264 --enable-libxvid --enable-zlib \
--enable-postproc --enable-swscale --enable-pthreads --enable-x11grab --enable-libdc1394 --enable-version3 \
--enable-libopencore-amrnb --enable-libopencore-amrwb
 }
 configure2(){
  ./configure \
--enable-gpl \
--enable-nonfree \
--enable-libfaac \
--enable-libgsm \
--enable-libmp3lame \
--enable-libtheora \
--enable-libvorbis \
--enable-libx264 \
--enable-libxvid \
--enable-zlib \
--enable-postproc \
--enable-swscale \
--enable-pthreads \
--enable-x11grab \
--enable-libdc1394 \
--enable-version3 \
--enable-libopencore-amrnb \
--enable-libopencore-amrwb
  
 }

install2(){
#make clean
install checkinstall
commander checkinstall -D --install=no --pkgname=ffmpeg-full --autodoinst=yes -y
# install the package :)
commander sudo dpkg -i ffmpeg-full_*-1_amd64.deb
}


commander add_sources
commander install_from_source
