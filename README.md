# Logstash Docker image

This docker image provides Logstash initalized for receiving system and audit log messages from the DICOM Archive
[dcm4chee-arc-light](https://github.com/dcm4che/dcm4chee-arc-light/wiki).
It extends the [official logstash image](https://www.elastic.co/guide/en/logstash/current/docker.html).

## How to use this image

See [Run all archive services with secured UI and storing System and Audit logs to Elastic Stack on a single host](https://github.com/dcm4che/dcm4chee-arc-light/wiki/Run-all-archive-services-with-secured-UI-and-storing-System-and-Audit-logs-to-Elastic-Stack-on-a-single-host) at the
[dcm4che Archive 5 Wiki](https://github.com/dcm4che/dcm4chee-arc-light/wiki).

## Environment Variables 

Below explained environment variables can be set as per one's application to override the default values if need be.
An example of how one can set an env variable in `docker run` command is shown below :

    -e SSL_VERIFY=true

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

#### `SSL_KEY_PASSWORD`

Password of the SSL key used by the TLS listener. Default value is `secret`.

#### `SSL_KEY_PASSWORD_FILE`

Path to file containing the password of the SSL key used by the TLS listener.
If the file does not exist, it will be created containing the password specified by `SSL_KEY_PASSWORD`. 
Default value is `/tmp/key_password`.

#### `SSL_VERIFY`

Verify the identity of the other end of the SSL connection against the CA. Default value is `false`.

#### `HASHTREE_TARGET`

The name of the field where the fingerprint of the audit message will be stored. Default value is `fingerprint`.

#### `HASHTREE_PREVIOUS`

The name of the field where the fingerprint of the previous audit message will be stored.
Default value is `fingerprint_previous`.

#### `HASHTREE_FILE`

Path of the file where the fingerprint of the previous audit message is stored. **Attention:** You have to mount
the file or parent directory to a volume or host directory to avoid to start a new hash tree on every re-creation
of the container. The file (or parent directory) must be writable by the logstash user of the container (uid=1000).
Default value is `/usr/share/logstash/data/filter-hashtree`.

#### `HASHTREE_METHOD`

The fingerprint method to use. Enumerated values: 'SHA1', 'SHA256', 'SHA384', 'SHA512', 'MD5'.
Default value is `SHA1`.

#### `COLLECTD_PORT`

UDP port on which Logstash is listening for collectd messages. Default value is `25826`.

#### `COLLECTD_BUFFER_SIZE`

The maximum packet size to read from the network by the UDP listener for collectd messages. Default value is `1452`.

#### `HL7_CHARSET`

Character Set of HL7 v2 messages in received Audit messages. Default value is `ISO-8859-1`.
