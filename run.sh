#!/bin/bash
shopt -s expand_aliases
set -u


filename_init="$1"
######################################### log by name
if [ $mute_err = true ];then
    exec 2>  /tmp/log/${filename_init}.err
fi

if [ $mute_out = true ];then
    exec 1>  /tmp/log/${filename_init}.out
fi
##########################################



export dir_root=$(cd $(dirname $0) && pwd )
#test -d $dir_root || { exit 1; }

task(){
local cmd args size
args="$@"
cmd="$dir_SCRIPT/${args}.sh"
echo "[TASK] $cmd"
eval "$cmd"
}
########################################## load .cfg + RUN
#source $dir_root/CFG/config.cfg
#steps_for_config
#source $dir_root/CFG/config_ffmpeg.cfg


eval "task $filename_init"
