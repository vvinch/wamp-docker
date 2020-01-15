FROM alpine:3

RUN apk update && apk upgrade && \
    apk add \
      mariadb \
      tzdata \
      vim

ARG TIMEZONE=Europe/Brussels
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo ${TIMEZONE} > /etc/timezone

RUN sed -i 's/skip-networking/\#skip-networking/i' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i '/mariadb\]/a log_error = \/var\/lib\/mysql\/error.log' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i 's:#bind-address:bind-address:' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i '/mariadb\]/a skip-external-locking' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i '/mariadb\]/a general_log = ON' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i '/mariadb\]/a general_log_file = \/var\/lib\/mysql\/query.log' /etc/my.cnf.d/mariadb-server.cnf

COPY container-start.sh /

RUN chmod +x /container-start.sh && \
    mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql

ENV DB_DATA_PATH="/var/lib/mysql"
ENV DB_ROOT_PASS="mariadb_root_password"
ENV DB_USER="mariadb_user"
ENV DB_PASS="mariadb_user_password"


CMD /container-start.sh
