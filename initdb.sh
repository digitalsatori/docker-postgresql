#!/bin/bash
set -e
echo "Switch Database owner of default database"
psql -U postgres -c "ALTER DATABASE $POSTGRES_DB OWNER TO $POSTGRES_USER"
