FROM ubuntu:16.04
RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX
RUN apt-get update && \
    apt-get install -y curl vim
RUN apt-get clean -y
RUN apt-get autoclean -y
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo /var/cache/debconf/*-old
RUN rm -rf /var/lib/cache /var/lib/log
RUN rm -rf /tmp/*
RUN rm -rf /var/tmp/*

MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-meteor-dev)

LABEL description="Meteor 1.4.2 Development Image"

RUN curl https://install.meteor.com/ | sh

ENV METEOR_LOG=debug
ENV METEOR_OFFLINE_CATALOG=1

RUN METEOR_LOG=debug METEOR_OFFLINE_CATALOG=1 meteor create /opt/app --unsafe-perm --release 1.4.2
RUN rm -rf /opt/app

WORKDIR /opt/app
EXPOSE 3000

ENTRYPOINT ["meteor", "--unsafe-perm"]
CMD ["run"]
