#deb http://us.archive.ubuntu.com/ubuntu lucid main universe
#https://aur.archlinux.org/packages/?O=0&K=x11grab

sudo apt-get install ffmpeg
sudo apt-get install kx11grab

ffmpeg -f x11grab -t 10 -s 1024x768 -r 75 -i :0.0 /tmp/out.avi
