
#add PPA
#sudo add-apt-repository ppa:webupd8team/y-ppa-manager -y
#sudo add-apt-repository ppa:fossfreedom/byzanz -y 
#sudo add-apt-repository ppa:jon-severinsson/ffmpeg -y

#update
#sudo apt-get update 


#install 
#install yad 
#install byzanz
#install ffmpeg

set -u


use act_on_list
cmd='sudo add-apt-repository'
act_on_list $dir_TXT/tests.txt "$cmd""
