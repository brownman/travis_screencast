#

#!/bin/bash
#
# USAGE:
#     bash -ex /usr/lib/selenium/headlessSelenium.sh $BASEURL $WORKSPACE $TEST_SUITE
#
#
WORKSPACE=$1
BASEURL=$2
TEST_SUITE=$3

SELENIUM="java -jar /usr/lib/selenium/selenium-server.jar"
FIREFOX_BIN="/usr/lib/iceweasel/firefox-bin"
DISPLAY=":99"
#
# This option creates screen screennum and sets its width, height, and depth to W, H, and  D  respectively.
# By default, only screen 0 exists and has the dimensions 1280x1024x8.
#
SCREEN="0 1280x1024x16"

#Use virtual X server
VIRTUAL_X="Xvfb $DISPLAY"

#init
if [ -z "$(pidof Xvfb)" ]; then
        $VIRTUAL_X &
fi
export DISPLAY

$SELENIUM -htmlSuite "*firefox $FIREFOX_BIN" ${BASEURL} ${TEST_SUITE} ${WORKSPACE}/selenium-results.html
