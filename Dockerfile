FROM buildpack-deps:jessie

ENV METEOR_LOG=debug
ENV METEOR_OFFLINE_CATALOG=1

USER root

RUN set -x \
  && apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  vim \
  && groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node \
  && echo "alias l='ls -laFHh'" > /home/node/.bash_aliases \
  && mkdir -p /work/app/src /work/libs /work/npm \
  && echo "prefix = /work/npm" > /home/node/.npmrc \
  && chown -R node:node /home/node /work \
  && apt-get clean -y \
  && apt-get autoclean -y \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo /var/cache/debconf/*-old \
  && rm -rf /var/lib/cache /var/lib/log  \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/*

USER node

RUN set -x \
  && curl https://install.meteor.com/ | sh \
  && METEOR_LOG=debug METEOR_OFFLINE_CATALOG=1 /home/node/.meteor/meteor create --bare /work/app/src --release 1.4.3.1 \
  && rm -rf /work/app/src

WORKDIR /work/app/src
ENTRYPOINT ["/home/node/.meteor/meteor"]
CMD ["run"]
