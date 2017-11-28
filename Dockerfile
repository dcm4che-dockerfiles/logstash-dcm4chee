FROM docker.elastic.co/logstash/logstash-oss:6.0.0

RUN /usr/share/logstash/bin/logstash-plugin install --version 5.0.0 logstash-codec-frame

COPY logstash.yml /etc/logstash.yml

ENV ELASTICSEARCH_HOST=elasticsearch \
    ELASTICSEARCH_PORT=9200

EXPOSE 12201/udp 8514/udp 8514/tcp

CMD ["logstash", "-f", "/etc/logstash.yml"]
