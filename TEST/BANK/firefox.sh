 
test_firefox(){
# commander  sudo apt-get install firefox -y
commander "firefox www.youtube.com/watch?v=oHg5SJYRHA0 &"
xcowsay "$( wmctrl -l )"
wmctrl -a perform
xdotool key space
commander sleep 10
paplay <(espeak -vmb-us2  "That bored me" --stdout)
killall firefox  
}
test_firefox
