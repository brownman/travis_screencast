 
test_firefox(){
# commander  sudo apt-get install firefox -y
commander "firefox www.youtube.com/watch?v=oHg5SJYRHA0 &"
xcowsay "$( wmctrl -l )"
#wmctrl -a youtube
xdotool key space
commander sleep 10
paplay <(espeak -vmb-us2  "That bored me" --stdout)
killall firefox  
}
tess_firefox
