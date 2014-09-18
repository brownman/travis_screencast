#!/bin/bash
set -e
 commander cd $HOME
  commander git clone https://github.com/brownman/LIBRARY --depth=1
  commander source $HOME/LIBRARY/library.cfg
   
  commander source /tmp/library.cfg
  commander use1
  commander print ok 
