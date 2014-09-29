set -e
#sudo apt-get update -qq
#sudo apt-get install -qq recordmydesktop 

#utils
sudo apt-get install cowsay libnotify-bin flite fortune pv toilet curl wget tree gxmessage zenity xcowsay notify-osd toilet figlet sox libsox-fmt-mp3

#needed for some tests:
sudo apt-get install tumiki-fighters
sudo apt-get install libgtk2.0-0


#audio
sudo apt-get install  libpulse-dev pulseaudio espeak mbrola-us2 pulseaudio-utils

#x11
sudo apt-get installsudo apt-get install imagemagick x11-utils x11-apps dbus-x11 
sudo apt-get install xdotool wmctrl


#PPA
sudo add-apt-repository ppa:webupd8team/y-ppa-manager -y
sudo add-apt-repository ppa:fossfreedom/byzanz -y 
sudo add-apt-repository ppa:jon-severinsson/ffmpeg 

#update
sudo apt-get update 



sudo apt-get install yad byzanz

sudo apt-get install ffmpeg
sudo ln -s /usr/bin/avconv /usr/bin/ffmpeg 
