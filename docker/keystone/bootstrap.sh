#!/bin/bash
set -x
set -u

SQL_SCRIPT=/root/keystone.sql
CONFIG_FILE=/etc/keystone/keystone.conf

PERSISTENT_DIR=/etc/keystone
CONFIG_INITIALIZED_FILE="$PERSISTENT_DIR/.config_initialized"
ADMIN_TOKEN="${ADMIN_TOKEN:-ADMIN_TOKEN}"
MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD:-root}"
MYSQL_HOST="${MYSQL_HOST:-mysql}"
KEYSTONE_DBUSER="${KEYSTONE_DBUSER:-keystone}"
KEYSTONE_DBPASS="${KEYSTONE_DBPASS:-keystone}"

unset OS_TENANT_NAME OS_USERNAME OS_PASSWORD OS_AUTH_URL

# create keystone configuration file
if [ ! -f "$CONFIG_INITIALIZED_FILE" ]; then
    sed -i "s#^connection.*=.*#connection = \
        mysql://${KEYSTONE_DBUSER}:${KEYSTONE_DBPASS}@${MYSQL_HOST}/keystone#" \
            "$CONFIG_FILE"
    sed -i "s#^admin_token.*=.*#admin_token = $ADMIN_TOKEN#" "$CONFIG_FILE"
    su -s /bin/sh -c "keystone-manage db_sync" keystone
    touch "$CONFIG_INITIALIZED_FILE"
fi

# start keystone
keystone-all
