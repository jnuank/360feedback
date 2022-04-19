#!/bin/bash

echo "load db data"
psql --username postgres --dbname "$POSTGRES_DB" < /init-data-files/00_init.sql
psql --username postgres --dbname "$POSTGRES_DB" < /init-data-files/01_table.sql