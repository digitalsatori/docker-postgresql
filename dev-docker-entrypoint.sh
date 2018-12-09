#!/bin/bash
set -e
PG_USER=postgres

# Inpisred by https://github.com/sameersbn/docker-postgresql/blob/master/runtime/functions
USERMAP_ORIG_UID=$(id -u ${PG_USER})
USERMAP_ORIG_GID=$(id -g ${PG_USER})
USERMAP_GID=$(stat -c %g /var/lib/postgresql/data)
USERMAP_UID=$(stat -c %u /var/lib/postgresql/data)
if [[ ${USERMAP_UID} != ${USERMAP_ORIG_UID} ]] || [[ ${USERMAP_GID} != ${USERMAP_ORIG_GID} ]]; then
  echo "Adapting uid and gid for ${PG_USER}:${PG_USER} to $USERMAP_UID:$USERMAP_GID"
  groupmod -o -g ${USERMAP_GID} ${PG_USER}
  sed -i -e "s|:${USERMAP_ORIG_UID}:${USERMAP_GID}:|:${USERMAP_UID}:${USERMAP_GID}:|" /etc/passwd
fi

./docker-entrypoint.sh "$@"
