

sudo apt-get update -qq

while read line;do
test -n "$line" || break
commander install $line
done < ./txt/depend.txt
