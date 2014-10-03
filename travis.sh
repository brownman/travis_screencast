export dir_root=$(cd $(dirname $0) && pwd )
#source $dir_root/CFG/travis.cfg


step(){
  set -e
  set -u
  local cmd="$@"
  echo  "[STEP] $cmd"
  eval "$cmd"
}

steps_for_travis(){
  #set_env1
  #before_install &&  step install1
  #step before_script &&   step script1 &&    step after_script &&   step after_success ||   step after_failure
  $dir_root/INSTALL/library.sh
  source /tmp/library.cfg
  print ok
  
  source $dir_root/CFG/helper.cfg
  source $dir_root/CFG/exports.cfg
  commander exports
   $dir_root/INSTALL/update.sh
  $dir_root/INSTALL/depend.sh
}
steps_for_travis
