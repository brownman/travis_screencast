#
args="$@"

dir1=./SCRIPTS
file_proto=$dir/prototypes.sh
file_github=$dir/push_to_github.sh

cmd="$dir1/${args}.sh"
echo "[cmd] $cmd"
eval "$cmd

size=$( du /tmp/session.ogv | cut -d'.'  -f1 ) 
echo "[SIZE] $size"
if [ $size -gt 9000000 ];then
$file_github
fi
