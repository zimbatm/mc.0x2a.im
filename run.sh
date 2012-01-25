#!/bin/bash
cd `dirname $0`

# Remove old stop conditions
rm -f server.stop

# Make sure the fifo exists
if ! [ -p server.ctl ]; then
  rm -f server.ctl
  mkfifo server.ctl
fi

# Update upstream code
# TODO: restart run.sh on update
git pull

# Run the server
mkdir -p server
pushd server >/dev/null
  java -Xincgc -Xmx1G -jar ../craftbukkit-1.1-R1.jar nogui <> ../server.ctl &>/dev/null

  if [ "$?" != 0 ]; then
    echo "Fail !" `date` > ../fail.log
  fi
popd >/dev/null

sleep 1

# Restart ./run.sh
# This allows updating the script himself via git
if [ -f server.stop ]; then
  rm server.stop
else
  exec ./run.sh
fi
