FROM jks974/baseimage

MAINTAINER Jks

# Install sabnzbd
RUN add-apt-repository ppa:jcfp/ppa
RUN apt-get update
#RUN apt-get install -y sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush
RUN apt-get install -y sabnzbdplus


# Create sabnzb user. Test uid = user host
RUN useradd --system --uid 1000 -M --shell /usr/sbin/nologin sabnzb

VOLUME /config
VOLUME /data

RUN chown sabnzb:sabnzb /config -R
RUN chown sabnzb:sabnzb /data -R

USER sabnzb

EXPOSE 8080 9090

ENTRYPOINT ["/usr/bin/sabnzbdplus"]
CMD ["--config-file", "/config", "--server", "0.0.0.0:8080"]
