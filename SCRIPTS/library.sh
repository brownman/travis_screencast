#!/bin/bash


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
  commander1 use1
  commander1 print ok 
}
steps_for_library
