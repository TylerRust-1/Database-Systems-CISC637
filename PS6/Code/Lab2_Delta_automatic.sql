CREATE SEQUENCE COURSE_SEQ;
CREATE SEQUENCE SECTION_SEQ;
CREATE SEQUENCE STUDENT_SEQ;


declare
    CURSOR c_trg IS
    SELECT
        t.table_name,
        c.column_name,
        t.table_name || '_SEQ' sequence_name,
        'TR01_' || t.table_name trigger_name
    FROM
        (
            SELECT
                *
            FROM
                user_tables

            where
                table_name || '_SEQ' IN (
                    SELECT
                        sequence_name
                    FROM
                        user_sequences
                )
        ) t
        INNER JOIN (
            SELECT
                ucc.*
            FROM
                user_constraints    uc
                INNER JOIN user_cons_columns   ucc ON uc.constraint_name = ucc.constraint_name
            WHERE
                uc.constraint_type = 'P'
        ) c ON t.table_name = c.table_name;

    v_sql varchar2(4000);
BEGIN

    for r_trg in c_trg
    loop
        v_sql := 'create or replace TRIGGER ' || r_trg.trigger_name ;
        v_sql := v_sql || ' BEFORE INSERT ON ' || r_trg.table_name;
        v_sql := v_sql || ' FOR EACH ROW';
        v_sql := v_sql || ' BEGIN';
        v_sql := v_sql || '  <<COLUMN_SEQUENCES>>';
        v_sql := v_sql || ' BEGIN';
        v_sql := v_sql || ' IF INSERTING AND :NEW.' || r_trg.column_name || ' IS NULL THEN';
        v_sql := v_sql || ' SELECT ' || r_trg.sequence_name || '.NEXTVAL INTO :NEW.' || r_trg.column_name || ' FROM SYS.DUAL;';
        v_sql := v_sql || '  END IF;';
        v_sql := v_sql || ' END COLUMN_SEQUENCES;';
        v_sql := v_sql || ' END;';
        DBMS_OUTPUT.PUT_LINE(v_sql);
        execute immediate v_sql;
    end loop;

END ;
/