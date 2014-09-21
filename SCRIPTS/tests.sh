test_flite(){
#alias flite=`which flite`
str=$(dirname `which flite`)
export PATH=$PATH:$str  
flite -t hello -o /tmp/1.wav
paplay <(cat /tmp/1.wav)
}

test_prototype(){
cd /tmp
git clone https://github.com/brownman/prototypes
cd prototypes
./LIB/install.sh
./BANK/sanity_loop/run.sh
}
test_simple_gui(){
  xcowsay hi
  notify-send hello world
  gxmessage hi -t 3
  yad hi --timeout=3
}
test_firefox(){
# commander  sudo apt-get install firefox -y
commander "firefox www.youtube.com/watch?v=oHg5SJYRHA0 &"
commander sleep 10
paplay <(espeak -vmb-us2  "That bored me" --stdout)
killall firefox  
}
test_espeak(){
paplay <(espeak -vmb-us2  "Ok, let's get rickrolled" --stdout)
#eval "firefox www.youtube.com/watch?v=oHg5SJYRHA0 &"
#( TMOUT=20;   commander $router script  )
sleep 10
paplay <(espeak -vmb-us2  "That bored me" --stdout)
sleep 2
paplay <(espeak -vmb-us2  "Much better now" --stdout)
sleep 2
paplay <(espeak -vmb-us2  "I have to go. See you next build!" --stdout)
}
export DISPLAY=:99
test -f $file_list_session || exiting
while read line;do
test -n "$line" || { print ok empty line; break; }
  ( commander $line )
done <$file_list_session
