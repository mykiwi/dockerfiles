FROM pritunl/archlinux
MAINTAINER r. gautier <mail@romain.sh>

RUN printf "\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/\$arch\n" >> /etc/pacman.conf

RUN pacman -Sy --noconfirm --noprogressbar --needed                                                                 \
        base-devel                                                                                                  \
        yaourt                                                                                                      \
        openssh                                                                                                     \
        sudo                                                                                                        \
        zsh                                                                                                         \
        zsh-completions                                                                                             \
        wget                                                                                                        \
        curl                                                                                                        \
        git                                                                                                         \
        hub                                                                                                         \
        tmux                                                                                                        \
        htop                                                                                                        \
        unzip                                                                                                       \
        bc                                                                                                          \
        which                                                                                                       \
        man                                                                                                         \
        unrar                                                                                                       \
        unzip                                                                                                       \
        gzip                                                                                                        \
        vim                                                                                                         \
        docker                                                                                                      \
        docker-compose                                                                                              \
        go                                                                                                          \
        php                                                                                                         \
        php-intl                                                                                                    \
        php-gd                                                                                                      \
        php-mcrypt                                                                                                  \
        php-sqlite                                                                                                  \
        composer                                                                                                    \
        python                                                                                                      \
        python-pip                                                                                                  \
        npm

# Setup user mykiwi
RUN useradd mykiwi --shell /bin/zsh                                                                              && \
    echo '%mykiwi ALL= NOPASSWD: ALL' >> /etc/sudoers                                                            && \
    mkdir -p /home/mykiwi/.ssh/                                                                                  && \
    mkdir -p /home/mykiwi/.php/ini                                                                               && \
    touch /home/mykiwi/.z                                                                                        && \
    wget https://github.com/mykiwi.keys -O /home/mykiwi/.ssh/authorized_keys                                     && \
    chown -R mykiwi:mykiwi /home/mykiwi                                                                          && \
    chmod 700 /home/mykiwi/.ssh                                                                                  && \
    chmod 600 /home/mykiwi/.ssh/authorized_keys                                                                  && \
    sudo -u mykiwi zsh -c '                                                                                         \
        cd /home/mykiwi                                                                                          && \
        git clone --recursive https://github.com/mykiwi/dotfiles.git .dotfiles                                   && \
        cd .dotfiles                                                                                             && \
        ./install.sh                                                                                             && \
        source ~/.zshrc                                                                                             \
    '

RUN sudo -u mykiwi sh -c '                                                                                          \
        yaourt -Sy --noconfirm --noprogressbar                                                                      \
            blackfire-cli                                                                                           \
            blackfire-agent                                                                                         \
            php-blackfire                                                                                           \
            yarn                                                                                                    \
    '

# PHP
ENV PHPCSFIXER_VERSION v2.1.0
RUN curl -o /usr/local/bin/symfony -LsS https://symfony.com/installer                                            && \
    curl -o /usr/local/bin/melody       http://get.sensiolabs.org/melody.phar                                    && \
    curl -o /usr/local/bin/phpunit -LsS https://phar.phpunit.de/phpunit.phar                                     && \
    curl -o /usr/local/bin/php-cs-fixer -LsS                                                                        \
        https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/$PHPCSFIXER_VERSION/php-cs-fixer.phar     && \
    chmod a+x /usr/local/bin/*                                                                                   && \
    rm -rf /etc/php/conf.d                                                                                       && \
    ln -s /home/mykiwi/.php/ini /etc/php/conf.d                                                                  && \
    sudo -u mykiwi sh -c '                                                                                          \
        composer global require hirak/prestissimo                                                                && \
        cd /home/mykiwi/.php                                                                                     && \
        composer require symfony/var-dumper                                                                      && \
        composer dump-autoload --optimize --no-dev --classmap-authoritative                                      && \
        echo "zend_extension=opcache.so" > ${HOME}/.php/ini/70-opcache.ini                                       && \
        echo "extension=blackfire.so" > ${HOME}/.php/ini/90-blackfire.ini                                        && \
        echo "auto_prepend_file = ${HOME}/.php/vendor/autoload.php" > ${HOME}/.php/ini/90-symfony-dump.ini          \
    '

RUN mkdir /var/run/sshd                                                                                          && \
    ssh-keygen -A                                                                                                && \
    echo "Port 20000" >> /etc/ssh/sshd_config
EXPOSE 20000

ADD ./bin/init /init
CMD ["/init"]
