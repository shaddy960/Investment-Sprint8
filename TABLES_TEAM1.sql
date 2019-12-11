﻿ 
DROP TABLE ADDRESS CASCADE CONSTRAINTS;

DROP TABLE APPLICANTS CASCADE CONSTRAINTS;

DROP TABLE APPLICATIONS CASCADE CONSTRAINTS;

DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;

DROP TABLE ACCOUNTS CASCADE CONSTRAINTS;

DROP TABLE ACCOUNT_HOLDING CASCADE CONSTRAINTS;

DROP TABLE TRANSACTIONS CASCADE CONSTRAINTS;

DROP TABLE BANKERS CASCADE CONSTRAINTS;


CREATE TABLE ADDRESS 
   (	ADDRESS_ID NUMBER(6,0) PRIMARY KEY, 
	CURRENT_AREA VARCHAR2(15 CHAR), 
	CURRENT_CITY VARCHAR2(15 CHAR), 
	CURRENT_COUNTRY VARCHAR2(15 CHAR), 
	CURRENT_HOUSE_NUMBER VARCHAR2(6 CHAR), 
	CURRENT_LANDMARK VARCHAR2(15 CHAR), 
	CURRENT_PINCODE VARCHAR2(6 CHAR), 
	CURRENT_STATE VARCHAR2(15 CHAR), 
	CURRENT_STREET_NAME VARCHAR2(15 CHAR), 
	PERMANENT_AREA VARCHAR2(15 CHAR), 
	PERMANENT_CITY VARCHAR2(15 CHAR), 
	PERMANENT_COUNTRY VARCHAR2(15 CHAR), 
	PERMANENT_HOUSE_NUMBER VARCHAR2(6 CHAR), 
	PERMANENT_LANDMARK VARCHAR2(15 CHAR), 
	PERMANENT_PINCODE VARCHAR2(6 CHAR), 
	PERMANENT_STATE VARCHAR2(15 CHAR), 
	PERMANENT_STREET_NAME VARCHAR2(15 CHAR)
   ); 


CREATE TABLE APPLICANTS
   (	APPLICANT_ID NUMBER(6,0) PRIMARY KEY, 
	AADHARDOCUMENT BLOB, 
	AADHAR_NUMBER VARCHAR2(12 CHAR) NOT NULL, 
	ALTERNATE_MOBILE_NUMBER VARCHAR2(10 CHAR),
	DOB DATE NOT NULL, 
	EMAIL_ID VARCHAR2(35 CHAR) NOT NULL, 
	FATHER_NAME VARCHAR2(40 CHAR) NOT NULL, 
	FIRST_NAME VARCHAR2(25 CHAR) NOT NULL, 
	GENDER VARCHAR2(30 CHAR) NOT NULL, 
	LAST_NAME VARCHAR2(25 CHAR) NOT NULL, 
	MOBILE_NUMBER VARCHAR2(10 CHAR) NOT NULL, 
	MOTHER_NAME VARCHAR2(40 CHAR) NOT NULL, 
	PANDOCUMENT BLOB, 
	PAN_NUMBER VARCHAR2(10 CHAR) NOT NULL,
	ADDRESS_ADDRESS_ID NUMBER(6,0),
        FOREIGN KEY(ADDRESS_ADDRESS_ID) references ADDRESS(ADDRESS_ID) 	 
   );
 

 CREATE TABLE APPLICATIONS
   (	APPLICATION_ID NUMBER(6,0) PRIMARY KEY, 
	ACCOUNT_TYPE VARCHAR2(17 CHAR) NOT NULL, 
	APPLICATION_DATE DATE NOT NULL, 
	APPLICATION_STATUS VARCHAR2(255 CHAR) NOT NULL, 
	ASSIGNED_BANKER NUMBER(10,0), 
	REMARKS VARCHAR2(255 CHAR), 
	P_APPT_ID NUMBER(19,0), 
	S_APPT_ID NUMBER(19,0)
   );

CREATE TABLE CUSTOMERS
   (	UCI NUMBER(16,0) PRIMARY KEY, 
	AADHAR_NUMBER VARCHAR2(12 CHAR) NOT NULL, 
	ALTERNATE_MOBILE_NUMBER VARCHAR2(10 CHAR) NOT NULL, 
	APPLICATION_ID NUMBER(6,0) NOT NULL, 
	DOB DATE NOT NULL, 
	EMAIL_ID VARCHAR2(35 CHAR) NOT NULL, 
	FATHER_NAME VARCHAR2(40 CHAR) NOT NULL, 
	FIRST_NAME VARCHAR2(20 CHAR) NOT NULL, 
	GENDER VARCHAR2(20 CHAR) NOT NULL, 
	LAST_NAME VARCHAR2(20 CHAR) NOT NULL, 
	LOGIN_COUNT NUMBER(10,0), 
	MOBILE_NUMBER VARCHAR2(10 CHAR) NOT NULL, 
	MOTHER_NAME VARCHAR2(40 CHAR) NOT NULL, 
	PAN_NUMBER VARCHAR2(10 CHAR) NOT NULL, 
	PASSWORD VARCHAR2(15 CHAR) NOT NULL, 
	USER_ID VARCHAR2(15 CHAR) UNIQUE,
	ADDRESS_ADDRESS_ID NUMBER(6,0), 
        FOREIGN KEY(ADDRESS_ADDRESS_ID) references ADDRESS(ADDRESS_ID)
   );

CREATE TABLE ACCOUNTS
   (	ACCOUNT_NUMBER NUMBER(11,0) PRIMARY KEY, 
	ACC_CREATION_DATE DATE NOT NULL, 
	ACC_STATUS VARCHAR2(17 CHAR) NOT NULL, 
	ACCOUNT_TYPE VARCHAR2(17 CHAR) NOT NULL, 
	BALANCE NUMBER(19,2) NOT NULL, 
	MATURITY_AMT NUMBER(19,2), 
	OPEN_BALANCE NUMBER(19,2) NOT NULL, 
	TENURE FLOAT(126), 
	TRANSAC_PASS VARCHAR2(15 CHAR) NOT NULL
   );
  
CREATE TABLE ACCOUNT_HOLDING
   (    AHID NUMBER(19,0) PRIMARY KEY, 
	TYPE VARCHAR2(20 CHAR),
	ACCOUNT_ACCOUNT_NUMBER NUMBER(11,0),
	FOREIGN KEY(ACCOUNT_ACCOUNT_NUMBER) references ACCOUNTS(ACCOUNT_NUMBER),
	CUSTOMER_UCI NUMBER(16,0),
	FOREIGN KEY(CUSTOMER_UCI) references CUSTOMERS(UCI)
   );

 
CREATE TABLE TRANSACTIONS
   (	TRANS_ID NUMBER(10,0) PRIMARY KEY, 
	ACC_NO NUMBER(11,0) NOT NULL, 
	AMOUNT NUMBER(12,2) NOT NULL,
	CURRENT_BALANCE number(12,2), 
	TRANS_DATE_TIME TIMESTAMP NOT NULL, 
	TRANS_DESC VARCHAR2(40 CHAR) NOT NULL, 
	TRANS_MODE VARCHAR2(20 CHAR) NOT NULL, 
	TRANS_TYPE VARCHAR2(20 CHAR) NOT NULL,
	ACCOUNT_ACCOUNT_NUMBER number(11),
	FOREIGN KEY(ACCOUNT_ACCOUNT_NUMBER) references ACCOUNTS(ACCOUNT_NUMBER)
   );

CREATE TABLE BANKERS
   (	BANKER_ID NUMBER(10,0) PRIMARY KEY, 
	PASSWORD VARCHAR2(255 CHAR), 
	USER_ID VARCHAR2(255 CHAR)
   );
 
-------------------------------------------------------------------------------------------------------------
                                                   SEQUENCE 
-------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE APPLICANT_SEQUENCE
MINVALUE 10000
START WITH 10001
INCREMENT BY 1;

CREATE SEQUENCE ADDRESS_SEQUENCE
MINVALUE 100
START WITH 101
INCREMENT BY 1;

CREATE SEQUENCE CUSTOMER_SEQUENCE
MINVALUE 1111222210000000
START WITH 1111222210000001
INCREMENT BY 1;

CREATE SEQUENCE ACCOUNT_SEQUENCE
MINVALUE 55010010000
START WITH 55010010001
INCREMENT BY 1;

CREATE SEQUENCE APPLICATION_SEQUENCE
MINVALUE 5000
START WITH 5001
INCREMENT BY 1;

---------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------


						