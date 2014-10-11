travis build info: 
--------
- git commit info:
- http://docs.travis-ci.com/user/ci-environment/
 
```yaml
Environment variables #

CI=true
TRAVIS=true
CONTINUOUS_INTEGRATION=true
DEBIAN_FRONTEND=noninteractive
HAS_JOSH_K_SEAL_OF_APPROVAL=true
USER=travis (do not depend on this value)
HOME=/home/travis (do not depend on this value)
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
RAILS_ENV=test
RACK_ENV=test
MERB_ENV=test
JRUBY_OPTS="--server -Dcext.enabled=false -Xcompile.invokedynamic=false"
Additionally, Travis CI sets environment variables you can use in your build, e.g. to tag the build, or to run post-build deployments.

TRAVIS_BRANCH:For builds not triggered by a pull request this is the name of the branch currently being built; whereas for builds triggered by a pull request this is the name of the branch targeted by the pull request (in many cases this will be master).
TRAVIS_BUILD_DIR: The absolute path to the directory where the repository being built has been copied on the worker.
TRAVIS_BUILD_ID: The id of the current build that Travis CI uses internally.
TRAVIS_BUILD_NUMBER: The number of the current build (for example, "4").
TRAVIS_COMMIT: The commit that the current build is testing.
TRAVIS_COMMIT_RANGE: The range of commits that were included in the push or pull request.
TRAVIS_JOB_ID: The id of the current job that Travis CI uses internally.
TRAVIS_JOB_NUMBER: The number of the current job (for example, "4.1").
TRAVIS_PULL_REQUEST: The pull request number if the current job is a pull request, "false" if it's not a pull request.
TRAVIS_SECURE_ENV_VARS: Whether or not secure environment vars are being used. This value is either "true" or "false".
TRAVIS_REPO_SLUG: The slug (in form: owner_name/repo_name) of the repository currently being built. (for example, "travis-ci/travis-build").
TRAVIS_OS_NAME: On multi-OS builds, this value indicates the platform the job is running on. Values are linux and osx currently, to be extended in the future.
TRAVIS_TAG: If the current build for a tag, this includes the tag's name.
```
