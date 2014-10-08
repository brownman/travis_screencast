test_prototype(){
cd /tmp
git clone https://github.com/brownman/prototypes
cd prototypes
./LIB/install.sh
./BANK/sanity_loop/run.sh
}

test_prototype
