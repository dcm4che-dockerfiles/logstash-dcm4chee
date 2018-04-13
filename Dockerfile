FROM docker.elastic.co/logstash/logstash-oss:6.2.3

RUN /usr/share/logstash/bin/logstash-plugin install --version 5.0.0 logstash-codec-frame

COPY logstash.yml /etc/logstash.yml
COPY certs /etc/certs

ENV ELASTICSEARCH_HOST=elasticsearch \
    ELASTICSEARCH_PORT=9200 \
    SYSLOG_UDP_PORT=8514 \
    SYSLOG_TCP_PORT=8514 \
    SYSLOG_TLS_PORT=6514 \
    SSL_CERT=/etc/certs/cert.pem \
    SSL_EXTRA_CHAIN_CERTS=/etc/certs/ca.pem \
    SSL_KEY=/etc/certs/key.pem \
    SSL_KEY_PASSPHRASE=secret \
    SSL_VERIFY=true \
    COLLECTD_PORT=25826 \
    COLLECTD_BUFFER_SIZE=1452

CMD ["logstash", "-f", "/etc/logstash.yml"]
