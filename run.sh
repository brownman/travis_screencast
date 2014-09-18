#!/bin/bash
set -x
set -e
set -u
export dir_root=$(cd $(dirname $0) && pwd )


task(){
local cmd args size
args="$@"
cmd="$dir_script/${args}.sh"
 


size=$( du /tmp/session.ogv | cut -d'.'  -f1 ) 
echo "[SIZE] $size"
if [ $size -gt 9000000 ];then
$file_github
fi
}


source $dir_root/config.cfg
steps_for_config
commander "task $@"
