#!/bin/bash
dir_root=$(cd $(dirname $0) && pwd )


source config.cfg
steps_for_config

run(){
local args="$@"
local cmd="$dir1/${args}.sh"
echo "[cmd] $cmd"
eval "$cmd

size=$( du /tmp/session.ogv | cut -d'.'  -f1 ) 
echo "[SIZE] $size"
if [ $size -gt 9000000 ];then
$file_github
fi
}
run $@
