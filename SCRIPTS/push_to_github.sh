#!/bin/bash
set -u

gitbook(){
  commander npm install gitbook -g
  local fmt='Static Website'
  local dir_readme="$dir_product"
  commander "gitbook build $dir_readme --format='$fmt'--output=$dir_product/gitbook"
  
}
clone1(){
    echo -e "Starting to update gh-pages\n"
  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
commander  git clone --depth=1 --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/$owner/$repo.git  gh-pages #> /dev/null
}

rm2(){
test -d old || { mkdir old; }
mv *.* old/
git rm -rf build
}

migrate1(){
cd gh-pages
dir_new=build/$TRAVIS_BUILD_NUMBER
mkdir -p $dir_new
#
mv  $dir_product $dir_new/media #/* files
mv /tmp/log $dir_new/log
### summary
ls -lR --sort=size $dir_new > $dir_new/log.txt  #_${TRAVIS_BUILD_NUMBER}.txt
}

push1(){
git add -f .  
git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to gh-pages"
git push -fq origin gh-pages #> /dev/null
}

steps(){
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  clone1
  rm2
  migrate1
  push1
fi
}

steps
