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
steps_for_travis


 
  #set_env1
  #before_install &&  step install1
  #step before_script &&   step script1 &&    step after_script &&   step after_success ||   step after_failure
