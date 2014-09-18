test_flite(){
#alias flite=`which flite`
str=$(dirname `which flite`)
export PATH=$PATH:$str  
flite -t hello -o /tmp/1.wav
paplay <(cat /tmp/1.wav)
}

test_repo1(){
cd /tmp
git clone https://github.com/brownman/prototypes
cd prototypes
./LIB/install.sh
./BANK/sanity_loop/run.sh
}


test -f $file_list_session || exiting
while read line;do
  commander $line
done <$file_list_session
