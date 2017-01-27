FROM logstash:5.1.2

RUN /opt/logstash/bin/plugin install logstash-codec-frame

COPY logstash.yml /etc/logstash.yml

EXPOSE 12201/udp 8514/udp 8514/tcp

CMD ["logstash", "-f", "/etc/logstash.yml"]
