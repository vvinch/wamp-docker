FROM alpine:3

RUN apk update && apk upgrade && \
    apk add \
      apache2 \
      apache2-utils \
      tzdata \
      php7 \
      php7-apache2 \
      php7-mysqli \
      php7-cli \
      php7-phar \
      php7-zlib \
      php7-zip \
      php7-bz2 \
      php7-ctype \
      php7-curl \
      php7-pdo_mysql \
      php7-mysqli \
      php7-json \
      php7-mcrypt \
      php7-xml \
      php7-dom \
      php7-iconv \
      php7-xdebug \
      php7-session \
      php7-intl \
      php7-gd \
      php7-mbstring \
      php7-apcu \
      php7-opcache \
      php7-tokenizer \
      mariadb-client \
      vim
#     phpmyadmin

# Apache setup
RUN sed -i 's#ServerName www.example.com:80#\nServerName localhost:80#' /etc/apache2/httpd.conf

# PhpMyAdmin setup
#RUN chown -R apache:apache /etc/phpmyadmin

# Timezone
ARG TIMEZONE=Europe/Brussels
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo ${TIMEZONE} > /etc/timezone && \
    sed -i 's:;date\.timezone =:date.timezone = '"${TIMEZONE}"':g' /etc/php7/php.ini

# Volumes
VOLUME /var/www/localhost/htdocs
VOLUME /var/log/apache2

# Apache foreground startup
CMD /usr/sbin/httpd -DFOREGROUND
