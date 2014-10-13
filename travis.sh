export dir_root=$(cd $(dirname $0) && pwd )
source $dir_root/CFG/trap_travis.cfg
#source $dir_root/CFG/travis.cfg
#export MODE_MUTE=true
po(){
 local str="$@"
 #echo $str | cut -d':' -f2
 local str0=$( echo $str | cut -d':' -f1 )
 echo $str0
 eval echo \$$str0
 echo ---
}
print_env(){
po TRAVIS_BRANCH #:For builds not triggered by a pull request this is the name of the branch currently being built; whereas for builds triggered by a pull request this is the name of the branch targeted by the pull request (in many cases this will be master).
po TRAVIS_BUILD_DIR #: The absolute path to the directory where the repository being built has been copied on the worker.
po TRAVIS_BUILD_ID #: The id of the current build that Travis CI uses internally.
po TRAVIS_BUILD_NUMBER #: The number of the current build (for example, "4").
po TRAVIS_COMMIT #: The commit that the current build is testing.
po TRAVIS_COMMIT_RANGE #: The range of commits that were included in the push or pull request.
po TRAVIS_JOB_ID #: The id of the current job that Travis CI uses internally.
po TRAVIS_JOB_NUMBER #:  The number of the current job (for example, "4.1").
po TRAVIS_PULL_REQUEST #: The pull request number if the current job is a pull request, "false" if it's not a pull request.
po TRAVIS_SECURE_ENV_VARS #: Whether or not secure environment vars are being used. This value is either "true" or "false".
po TRAVIS_REPO_SLUG #: The slug (in form: owner_name/repo_name) of the repository currently being built. (for example, "travis-ci/travis-build").
po TRAVIS_OS_NAME #: On multi-OS builds, this value indicates the platform the job is running on. Values are linux and osx currently, to be extended in the future.
po TRAVIS_TAG #: If the current build for a tag, this includes the tag's name.
}
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
try 0 $dir_root/INSTALL/tests.sh    
try 12 $dir_root/INSTALL/depend.sh
try 12 $dir_root/INSTALL/youtube.sh
}

set_env_travis(){
 try 12  source $dir_root/CFG/exports.cfg
 try 12  source $dir_root/CFG/ffmpeg.cfg
}
############################################################## configure
validate_product(){
    commander "assert file_has_content $dir_product/session.mp4"
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
validate_product && { 
  git log -1 | grep 'upload to youtube' &&  { try 0 $dir_root/run.sh youtube_upload; } || { print ok skip youtube-upload; }
  try 12 $dir_root/run.sh push_to_github; 
  
}
}
############################################################## run!
steps_for_gitbook(){
  install_library
set_traps
set_env_travis
  
  commander npm install gitbook -g
  local fmt='Static Website'
  local dir_readme="$dir_product"
  commander "gitbook build $dir_readme --format='$fmt'--output=$dir_product/gitbook"
  
  try 12 $dir_root/run.sh push_to_github;
}
#steps_for_travis

print_env
steps_for_travis
#steps_for_gitbook

#openssl aes-256-cbc -k "$super_secret_password" -in super_secret.txt.enc -out super_secret.txt -d

 #steps_for_travis
  #set_env1
  #before_install &&  step install1
  #step before_script &&   step script1 &&    step after_script &&   step after_success ||   step after_failure
