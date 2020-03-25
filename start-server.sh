#!/bin/bash
if [ ! -z $AUTHKEY ]
then
AUTHKEYFULL="-authkey ${AUTHKEY}"
fi

if [ ! -z $PASSWORD ]
then
PASSWORDFULL="+sv_password ${PASSWORD}"
fi

if [ ! -z $HOST_WORKSHOP_COLLECTION ]
then
COLLECTION="+host_workshop_collection ${HOST_WORKSHOP_COLLECTION}"
fi

./home/Steam/steamcmd.sh +login anonymous +force_install_dir /home/steam/gmodds +app_update 4020 validate +quit

while true; do
/home/steam/gmodds/srcds_run -game garrysmod -norestart -port ${PORT} \
 "${AUTHKEYFULL}" \
 +maxplayers ${MAXPLAYERS} \
 +hostname "${G_HOSTNAME}" \
 +gamemode ${GAMEMODE} \
 +map ${MAP} \
 "${PASSWORDFULL}" \
 "${COLLECTION}" \
 "${ARGS}"
done
