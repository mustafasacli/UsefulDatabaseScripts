DECLARE
  CURSOR P_CURSOR IS
SELECT * FROM SQL_QUERY;
   -- record    
   P_ROW P_CURSOR%ROWTYPE; 
BEGIN 
   OPEN P_CURSOR;
   LOOP
    FETCH  P_CURSOR  INTO P_ROW;
    EXIT WHEN P_CURSOR%NOTFOUND;
BEGIN SAVEPOINT SP_A;
BEGIN 
-- INSERT, UPDATE, DELETE QUERY
COMMIT;
DBMS_OUTPUT.PUT_LINE('ID: ' || P_ROW.ID);
 EXCEPTION
 WHEN OTHERS THEN
 ROLLBACK WORK TO SP_A;
END;
END;
  END LOOP; 
  CLOSE P_CURSOR;
END;