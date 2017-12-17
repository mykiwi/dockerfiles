# Usage

    $ cat ~/.ssh/config
    Host devbox-container
      User mykiwi
      HostName localhost
      Port 20000
      StrictHostKeyChecking no
      UserKnownHostsFile /dev/null
      LogLevel quiet
    
    $ docker run -d \
        --publish 20000:20000 \
        --volume ~/dev:/home/mykiwi/dev \
        --volume /var/run/docker.sock:/var/run/docker.sock \
        --hostname devbox \
        --name devbox \
        mykiwi/devbox
    
    $ ssh devbox-container
    
    $ # ok just
    $ ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oLogLevel=quiet -p20000 mykiwi@localhost

