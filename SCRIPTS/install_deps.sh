set -e
#sudo apt-get update -qq
#sudo apt-get install -qq recordmydesktop 
install(){
  sudo apt-get install $@
}
#library deps
install cowsay libnotify-bin flite fortune pv toilet curl wget tree gxmessage zenity xcowsay notify-osd toilet figlet sox libsox-fmt-mp3

#utils
install imagemagick

#windows control
install xdotool wmctrl


#needed for some tests:
install tumiki-fighters
install libgtk2.0-0


#audio
install  libpulse-dev pulseaudio espeak mbrola-us2 pulseaudio-utils


#font
install libgl1-mesa-dri xfonts-cyrillic xfonts-100dpi xfonts-75dpi

#x11
install xvfb \
x11-utils x11-apps dbus-x11 

