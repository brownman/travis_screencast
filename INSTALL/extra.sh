#https://github.com/jnvsor/screencap
#http://www.installion.co.uk/ubuntu/trusty/universe/l/libfrei0r-ocaml-dev/en/install/index.html
set -e
entry1="deb http://us.archive.ubuntu.com/ubuntu $(lsb-release -cs) main universe"
#- curl http://repo.varnish-cache.org/debian/GPG-key.txt | sudo apt-key add -
echo "$entry1" | sudo tee -a /etc/apt/sources.list
  
  sudo apt-get update
