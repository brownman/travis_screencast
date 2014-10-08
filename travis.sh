export dir_root=$(cd $(dirname $0) && pwd )
#source $dir_root/CFG/travis.cfg
export MODE_MUTE=true
########################################### fast fail on travis
trap_err_travis () 
{ 
    use print;
    print func;
    print error;
    $str_caller;
    exit 1
}
export cmd_trap_err_travis='trap trap_err_travis ERR'
export -f trap_err_travis
############################################################## 1 step:
try(){
  set -u
 # set -e
  local cmd="$@"
  local res
  echo  "[STEP] $cmd"
    
  #test_trap_err
  #set +e
  if [ $MODE_MUTE =  true ];then
  eval "$cmd" 1>/dev/null 2>/tmp/err || { indicator; cat /tmp/err; exit 1; }
  else
  eval "$cmd"
  fi
}
##############################################################
test_trap_err(){
  some_err
}
install_library(){
   $dir_root/INSTALL/library.sh
   source /tmp/library.cfg &>/dev/null
   print ok
   indicator $?
   trap
   trap - ERR
   commander $cmd_trap_err_travis
}

install_others(){

#1. UPDATE: APT-GET RESOURCES
try $dir_root/INSTALL/sources.sh

#depend: apt-add-repository
try $dir_root/INSTALL/ppa.sh

#2. APT-GET UPDATE
try $dir_root/INSTALL/update.sh

#3.install packages
try $dir_root/INSTALL/tests.sh    
try $dir_root/INSTALL/depend.sh
}

set_env_travis(){
 try  source $dir_root/CFG/exports.cfg
 try  source $dir_root/CFG/ffmpeg.cfg
}

validate_travis(){
    commander "assert file_has_content $file_output"
}

steps_for_travis(){
install_library
set_env_travis
install_others

try $dir_root/run.sh x11
try $dir_root/run.sh debug_screen
try $dir_root/run.sh task &
try $dir_root/run.sh record
validate_travis
try $dir_root/run.sh push_to_github
}
steps_for_travis

 
  #set_env1
  #before_install &&  step install1
  #step before_script &&   step script1 &&    step after_script &&   step after_success ||   step after_failure
