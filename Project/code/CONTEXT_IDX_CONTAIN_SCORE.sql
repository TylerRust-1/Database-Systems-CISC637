
----create index----
CREATE INDEX idx_rsms ON RSME(FILE_BLOB)
     INDEXTYPE IS CTXSYS.CONTEXT;

----sync index----
begin

ctx_ddl.sync_index('idx_rsms', '2M');

end;

----search one term----
SELECT SCORE(1), FILE_ID, FILE_NAME from RSME WHERE CONTAINS(FILE_BLOB, 'Excel', 1) > 0;

----search two terms with and operator----
SELECT SCORE(1), FILE_ID, FILE_NAME from RSME WHERE CONTAINS(FILE_BLOB, 'Excel AND Powerpoint', 1) > 0;

----search two terms with OR operator----
---opt1---
SELECT SCORE(1), FILE_ID, FILE_NAME from RSME WHERE CONTAINS(FILE_BLOB, 'Excel OR Powerpoint', 1) > 0;
---opt2---
SELECT SCORE(1), FILE_ID, FILE_NAME from RSME WHERE CONTAINS(FILE_BLOB, 'Excel | Powerpoint', 1) > 0;

----search two terms with NOT operator----
---opt1---
SELECT SCORE(1), FILE_ID, FILE_NAME from RSME WHERE CONTAINS(FILE_BLOB, 'Excel NOT Powerpoint', 1) > 0;
---opt2---
SELECT SCORE(1), FILE_ID, FILE_NAME from RSME WHERE CONTAINS(FILE_BLOB, 'Excel ~ Powerpoint', 1) > 0;


----search ACCUM terms and order by score----
SELECT SCORE(1), FILE_ID, FILE_NAME from RSME WHERE CONTAINS(FILE_BLOB, 'Excel, Powerpoint', 1) > 0
order by 1 desc;

----search EQUIV terms and order by score----
SELECT SCORE(1), FILE_ID, FILE_NAME from RSME WHERE CONTAINS(FILE_BLOB, 'Excel = Powerpoint', 1) > 0
order by 1 desc;

----Structured Query with CONTAINS Example----
SELECT SCORE(1), FILE_ID, FILE_NAME, FILE_LENGTH from RSME 
           WHERE CONTAINS(FILE_BLOB, 'Excel', 1) > 0
           AND FILE_LENGTH > 55847 
           ORDER BY SCORE(1) DESC;

----use a cursor to fetch the results of the query----
declare 
  rowno number := 0; 
  CURSOR T_CURSORS IS 
  SELECT RM.FILE_ID, RM.FILE_NAME
  FROM RSME RM
  WHERE CONTAINS(FILE_BLOB, 'Excel, Powerpoint, Words')>0;
  
begin 
  for T_CURSOR in T_CURSORS
  loop 
    rowno := rowno + 1; 
    dbms_output.put_line(T_CURSOR.FILE_NAME); 
    exit when rowno = 10; 
  end loop; 
end; 

-----use ABOUT and SCORE operator----
SELECT SCORE(1), FILE_ID, FILE_NAME FROM RSME 
           WHERE CONTAINS(FILE_BLOB, 'about(Excel)', 1) > 0
           ORDER BY SCORE(1) DESC;

-----use Near and SCORE operator----
SELECT SCORE(1), FILE_ID, FILE_NAME FROM RSME 
           WHERE CONTAINS(FILE_BLOB, 'near((Excel, Powerpoint), 6)', 1) > 0
           ORDER BY SCORE(1) DESC;