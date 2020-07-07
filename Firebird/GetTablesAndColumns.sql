http://www.firebirdfaq.org/faq174/

How to get a list of tables, views and columns in Firebird database?

Tables and views are stored in RDB$RELATIONS system table. System tables and views have RDB$SYSTEM_FLAG set, 
while user defined ones have zero or NULL. You can distinguish views from tables as they have field RDB$VIEW_BLR set. 
Please note that there is also a field RDB$VIEW_SOURCE which stored human-readable view source and can be set to NULL 
- database would still be completely functional as it uses precompiled BLR. Here's query to list all user tables:

select rdb$relation_name
from rdb$relations
where rdb$view_blr is null
and (rdb$system_flag is null or rdb$system_flag = 0);

A query to list all views:

select rdb$relation_name
from rdb$relations
where rdb$view_blr is not null
and (rdb$system_flag is null or rdb$system_flag = 0);

Table and view columns are stored in RDB$RELATION_FIELDS. It stores the name, null flag, default value, and domain. 
In order to get the datatype you need to read domain info from rdb$fields. Here's a query that lists all tables with their columns:

select f.rdb$relation_name, f.rdb$field_name
from rdb$relation_fields f
join rdb$relations r on f.rdb$relation_name = r.rdb$relation_name
and r.rdb$view_blr is null
and (r.rdb$system_flag is null or r.rdb$system_flag = 0)
order by 1, f.rdb$field_position;
