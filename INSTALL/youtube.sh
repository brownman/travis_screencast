youtube_install(){
                 
VERSION=0.7.3
wget http://youtube-upload.googlecode.com/files/youtube-upload-$VERSION.tgz
tar xvzf youtube-upload-$VERSION.tgz
cd youtube-upload-$VERSION

sudo apt-get install -y libcurl4-gnutls-dev librtmp-dev
sudo pip install pycurl gdata progressbar 
sudo python setup.py install 
}
youtube_install
