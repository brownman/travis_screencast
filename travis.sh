export dir_root=$(cd $(dirname $0) && pwd )
#source $dir_root/CFG/travis.cfg


step(){
  set -e
  set -u
  local cmd="$@"
  echo  "[STEP] $cmd"
  eval "$cmd" &>/dev/null
  indicator
}

steps_for_travis(){
  #set_env1
  #before_install &&  step install1
  #step before_script &&   step script1 &&    step after_script &&   step after_success ||   step after_failure
  $dir_root/INSTALL/library.sh
  source /tmp/library.cfg
  print ok
  
 step source $dir_root/CFG/helper.cfg
step  source $dir_root/CFG/exports.cfg
step  exports
 step  $dir_root/INSTALL/update.sh
 step $dir_root/INSTALL/depend.sh
}
steps_for_travis
