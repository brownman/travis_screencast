debug_screen(){
commander xwininfo -root -tree
#xcowfortune -t 3 &
commander xcowsay -t 3  "travis: build number: $TRAVIS_BUILD_NUMBER" &
commander notify-send "travis: build number" "$TRAVIS_BUILD_NUMBER"
commander sleep 1 
commander "import -window root $file_product_cover"
}

debug_screen
