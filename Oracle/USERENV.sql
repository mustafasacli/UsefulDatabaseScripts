SELECT USERENV('LANGUAGE') "Language" FROM DUAL;
SELECT SYS_CONTEXT ('USERENV', 'IP_ADDRESS') FROM DUAL;
SELECT SYS_CONTEXT ('USERENV', 'COMMITSCN') FROM DUAL;

-- https://www.techonthenet.com/oracle/functions/userenv.php
-- https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/USERENV.html

CLIENT_INFO	Returns user session information stored using the DBMS_APPLICATION_INFO package
ENTRYID	Available auditing entry identifier
INSTANCE	The identifier number of the current instance
ISDBA	Returns TRUE if the user has DBA privileges. Otherwise, it will return FALSE.
LANG	The ISO abbreviation for the language
LANGUAGE	The language, territory, and character of the session in the following format: language_territory.characterset
SESSIONID	The identifier of the auditing session
SID	The session ID
TERMINAL	The OS identifier of the current SESSION

SELECT USERENV('CLIENT_INFO') AS CL1 FROM DUAL;
SELECT USERENV('ENTRYID') AS CL1 FROM DUAL;
SELECT USERENV('INSTANCE') AS CL1 FROM DUAL;
SELECT USERENV('ISDBA') AS CL1 FROM DUAL;
SELECT USERENV('LANG') AS CL1 FROM DUAL;
SELECT USERENV('SESSIONID') AS CL1 FROM DUAL;
SELECT USERENV('SID') AS CL1 FROM DUAL;
SELECT USERENV('TERMINAL') AS CL1 FROM DUAL;
SELECT USERENV('') AS CL1 FROM DUAL;