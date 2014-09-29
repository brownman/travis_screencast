
#PPA
sudo add-apt-repository ppa:webupd8team/y-ppa-manager -y
sudo add-apt-repository ppa:fossfreedom/byzanz -y 
sudo add-apt-repository ppa:jon-severinsson/ffmpeg -y

#update
sudo apt-get update 
sudo apt-get install yad byzanz ffmpeg
sudo ln -s /usr/bin/avconv /usr/bin/ffmpeg 
