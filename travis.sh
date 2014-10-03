export dir_root=$(cd $(dirname $0) && pwd )
#source $dir_root/CFG/travis.cfg
export MODE_MUTE=false

try(){
  set -u
  local cmd="$@"
  local res
  echo  "[STEP] $cmd"
  set +e
  if [ $MODE_MUTE =  true ];then
  eval "$cmd" 1>/dev/null 2>/tmp/err || { indicator; cat /tmp/err; exit 1; }
  else
  eval "$cmd"
  fi
}

steps_for_travis(){
 
  #set_env1
  #before_install &&  step install1
  #step before_script &&   step script1 &&    step after_script &&   step after_success ||   step after_failure
  $dir_root/INSTALL/library.sh
  try source /tmp/library.cfg
  try print ok
  try indicator $?
  
 try source $dir_root/CFG/helper.cfg
 try  source $dir_root/CFG/exports.cfg
 try  exports
 try  $dir_root/INSTALL/update.sh
 try $dir_root/INSTALL/depend.sh
 try $dir_root/run.sh x11
  try $dir_root/run.sh debug_screen
    try $dir_root/run.sh push_to_github


}
steps_for_travis
