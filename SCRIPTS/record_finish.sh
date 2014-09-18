killall recordmydesktop
while pgrep -x recordmydesktop > /dev/null ; do sleep 1; done # wait for transcoding
tar cf artifacts.tar session.ogv
ls -l session.ogv
mv session.ogv /tmp
