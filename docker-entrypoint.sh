#!/bin/bash

set -e

if [ "$1" = 'logstash' ]; then

    if [ -f $SSL_KEY_PASSWORD_FILE ]; then
        SSL_KEY_PASSWORD=`cat $SSL_KEY_PASSWORD_FILE`
    else
        echo $SSL_KEY_PASSWORD > $SSL_KEY_PASSWORD_FILE
    fi

    chown -R logstash:logstash /usr/share/logstash/data

fi

exec "$@"
