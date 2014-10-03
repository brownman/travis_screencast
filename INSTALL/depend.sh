


while read line;do
test -n "$line" || break
commander install $line
done < <( cat $dir_TXT/depend.txt | grep -v \# )
