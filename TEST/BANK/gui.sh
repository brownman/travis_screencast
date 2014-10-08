depend xcowsay
depend notify-send
depend gxmessage
depend yad

test_simple_gui(){
  xcowsay hi
  notify-send hello world
  gxmessage hi -timeout 3
  yad 'hello world' --timeout=3
}

test_simple_gui
