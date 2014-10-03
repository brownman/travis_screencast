export dir_root=$(cd $(dirname $0) && pwd )
source $dir_root/CFG/travis.cfg


step(){
  set -e
  local cmd=$1
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
}
steps_for_travis
