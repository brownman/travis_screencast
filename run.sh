#!/bin/bash
set -u

run(){
local cmd args size
args="$@"
cmd="$dir_SCRIPT/${args}.sh"
echo "[TASK] $cmd" 
eval "$cmd" 2>/tmp/log/${filename_init}.err 1>/tmp/log/${filename_init}.out
}
 ################################## load .cfg + RUN
#source $dir_root/CFG/config.cfg
#steps_for_config
#source $dir_root/CFG/config_ffmpeg.cfg

filename_init=$1
eval "run $filename_init"
