SELECT 
  C.TABLE_SCHEMA, C.TABLE_NAME, C.COLUMN_NAME, C.CONSTRAINT_NAME, C.REFERENCED_TABLE_NAME, C.REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE C
  WHERE
  C.CONSTRAINT_NAME <> 'PRIMARY'
  AND
  C.REFERENCED_TABLE_NAME IS NOT null
   AND
  C.REFERENCED_COLUMN_NAME IS NOT null
  AND
   C.TABLE_SCHEMA = @P_SCHEMA_NAME
  AND
   C.TABLE_NAME = @P_TABLE_NAME;
