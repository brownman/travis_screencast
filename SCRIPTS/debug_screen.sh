debug_screen(){
commander xwininfo -root -tree
#xcowfortune -t 3 &
xcowsay -t 3  "travis: build number: $TRAVIS_BUILD_NUMBER" &
notify-send "travis: build number" "$TRAVIS_BUILD_NUMBER"
sleep 1 
commander "import -window root $file_product_cover"
}

debug_screen
