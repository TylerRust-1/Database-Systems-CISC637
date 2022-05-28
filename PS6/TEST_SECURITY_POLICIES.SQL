CREATE OR REPLACE PACKAGE security_package AS
  FUNCTION school_user_insert_security(owner VARCHAR2, objname VARCHAR2)
    RETURN VARCHAR2;
  
  FUNCTION school_user_select_security(owner VARCHAR2, objname VARCHAR2)
    RETURN VARCHAR2;
END security_package;
/

CREATE OR REPLACE PACKAGE BODY security_package IS

  FUNCTION school_user_select_security(owner VARCHAR2, objname VARCHAR2) RETURN 
VARCHAR2 IS
    predicate VARCHAR2(2000);
  BEGIN
    predicate := '1=2';
    IF (SYS_CONTEXT('USERENV','SESSION_USER') = 'C##_UD_TRUST') THEN
      predicate := NULL;
    ELSE 
      predicate := 'SCHOOL_ID IN SYS_CONTEXT(''C##SCHOOL_CONTEXT'',''SCHOOL_IDS'')';
    END IF;
    RETURN predicate;
  END school_user_select_security;
  
  FUNCTION school_user_insert_security(owner VARCHAR2, objname VARCHAR2) RETURN 
VARCHAR2 IS
    predicate VARCHAR2(2000);
  BEGIN
    predicate := '1=2';
    IF (SYS_CONTEXT('USERENV','SESSION_USER') = 'C##_UD_TRUST') THEN
      predicate := NULL;
    ELSE 
      predicate := 'SCHOOL_ID IN SYS_CONTEXT(''C##SCHOOL_CONTEXT'',''SCHOOL_IDS'')';
    END IF;
    RETURN predicate;
  END school_user_insert_security;
END security_package;
/

GRANT EXECUTE ON C##_UD_TRUST.security_package TO C##CISC437_STUDENT_ROLE;
/

CREATE OR REPLACE PUBLIC SYNONYM security_package FOR C##_UD_TRUST.security_package;
BEGIN
  DBMS_RLS.add_policy('C##_UD_TRUST', 'COURSE', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);
  DBMS_RLS.add_policy('C##_UD_TRUST', 'COURSE', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
END;
/
EXIT
