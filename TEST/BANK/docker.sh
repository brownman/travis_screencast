#https://github.com/rogaha/docker-desktop
#https://github.com/brownman/GENERATOR/tree/develop/DESKTOP

step1(){
#Add the PPA sources to your apt sources list.
sudo apt-get install python-software-properties && sudo add-apt-repository ppa:dotcloud/lxc-docker

# Update your sources
sudo apt-get update

# Install, you will see another warning that the package cannot be authenticated. Confirm install.
sudo apt-get install lxc-docker
sudo apt-get install xpra #/usr/bin/xpra

 git clone https://github.com/rogaha/docker-desktop.git
 cd docker-desktop
 docker build -t $LOGNAME/docker-desktop .
 CONTAINER_ID=$(docker run -d -P $LOGNAME/docker-desktop)
  echo $(docker logs $CONTAINER_ID | sed -n 1p)
  docker port $CONTAINER_ID 22
  ifconfig | grep "inet addr:" 
  ssh docker@192.168.56.102 -p 49153 "sh -c './docker-desktop -s 800x600 -d 10 > /dev/null 2>&1 &'" # Here is where we use the external port
docker@192.168.56.102's password: xxxxxxxxxxxx 
 ./docker-desktop -h
  xpra --ssh="ssh -p 49153" attach ssh:docker@192.168.56.102:10 # user@ip_address:session_number
docker@192.168.56.102's password: xxxxxxxxxxxx 
}

step0(){
 git clone https://github.com/brownman/GENERATOR
 cd GENERATOR/DESKTOP
 ls -l
 
}
step0
