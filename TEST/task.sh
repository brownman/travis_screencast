
#export DISPLAY=:99
#eval "export DISPLAY=:99.0"
print color 33 "DISPLAY: $DISPLAY"

test -f $file_list_session || exiting
while read line;do
test -n "$line" || { print ok empty line; break; }
  (  commander $line  )&
  sleep $timeout_task
done <$dir_TXT/task.txt

 
