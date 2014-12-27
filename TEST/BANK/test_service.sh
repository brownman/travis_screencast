test_service(){
cd /tmp
git clone --depth=1 https://github.com/brownman/do_for_others_first.git
cd do_for_others_first
chmod +x travis.sh
./travis.sh
./travis.sh user
./travis.sh library
./travis.sh service
}

test_service
