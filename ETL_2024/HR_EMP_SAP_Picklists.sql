/*
	HR_EMP_SAP_Picklists.sql
	
	created:	20240308	Andy Rupp
	updated:
	
*/

select	distinct
		PICKLISTV2_ID
,		count(*)
from	CORPITDATAPROD.EDW_LND_TB.SAPSF_PICKLIST_VAL_V2
where	upper(PICKLISTV2_ID)	like upper('%')
group	by
		PICKLISTV2_ID
order	by
		2 desc
;
select	*
from	CORPITDATAPROD.EDW_LND_TB.SAPSF_PICKLIST_VAL_V2
where	PICKLISTV2_ID			like 'Gender'
order   by
		4,6
;