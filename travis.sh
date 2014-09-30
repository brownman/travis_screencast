
steps_travis(){
  source ./config_travis.cfg
  set_env 
  before_install &&  install
  before_script &&   script &&    after_script &&   after_success ||   after_failure
}
steps_travis
