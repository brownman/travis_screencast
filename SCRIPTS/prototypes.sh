flite_test(){
#alias flite=`which flite`
str=$(dirname `which flite`)
export PATH=$PATH:$str  
flite -t hello -o /tmp/1.wav
paplay <(cat /tmp/1.wav)
}


install_deps(){
sudo apt-get update -qq
sudo apt-get install -qq recordmydesktop x11-apps libpulse-dev pulseaudio dbus-x11 espeak mbrola-us2 pulseaudio-utils

sudo apt-get install -y flite fortune pv toilet curl wget tree gxmessage zenity xcowsay notify-osd toilet figlet sox libsox-fmt-mp3
sudo add-apt-repository ppa:webupd8team/y-ppa-manager -y
sudo apt-get update 
sudo apt-get install yad
}

set_env(){
   export AUDIODEV=null
}


run(){
    
cd /tmp
git clone https://github.com/brownman/prototypes
cd prototypes
./LIB/install.sh
./BANK/sanity_loop/run.sh
}


steps(){
eval "export DISPLAY=:99.0"
eval "sh -e /etc/init.d/xvfb start"
dbus-launch pulseaudio --start
eval "recordmydesktop --no-cursor  --output=session.ogv &"
paplay <(espeak -vmb-us2  "Ok, let's get rickrolled" --stdout)
#eval "firefox www.youtube.com/watch?v=oHg5SJYRHA0 &"
flite_test
set_env
run
sleep 10
paplay <(espeak -vmb-us2  "That bored me" --stdout)
killall firefox 
sleep 2
paplay <(espeak -vmb-us2  "Much better now" --stdout)
sleep 2
paplay <(espeak -vmb-us2  "I have to go. See you next build!" --stdout)
killall recordmydesktop
while pgrep -x recordmydesktop > /dev/null ; do sleep 1; done # wait for transcoding
tar cf artifacts.tar session.ogv
ls -l session.ogv
mv session.ogv /tmp
}

install_deps
steps
