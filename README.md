# Logstash Docker image

This docker image provides Logstash initalized for receiving system and audit log messages from the DICOM Archive
[dcm4chee-arc-light](https://github.com/dcm4che/dcm4chee-arc-light/wiki).
It extends the [official logstash image](https://www.elastic.co/guide/en/logstash/current/docker.html).

## Supported tags and respective `Dockerfile` links

- [`6.2.3-5` (*6.2.3/Dockerfile*)](https://github.com/dcm4che-dockerfiles/logstash-dcm4chee/blob/master/Dockerfile)

## How to use this image

See [Running on Docker](https://github.com/dcm4che/dcm4chee-arc-light/wiki/Running-on-Docker) at the
[dcm4che Archive 5 Wiki](https://github.com/dcm4che/dcm4chee-arc-light/wiki).

## Environment Variables 

Below explained environment variables can be set as per one's application to override the default values if need be.
An example of how one can set an env variable in `docker run` command is shown below :

    -e SSL_VERIFY=false

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

#### `ELASTICSEARCH_HOST`

Hostname of Elasticsearch to which logs are stored. Default value is `elasticsearch`.

#### `ELASTICSEARCH_PORT`

Port of Elasticsearch to which logs are stored. Default value is `9200`.

#### `SYSLOG_UDP_PORT`

UDP port on which Logstash is listening for audit messages according
[RFC 5426](https://tools.ietf.org/html/rfc5426). Default value is `8514`.

#### `SYSLOG_TCP_PORT`

TCP port on which Logstash is listening for audit messages. Default value is `8514`.

#### `SYSLOG_TLS_PORT`

TCP port on which Logstash is listening using TLS for audit messages according
[RFC 5425](https://tools.ietf.org/html/rfc5425). Default value is `6514`.

#### `SSL_CERT`

Path to the SSL certificate used by the TLS listener. Default value is `/etc/certs/cert.pem`.

#### `SSL_EXTRA_CHAIN_CERTS`

Path to the SSL certificate of the certification authority (CA) used by the TLS listener. Default value is `/etc/certs/ca.pem`.

#### `SSL_KEY`

Path to the SSL key used by the TLS listener. Default value is `/etc/certs/key.pem`.

#### `SSL_KEY_PASSPHRASE`

Passphrase of the SSL key used by the TLS listener. Default value is `secret`.

#### `SSL_VERIFY`

Verify the identity of the other end of the SSL connection against the CA. Default value is `true`.

#### `COLLECTD_PORT`

UDP port on which Logstash is listening for collectd messages. Default value is `25826`.

#### `COLLECTD_BUFFER_SIZE`

The maximum packet size to read from the network by the UDP listener for collectd messages. Default value is `1452`.
