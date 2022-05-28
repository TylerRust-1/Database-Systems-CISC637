--------------------------------------------------------
--  File created - Sunday-March-27-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ASP_NET_ROLES
--------------------------------------------------------

  CREATE TABLE "ASP_NET_ROLES" 
   (	"ID" NVARCHAR2(450), 
	"NAME" NVARCHAR2(256), 
	"NORMALIZED_NAME" NVARCHAR2(256), 
	"CONCURRENCY_STAMP" NVARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table ASP_NET_ROLE_CLAIMS
--------------------------------------------------------

  CREATE TABLE "ASP_NET_ROLE_CLAIMS" 
   (	"ID" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ROLE_ID" NVARCHAR2(450), 
	"CLAIM_TYPE" NVARCHAR2(2000), 
	"CLAIM_VALUE" NVARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table ASP_NET_USERS
--------------------------------------------------------

  CREATE TABLE "ASP_NET_USERS" 
   (	"ID" NVARCHAR2(450), 
	"USER_NAME" NVARCHAR2(256), 
	"NORMALIZED_USER_NAME" NVARCHAR2(256), 
	"EMAIL" NVARCHAR2(256), 
	"NORMALIZED_EMAIL" NVARCHAR2(256), 
	"EMAIL_CONFIRMED" NUMBER(1,0), 
	"PASSWORD_HASH" NVARCHAR2(2000), 
	"SECURITY_STAMP" NVARCHAR2(2000), 
	"CONCURRENCY_STAMP" NVARCHAR2(2000), 
	"PHONE_NUMBER" NVARCHAR2(2000), 
	"PHONE_NUMBER_CONFIRMED" NUMBER(1,0), 
	"TWO_FACTOR_ENABLED" NUMBER(1,0), 
	"LOCKOUT_END" TIMESTAMP (7) WITH TIME ZONE, 
	"LOCKOUT_ENABLED" NUMBER(1,0), 
	"ACCESS_FAILED_COUNT" NUMBER(10,0)
   ) ;
--------------------------------------------------------
--  DDL for Table ASP_NET_USER_CLAIMS
--------------------------------------------------------

  CREATE TABLE "ASP_NET_USER_CLAIMS" 
   (	"ID" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"USER_ID" NVARCHAR2(450), 
	"CLAIM_TYPE" NVARCHAR2(2000), 
	"CLAIM_VALUE" NVARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table ASP_NET_USER_LOGINS
--------------------------------------------------------

  CREATE TABLE "ASP_NET_USER_LOGINS" 
   (	"LOGIN_PROVIDER" NVARCHAR2(128), 
	"PROVIDER_KEY" NVARCHAR2(128), 
	"PROVIDER_DISPLAY_NAME" NVARCHAR2(2000), 
	"USER_ID" NVARCHAR2(450)
   ) ;
--------------------------------------------------------
--  DDL for Table ASP_NET_USER_ROLES
--------------------------------------------------------

  CREATE TABLE "ASP_NET_USER_ROLES" 
   (	"USER_ID" NVARCHAR2(450), 
	"ROLE_ID" NVARCHAR2(450)
   ) ;
--------------------------------------------------------
--  DDL for Table ASP_NET_USER_TOKENS
--------------------------------------------------------

  CREATE TABLE "ASP_NET_USER_TOKENS" 
   (	"USER_ID" NVARCHAR2(450), 
	"LOGIN_PROVIDER" NVARCHAR2(128), 
	"NAME" NVARCHAR2(128), 
	"VALUE" NVARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table DEVICE_CODES
--------------------------------------------------------

  CREATE TABLE "DEVICE_CODES" 
   (	"USER_CODE" NVARCHAR2(200), 
	"DEVICE_CODE" NVARCHAR2(200), 
	"SUBJECT_ID" NVARCHAR2(200), 
	"SESSION_ID" NVARCHAR2(100), 
	"CLIENT_ID" NVARCHAR2(200), 
	"DESCRIPTION" NVARCHAR2(200), 
	"CREATION_TIME" TIMESTAMP (7), 
	"EXPIRATION" TIMESTAMP (7), 
	"DATA" NCLOB
   ) ;
--------------------------------------------------------
--  DDL for Table PERSISTED_GRANTS
--------------------------------------------------------

  CREATE TABLE "PERSISTED_GRANTS" 
   (	"KEY" NVARCHAR2(200), 
	"TYPE" NVARCHAR2(50), 
	"SUBJECT_ID" NVARCHAR2(200), 
	"SESSION_ID" NVARCHAR2(100), 
	"CLIENT_ID" NVARCHAR2(200), 
	"DESCRIPTION" NVARCHAR2(200), 
	"CREATION_TIME" TIMESTAMP (7), 
	"EXPIRATION" TIMESTAMP (7), 
	"CONSUMED_TIME" TIMESTAMP (7), 
	"DATA" NCLOB
   ) ;
--------------------------------------------------------
--  DDL for Table __EFMigrationsHistory
--------------------------------------------------------

  CREATE TABLE "__EFMigrationsHistory" 
   (	"MigrationId" NVARCHAR2(150), 
	"ProductVersion" NVARCHAR2(32)
   ) ;
REM INSERTING into ASP_NET_ROLES
SET DEFINE OFF;
REM INSERTING into ASP_NET_ROLE_CLAIMS
SET DEFINE OFF;
REM INSERTING into ASP_NET_USERS
SET DEFINE OFF;
Insert into ASP_NET_USERS (ID,USER_NAME,NORMALIZED_USER_NAME,EMAIL,NORMALIZED_EMAIL,EMAIL_CONFIRMED,PASSWORD_HASH,SECURITY_STAMP,CONCURRENCY_STAMP,PHONE_NUMBER,PHONE_NUMBER_CONFIRMED,TWO_FACTOR_ENABLED,LOCKOUT_END,LOCKOUT_ENABLED,ACCESS_FAILED_COUNT) values ('f3d394c0-74be-4a2f-b811-4388c32117ec','trust@udel.edu','TRUST@UDEL.EDU','trust@udel.edu','TRUST@UDEL.EDU',1,'AQAAAAEAACcQAAAAEAUnYTEP91tZ6PGR0rF4I04u5NQcoYmRbVYroWXA8gri8xUUsmHEvbXCgqaqAxXAgQ==','VYGJMH7WLULK3FVJ27UY37UVEXTNYNYV','86e1872f-e4ab-4c31-a5a2-b2e542841dd5',null,0,0,null,1,0);
REM INSERTING into ASP_NET_USER_CLAIMS
SET DEFINE OFF;
REM INSERTING into ASP_NET_USER_LOGINS
SET DEFINE OFF;
REM INSERTING into ASP_NET_USER_ROLES
SET DEFINE OFF;
REM INSERTING into ASP_NET_USER_TOKENS
SET DEFINE OFF;
REM INSERTING into DEVICE_CODES
SET DEFINE OFF;
REM INSERTING into PERSISTED_GRANTS
SET DEFINE OFF;
REM INSERTING into "__EFMigrationsHistory"
SET DEFINE OFF;
Insert into "__EFMigrationsHistory" ("MigrationId","ProductVersion") values ('20220327225033_init','5.0.15');
