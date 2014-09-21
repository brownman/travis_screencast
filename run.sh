#!/bin/bash
shopt -s expand_aliases
exec 2> >(tee -a /tmp/err >&2)

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

filename_init="$1"
source $dir_root/config.cfg
steps_for_config
eval "task $filename_init"
