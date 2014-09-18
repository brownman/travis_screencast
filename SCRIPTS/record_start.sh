 
commander "export DISPLAY=:99.0"
commander "sh -e /etc/init.d/xvfb start"
commander dbus-launch pulseaudio --start

commander  "recordmydesktop --no-cursor  --output=session.ogv &"


