-- FIRST AND LAST RECORD OF RESULT SET
SELECT T4.* FROM (SELECT ROWNUM AS RN2, T3.* FROM (SELECT T2.* FROM (SELECT ROWNUM AS RN1, T1.* FROM (
-- SQL_SCRIPT
) T1) T2 ORDER BY RN1 DESC) T3) T4
WHERE T4.RN1=1 OR T4.RN2=1;