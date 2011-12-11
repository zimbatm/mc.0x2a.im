#!/bin/sh
cd `dirname $0`

while ! [ -f server.stop ]; do
  if ! [ -p server.ctl ]; then
    rm -f server.ctl
    mkfifo server.ctl
  fi

  java -Xincgc -Xmx1G -jar craftbukkit-1.0.0-SNAPSHOT.jar nogui <> server.ctl &>/dev/null

  if [ "$?" != 0 ]; then
    echo "Fail !" `date` > fail.log
  fi

  sleep 1
done
rm -f server.stop
