#!/bin/bash

 commander cd $HOME
  commander git clone https://github.com/brownman/LIBRARY --depth=1
  commander $HOME/LIBRARY/install.sh
  
  commander source /tmp/library.cfg
  commander use1
  commander print ok 
