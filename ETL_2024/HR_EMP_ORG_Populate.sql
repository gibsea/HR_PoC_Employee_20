/*
		HR_EMP_ORG_Populate.sql
		
		created:	20231130	Andy Rupp
		updated:	20240311	Andy Rupp
		also populate HR_FO Tables in S2_HR
*/
TRUNCATE	TABLE	S2_HR.HR_FO_COMPANY	;
TRUNCATE	TABLE	S2_HR.HR_FO_BUSINESS_UNIT ;
TRUNCATE	TABLE	S2_HR.HR_FO_DIVISION ;
TRUNCATE	TABLE	S2_HR.HR_FO_DEPARTMENT ;

insert	into
		S2_HR.HR_FO_COMPANY
		(
		CMPY_CD
,		ABBR_COMPANY
,		NAME_COMPANY
,		COST_CENTER
,		DT_CRE_AT 
,		DT_CRE_BY 
,		DT_UPD_AT 
,		DT_UPD_BY 
,		DT_VALID_FROM
,		DT_VALID_TO
,		ACTIVE
		)
select	CMPY_ID
,		NAME_SHORT
,		NAME
,		COST_CENTER_CD
,		CURRENT_DATE
,		NULL
,		CURRENT_DATE
,		NULL
,		'2000-01-01'
,		'2099-12-31'
,		ACTIVE
from	S2_REF.REF_UPLOAD_ORG_CMPY
where   CMPY_ID IS NOT NULL
;
insert	into
		S2_HR.HR_FO_BUSINESS_UNIT
		(
		CMPY_CD
,		BU_CD
,		ABBR_BU
,		NAME_BU
,		COST_CENTER
,		DT_CRE_AT 
,		DT_CRE_BY 
,		DT_UPD_AT 
,		DT_UPD_BY 
,		DT_VALID_FROM
,		DT_VALID_TO
,		ACTIVE
		)
select	CMPY_ID
,		BU_ID
,		NAME_SHORT
,		NAME
,		COST_CENTER_CD
,		CURRENT_DATE
,		NULL
,		CURRENT_DATE
,		NULL
,		'2000-01-01'
,		'2099-12-31'
,		ACTIVE
from	S2_REF.REF_UPLOAD_ORG_BU
;
insert	into
		S2_HR.HR_FO_DIVISION
		(
		CMPY_CD
,		BU_CD
,		DIV_CD
,		ABBR_DIV
,		NAME_DIV
,		COST_CENTER
,		DT_CRE_AT 
,		DT_CRE_BY 
,		DT_UPD_AT 
,		DT_UPD_BY 
,		DT_VALID_FROM
,		DT_VALID_TO
,		ACTIVE
		)
select	CMPY_ID
,		BU_ID
,		DIV_ID
,		NAME_SHORT
,		NAME
--,		NULL -- HQ
,		COST_CENTER_CD
,		CURRENT_DATE
,		NULL
,		CURRENT_DATE
,		NULL
,		'2000-01-01'
,		'2099-12-31'
,		ACTIVE
from	S2_REF.REF_UPLOAD_ORG_DIV
;
insert	into
		S2_HR.HR_FO_DEPARTMENT
		(
		CMPY_CD
,		BU_CD
,		DEPT_CD
,		ABBR_DEPT
,		NAME_DEPT
,		COST_CENTER
,		DT_CRE_AT 
,		DT_CRE_BY 
,		DT_UPD_AT 
,		DT_UPD_BY 
,		DT_VALID_FROM
,		DT_VALID_TO
,		ACTIVE
		)
select	CMPY_ID
,		BU_ID
,		DPT_ID
,		NAME_SHORT
,		NAME
,		COST_CENTER_CD
,		CURRENT_DATE
,		NULL
,		CURRENT_DATE
,		NULL
,		'2000-01-01'
,		'2099-12-31'
,		ACTIVE
from	S2_REF.REF_UPLOAD_ORG_DPT
;