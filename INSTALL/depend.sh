
set -u

while read line;do
test -n "$line" || break
commander sudo apt-get install $line
done < <( cat $dir_TXT/depend.txt | grep -v \# )
