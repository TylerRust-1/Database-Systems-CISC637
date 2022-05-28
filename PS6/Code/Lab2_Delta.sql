DECLARE
    PROCEDURE drop_if_exists (
        sequence_name_in VARCHAR2
    ) AS
        v_cnt NUMBER(1);
    BEGIN
        SELECT
            COUNT(*)
        INTO v_cnt
        FROM
            user_sequences
        WHERE
            sequence_name = sequence_name_in;

        IF v_cnt > 0 THEN
            EXECUTE IMMEDIATE 'DROP SEQUENCE ' || sequence_name_in;
        END IF;
    END;

    FUNCTION find_highest_value (
        table_name_in    VARCHAR2,
        column_name_in   VARCHAR2
    ) RETURN NUMBER AS
        v_max   NUMBER(9);
        v_sql   VARCHAR2(2000);
    BEGIN
        v_sql := 'select max('
                 || column_name_in
                 || ') from '
                 || table_name_in;
        EXECUTE IMMEDIATE v_sql
        INTO v_max;
        IF v_max IS NULL THEN
            RETURN 1;
        ELSE
            RETURN v_max + 1;
        END IF;
    END;

    PROCEDURE create_sequence (
        sequence_name_IN   VARCHAR2,
        TABLE_NAME_IN VARCHAR2,
        COLUMN_NAME_IN VARCHAR2
    ) AS
        v_sql VARCHAR2(2000);
        V_MAX NUMBER(9);
    BEGIN
        drop_if_exists(sequence_name_IN);
        V_MAX := find_highest_value(TABLE_NAME_IN, COLUMN_NAME_IN);
        v_sql := 'CREATE SEQUENCE '
                 || sequence_name_IN
                 || ' START WITH '
                 || V_MAX;
        EXECUTE IMMEDIATE V_SQL;
    END;

BEGIN
    create_sequence('COURSE_SEQ', 'COURSE', 'COURSE_NO' );
    create_sequence('SECTION_SEQ', 'SECTION', 'SECTION_ID' );
    create_sequence('STUDENT_SEQ', 'STUDENT', 'STUDENT_ID' );
END;
/

CREATE TRIGGER TRG01_COURSE
BEFORE INSERT ON COURSE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING THEN
      SELECT COURSE_SEQ.NEXTVAL INTO :NEW.COURSE_NO FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/

CREATE TRIGGER TRG01_SECTION
BEFORE INSERT ON SECTION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING  THEN
      SELECT SECTION_SEQ.NEXTVAL INTO :NEW.SECTION_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/

CREATE TRIGGER TRG01_STUDENT 
BEFORE INSERT ON STUDENT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING THEN
      SELECT STUDENT_SEQ.NEXTVAL INTO :NEW.STUDENT_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/

