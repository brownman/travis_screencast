#!/bin/bash
set -u

run(){
local cmd args size
args="$@"
cmd="$dir_SCRIPT/${args}.sh"
echo "[TASK] $cmd"
eval "$cmd"
}
 ################################## load .cfg + RUN
#source $dir_root/CFG/config.cfg
#steps_for_config
#source $dir_root/CFG/config_ffmpeg.cfg


eval "run $filename_init"
