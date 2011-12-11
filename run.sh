#!/bin/bash
cd `dirname $0`

rm -f server.stop

while ! [ -f server.stop ]; do
  if ! [ -p server.ctl ]; then
    rm -f server.ctl
    mkfifo server.ctl
  fi

  git pull

  mkdir -p server
  pushd server >/dev/null
    java -Xincgc -Xmx1G -jar ../craftbukkit-1.0.0-SNAPSHOT.jar nogui <> ../server.ctl &>/dev/null

    if [ "$?" != 0 ]; then
      echo "Fail !" `date` > ../fail.log
    fi
  popd >/dev/null

  sleep 1
done
