
steps_for_youtube(){
 # install_library
#set_traps
#set_env_travis
# sudo   pip install googlecl
#commander google youtube post --category Education killer_robots.avi
VERSION=0.7.3
wget http://youtube-upload.googlecode.com/files/youtube-upload-$VERSION.tgz
 tar xvzf youtube-upload-$VERSION.tgz
  cd youtube-upload-$VERSION
 # pip install --allow-external  youtube-upload
#  sudo python setup.py install 
  
  
  # stuff for youtube
sudo apt-get install -y libcurl4-gnutls-dev librtmp-dev
sudo pip install pycurl gdata progressbar 
  sudo python setup.py install 
#sudo pip install youtube-upload
#curl http://youtube-upload.googlecode.com/svn/trunk/examples/split_video_for_youtube.sh > ../bin/split_video_for_youtube && chmod u+x ../bin/split_video_for_youtube




 # cd youtube-upload-VERSION
 #python youtube_upload/youtube_upload.py ...
# sudo apt-get install subversion
 #svn checkout http://youtube-upload.googlecode.com/svn/trunk/ youtube-upload
 #cd youtube-upload
 #sudo python setup.py install
# file_vid=test.mov
 #wget https://github.com/kylejginavan/youtube_it/blob/master/test/${file_vid}?raw=true
# wget  "https://raw.githubusercontent.com/kylejginavan/youtube_it/master/test/${file_vid}"

file_vid=$dir_product/session.mp4
ls -l $file_vid

python youtube_upload/youtube_upload.py --email=$user@gmail.com --password=$password \
                 --title="$TRAVIS_BUILD_NUMBER" --description="$TRAVIS_BUILD_NUMBER" \
                 --category=Music --keywords="x,y" $file_vid &>/dev/null
#www.youtube.com/watch?v=pxzZ-fYjeYs


}
 
#steps_for_youtube
#echo "my secret env: $user"
  steps_for_youtube 
