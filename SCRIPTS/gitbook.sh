steps_for_gitbook(){
   commander npm install gitbook -g
  local fmt='Static Website'
  local dir_readme="$dir_product"
  commander "gitbook build $dir_readme --format='$fmt'--output=$dir_product/gitbook"
  
  try 12 $dir_root/run.sh push_to_github;
}

steps_for_gitbook
