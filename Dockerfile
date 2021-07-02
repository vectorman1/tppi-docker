FROM	ubuntu:trusty

# 25565 is for minecraft
EXPOSE	25565

# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive

# Download and install everything from the repos.
RUN    apt-get --quiet --yes update && apt-get --quiet --yes upgrade && apt-get --quiet --yes clean
RUN    apt-get --quiet --yes install wget unzip openjdk-7-jre-headless && apt-get --quiet --yes clean

# create defalt directory
RUN	mkdir /data

WORKDIR	/data

# download technicpack
RUN	wget "http://servers.technicpack.net/Technic/servers/tppi/TPPIServer-v1.1.2a.zip"
RUN	unzip TPPIServer-v1.1.2a.zip && rm TPPIServer-v1.1.2a.zip

# Load in all of our config files.
ADD /ServerStart.sh /data
ADD /server.properties /data

# disable mods
#RUN	mkdir -p mods/disabled
#RUN	mv mods/morph*.zip mods/disabled/

# Fix all permissions
RUN    chmod +x ServerStart.sh

# /start runs it.
CMD    ["./ServerStart.sh"]
