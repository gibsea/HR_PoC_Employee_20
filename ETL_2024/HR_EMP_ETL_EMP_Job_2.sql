/*
	HR_EMP_ETL_EMP_Job_2.sql
	
	created:	20240308	Andy Rupp
	updated:
	
	This is a TEST release.
	use S1_LND.SAPSF_EMP_JOB
	populate the table HR_EMP_JOB.
	
*/

TRUNCATE	TABLE	CITD_D1_DEV.S2_HR.HR_EMP_JOB
;

insert	into	CITD_D1_DEV.S2_HR.HR_EMP_JOB
		(
		EMPLOYEE_ID
,		HOST_MANAGER 
,		CMPY_CD
,		BU_CD
,		DEPT_CD
,		OFFICE_CODE
,		EMP_CLASS_CD 
,		EMP_STATUS 
,		EVENT_CD 
,		EVENT_REASON_CD 
,		POSITION_CODE
,		REGULAR_TEMP 
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
		"userId"
,		"managerId"
,		"company"
,		"businessUnit"
,		"department"
,		'0' -- LOCATION_CD
,		"employeeClass"
,		"emplStatus"
,		"event"
,		"eventReason"
,		"position"
,		"regularTemp"
,		CASE	"isFulltimeEmployee"
		when TRUE	then '1'
		when FALSE	then '0'
		end case
,		"fte"
,		"jobCode"
,		'321' -- JobGrade
,		"customString12"
,		"customString17"
,		"companyEntryDate"
,		NULL
,		"lastModifiedOn"
,		NULL
,		"companyEntryDate"
,		"contractEndDate"
,		'1'
FROM	CITD_D1_DEV.S1_LND.SAPSF_EMP_JOB				JOB
where   (
        "company" not like 'Kinaxis%'
    and "company" not like 'Prana%'
    and "company" not like 'Rubikloud%'
        )
order   by
        1,3,4,5
;
UPDATE	CITD_D1_DEV.S2_HR.HR_EMP_JOB
SET		ACTIVE			= '0'
where	DT_VALID_TO		IS NOT NULL
;
UPDATE	CITD_D1_DEV.S2_HR.HR_EMP_JOB
SET		ACTIVE			= '1'
where	DT_VALID_TO		IS NULL
;