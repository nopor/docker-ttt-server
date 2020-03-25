# docker-ttt-server

1. [Steam Workshop](https://steamcommunity.com/workshop/browse/?appid=4000&searchtext=ttt&childpublishedfileid=0&section=collections)
2. Get an [Steam API Key](https://steamcommunity.com/dev/apikey)
3. Set up environment variables:

```docker
PORT = "27015"
MAXPLAYERS = "16"
G_HOSTNAME = "Garry's Mod"
GAMEMODE = "terrortown"
MAP = "gm_construct"
PASSWORD = ''
HOST_WORKSHOP_COLLECTION = ""
AUTHKEY = ""
ARGS = "" // can be used for any additional parameter, e.g. "+rcon_password xxxx" (see example)
```

Build:

```bash
docker build -t tttserver .
```

Example:

```bash
docker run -t -d -p 27005:27005/udp \
-p 27015:27015/udp \
-p 27006:27006/tcp \
-p 27015:27015/tcp \
-v ./server.cfg:/home/steam/gmodds/garrysmod/cfg/server.cfg tttserver \
--env PORT='27015' \
--env MAXPLAYERS='16' \
--env G_HOSTNAME='Garry\'s Mod' \
--env PASSWORD='xxx' \
--env GAMEMODE='terrortown' \
--env MAP='gm_construct' \
--env HOST_WORKSHOP_COLLECTION='XXXX' \
--env AUTHKEY='XXXX' \
--env ARGS='+rcon_password xxxx'
```
