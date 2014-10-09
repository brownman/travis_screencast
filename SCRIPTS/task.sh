
#export DISPLAY=:99
#eval "export DISPLAY=:99.0"
print color 33 "DISPLAY: $DISPLAY"
run(){
local pid file filename

test -f $file_list_session || exiting
while read line;do
test -n "$line" || { print ok empty line; break; }
  file=dir_TEST=$dir_TEST/BANK/$line
  filename=$(basename $file)
  test -f $file && (  gxmessage -file $file -timeout 3 -title "$filename"; commander $file )&
  pid=$!
  sleep $timeout_task
  kill $pid
done <$dir_TXT/task.txt
}

run
