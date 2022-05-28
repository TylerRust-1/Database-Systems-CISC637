declare
v_user varchar2(200);
V_SCHEMA_OWNER VARCHAR2(200);
BEGIN

  V_SCHEMA_OWNER := 'C##_UD_TRUST';

  select SYS_CONTEXT('USERENV','SESSION_USER') into v_user from dual;
  C##SCHOOL.context_package.set_context(V_SCHEMA_OWNER ,v_user);
END;