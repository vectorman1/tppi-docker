FROM openjdk:8-jre-slim-buster

RUN apt-get update \
    && apt-get install -y curl unzip \
    && mkdir /minecraft \
    && cd /minecraft \
    && curl http://servers.technicpack.net/Technic/servers/tppi/TPPIServer-v1.1.2a.zip -o tppi.zip \
	&& unzip tppi.zip \
	&& rm tppi.zip \
	&& chmod +x launch.sh

EXPOSE 25565 25565/udp

WORKDIR /minecraft
CMD ["./launch.sh"]