po(){
 local str="$@"
 #echo $str | cut -d':' -f2
 local str0=$( echo $str | cut -d':' -f1 )
 echo $str0
 eval echo \$$str0
 echo ---
}
print_env(){
po TRAVIS_BRANCH #:For builds not triggered by a pull request this is the name of the branch currently being built; whereas for builds triggered by a pull request this is the name of the branch targeted by the pull request (in many cases this will be master).
po TRAVIS_BUILD_DIR #: The absolute path to the directory where the repository being built has been copied on the worker.
po TRAVIS_BUILD_ID #: The id of the current build that Travis CI uses internally.
po TRAVIS_BUILD_NUMBER #: The number of the current build (for example, "4").
po TRAVIS_COMMIT #: The commit that the current build is testing.
po TRAVIS_COMMIT_RANGE #: The range of commits that were included in the push or pull request.
po TRAVIS_JOB_ID #: The id of the current job that Travis CI uses internally.
po TRAVIS_JOB_NUMBER #:  The number of the current job (for example, "4.1").
po TRAVIS_PULL_REQUEST #: The pull request number if the current job is a pull request, "false" if it's not a pull request.
po TRAVIS_SECURE_ENV_VARS #: Whether or not secure environment vars are being used. This value is either "true" or "false".
po TRAVIS_REPO_SLUG #: The slug (in form: owner_name/repo_name) of the repository currently being built. (for example, "travis-ci/travis-build").
po TRAVIS_OS_NAME #: On multi-OS builds, this value indicates the platform the job is running on. Values are linux and osx currently, to be extended in the future.
po TRAVIS_TAG #: If the current build for a tag, this includes the tag's name.
}
############################################################## 1 step:
print_env
