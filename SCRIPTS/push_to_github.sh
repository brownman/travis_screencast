#!/bin/bash
set -u


if [ -s $file_product ];then
 size=$( du $file_product | cut -d'.'  -f1 ) 
 print color 33 file size is: $size
 echo "[SIZE] $size"
 if [ $size -gt $size_min ];then
  print ok
 fi
else
  print color file is too small
  exiting
fi



steps(){
 

local path=`where_am_i $0`
local dirname=coverage
local dir=$path/$dirname
mkdir -p $dir

filename=date.txt

git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials
  
  
file=$dir/$filename

echo $( date )  > $file

echo [ file info/location ] 
ls -l $file
cat $file
mv $file_product $dir/
  
  
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
