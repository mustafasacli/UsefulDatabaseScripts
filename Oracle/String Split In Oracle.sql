-- https://stackoverflow.com/questions/3819375/convert-comma-separated-string-to-array-in-pl-sql

select to_number(column_value) as IDs from xmltable(:PD);--'1,2,3,4,5');

DECLARE
   BAR   VARCHAR2 (200) := '1,2,3';
BEGIN
   FOR FOO IN (    SELECT REGEXP_SUBSTR (BAR,
                                         '[^,]+',
                                         1,
                                         LEVEL)
                             TXT
                     FROM DUAL
               CONNECT BY REGEXP_SUBSTR (BAR,
                                         '[^,]+',
                                         1,
                                         LEVEL)
                             IS NOT NULL)
   LOOP
      DBMS_OUTPUT.PUT_LINE (FOO.TXT);
   END LOOP;
END;

DECLARE
   BAR   VARCHAR2 (200) := '1,2,3';
BEGIN
   FOR FOO IN (    SELECT REGEXP_SUBSTR (BAR,
                                         '[^,]+',
                                         1,
                                         LEVEL)
                             TXT
                     FROM DUAL
               CONNECT BY REGEXP_SUBSTR (BAR,
                                         '[^,]+',
                                         1,
                                         LEVEL)
                             IS NOT NULL)
   LOOP
      DBMS_OUTPUT.PUT_LINE (FOO.TXT);
   END LOOP;
END;

SELECT REGEXP_SUBSTR ('1,2,3','[^,]+',1,LEVEL) TXT FROM DUAL CONNECT BY REGEXP_SUBSTR ('1,2,3','[^,]+',1,LEVEL) IS NOT NULL
                             