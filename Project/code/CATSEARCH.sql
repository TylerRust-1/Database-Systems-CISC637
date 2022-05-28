-- INTRODUCTION TO CATSEARCH STEPS
begin
    ctx_ddl.create_index_set('RSME_CAT');
    ctx_ddl.add_index('RSME_CAT', 'RSME_ID'); /* sub-index A */
end;
/

CREATE INDEX idx_cat on RSME(RSME_ID) INDEXTYPE IS CTXSYS.CTXCAT Parameters('index set rsme_cat');

SELECT * FROM RSME WHERE CATSEARCH(FILE_NAME, '1', 'order by RSME_ID')>0;

SELECT * FROM RSME WHERE CATSEARCH(FILE_NAME, 'Sales', 'order by RSME_ID')>0;
-- END OF STEPS


----------- QUERIES
--DROP DEMONSTRATION INDEX
begin
    ctx_ddl.drop_index_set('RSME_CAT');
end;
/
drop index "UD_CISC637_GROUP4"."IDX_CAT";

begin
    ctx_ddl.create_index_set('RSME_CAT');
    ctx_ddl.add_index('RSME_CAT', 'FILE_ID'); /* sub-index A */
end;
/

CREATE INDEX idx_cat on RSME(FILE_ID) INDEXTYPE IS CTXSYS.CTXCAT Parameters('index set rsme_cat');

-- STANDARD CATSEARCH
SELECT FILE_ID, FILE_NAME, FILE_BLOB FROM RSME WHERE CATSEARCH(FILE_NAME, 'Sales', order by FILE_ID')>0;

-- CATSEARCH WITH AND
SELECT FILE_ID, FILE_NAME, FILE_BLOB FROM RSME WHERE CATSEARCH(FILE_NAME, 'Sales, manager', order by FILE_ID')>0;

-- CATSEARCH WITH OR
SELECT FILE_ID, FILE_NAME, FILE_BLOB FROM RSME WHERE CATSEARCH(FILE_NAME, 'Sales | manager', order by FILE_ID')>0;

-- CATSEARCH WITH NOT
SELECT FILE_ID, FILE_NAME, FILE_BLOB FROM RSME WHERE CATSEARCH(FILE_NAME, 'Sales - manager', order by FILE_ID')>0;

