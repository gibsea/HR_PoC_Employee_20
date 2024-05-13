/*

		CITD_REF_ORG.sql
		
		created:	20231129	Andy Rupp
		updated:	

*/
truncate	table	S2_REF.REF_ORG_CMPY ;
truncate	table	S2_REF.REF_ORG_BU ;
truncate	table	S2_REF.REF_ORG_DIV ;
truncate	table	S2_REF.REF_ORG_DPT ;

create or replace table	S2_REF.REF_ORG_CMPY
as
select	DISTINCT
		CMPY_ID
,		CMPY_NAME
,		NAME_SHORT
,		COST_CENTER_CD
from	S2_REF.ORG_CMPY
;
create or replace table	S2_REF.REF_ORG_BU
as
select	DISTINCT
		BU_ID
,		BU_NAME
,		NAME_SHORT
,		COST_CENTER_CD
from	S2_REF.ORG_BU
;
create or replace table	S2_REF.REF_ORG_DIV
as
select	DISTINCT
		DIV_ID
,		DIV_NAME
,		NAME_SHORT
,		COST_CENTER_CD
from	S2_REF.ORG_DIV
;
create or replace table	S2_REF.REF_ORG_DPT
as
select	DISTINCT
		DPT_ID
,		DPT_NAME
,		NAME_SHORT
,		COST_CENTER_CD
from	S2_REF.ORG_DPT
;