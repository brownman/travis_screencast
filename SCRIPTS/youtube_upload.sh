
steps_for_youtube(){

file_vid=$dir_product/session.mp4
ls -l $file_vid

python youtube_upload/youtube_upload.py --email=$user@gmail.com --password=$password \
                 --title="$TRAVIS_BUILD_NUMBER" --description="$TRAVIS_BUILD_NUMBER" \
                 --category=Music --keywords="x,y" $file_vid &>/dev/null
}
 
steps_for_youtube 
