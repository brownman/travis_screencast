#!/bin/bash
set -e


steps_for_library(){
 commander cd $HOME
 local url_repo=https://github.com/brownman/LIBRARY
  commander git clone  --depth=1 $url_repo
  #git archive --format=tar --remote=$url_repo HEAD | tar xf -
  local dir2
  dir2=$HOME/LIBRARY
  
  commander tree $dir2
  
  commander source $dir2/library.cfg
 
  commander source /tmp/library.cfg
  commander use1
  commander print ok 
}
steps_for_library
