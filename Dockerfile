FROM openjdk:8-jre-slim-buster

RUN apt-get update \
    && apt-get install -y wget unzip \
    && mkdir /minecraft \
    && cd /minecraft \
    && wget http://servers.technicpack.net/Technic/servers/tppi/TPPIServer-v1.1.2a.zip \
	&& unzip TPPIServer-v1.1.2a.zip \
	&& rm TPPIServer-v1.1.2a.zip \
	&& chmod +x launch.sh

EXPOSE 25565 25565/udp

WORKDIR /minecraft
CMD ["./launch.sh"]
