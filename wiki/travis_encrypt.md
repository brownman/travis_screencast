travis encrypt 
---

```bash
gem install --user travis
travis encrypt MY_SECRET_ENV=super_secret -r my_username/my_repo
Please add the following to your .travis.yml file:
secure: "OrEeqU0z6GJdC6Sx/X..."


travis encrypt-file travis.txt -r brownman/travis_screencast

```
- [travis.doc](http://docs.travis-ci.com/user/encrypting-files/)
- [stack-overflow](http://stackoverflow.com/questions/9338428/using-secret-api-keys-on-travis-ci)
