 
test_firefox(){
# commander  sudo apt-get install firefox -y
#https://github.com/brownman/travis_screencast/blob/gh-pages/build/982/media/21.png
commander "firefox www.youtube.com/watch?v=oHg5SJYRHA0 &"
xcowsay "$( wmctrl -l )"
wmctrl -a perform
xdotool key space
commander sleep 10
paplay <(espeak -vmb-us2  "That bored me" --stdout)
killall firefox  
}
test_firefox
