
steps_for_travis(){
  source ./config_travis.cfg
  set_env1
  before_install &&  install1
  before_script &&   script1 &&    after_script &&   after_success ||   after_failure
}
steps_for_travis
