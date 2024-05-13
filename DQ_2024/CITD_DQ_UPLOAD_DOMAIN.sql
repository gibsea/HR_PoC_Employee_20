/*
		CITD_DQ_UPLOAD_DOMAIN.sql
*/
-- delete from S2_DQ.CITD_DQ_DOMAIN

insert	into	S2_DQ.CITD_DQ_DOMAIN
		(
		DQ_NAME
,		DQ_TYPE
,		DQ_FORMAT
,		DQ_LENGTH
,		DQ_PRECISION
,		DQ_CARDINALITY
,		DQ_BU
		)
select	DOMAIN_NAME
,		'V'
,		NATIVE_TYPE
,		T_SIZE
,		T_PRECISION
,		NULL
,		'HR'
from	CITD_D1_DEV.S2_DQ.DQ_UPLOAD_DQ_DOMAIN
where	not EXISTS
		(
		select	1
		from	S2_DQ.CITD_DQ_DOMAIN
		where	upper(DQ_NAME)		= upper(DOMAIN_NAME)
		)
;