sleep 5
PGPASSWORD=1 psql -h post -p 5432 -U postgres -f /sql_scripts/init_tables.sql
