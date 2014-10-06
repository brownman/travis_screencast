
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

while read line;do
test -n "$line" || break
commander sudo add-apt-repository  $line
done < <( cat $dir_TXT/ppa.txt | grep -v \# )
