    
  # commander "$XVFB $DISPLAY -screen $SCREEN -extension RANDR" &
  commander  sudo sh -e /etc/init.d/xvfb start
  commander  'sudo dbus-launch pulseaudio --start'
