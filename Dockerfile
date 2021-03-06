FROM	ubuntu

# 25565 is for minecraft
EXPOSE	25565

# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive

# Download and install everything from the repos.
RUN    apt-get --quiet --yes update && apt-get --quiet --yes upgrade && apt-get --quiet --yes clean
RUN    apt-get --quiet --yes install wget unzip openjdk-8-jre-headless && apt-get --quiet --yes clean

# create defalt directory
RUN	mkdir /data

WORKDIR	/data


RUN	wget "https://dystopia.systems/tppi-server-1.1.3a.zip"
RUN	unzip tppi-server-1.1.3a.zip && rm tppi-server-1.1.3a.zip

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