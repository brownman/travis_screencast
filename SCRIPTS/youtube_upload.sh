
steps_for_youtube(){

VERSION=0.7.3
wget http://youtube-upload.googlecode.com/files/youtube-upload-$VERSION.tgz
tar xvzf youtube-upload-$VERSION.tgz
cd youtube-upload-$VERSION

sudo apt-get install -y libcurl4-gnutls-dev librtmp-dev
sudo pip install pycurl gdata progressbar 
sudo python setup.py install 


file_vid=$dir_product/session.mp4
ls -l $file_vid

python youtube_upload/youtube_upload.py --email=$user@gmail.com --password=$password \
                 --title="$TRAVIS_BUILD_NUMBER" --description="$TRAVIS_BUILD_NUMBER" \
                 --category=Music --keywords="x,y" $file_vid &>/dev/null
}
 
steps_for_youtube 
