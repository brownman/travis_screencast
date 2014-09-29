#https://github.com/jnvsor/screencap
sudo apt-get update

sudo apt-get install git build-essential yasm libcdio-paranoia-dev libx264-dev libvpx-dev libvorbis-dev libtheora-dev libspeex-dev libschroedinger-dev librtmp-dev libpulse-dev libopus-dev libopenjpeg-dev libopencv-dev libmp3lame-dev libgsm1-dev libgnutls-dev libfrei0r-ocaml-dev
git clone https://github.com/FFmpeg/FFmpeg.git --depth=1
cd FFmpeg 
./configure --enable-gpl --enable-x11grab
#--arch=amd64 --enable-pthreads --enable-libopencv --enable-librtmp --enable-libopenjpeg --enable-libopus --enable-libschroedinger --enable-libspeex --enable-libtheora --enable-vaapi --enable-runtime-cpudetect --enable-libvorbis --enable-zlib --enable-swscale --enable-libcdio --enable-bzlib --enable-libdc1394 --enable-frei0r --enable-gnutls --enable-libgsm --enable-libmp3lame --enable-libpulse --enable-vdpau --enable-libvpx  --enable-libx264 --enable-filters --enable-libzmq
make -j4
sudo make install
