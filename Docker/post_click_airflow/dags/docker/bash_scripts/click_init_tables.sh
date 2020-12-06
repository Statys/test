cat /sql_scripts/click_init_tables.sql | clickhouse-client -h click -mn
PGPASSWORD=1 psql -h post -t -p 5432 -U postgres -AF $';' --no-align -f /sql_scripts/select_pg.sql | \
    tail -f -n +2
PGPASSWORD=1 psql -h post -t -p 5432 -U postgres -AF $';' --no-align -f /sql_scripts/select_pg.sql | \
    tail -f -n +2 | \
    clickhouse-client -h click -mn --format_csv_delimiter=";" --query="INSERT INTO s1 FORMAT CSV" 
clickhouse-client -h click -mn --query="select * from s1;"