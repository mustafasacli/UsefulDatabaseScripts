select * from information_schema.tables where table_catalog = :p_db_name;
select table_name from information_schema.tables where table_catalog = :p_db_name and table_schema not in ('pg_catalog','information_schema')
