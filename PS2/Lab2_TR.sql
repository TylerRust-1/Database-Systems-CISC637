--------------------------------------------------------
--  File created - Saturday-February-26-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequences
--------------------------------------------------------
DECLARE
  max_course_id int;
  max_section_id int;
  max_student_id int;

BEGIN
  SELECT max(course_no)+1 INTO max_course_id FROM COURSE;
  SELECT max(section_id)+1 INTO max_section_id FROM SECTION;
  SELECT max(student_id)+1 INTO max_student_id FROM STUDENT;
  EXECUTE IMMEDIATE 'create SEQUENCE "C##_UD_TRUST"."COURSE_SEQ" MINVALUE  1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH '||max_course_id||' NOCACHE NOORDER NOCYCLE';
  EXECUTE IMMEDIATE 'create SEQUENCE "C##_UD_TRUST"."SECTION_SEQ" MINVALUE  1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH '||max_section_id||' NOCACHE NOORDER NOCYCLE';
  EXECUTE IMMEDIATE 'create SEQUENCE "C##_UD_TRUST"."STUDENT_SEQ" MINVALUE  1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH '||max_student_id||' NOCACHE NOORDER NOCYCLE';
END;
/
--------------------------------------------------------
--  DDL for Trigger TRG01_COURSE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG01_COURSE" 
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
ALTER TRIGGER "TRG01_COURSE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG01_SECTION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG01_SECTION" 
BEFORE INSERT ON SECTION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING THEN
      SELECT SECTION_SEQ.NEXTVAL INTO :NEW.SECTION_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/
ALTER TRIGGER "TRG01_SECTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG01_STUDENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG01_STUDENT" 
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
ALTER TRIGGER "TRG01_STUDENT" ENABLE;
