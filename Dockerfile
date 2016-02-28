FROM logstash:2.2

COPY logstash.yml /etc/logstash.yml

EXPOSE 12201/udp 8514/udp

CMD ["logstash", "-f", "/etc/logstash.yml"]
