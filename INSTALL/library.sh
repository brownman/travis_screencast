#!/bin/bash
 
skip(){
echo 1>&2 skipping: $@
}

trace0(){
 echo 1>&2 "[-] $@"
 }

exiting(){
echo "[ exiting ] $(caller)"
exit 1
}


commander1() 
{ 
    local args=($@);
    local cmd="${args[@]}";
    trace0 ---------------
    trace0 "[cmd] :: $cmd";
    eval "$cmd" || exiting
    res="$?";
    trace0 res: $res;
    trace0 ---------------
    return $res
}

steps_for_library(){
 commander1 cd $HOME
 local url_repo=https://github.com/brownman/LIBRARY
  commander1 git clone  --depth=1 $url_repo --branch=develop
  #git archive --format=tar --remote=$url_repo HEAD | tar xf -
  local dir2
  dir2=$HOME/LIBRARY
  
  #commander tree $dir2
  
  commander1 source $dir2/library.cfg
  commander1 source /tmp/library.cfg
  
  
  echo 1>&2 TESITNG use of the LIBRARY:
  use print
  commander1 print ok 
}

library_test(){
 use pipe_translate
commander subshell pipe_translate hello 
}


steps_for_library
#library_test
