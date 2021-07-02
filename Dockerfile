FROM openjdk:7

RUN apt-get update \
    && apt-get install -y wget unzip \
    && mkdir /minecraft \
    && cd /minecraft \
    && wget http://servers.technicpack.net/Technic/servers/tppi/TPPIServer-v1.1.2a.zip \
	&& unzip TPPIServer-v1.1.2a.zip \
	&& rm TPPIServer-v1.1.2a.zip \
    && rm ServerStart.sh \
    && rm server.properties \
    && wget https://raw.githubusercontent.com/vectorman1/tppi-docker/master/ServerStart.sh \
	&& chmod +x ServerStart.sh \
    && wget https://raw.githubusercontent.com/vectorman1/tppi-docker/master/server.properties

EXPOSE 25565 25565/udp

WORKDIR /minecraft
CMD ["./ServerStart.sh"]
