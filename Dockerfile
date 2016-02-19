FROM logstash:2.2

COPY logstash.conf /etc/logstash.conf

CMD ["logstash", "-f", "/etc/logstash.conf"]
