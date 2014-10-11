travis encrypt 
---
- gem install --user travis
- travis encrypt MY_SECRET_ENV=super_secret -r my_username/my_repo
- #Please add the following to your .travis.yml file:
- #secure: "OrEeqU0z6GJdC6Sx/X
-
- override .travis.yml: travis encrypt MY_SECRET_ENV=super_secret -r my_username/my_repo --add
-
- [url1](http://docs.travis-ci.com/user/encrypting-files/)
