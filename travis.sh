
step(){
  set -e
  local cmd=$1
  echo  "[Cmd] $cmd"
  eval "$cmd"
}

steps_for_travis(){
  source ./config_travis.cfg
  set_env1
  before_install &&  step install1
  step before_script &&   step script1 &&    step after_script &&   step after_success ||   step after_failure
}
steps_for_travis
