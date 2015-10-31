FROM jks974/baseimage

MAINTAINER Jks

# Install sabnzbd
RUN add-apt-repository ppa:jcfp/ppa
RUN apt-get update
RUN apt-get install -y unrar par2 unzip
RUN apt-get install -y sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush

# Create sabnzb user. Test uid = user host
RUN useradd --system --uid 1000 -M --shell /usr/sbin/nologin sabnzb

VOLUME /config
VOLUME /data

USER sabnzb

EXPOSE 8080 9090

CMD ["/usr/bin/sabnzbdplus","--config-file","/config","--console"]