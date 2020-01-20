select
   all_cons_columns.owner as schema_name,
   all_cons_columns.table_name, 
   all_cons_columns.column_name, 
   all_cons_columns.position, 
   all_constraints.status
from all_constraints, all_cons_columns 
where 
   all_constraints.constraint_type = 'P'
   and all_constraints.constraint_name = all_cons_columns.constraint_name
   and all_constraints.owner = all_cons_columns.owner
order by 
   all_cons_columns.owner,
   all_cons_columns.table_name, 
   all_cons_columns.position
