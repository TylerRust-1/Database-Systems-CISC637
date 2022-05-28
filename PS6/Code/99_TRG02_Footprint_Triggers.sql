create or replace PROCEDURE HANDLE_TRIGGER_FOOTPRINT
(
  TABLE_NAME_IN IN VARCHAR2 
) 
AS
    v_sql varchar2(4000);
BEGIN

    DBMS_OUTPUT.PUT_LINE('CHECKING TABLE ' || table_name_in);
    V_SQL := 'CREATE OR REPLACE TRIGGER trg02_' || TABLE_NAME_IN || ' BEFORE INSERT ON ' || TABLE_NAME_IN;
    V_SQL := V_SQL || ' FOR EACH ROW';
    V_SQL := V_SQL || ' BEGIN ';
    V_SQL := V_SQL || 'IF inserting THEN ';
    V_SQL := V_SQL || ' :new.created_by := user; ';
    V_SQL := V_SQL || ' :new.created_date := sysdate; ';
    V_SQL := V_SQL || ' END IF;';
    V_SQL := V_SQL || ' :new.modified_by := user; ';
    V_SQL := V_SQL || ' :new.modified_date := sysdate;' ;
    V_SQL := V_SQL || ' end; ' ;
    EXECUTE IMMEDIATE V_SQL;

END HANDLE_TRIGGER_FOOTPRINT;
/
DECLARE
    CURSOR c_table IS
    SELECT
        table_name
    FROM
        user_tables
    where table_name in 
    (select table_name from user_tab_cols where column_name = 'CREATED_BY');

    v_sql VARCHAR2(2000);
BEGIN
    FOR r_table IN c_table LOOP
        v_sql := 'begin ';
        v_sql := v_sql
                 || ' Handle_Trigger_Footprint('
                 || ''''
                 || r_table.table_name
                 || ''''
                 || ');';

        v_sql := v_sql || ' end; ';
        EXECUTE IMMEDIATE v_sql;
    END LOOP;
END;
/