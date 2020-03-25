FROM ubuntu:18.04

# Download and install dependencies and create steam user
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wget lib32gcc1 lib32stdc++6 lib32tinfo5 && \
    rm -r /var/cache/apt/archives/* && \
    useradd steam -m

WORKDIR /home/steam
USER steam

# Download steamcmd
RUN mkdir content Steam tmp && \
    cd Steam && \
    wget http://media.steampowered.com/client/steamcmd_linux.tar.gz && \
    tar xzf steamcmd_linux.tar.gz && \
    rm steamcmd_linux.tar.gz

# Download gmod and cleanup
RUN ./Steam/steamcmd.sh +login anonymous +force_install_dir /home/steam/gmodds +app_update 4020 validate +quit && \
    rm -r /home/steam/tmp && \
    rm /home/steam/Steam/logs/*

ADD start-server.sh start-server.sh

EXPOSE 27015/udp
EXPOSE 27015/tcp
EXPOSE 27005/udp
EXPOSE 27006/tcp

ENV PORT="27015"
ENV MAXPLAYERS="16"
ENV G_HOSTNAME="Garry's Mod"
ENV PASSWORD = ""
ENV GAMEMODE="terrortown"
ENV MAP="gm_construct"
ENV HOST_WORKSHOP_COLLECTION = ""
ENV AUTHKEY = ""
ENV ARGS=""
USER steam
CMD ["/bin/sh", "start-server.sh"]
