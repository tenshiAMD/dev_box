#!/bin/bash
set -eo pipefail

host="$(hostname -i || echo '127.0.0.1')"
user="${PG_USER:-postgres}"
port="${PG_PORT:-5432}"

args=(
	-h "$host"
	-p "$port"
	-U "$user"
	--quiet --no-align --tuples-only
)

select=`echo 'SELECT 1;' | PGPASSWORD=${PG_PASSWORD} psql ${args[@]}`

if [ "$select" = '1' ]; then
	exit 0
fi

exit 1
