
sudo apt-get install -y flite fortune pv toilet curl wget tree gxmessage zenity xcowsay notify-osd toilet figlet sox libsox-fmt-mp3
sudo add-apt-repository ppa:webupd8team/y-ppa-manager -y
sudo apt-get update 
sudo apt-get install yad

alias flite=`which flite`

cd /tmp
git clone https://github.com/brownman/prototypes
cd prototypes
./LIB/install.sh
./BANK/sanity_loop/run.sh
