CREATE OR REPLACE PACKAGE security_package AS
  FUNCTION school_user_insert_security(owner VARCHAR2, objname VARCHAR2)
    RETURN VARCHAR2;
    
  FUNCTION school_user_delete_security(owner VARCHAR2, objname VARCHAR2)
    RETURN VARCHAR2;
  
  FUNCTION school_user_select_security(owner VARCHAR2, objname VARCHAR2)
    RETURN VARCHAR2;
    
  FUNCTION school_user_update_security(owner VARCHAR2, objname VARCHAR2)
    RETURN VARCHAR2;
END security_package;
/
CREATE OR REPLACE PACKAGE BODY Security_Package IS
  FUNCTION school_user_select_security(owner VARCHAR2, objname VARCHAR2) RETURN 
VARCHAR2 IS
    predicate VARCHAR2(2000);
  BEGIN
    predicate := '1=2';
    IF (SYS_CONTEXT('USERENV','SESSION_USER') = 'C##_UD_TRUST') THEN
      predicate := NULL;
    ELSE 
      predicate := 'SCHOOL_ID in ' || SYS_CONTEXT('C##SCHOOL_CONTEXT','SCHOOL_IDS');
    END IF;
    RETURN predicate;
  END school_user_select_security;
  
  FUNCTION school_user_update_security(owner VARCHAR2, objname VARCHAR2) RETURN 
VARCHAR2 IS
    predicate VARCHAR2(2000);
  BEGIN
    predicate := '1=2';
    IF (SYS_CONTEXT('USERENV','SESSION_USER') = 'C##_UD_TRUST') THEN
      predicate := NULL;
    ELSE 
      predicate := 'SCHOOL_ID in ' || SYS_CONTEXT('C##SCHOOL_CONTEXT','SCHOOL_IDS');
    END IF;
    RETURN predicate;
  END school_user_update_security;
  
  FUNCTION school_user_insert_security(owner VARCHAR2, objname VARCHAR2) RETURN 
VARCHAR2 IS
    predicate VARCHAR2(2000);
  BEGIN
    predicate := '1=2';
    IF (SYS_CONTEXT('USERENV','SESSION_USER') = 'C##_UD_TRUST') THEN
      predicate := NULL;
    ELSE 
      predicate := 'SCHOOL_ID in ' || SYS_CONTEXT('C##SCHOOL_CONTEXT','SCHOOL_IDS');
    END IF;
    RETURN predicate;
  END school_user_insert_security;

  FUNCTION school_user_delete_security(owner VARCHAR2, objname VARCHAR2) RETURN 
VARCHAR2 IS
    predicate VARCHAR2(2000);
  BEGIN
    predicate := '1=2';
    IF (SYS_CONTEXT('USERENV','SESSION_USER') = 'C##_UD_TRUST') THEN
      predicate := NULL;
    ELSE 
      predicate := 'SCHOOL_ID in ' || SYS_CONTEXT('C##SCHOOL_CONTEXT','SCHOOL_IDS');
    END IF;
    RETURN predicate;
  END school_user_delete_security;
END security_package;
/

GRANT EXECUTE ON C##_UD_TRUST.security_package TO C##CISC437_STUDENT_ROLE
/

BEGIN
  DBMS_RLS.add_policy('C##_UD_TRUST', 'COURSE', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'COURSE', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'COURSE', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);
                                        
  DBMS_RLS.add_policy('C##_UD_TRUST', 'COURSE', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                      
                      
                      
-----------------------
  DBMS_RLS.add_policy('C##_UD_TRUST', 'STUDENT', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'STUDENT', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'STUDENT', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'STUDENT', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                      
                      
                      
                ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SCHOOL', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);
                                           
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SCHOOL', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SCHOOL', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SCHOOL', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                                            
                      
                      
                ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ENROLLMENT', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);
                                           
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ENROLLMENT', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ENROLLMENT', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ENROLLMENT', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                                            
                      
                      
                ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SECTION', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);
                                           
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SECTION', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SECTION', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SECTION', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                      
                      
                      ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SCHOOL_USER', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SCHOOL_USER', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SCHOOL_USER', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);                  
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'SCHOOL_USER', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                                            
                      
                      
                      ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USERS', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USERS', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USERS', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);                  
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USERS', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                                                                  
                      
                      
                      ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_CLAIMS', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_CLAIMS', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_CLAIMS', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);                  
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_CLAIMS', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                                                                  
                      
                      
                      ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_LOGINS', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_LOGINS', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_LOGINS', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);                  
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_LOGINS', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                                                                  
                      
                      
                      ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_TOKENS', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_TOKENS', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_TOKENS', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);                  
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_TOKENS', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                                                                  
                      
                      
                      ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_ROLES', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_ROLES', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_ROLES', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);                  
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_USER_ROLES', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                                                                  
                      
                      
                      ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_ROLES', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_ROLES', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_ROLES', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);                  
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_ROLES', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                                                                  
                      
                      
                      ----------------                     
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_ROLE_CLAIMS', 'SCHOOL_USER_INSERT_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_INSERT_SECURITY',
                      'INSERT', TRUE);           
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_ROLE_CLAIMS', 'SCHOOL_USER_SELECT_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_SELECT_SECURITY',
                      'SELECT');
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_ROLE_CLAIMS', 'SCHOOL_USER_UPDATE_POLICY', 
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_UPDATE_SECURITY',
                      'INSERT', TRUE);                  
                      
  DBMS_RLS.add_policy('C##_UD_TRUST', 'ASP_NET_ROLE_CLAIMS', 'SCHOOL_USER_DELETE_POLICY',
                      'C##SCHEMAOWNER', 
'SECURITY_PACKAGE.SCHOOL_USER_DELETE_SECURITY',
                      'SELECT');
                      
END;
/
EXIT