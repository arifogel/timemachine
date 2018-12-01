FROM ubuntu:18.04

USER root
ENV HOME /root

RUN apt-get update
RUN apt-get -y install samba

RUN mkdir -p /data/backup
COPY smb.conf.timemachine ${HOME}/
RUN cat $HOME/smb.conf.timemachine >> /etc/samba/smb.conf
EXPOSE 139:139/tcp 445:445/tcp 137:137/udp 138:138/udp
#ENTRYPOINT ["smbd", "-F"]
