/*
	HR_EMP_ETL_EMP_Job_Position.sql
	
	created:	20240308	Andy Rupp
	updated:
	
	This is a TEST release.
	populate the table HR_EMP_POSITION.
	
*/

TRUNCATE	TABLE	CITD_D1_DEV.S2_HR.HR_EMP_POSITION
;

insert	into	CITD_D1_DEV.S2_HR.HR_EMP_POSITION
		(
		POSITION_CODE
,		LEGACY_POSITION_ID
,		REGULAR_TEMPORARY
,		TARGET_FTE
,		STANDARD_HRS
,		VACANT_IND
,		EFFECTIVE_STATUS
,		DT_CRE_AT
,		DT_CRE_BY
,		DT_UPD_AT
,		DT_UPD_BY
,		DT_VALID_FROM
,		DT_VALID_TO
,		ACTIVE
		)
select	PO.POSITION_CD
,		PO.LEGACY_POSITION_ID
,		PO.REGULAR_TEMPORARY
,		PO.TARGET_FTE
,		PO.STANDARD_HRS
,		CASE	PO.VACANT_IND
		WHEN	TRUE	then 1
		WHEN	FALSE	then 0
		END CASE
,		PO.EFFECTIVE_STATUS
,		PO.EFFECTIVE_START_DTM		-- DT_CRE_AT
,		NULL						-- DT_CRE_BY
,		PO.LAST_MODIFIED_DTM		-- DT_UPD_AT
,		NULL						-- DT_UPD_BY
,		PO.EFFECTIVE_START_DTM		-- DT_VALID_FROM
,		CASE PO.EFFECTIVE_END_DTM
		WHEN '9999-12-31 00:00:00.000'	then	NULL
								ELSE			PO.EFFECTIVE_END_DTM
		END CASE					-- DT_VALID_TO
,		PO.EFFECTIVE_STATUS			-- ACTIVE
from	CITD_D1_DEV.S2_HR.SOURCE_FAKE_HR_EMP_POSITION		PO
;
UPDATE	CITD_D1_DEV.S2_HR.HR_EMP_POSITION
SET		ACTIVE			= '1'
where	ACTIVE			= 'A'
;
UPDATE	CITD_D1_DEV.S2_HR.HR_EMP_POSITION
SET		ACTIVE			= '0'
where	ACTIVE			= 'I'
;
UPDATE	CITD_D1_DEV.S2_HR.HR_EMP_POSITION
SET		ACTIVE			= '0'
where	DT_VALID_TO		IS NOT NULL
;
UPDATE	CITD_D1_DEV.S2_HR.HR_EMP_POSITION
SET		ACTIVE			= '1'
where	DT_VALID_TO		IS NULL
;
