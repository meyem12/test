/* Adding a comment here for gitHub testing */

/* More comments for branch */

/* ODM testing from 3/10/2020
Table: Z_FACT_UW_USR_MSG_TRAN */

/* See email to Lindsey and Eric, don't think this table is right messages, and also couldn't get joined in many ways */

proc sql;
CREATE TABLE ODM_ALL as
SELECT *
FROM IC_CLNXT.Z_FACT_UW_USR_MSG_TRAN;
QUIT;

data ODM_ALL;
set ODM_ALL;
POL_NO = compress(POL_NO);
run;


proc sql;
CREATE TABLE ODM_JOINED as 
SELECT 
	POLICY_RENEWAL_CONTROL_ID,
	SOURCE_ACCOUNT_NUMBER,
	SOURCE_POLICY_NUMBER,
	POL_EXPIR,
	MIG_PROCESS_CDE,
	CLT_ACCOUNT_NUMBER,
	CLT_POLICY_NUMBER,
	INITIAL_L,
	SOURCE_SYSTEM_TXT,
	MIG_UPDT_TS,
	AWD_TASK_PLCY_IND,
	BATCH_ID,
	LOB,
	State,
	MIG_PROC_TXT,
	OUTCOME,
	USER_MSG
FROM FINAL left join ODM_ALL
ON FINAL.SOURCE_POLICY_NUMBER = ODM_ALL.POL_NO;
QUIT;