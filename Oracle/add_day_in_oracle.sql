SELECT ( SYSDATE + :N ) AS x1, (TRUNC(SYSDATE) + :N) AS x2 FROM DUAL;