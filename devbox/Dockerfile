FROM archlinux/base

RUN printf "\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/\$arch\n" >> /etc/pacman.conf   && \
    sed -i.bak "s/SigLevel    = Required DatabaseOptional/SigLevel = Never/g" /etc/pacman.conf

RUN pacman -Syy --noconfirm --noprogressbar --needed                                                                \
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
        docker-machine                                                                                              \
        go                                                                                                          \
        mongodb                                                                                                     \
        mongodb-tools                                                                                               \
        php                                                                                                         \
        php-intl                                                                                                    \
        php-gd                                                                                                      \
        php-sqlite                                                                                                  \
        php-pgsql                                                                                                   \
        php-mongodb                                                                                                 \
        php-redis                                                                                                   \
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
RUN curl -o /usr/local/bin/melody       -LsS http://get.sensiolabs.org/melody.phar                               && \
    curl -o /usr/local/bin/phpunit      -LsS https://phar.phpunit.de/phpunit.phar                                && \
    curl -o /usr/local/bin/php-cs-fixer -LsS http://cs.sensiolabs.org/download/php-cs-fixer-v2.phar              && \
    curl -o /usr/local/bin/psysh        -LsS https://git.io/psysh                                                && \
    chmod a+x /usr/local/bin/*                                                                                   && \
    rm -rf /etc/php/conf.d                                                                                       && \
    ln -s /home/mykiwi/.php/ini /etc/php/conf.d                                                                  && \
    sudo -u mykiwi sh -c '                                                                                          \
        composer global require --optimize-autoloader                                                               \
            symfony/flex                                                                                            \
            pyrech/composer-changelogs                                                                           && \
        cd /home/mykiwi/.php                                                                                     && \
        composer init --no-interaction                                                                           && \
        composer require symfony/var-dumper                                                                      && \
        composer dump-autoload --optimize --no-dev --classmap-authoritative                                      && \
        echo "extension=iconv"               > ${HOME}/.php/ini/10-extensions.ini                                && \
        echo "extension=blackfire.so"       >> ${HOME}/.php/ini/10-extensions.ini                                && \
        echo "extension=pdo_mysql"          >> ${HOME}/.php/ini/10-extensions.ini                                && \
        echo "extension=pdo_pgsql"          >> ${HOME}/.php/ini/10-extensions.ini                                && \
        echo "extension=pdo_sqlite"         >> ${HOME}/.php/ini/10-extensions.ini                                && \
        echo "extension=mongodb.so"         >> ${HOME}/.php/ini/10-extensions.ini                                && \
        echo "zend_extension=opcache.so" > ${HOME}/.php/ini/20-opcache.ini                                       && \
        echo "auto_prepend_file = ${HOME}/.php/vendor/autoload.php" > ${HOME}/.php/ini/30-symfony-dump.ini          \
    '

RUN mkdir /var/run/sshd                                                                                          && \
    ssh-keygen -A                                                                                                && \
    echo "Port 20000" >> /etc/ssh/sshd_config
EXPOSE 20000

ADD ./entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
