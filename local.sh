gem install travis
echo now go get the OAUTH TOKEN
travis encrypt GH_TOKEN=$TOKEN --add env.global
