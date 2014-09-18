#!/bin/bash
if [ -s /tmp/session.ogv ];then
 size=$( du /tmp/session.ogv | cut -d'.'  -f1 ) 
 echo "[SIZE] $size"
 if [ $size -gt 9000000 ];then
  print ok
 fi
else
  exiting
fi


steps(){
owner=brownman
repo=travis_screencast
path=`pwd`
dirname=coverage
dir=$path/$dirname
mkdir -p $dir

filename=date.txt

git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials
  
  
file=$dir/$filename

echo $( date )  > $file

echo [ file info/location ] 
ls -l $file
cat $file
mv /tmp/session.ogv $dir/
  
  
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo -e "Starting to update gh-pages\n"



  
  cp -R $dir $HOME/coverage
  cd $HOME
  
  
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/$owner/$repo.git  gh-pages #> /dev/null

  cd gh-pages
  cp -Rf $HOME/coverage/* .

  git add -f .
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to gh-pages"
  git push -fq origin gh-pages #> /dev/null

  echo -e "Done magic with coverage\n"
fi

}
steps
