export dir_root=$(cd $(dirname $0) && pwd )
#source $dir_root/CFG/travis.cfg
export MODE_MUTE=true

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

try(){
  set -u
 # set -e
  local cmd="$@"
  local res
  echo  "[STEP] $cmd"
    
  #test_trap_err
  set +e
  
  
  if [ $MODE_MUTE =  true ];then
  eval "$cmd" 1>/dev/null 2>/tmp/err || { indicator; cat /tmp/err; exit 1; }
  else
  eval "$cmd"
  fi
}
test_trap_err(){
  some_err
}

steps_for_travis(){
 
  #set_env1
  #before_install &&  step install1
  #step before_script &&   step script1 &&    step after_script &&   step after_success ||   step after_failure
  $dir_root/INSTALL/library.sh
    source /tmp/library.cfg &>/dev/null
   print ok
   indicator $?
   trap
   trap - ERR
   commander $cmd_trap_err_travis
  # $cmd_trap_err
   #   $cmd_trap_exit
  try $dir_root/INSTALL/extra.sh
   
  
 try source $dir_root/CFG/helper.cfg
 try  source $dir_root/CFG/exports.cfg
  try  source $dir_root/CFG/ffmpeg.cfg

  
 
  try $dir_root/INSTALL/ppa.sh
 try  $dir_root/INSTALL/update.sh

 try $dir_root/INSTALL/depend.sh
 try $dir_root/run.sh x11
 try $dir_root/run.sh debug_screen
#commander
try $dir_root/run.sh task &
#commander
commander $dir_root/run.sh record

 try $dir_root/run.sh push_to_github
 


}
steps_for_travis
