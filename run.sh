#!/bin/bash
set -u

run(){
local cmd args size
local str="$@"
local runner=${str[@]:0:1}
local args=${str[@]:1}


cmd="$dir_SCRIPT/${runner}.sh $args"
echo "[TASK] $cmd" 
eval "$cmd" 2>/tmp/log/${runner}.err 1>/tmp/log/${runner}.out
}
 ################################## load .cfg + RUN
#source $dir_root/CFG/config.cfg
#steps_for_config
#source $dir_root/CFG/config_ffmpeg.cfg



run $@
