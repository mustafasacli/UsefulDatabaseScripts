https://stackoverflow.com/questions/2341278/how-to-get-primary-key-of-table/2341388

show columns from tablename where `Key` = "PRI";

https://stackoverflow.com/questions/2341278/how-to-get-primary-key-of-table/2341388

SHOW KEYS FROM table WHERE Key_name = 'PRIMARY'

** If you have spatial tables in your database, use:

SHOW KEYS FROM table WHERE Key_name = 'PRIMARY' OR Key_name = 'OGR_FID'
