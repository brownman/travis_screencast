export dir_root=$(cd $(dirname $0) && pwd )
source $dir_root/CFG/trap_travis.cfg
#source $dir_root/CFG/travis.cfg
#export MODE_MUTE=true

############################################################## 1 step:
try(){
  set -u
 # set -e
  local type=$1
  shift
  local cmd="$@"
  local res
  echo  "[STEP] $cmd"
    
  #test_trap_err
  #set +e
  case $type in
      0) #show all
      eval "$cmd" || { indicator; cat /tmp/err; exit 1; }
      ;;
      12) #hide all
      eval "$cmd" 1>/dev/null 2>/tmp/err || { indicator; cat /tmp/err; exit 1; }
      ;;
      1) #hide std OUT
      eval "$cmd" 1>/dev/null || { indicator; cat /tmp/err; exit 1; }
      ;;
      2) #hide std ERR
      eval "$cmd" 2>/dev/null || { indicator; cat /tmp/err; exit 1; }
      ;;
      **)
      print error 'no handler for type: ' "$type"
      ;;
  esac
}
############################################################## the library has helpers functions 
install_library(){
   $dir_root/INSTALL/library.sh
   source /tmp/library.cfg &>/dev/null
   print ok
   indicator $?
}
set_traps(){
   trap
   trap - ERR
   commander $cmd_trap_err_travis
}
############################################################## install packages
install_packages(){
#1. UPDATE: APT-GET RESOURCES
try 12 $dir_root/INSTALL/sources.sh
#depend: apt-add-repository
try 12 $dir_root/INSTALL/ppa.sh
#2. APT-GET UPDATE
try 12 $dir_root/INSTALL/update.sh
#3.install packages
try 12 $dir_root/INSTALL/tests.sh    
try 12 $dir_root/INSTALL/depend.sh
}

set_env_travis(){
 try 12  source $dir_root/CFG/exports.cfg
 try 12  source $dir_root/CFG/ffmpeg.cfg
}
############################################################## configure
validate_travis(){
    commander "assert file_has_content $file_output"
}

############################################################## main 
steps_for_travis(){
install_library
set_traps
set_env_travis
install_packages

try 12 $dir_root/run.sh x11
try 12 $dir_root/run.sh debug_screen
try 0  $dir_root/run.sh task &
try 0  $dir_root/run.sh capture &
try 12 $dir_root/run.sh record
validate_travis && { try 12 $dir_root/run.sh push_to_github; }
}
############################################################## run!
steps_for_gitbook(){
  install_library
set_traps
set_env_travis
  
  commander npm install gitbook -g
  local fmt='Static Website'
  local dir_readme="$dir_product"
  commander "gitbook build $dir_readme --format='$fmt'--output=$dir_product/gitbook"
  
  try 12 $dir_root/run.sh push_to_github;
}
#steps_for_travis

#steps_for_gitbook

steps_for_youtube(){
  install_library
set_traps
set_env_travis
# sudo   pip install googlecl
#commander google youtube post --category Education killer_robots.avi
VERSION=0.7.3
wget http://youtube-upload.googlecode.com/files/youtube-upload-$VERSION.tgz
 tar xvzf youtube-upload-$VERSION.tgz
  cd youtube-upload-$VERSION
 # pip install --allow-external  youtube-upload
#  sudo python setup.py install 
  
  
  # stuff for youtube
sudo apt-get install -y libcurl4-gnutls-dev librtmp-dev
sudo pip install pycurl gdata python-progressbar 
  sudo python setup.py install 
#sudo pip install youtube-upload
#curl http://youtube-upload.googlecode.com/svn/trunk/examples/split_video_for_youtube.sh > ../bin/split_video_for_youtube && chmod u+x ../bin/split_video_for_youtube




 # cd youtube-upload-VERSION
 #python youtube_upload/youtube_upload.py ...
# sudo apt-get install subversion
 #svn checkout http://youtube-upload.googlecode.com/svn/trunk/ youtube-upload
 #cd youtube-upload
 #sudo python setup.py install
 file_vid=test.mov
 #wget https://github.com/kylejginavan/youtube_it/blob/master/test/${file_vid}?raw=true
 wget  "https://raw.githubusercontent.com/kylejginavan/youtube_it/master/test/${file_vid}"
ls -l $file_vid

python youtube_upload/youtube_upload.py --email=$user@gmail.com --password=$password \
                 --title="A.S. Mutter" --description="A.S. Mutter plays Beethoven" \
                 --category=Music --keywords="mutter, beethoven" $file_vid #&>/dev/null
#www.youtube.com/watch?v=pxzZ-fYjeYs


}
 
#steps_for_youtube
#echo $super_secret_password
echo "my secret env: $user"
steps_for_youtube
#openssl aes-256-cbc -k "$super_secret_password" -in super_secret.txt.enc -out super_secret.txt -d

 #steps_for_travis
  #set_env1
  #before_install &&  step install1
  #step before_script &&   step script1 &&    step after_script &&   step after_success ||   step after_failure
