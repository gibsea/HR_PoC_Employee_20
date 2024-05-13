/*
	HR_EMP_ETL_Office_Location.sql
	
	created:	20240310	Andy Rupp
	updated:
	
	This is a TEST release.
	populate the table HR_OFFICE_LOCATION.
	
*/

TRUNCATE	TABLE	S2_HR.HR_OFFICE_LOCATION
;

insert	into	CITD_D1_DEV.S2_HR.HR_OFFICE_LOCATION
		(
		OFFICE_CODE
,		OFFICE_NAME
,		OFFICE_DESCRIPTION
		)
select	EXTERNALCODE
,		NAME
,		NAME
from	CORPITDATAPROD.EDW_LND_TB.SAPSF_FO_LOCATION
;