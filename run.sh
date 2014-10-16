#!/bin/bash
set -u

run2(){
local cmd args size
str="$@"
runner=${str[@]:0:1}
args=${str[@]:1}


cmd="$dir_SCRIPT/${runner}.sh $args"
echo "[TASK] $cmd" 
eval "$cmd" 2>/tmp/log/${filename_init}.err 1>/tmp/log/${filename_init}.out
}
 ################################## load .cfg + RUN
#source $dir_root/CFG/config.cfg
#steps_for_config
#source $dir_root/CFG/config_ffmpeg.cfg

filename_init=$1
eval "run $filename_init"
