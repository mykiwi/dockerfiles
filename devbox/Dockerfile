FROM debian:10.8-slim

ARG CURL="curl -fsSL"
ARG UPDATE="apt update"
ARG NO_CONFIRM="--yes --no-install-recommends"
ARG INSTALL="apt install ${NO_CONFIRM}"

RUN set -xe \
 && ${UPDATE} \
 && apt upgrade ${NO_CONFIRM} \
 && ${INSTALL} \
       ca-certificates \
       curl \
       gnupg \
       procps \
       unzip

# PHP
ARG PHP_VERSION=8.0
RUN set -xe \
 && echo "deb https://packages.sury.org/php buster main" > /etc/apt/sources.list.d/sury.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B188E2B695BD4743 \
 && ${UPDATE} \
 && ${INSTALL} \
       php${PHP_VERSION}-apcu \
       php${PHP_VERSION}-bcmath \
       php${PHP_VERSION}-cli \
       php${PHP_VERSION}-common \
       php${PHP_VERSION}-curl \
       php${PHP_VERSION}-iconv \
       php${PHP_VERSION}-intl \
       php${PHP_VERSION}-mbstring \
       php${PHP_VERSION}-pgsql \
       php${PHP_VERSION}-uuid \
       php${PHP_VERSION}-xml \
       php${PHP_VERSION}-zip \
 && ${CURL} https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && ${CURL} https://get.symfony.com/cli/installer | bash && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# NodeJS
RUN set -xe \
 && ${CURL} https://deb.nodesource.com/setup_15.x | bash - \
 && ${INSTALL} nodejs \
 && npm install --global npm@latest

# Python
RUN set -xe \
 && ${INSTALL} \
       python3 \
       python3-pip \
       python \
       python-pip \
 && python3 -m pip install --upgrade pip \
 && python -m pip install --upgrade pip

# Rust
RUN set -xe \
 && ${CURL} https://sh.rustup.rs | sh -s -- -y

# Go
ARG GO_VERSION=1.16
RUN set -xe \
 && ${CURL} https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz > go.tar.gz && tar -C /usr/local -xzf go.tar.gz && rm go.tar.gz \
 && ln -s /usr/local/go/bin/go /usr/local/bin/go \
 && ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt

# Docker
ARG DOCKER_COMPOSE_VERSION=1.28.2
ARG DOCKER_MACHINE_VERSION=0.16.2
RUN set -xe \
 && ${CURL} https://get.docker.com/ | sh \
 && ${CURL} https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose \
 && ${CURL} https://github.com/docker/machine/releases/download/v${DOCKER_MACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && chmod +x /usr/local/bin/docker-machine

# AWS
RUN set -xe \
 && ${CURL} https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip > awscliv2.zip && unzip awscliv2.zip && ./aws/install && rm -rf awscliv2.zip aws


# Setup user mykiwi
RUN set -xe \
 && echo "deb https://cli.github.com/packages buster main" > /etc/apt/sources.list.d/sury.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 \
 && ${UPDATE} \
 && ${INSTALL} \
      git \
      gh \
      hub \
      openssh-client \
      sudo \
      zsh \
 && useradd mykiwi --shell /bin/zsh \
 && usermod -aG docker mykiwi \
 && echo '%mykiwi ALL= NOPASSWD: ALL' >> /etc/sudoers \
 && mkdir -p /home/mykiwi/.ssh/ \
 && mkdir -p /home/mykiwi/.php/ini \
 && touch /home/mykiwi/.z \
 && ${CURL} https://github.com/mykiwi.keys > /home/mykiwi/.ssh/authorized_keys \
 && chown -R mykiwi:mykiwi /home/mykiwi \
 && chmod 700 /home/mykiwi/.ssh \
 && chmod 600 /home/mykiwi/.ssh/authorized_keys \
 && sudo -u mykiwi zsh -c 'set -xe \
      && cd /home/mykiwi \
      && git config --global url."https://github.com/".insteadOf git@github.com: \
      && git clone --recursive git@github.com:mykiwi/dotfiles.git .dotfiles \
      && cd .dotfiles \
      && ./install.sh \
      && source ~/.zshrc \
      && composer global require --optimize-autoloader pyrech/composer-changelogs \
 '

ARG BAT_VERSION=0.17.1
RUN set -xe \
 && ${CURL} https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb > bat.deb && dpkg -i bat.deb && rm bat.deb \
 && ${CURL} https://gobinaries.com/chriswalz/bit | sh \
 && ${INSTALL} \
      exa \
      fd-find \
      htop \
      jq \
      neovim \
      ripgrep \
      tmate \
      tmux \
 && ln -s /usr/lib/cargo/bin/fd /usr/local/bin/fd

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

ENV TERM xterm
ENV USER mykiwi
USER mykiwi
WORKDIR /home/mykiwi
CMD ["zsh"]
