select --*
rdb$relation_name as table_name
from rdb$relations
where rdb$view_blr is null
and (rdb$system_flag is null or rdb$system_flag = 0);



select --f.rdb$relation_name, f.rdb$field_name,
 *
from rdb$relation_fields f
join rdb$relations r on f.rdb$relation_name = r.rdb$relation_name
and r.rdb$view_blr is null
and (r.rdb$system_flag is null or r.rdb$system_flag = 0)
order by r.rdb$relation_name, f.rdb$field_position;


select *
from rdb$relations
where rdb$view_blr is not null
and (rdb$system_flag is null or rdb$system_flag = 0);


SELECT
  R.RDB$RELATION_NAME,
  R.RDB$FIELD_NAME,
  R.RDB$FIELD_SOURCE,
  F.RDB$FIELD_LENGTH,
  F.RDB$FIELD_TYPE,
  F.RDB$FIELD_SCALE,
  F.RDB$FIELD_SUB_TYPE
FROM
  RDB$RELATION_FIELDS R
  JOIN RDB$FIELDS F
    ON F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE
  JOIN RDB$RELATIONS RL
    ON RL.RDB$RELATION_NAME = R.RDB$RELATION_NAME
WHERE
  COALESCE(R.RDB$SYSTEM_FLAG, 0) = 0
  AND
  COALESCE(RL.RDB$SYSTEM_FLAG, 0) = 0
  AND
  RL.RDB$VIEW_BLR IS NULL
ORDER BY
  R.RDB$RELATION_NAME,
  R.RDB$FIELD_POSITION
  
  
SELECT
  R.RDB$RELATION_NAME AS TABLE_NAME,
  R.RDB$FIELD_NAME AS COLUMN_NAME,
  R.RDB$FIELD_SOURCE AS FIELD_SOURCE,
  F.RDB$FIELD_LENGTH AS LENGTH,
  F.RDB$FIELD_TYPE AS DATA_TYPE_INT,
  F.RDB$FIELD_SCALE AS SCALE,
  F.RDB$FIELD_SUB_TYPE AS SUB_TYPE
FROM
  RDB$RELATION_FIELDS R
  JOIN RDB$FIELDS F
    ON F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE
  JOIN RDB$RELATIONS RL
    ON RL.RDB$RELATION_NAME = R.RDB$RELATION_NAME
WHERE
  COALESCE(R.RDB$SYSTEM_FLAG, 0) = 0
  AND
  COALESCE(RL.RDB$SYSTEM_FLAG, 0) = 0
  AND
  RL.RDB$VIEW_BLR IS NULL
  AND R.RDB$RELATION_NAME IN (#TABLE_NAME#)
ORDER BY
  R.RDB$RELATION_NAME,
  R.RDB$FIELD_POSITION