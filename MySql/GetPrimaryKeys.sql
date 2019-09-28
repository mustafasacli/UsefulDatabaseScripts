https://stackoverflow.com/questions/2341278/how-to-get-primary-key-of-table/2341388

show columns from tablename where `Key` = "PRI";

https://stackoverflow.com/questions/2341278/how-to-get-primary-key-of-table/2341388

SHOW KEYS FROM table WHERE Key_name = 'PRIMARY'

** If you have spatial tables in your database, use:

SHOW KEYS FROM table WHERE Key_name = 'PRIMARY' OR Key_name = 'OGR_FID'


https://dataedo.com/kb/query/mysql/list-tables-with-their-primary-keys

The query below lists the tables and their primary key (PK) constraint names in all user databases. 
By browsing the list, you can spot which tables have and which don't have primary keys.


select tab.table_schema as database_name,
       tab.table_name,
       tco.constraint_name as pk_name,
       group_concat(kcu.column_name
            order by kcu.ordinal_position
            separator ', ') as columns
from information_schema.tables tab
left join information_schema.table_constraints tco
          on tab.table_schema = tco.table_schema
          and tab.table_name = tco.table_name
          and tco.constraint_type = 'PRIMARY KEY'
left join information_schema.key_column_usage kcu
          on tco.constraint_schema = kcu.constraint_schema
          and tco.constraint_name = kcu.constraint_name
          and tco.table_name = kcu.table_name
where tab.table_schema not in ('mysql', 'information_schema', 
                                'performance_schema', 'sys')
--  and tab.table_schema = 'schema_name' -- provide schema name here
group by tab.table_schema,
         tab.table_name,
         tco.constraint_name
order by tab.table_schema,
         tab.table_name;
