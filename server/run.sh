#!/bin/sh

cd `dirname $0`

if ! [ -f server.ctl ]; then
  mkfifo server.ctl
fi

while true; do
  java -Xincgc -Xmx1G -jar craftbukkit-1.0.0-SNAPSHOT.jar nogui <> server.ctl &>/dev/null
  if [ "$?" = 0 ]; then
    exit
  fi
  echo "Fail !" `date` > fail.log
  sleep 1
done
