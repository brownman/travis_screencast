

steps(){
local pid
eval "export DISPLAY=:99.0"
eval "sh -e /etc/init.d/xvfb start"
dbus-launch pulseaudio --start
eval "recordmydesktop --no-cursor  --output=session.ogv &"
paplay <(espeak -vmb-us2  "Ok, let's get rickrolled" --stdout)
#eval "firefox www.youtube.com/watch?v=oHg5SJYRHA0 &"
flite_test
set_env
#start pid, delay, kill
(  set -e; $router script;  &)
pid=$!

sleep 10
paplay <(espeak -vmb-us2  "That bored me" --stdout)
kill $pid

sleep 2
paplay <(espeak -vmb-us2  "Much better now" --stdout)
sleep 2
paplay <(espeak -vmb-us2  "I have to go. See you next build!" --stdout)
killall recordmydesktop
while pgrep -x recordmydesktop > /dev/null ; do sleep 1; done # wait for transcoding
tar cf artifacts.tar session.ogv
ls -l session.ogv
mv session.ogv /tmp
}
steps
 
