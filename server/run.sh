#!/bin/sh

cd `dirname $0`

while true; do
  java -Xincgc -Xmx1G -jar craftbukkit-1.0.0-SNAPSHOT.jar
  if [ "$?" = 0 ]; then
    exit
  fi
  echo "Fail !" `date` > fail.log
  sleep 1
done
