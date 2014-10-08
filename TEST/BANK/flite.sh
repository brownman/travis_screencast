test_flite(){
#alias flite=`which flite`
str=$(dirname `which flite`)
export PATH=$PATH:$str  
flite -t hello -o /tmp/1.wav
paplay <(cat /tmp/1.wav)
}
test_flite
