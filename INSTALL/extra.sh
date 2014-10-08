#https://github.com/jnvsor/screencap
#http://www.installion.co.uk/ubuntu/trusty/universe/l/libfrei0r-ocaml-dev/en/install/index.html
case1(){
set -e
entry1="deb http://us.archive.ubuntu.com/ubuntu $(lsb_release -cs) main universe"
#- curl http://repo.varnish-cache.org/debian/GPG-key.txt | sudo apt-key add -
echo "$entry1" | sudo tee -a /etc/apt/sources.list

sudo apt-get update
}
  
  
  
case2(){
sudo wget http://www.medibuntu.org/sources.list.d/`lsb_release -cs`.list --output-document=/etc/apt/sources.list.d/medibuntu.list;
sudo apt-get -q update;
sudo apt-get --yes -q --allow-unauthenticated install medibuntu-keyring; 
sudo apt-get -q update
commander sudo apt-get install ffmpeg
commander whereis ffmpeg
}

case2
sudo apt-get install ffmpeg
print ok
which ffmpeg 1>&2
