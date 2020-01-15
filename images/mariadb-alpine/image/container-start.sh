#!/bin/sh

echo "Checking /var/lib/mysql folder"
if [ ! -f ${DB_DATA_PATH}/ibdata1 ]; then
    echo "Installing db"
    mariadb-install-db --user=mysql --datadir=${DB_DATA_PATH} > /dev/null
    echo "Installed"
fi

tfile=`mktemp`
if [ ! -f "$tfile" ]; then
    return 1
fi

cat << EOF > $tfile
    USE mysql;
    DELETE FROM user;
    FLUSH PRIVILEGES;
    GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '${DB_ROOT_PASS}';
    CREATE USER '${DB_USER}' IDENTIFIED BY '${DB_PASS}';
    GRANT ALL ON *.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
    FLUSH PRIVILEGES;
EOF

echo "Querying user"
/usr/bin/mysqld --user=mysql --bootstrap --verbose < $tfile
rm -f $tfile
echo "Done query"

# start mysql
echo "Starting mariadb database"
exec /usr/bin/mysqld --user=mysql --verbose --skip-name-resolve --skip-networking=0 --default-authentication-plugin=mysql_native_password --bind-address=0.0.0.0

