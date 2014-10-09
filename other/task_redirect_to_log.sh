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
