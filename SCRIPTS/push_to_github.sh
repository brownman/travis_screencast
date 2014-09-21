#!/bin/bash
set -u




upload(){
local path=/tmp/1
local dir=$dir_product
local file_info=$dir_product/date.txt

git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials
echo "ls -l $dir_product"  > $file_info
  
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo -e "Starting to update gh-pages\n"
  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/$owner/$repo.git  gh-pages #> /dev/null
  cd gh-pages
  
  mv -Rf $dir_product/* .
  mv /tmp/err .
  
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
