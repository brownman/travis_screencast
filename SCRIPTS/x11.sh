    commander  'dbus-launch pulseaudio --start'
  # commander "$XVFB $DISPLAY -screen $SCREEN -extension RANDR" &
  commander  sh -e /etc/init.d/xvfb start
