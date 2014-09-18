#!/bin/bash
set -e


steps_for_library(){
 commander cd $HOME
  commander git clone https://github.com/brownman/LIBRARY --depth=1
  local dir2
  dir2=$HOME/LIBRARY
  
  commander tree $dir2
  
  commander source $dir2/library.cfg
 
  commander source /tmp/library.cfg
  commander use1
  commander print ok 
}
steps_for_library
