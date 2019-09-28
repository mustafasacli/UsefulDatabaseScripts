PostgreSql get Foreign Keys;
https://stackoverflow.com/questions/1152260/postgres-sql-to-list-table-foreign-keys

SELECT
tc.table_schema,
tc.constraint_name,
tc.table_name,
kcu.column_name,
ccu.table_schema AS foreign_table_schema,
ccu.table_name AS foreign_table_name,
ccu.column_name AS foreign_column_name
FROM
information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
ON tc.constraint_name = kcu.constraint_name
AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage AS ccu
ON ccu.constraint_name = tc.constraint_name
AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY' AND tc.table_name='mytable';

https://dataedo.com/kb/query/postgresql/list-foreign-keys

select kcu.table_schema || '.' ||kcu.table_name as foreign_table, '>-' as rel, 
rel_tco.table_schema || '.' || rel_tco.table_name as primary_table, string_agg(kcu.column_name, ', ') as fk_columns, 
kcu.constraint_name from information_schema.table_constraints tco 
join information_schema.key_column_usage kcu on tco.constraint_schema = kcu.constraint_schema 
and tco.constraint_name = kcu.constraint_name 
join information_schema.referential_constraints rco on tco.constraint_schema = rco.constraint_schema 
and tco.constraint_name = rco.constraint_name 
join information_schema.table_constraints rel_tco on rco.unique_constraint_schema = rel_tco.constraint_schema 
and rco.unique_constraint_name = rel_tco.constraint_name 
where tco.constraint_type = 'FOREIGN KEY' 
group by kcu.table_schema, kcu.table_name, rel_tco.table_name, rel_tco.table_schema, kcu.constraint_name 
order by kcu.table_schema, kcu.table_name;
