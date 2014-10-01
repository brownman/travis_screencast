
#https://gist.github.com/holms/7009218
#https://help.ubuntu.com/community/CompilingSoftware
install checkinstall
 #st
# Add multimedia source
echo "deb http://www.deb-multimedia.org wheezy main non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://www.deb-multimedia.org wheezy main non-free"  | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install deb-multimedia-keyring # if this aborts, try again
#apt-get update
 
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
sudo apt-get build-dep ffmpeg
 
# Get the actual ffmpeg source code
sudo apt-get source ffmpeg
# Go into the ffmpeg source directory
cd ffmpeg-*
# Configure it
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
 
# a fix
mkdir -p /usr/local/share/ffmpeg 
 
# Generate the debian package (*.deb)
commander checkinstall -D --install=no --pkgname=ffmpeg-full --autodoinst=yes -y
 
# if after this step you'll probably will get an error
# libavcodec/libx264.c:492: undefined reference to `x264_encoder_open_125'
# here's a solution:
cd ..
apt-get remove x264
git clone --depth=1 git://git.videolan.org/x264.git
cd x264
./configure --enable-static --enable-shared
make && make install
ldconfig
cd .. && cd ffmpeg*
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/src/x264/libx264.a ./configure --enable-gpl \
--enable-nonfree --enable-libfaac --enable-libgsm --enable-libmp3lame \
--enable-libtheora --enable-libvorbis --enable-libx264 --enable-libxvid --enable-zlib \
--enable-postproc --enable-swscale --enable-pthreads --enable-x11grab --enable-libdc1394 --enable-version3 \
--enable-libopencore-amrnb --enable-libopencore-amrwb

make clean
commander checkinstall -D --install=no --pkgname=ffmpeg-full --autodoinst=yes -y
 
# install the package :)
commander sudo dpkg -i ffmpeg-full_*-1_amd64.deb
