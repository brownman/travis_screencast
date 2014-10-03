    
  commander "exec $XVFB $DISPLAY -screen $SCREEN -extension RANDR" &
  #commander  sudo sh -e /etc/init.d/xvfb start
  commander  'dbus-launch pulseaudio --start'
  print color 33 "DISPLAY $DISPLAY"
  commander export DISPLAY=99.0
