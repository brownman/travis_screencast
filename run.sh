#
args="$@"

dir1=./SCRIPTS
file_proto=$dir/prototypes.sh
file_github=$dir/push_to_github.sh

$file_proto $args

size=$( du /tmp/session.ogv | cut -d'.'  -f1 ) 
echo "[SIZE] $size"
if [ $size -gt 9000000 ];then
$file_github
fi
