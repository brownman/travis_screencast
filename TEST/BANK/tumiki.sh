depend tumiki-fighters
depend xdotool

test_game(){
  tumiki-fighters -fullscreen &
  sleep 1
  while :;do
  xdotool key ctrl
  sleep .01
  done
  
}
build_game(){
  xterm 
  wmctrl -a xterm
 commander apt-get source tumiki-fighters
  commander cd tumiki-fighters
  commander sudo apt-get build-deps tumiki-fighters
  commander ./configure
  commander make 
  commander mv tumiki-fighters $dir_product/
}
#test_game
build_game
