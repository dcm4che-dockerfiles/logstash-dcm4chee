FROM logstash:2.2

COPY logstash.yml /etc/logstash.yml

CMD ["logstash", "-f", "/etc/logstash.yml"]
