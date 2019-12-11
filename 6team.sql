DROP TABLE TRANSACTION_EXTENDED CASCADE CONSTRAINTS;

DROP TABLE BANK_MUTUAL_FUND CASCADE CONSTRAINTS;

DROP TABLE MUTUAL_FUND CASCADE CONSTRAINTS;

DROP TABLE INVESTMENTS CASCADE CONSTRAINTS;

DROP TABLE GOLD_PRICE CASCADE CONSTRAINTS;

DROP TABLE SILVER_PRICE CASCADE CONSTRAINTS;

--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------


--------------------------------------------------------
--  DDL for Table ACCOUNT
--------------------------------------------------------

 
--------------------------------------------------------
--  DDL for Table ACCOUNT_HOLDING_BEAN
--------------------------------------------------------


--------------------------------------------------------
--  DDL for Table TRANSACTIONS
--------------------------------------------------------

 


-------------------------------------------------
-- DDL FOR TRANSACTION_EXTENDED
-------------------------------------------------

CREATE TABLE TRANSACTION_EXTENDED 
   (	PRICE_PER_UNIT FLOAT(126), 
	UNITS FLOAT(126), 
	TRANS_ID NUMBER(10,0)REFERENCES TRANSACTIONS(TRANS_ID),
	PRIMARY KEY (TRANS_ID)
	
   );


--------------------------------------------------------
--  DDL for Table BANK_MUTUAL_FUND
--------------------------------------------------------

  CREATE TABLE BANK_MUTUAL_FUND 
   (	MF_PLAN_ID NUMBER(10), 
	DIR_STATUS NUMBER(1), 
	EXPIRY_DATE DATE, 
	LAUNCH_DATE DATE, 
	MIN_AMT_DIR FLOAT(126), 
	MIN_AMT_SIP FLOAT(126), 
	NAV FLOAT(126), 
	SIP_STATUS NUMBER(1), 
	TITLE VARCHAR2(255 CHAR),
	PRIMARY KEY(MF_PLAN_ID)
   );

--------------------------------------------------------
--  DDL for Table INVESTMENTS
--------------------------------------------------------

  CREATE TABLE INVESTMENTS 
   (	UCI NUMBER(16) REFERENCES CUSTOMERS(UCI), 
	GOLD_UNITS FLOAT(126), 
	SILVER_UNITS FLOAT(126), 
	ACCOUNT_ACCOUNT_NUMBER NUMBER(11) REFERENCES ACCOUNTS(ACCOUNT_NUMBER),
         PRIMARY KEY (UCI)
   );


--------------------------------------------------------
--  DDL for Table MUTUAL_FUND
--------------------------------------------------------

  CREATE TABLE MUTUAL_FUND 
   (	FOLIO_NUMBER NUMBER(10), 
	BUY_DATE DATE, 
	CLOSING_DATE DATE, 
	DURATION NUMBER(10), 
	FREQUENCY VARCHAR2(255 CHAR), 
	INSTALLMENTS NUMBER(10), 
	MF_AMOUNT FLOAT(126), 
	MF_UNITS FLOAT(126), 
	NEXT_INSTALL_DATE DATE, 
	OPENING_DATE DATE, 
	MF_STATUS NUMBER(1), 
	MF_TYPE VARCHAR2(255 CHAR), 
	BANK_MUTUAL_FUND_MF_PLAN_ID NUMBER(10) REFERENCES BANK_MUTUAL_FUND(MF_PLAN_ID), 
	INV_UCI NUMBER(16) REFERENCES INVESTMENTS(UCI),
	PRIMARY KEY (FOLIO_NUMBER)
   ) ;



--------------------------------------------------------
--  DDL for Table SILVER_PRICE
--------------------------------------------------------

  CREATE TABLE SILVER_PRICE 
   (	UPDATE_DATE TIMESTAMP(6), 
	SILVER_PRICE FLOAT(126),
	PRIMARY KEY (UPDATE_DATE)
   ) ;

--------------------------------------------------------
--  DDL for Table GOLD_PRICE
--------------------------------------------------------

  CREATE TABLE GOLD_PRICE 
   (	UPDATE_DATE TIMESTAMP(6), 
	GOLD_PRICE FLOAT(126),
	PRIMARY KEY (UPDATE_DATE)
   ) ;

INSERT INTO "TEST"."APPLICANTS" (APPLICANT_ID, AADHAR_NUMBER, ALTERNATE_MOBILE_NUMBER, DOB, EMAIL_ID, FATHER_NAME, FIRST_NAME, GENDER, LAST_NAME, MOBILE_NUMBER, MOTHER_NAME, PAN_NUMBER) VALUES ('1010', '123412341234', '1234567890', TO_DATE('2019-11-13 10:17:23', 'YYYY-MM-DD HH24:MI:SS'), 'zdfdzf', 'df', 'fgg', 'MALE', 'fgd', '9874563210', 'fgfg', 'asdfgqwe1');

Commit;


Task Cancelled: 
INSERT INTO "TEST"."APPLICATIONS" (APPLICATION_ID, ACCOUNT_TYPE, APPLICATION_DATE, APPLICATION_STATUS) VALUES ('1010', 'SAVINGS', TO_DATE('2019-11-14 10:19:29', 'YYYY-MM-DD HH24:MI:SS'), 'APPROVED');

Commit;


INSERT INTO "TEST"."CUSTOMERS" (UCI, AADHAR_NUMBER, ALTERNATE_MOBILE_NUMBER, APPLICATION_ID, DOB, EMAIL_ID, FATHER_NAME, FIRST_NAME, GENDER, LAST_NAME, MOBILE_NUMBER, MOTHER_NAME, PAN_NUMBER, PASSWORD, USER_ID) VALUES ('1234123412341234', '123412341234', '9874563210', '1010', TO_DATE('2019-11-05 10:20:40', 'YYYY-MM-DD HH24:MI:SS'), 'ghgh', 'fg', 'ghg', 'MALE', 'ghghf', '9874563210', 'rs', 'fgfdgd', 'password1', 'user1');

Commit;


INSERT INTO "TEST"."ACCOUNTS" (ACCOUNT_NUMBER, ACC_CREATION_DATE, ACC_STATUS, ACCOUNT_TYPE, BALANCE, MATURITY_AMT, OPEN_BALANCE, TENURE, TRANSAC_PASS) VALUES ('12341234123', TO_DATE('2019-11-27 10:21:54', 'YYYY-MM-DD HH24:MI:SS'), 'ACTIVE', 'SAVINGS', '900000', '5000', '5000', '10', 'transpass')

Commit;


INSERT INTO "TEST"."BANK_MUTUAL_FUND" (MF_PLAN_ID, DIR_STATUS, LAUNCH_DATE, MIN_AMT_DIR, MIN_AMT_SIP, NAV, SIP_STATUS, TITLE) VALUES ('10001', '1', TO_DATE('2019-11-13 10:23:05', 'YYYY-MM-DD HH24:MI:SS'), '5000', '500', '500', '1', 'IBS_NEW')

Commit;


INSERT INTO "TEST"."BANKERS" (BANKER_ID, PASSWORD, USER_ID) VALUES ('5050', 'id1', 'pass1')

Commit;

INSERT INTO "TEST"."INVESTMENTS" (UCI, GOLD_UNITS, SILVER_UNITS, ACCOUNTS_ACCOUNT_NUMBER) VALUES ('1234123412341234', '500', '2000', '12341234123')

Commit;



