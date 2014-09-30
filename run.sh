#!/bin/bash
shopt -s expand_aliases
filename_init="$1"
 
#
if [ $mute_err = true ];then
    exec 2>  /tmp/log/${filename_init}.err
fi

if [ $mute_out = true ];then
    exec 1>  /tmp/log/${filename_init}.out
fi




set -u
export dir_root=$(cd $(dirname $0) && pwd )

if [ -L /tmp/library.cfg ];then
source /tmp/library.cfg &>/dev/null
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


}

source $dir_root/config.cfg
steps_for_config
source $dir_root/config_ffmpeg.cfg


eval "task $filename_init"
