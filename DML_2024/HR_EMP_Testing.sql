
select	*
from	S2_HR.HR_EMP
where	EMPLOYEE_ID	= '13840'
;

select	*
from	S2_HR.HR_EMP_EMPLOYMENT
where	EMPLOYEE_ID	= '13840'
;
select	*
from	S1_LND.SAPSF_EMP_EMPLOYMENT
where	"assignmentIdExternal"	= '13840'
;

select	*
from	S2_HR.HR_EMP_JOB
where	EMPLOYEE_ID	= '13840'
order   by
        DT_CRE_AT desc
;
select	"company"
,       "countryOfCompany"
,       "department"
,       "division"
,       "userId"
,       "customString16"
,       "customString2"
,       "companyEntryDate"
,       "contractEndDate"
from	S1_LND.SAPSF_EMP_JOB
where	"department" is not null
and     "endDate"   <> '9999-12-31T00:00:00Z'
and     "userId"	= '13840'
order   by
        "company"
,       "countryOfCompany"
,       "department"
,       "division"
,       "userId"
,       "customString16"
,       "customString2"
,       "companyEntryDate"
,       "contractEndDate"
;