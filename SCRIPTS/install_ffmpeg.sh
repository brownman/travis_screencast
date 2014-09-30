$cmd_trap_err

pre(){
sudo apt-get update
sudo apt-get -y install autoconf automake build-essential libass-dev libfreetype6-dev libgpac-dev \
  libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libx11-dev \
  libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev

sudo apt-get install yasm
sudo apt-get install libx264-dev
#sudo apt-get install libopus-dev
sudo apt-get install libmp3lame-dev
}


manual(){
mkdir ~/ffmpeg_sources
#########################################
sudo apt-get install unzip
cd ~/ffmpeg_sources
wget -O fdk-aac.zip https://github.com/mstorsjo/fdk-aac/zipball/master
unzip fdk-aac.zip
cd mstorsjo-fdk-aac*
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
commander make install
make distclean
#########################################

cd ~/ffmpeg_sources
wget http://webm.googlecode.com/files/libvpx-v1.3.0.tar.bz2
tar xjvf libvpx-v1.3.0.tar.bz2
cd libvpx-v1.3.0
./configure --prefix="$HOME/ffmpeg_build" --disable-examples
make
commander make install
make clean

#########################################
cd ~/ffmpeg_sources
wget http://downloads.xiph.org/releases/opus/opus-1.1.tar.gz
tar xzvf opus-1.1.tar.gz
cd opus-1.1
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean
}

compile(){
  #https://github.com/charleshross/soarin/wiki/Setup-FFMPEG
cd ~/ffmpeg_sources
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
commander cd ffmpeg

  

OPTIONS2='--enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-nonfree \
  --enable-x11grab'
  
  
  #--enable-libopus \
  
  OPTIONS1='--enable-gpl   --enable-nonfree    --enable-x11grab'

./configure \
  --prefix="$HOME/ffmpeg_build" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --bindir="$HOME/bin" $OPTIONS1

  
#PATH="$PATH:$HOME/bin"
make
commander make install
make distclean
hash -r
}

validate(){
sudo apt-get install tree
tree $HOME/ffmpeg_build
commander whereis ffmpeg
ffmpeg
}

steps(){
pre
if [ $MODE_SIMPLE = false ];then
manual
fi

compile
validate
}

MODE_SIMPLE=true
steps
