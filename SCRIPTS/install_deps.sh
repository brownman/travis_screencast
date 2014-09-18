
sudo apt-get update -qq
sudo apt-get install -qq recordmydesktop x11-apps libpulse-dev pulseaudio dbus-x11 espeak mbrola-us2 pulseaudio-utils
sudo apt-get install -y  flite fortune pv toilet curl wget tree gxmessage zenity xcowsay notify-osd toilet figlet sox libsox-fmt-mp3

#PPA
sudo add-apt-repository ppa:webupd8team/y-ppa-manager -y
sudo add-apt-repository ppa:fossfreedom/byzanz -y 
sudo apt-get update 
sudo apt-get install yad byzanz-record

