#!/bin/bash
shopt -s expand_aliases


set -u
export dir_root=$(cd $(dirname $0) && pwd )

if [ -L /tmp/library.cfg ];then
source /tmp/library.cfg
activate_important
else
echo 1>&2  use temporary func: commander
alias commander=commander1
fi


task(){
local cmd args size

args="$@"
cmd="$dir_script/${args}.sh"
trace0 $cmd
eval "$cmd"

if [ -s /tmp/session.ogv ];then
 size=$( du /tmp/session.ogv | cut -d'.'  -f1 ) 
 echo "[SIZE] $size"
 if [ $size -gt 9000000 ];then
  $file_github
 fi
fi
}

filename_init="$1"
source $dir_root/config.cfg
steps_for_config
eval "task $filename_init"
