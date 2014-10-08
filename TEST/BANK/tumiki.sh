depend tumiki-fighters
depend xdotool

test_game(){
  tumiki-fighters -fullscreen &
  sleep 1
  while :;do
  xdotool key ctrl
  sleep .3
  done
  
}
test_game
