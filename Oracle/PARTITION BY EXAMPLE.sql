SELECT ROW_NUMBER() OVER (PARTITION BY COL1, COL2 ORDER BY COL3 ASC, COL4 DESC) AS RN FROM SCHEMA1.TABLE1;