#!/bin/bash
set -eo pipefail

mysqladmin ping -h 127.0.0.1 --user=root --password=${MYSQL_ROOT_PASSWORD}
