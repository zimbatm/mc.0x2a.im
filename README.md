Minecraft server control scripts
================================

Little script to sustain my mc.0x2a.im minecraft server.

./run.sh runs in a loop and can be run with nohup

the bukkit server is controlled by checking a new version in
the git repo

All server data is in "./server"

Usage
-----

Run the server: `nohup ./run.sh &`

Restart the server: `echo stop > server.ctl`

Stop the server:
```
touch server.stop
echo stop > server.ctl
```

Output logs are in "server/server.log"

Crash dates are in "fail.log"
