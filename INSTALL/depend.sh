
set -u

#while read line;do
#test -n "$line" || break
#commander sudo apt-get install $line
#done < <( cat $dir_TXT/depend.txt | grep -v \# )
use act_on_list
act_on_list $dir_TXT/depend.txt  'sudo apt-get install'
