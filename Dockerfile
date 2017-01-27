FROM logstash:5.1.2

RUN /usr/share/logstash/bin/logstash-plugin install --version 5.0.0 logstash-codec-frame

COPY logstash.yml /etc/logstash.yml

EXPOSE 12201/udp 8514/udp 8514/tcp

CMD ["logstash", "-f", "/etc/logstash.yml"]
