run(){
while :;do
commander "import -window root $dir_product/$(date +%S).png"
sleep 3;
done
}

run
