FROM mykiwi/symfony-base:7.0-fpm

RUN apt-get update && \
    apt-get install -y supervisor && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8000 8001 8002 8003 8004 8005 8006 8007

ADD run.sh /usr/local/bin
CMD ["/usr/local/bin/run.sh"]
