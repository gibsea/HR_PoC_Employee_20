/*
	HR_EMP_ETL_EMP_Job.sql
	
	created:	20240308	Andy Rupp
	updated:
	
	This is a TEST release.
	populate the table HR_EMP_JOB.
	
*/

TRUNCATE	TABLE	CITD_D1_DEV.S2_HR.HR_EMP_JOB
;

insert	into	CITD_D1_DEV.S2_HR.HR_EMP_JOB
		(
		EMPLOYEE_ID
,		HOST_MANAGER 
,		BU_CD
,		DEPT_CD
,		EMP_CLASS_CD 
,		EMP_STATUS 
,		EVENT_CD 
,		POSITION_CODE
--,		REGULAR_TEMP 
,		IS_FULLTIME_EMPLOYEE 
,		FTE 
,		JOB_CODE 
,		JOB_GRADE
,		JOB_CODE_TITLE 
,		JOB_LEVEL 
,		DT_CRE_AT 
,		DT_CRE_BY 
,		DT_UPD_AT 
,		DT_UPD_BY 
,		DT_VALID_FROM 
,		DT_VALID_TO 
,		ACTIVE
		)
SELECT	DISTINCT
		JOB.USERID 
,		JOB.MANAGERID 			-- via CUSTOMSTRING2 (Name to ID mapping)
,		'BU_CD'					-- link to S2_REF reference tables
,		DPT.DEPT_CD				-- link to S2_REF reference tables
,		JOB.EMPLOYEECLASS 
,		JOB.EMPLSTATUS 
,		JOB.EVENT 
,		JOB.POSITION
--,		JOB.REGULARTEMP
,		CASE	JOB.ISFULLTIMEEMPLOYEE
		WHEN TRUE	THEN '1'
		WHEN FALSE	THEN '0'
		END CASE
,		JOB.FTE 
,		JOB.JOBCODE 
,		NULL-- JOB.PAYGRADE
,		JOB.JOBTITLE 
,		'Job Level'
,		JOB.CREATEDDATETIME 
,		NULL
,		JOB.LASTMODIFIEDDATETIME
,		NULL
,		JOB.STARTDATE 
,		CASE JOB.ENDDATE
		WHEN '9999-12-31 00:00:00.000'	then	NULL
								ELSE			JOB.ENDDATE
		END CASE			-- DT_VALID_TO
,		'1'	
FROM	CORPITDATAPROD.EDW_LND_TB.SAPSF_EMP_JOB			JOB
LEFT JOIN
		CITD_D1_DEV.S2_HR.SOURCE_FAKE_HR_EMP_FO_DEPT	DPT
	ON	(JOB.DEPARTMENT			= DPT.DEPT_DESC)
	OR	(JOB.DEPARTMENT			= DPT.DEPT_CD)
;
UPDATE	CITD_D1_DEV.S2_HR.HR_EMP_JOB
SET		ACTIVE			= '0'
where	DT_VALID_TO		IS NOT NULL
;
UPDATE	CITD_D1_DEV.S2_HR.HR_EMP_JOB
SET		ACTIVE			= '1'
where	DT_VALID_TO		IS NULL
;