#!/bin/bash
set -u




upload(){

git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials
  
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo -e "Starting to update gh-pages\n"
  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/$owner/$repo.git  gh-pages #> /dev/null
  cd gh-pages
  
  #test -d old || { mkdir old; }
 # mv *.* old/
 # git rm -rf *.*
  #git rm -rf old
  #git rm -rf log
  #git rm -rf files
  
  dir_new=build/$TRAVIS_BUILD_NUMBER
  mkdir -p $dir_new
  
  mv  $dir_product $dir_new/files #/* files
  mv /tmp/log $dir_new/log
  
  ### summary
  ls -lR --sort=size $dir_new > $dir_new/log.txt  #_${TRAVIS_BUILD_NUMBER}.txt
  #ls -l --sort=size files  > files.txt #_${TRAVIS_BUILD_NUMBER}.txt
  #ln -l ./web/index.html .
 

  git add -f .
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to gh-pages"
  git push -fq origin gh-pages #> /dev/null
  print color 33 "Done magic with coverage\n"
fi

}
steps(){
#validate_products && 
assert file_exist $file_product_cover
#assert file_has_content $file_product
upload
}
steps
