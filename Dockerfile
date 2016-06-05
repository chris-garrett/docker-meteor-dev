FROM ubuntu:16.04
RUN update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX
RUN apt-get update && \
    apt-get install -y curl
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN curl https://install.meteor.com/ | sh
WORKDIR /opt/app
EXPOSE 3000
CMD [ "meteor" ]
