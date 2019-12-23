FROM logstash:7.5.1

RUN /usr/share/logstash/bin/logstash-plugin install --version 5.0.0 logstash-codec-frame && \
    /usr/share/logstash/bin/logstash-plugin install --version 6.4.3 logstash-filter-hashtree

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
    SSL_VERIFY=false \
    HASHTREE_TARGET=fingerprint \
    HASHTREE_PREVIOUS=fingerprint_previous \
    HASHTREE_FILE=/usr/share/logstash/data/filter-hashtree \
    HASHTREE_METHOD=SHA1 \
    COLLECTD_PORT=25826 \
    COLLECTD_BUFFER_SIZE=1452 \
    HL7_CHARSET=ISO-8859-1

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["logstash", "-f", "/etc/logstash.yml"]
