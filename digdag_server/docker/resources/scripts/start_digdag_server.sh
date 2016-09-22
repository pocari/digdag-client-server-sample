#!/bin/sh

CONFIG_FILE=$APP_ROOT/tmp/postgresql.conf

cat <<EOS > $CONFIG_FILE
server.bind = 0.0.0.0
database.type = postgresql
database.user = $DIGDAGDB_USER
database.password = $DIGDAGDB_PASS
database.host = $DIGDAGDB_HOST
database.port = $DIGDAGDB_PORT
database.database = $DIGDAGDB_DATABASE
EOS

# postgresq起動前にアクセスしてしまうのでちょっと待つ
sleep 4
digdag server \
  --config $CONFIG_FILE \
  --task-log $APP_ROOT/sessions

