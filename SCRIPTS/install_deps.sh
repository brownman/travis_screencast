
sudo apt-get update -qq
sudo apt-get install -qq recordmydesktop x11-apps libpulse-dev pulseaudio dbus-x11 espeak mbrola-us2 pulseaudio-utils
sudo apt-get install -y  libnotify-bin flite fortune pv toilet curl wget tree gxmessage zenity xcowsay notify-osd toilet figlet sox libsox-fmt-mp3
sudo apt-get install xvfb
sudo apt-get install libgtk2.0-0

#install firefox
sudo apt-get install icewease

#show xinfo of root window
sudo apt-get install xvfb apt-get libgl1-mesa-dri xfonts-cyrillic xfonts-100dpi xfonts-75dpi
sudo apt-get install imagemagick x11-utils

sudo apt-get install xdotool wmctrl
#PPA
sudo add-apt-repository ppa:webupd8team/y-ppa-manager -y
sudo add-apt-repository ppa:fossfreedom/byzanz -y 
sudo apt-get update 
sudo apt-get install yad byzanz
