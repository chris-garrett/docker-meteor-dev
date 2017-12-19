FROM debian:jessie

USER root

RUN set -x \
	&& apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    vim \
    locales \
    git \
    make \
    rake \
    build-essential \
    automake \
    autoconf \
    nasm \
    python \
    libpng-dev \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
  && rm -rf /var/lib/apt/lists/* \
  && groupadd --gid 1000 sprout \
  && useradd --uid 1000 --gid sprout --shell /bin/bash --create-home sprout \
  && echo "alias l='ls -laFHh'" > /home/sprout/.bash_aliases \
  && mkdir -p /work/app/src /work/libs /work/npm \
  && echo "prefix = /work/npm" > /home/sprout/.npmrc \
  && chown -R sprout:sprout /home/sprout /work \
	&& echo fs.inotify.max_user_watches=524288 > /etc/sysctl.d/increase-watches.conf \
	&& sysctl -p

USER sprout

RUN set -x \
  && curl https://install.meteor.com/ | sh \
  && METEOR_LOG=debug METEOR_OFFLINE_CATALOG=1 /home/sprout/.meteor/meteor create /work/app/src --release 1.6.0.1 \
  && rm -rf /work/app/src

ENV LANG en_US.utf8
ENV METEOR_LOG=debug
ENV METEOR_OFFLINE_CATALOG=1
ENV PATH /home/sprout/.meteor:/opt/athenapdf/bin:/opt/gradle-3.5/bin:/opt/jdk1.8.0_121/bin:/opt/go-1.8/bin:/opt/node-v6.10.2-linux-x64/bin:/home/chris/projects/mackware/go/bin:/opt/go-1.8/bin:/home/chris/bin:/home/chris/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
WORKDIR /work/app/src
CMD ["meteor","run"]
