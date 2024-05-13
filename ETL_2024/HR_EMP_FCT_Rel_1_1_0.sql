/*
		HR_EMP_FCT.sql
		
		created:	20220427
		updated:	20220427	renamed to EMPLOYEE_MASTER_VIEW
					20220504	implemented latest changes from Integration Layer
								field no longer provided | only used in WHERE condition
					20220519	changed 'AND' to 'WHERE' condition
								for column 'EDW_EFFECTIVE_END_DTM'
					20220610	applied naming conventions
					20220614	eleminated JOB_DESC column
					20220621	Rel_1_1_0 added YYYY, QQ, MM columns
					20220714	Rel_1_1_0
								added GENDER
								added Employment Length
								added EDW Refresh timespamp
								reformat: TIMEZONE to TO_DATE(YYYY-MM-DD)
					20220719	name fixes
								Employment Length formulae changed
*/

					 		
drop view 			HR_EMP_FCT_OLD	 	--	drop
					 		
alter view 			HR_EMP_FCT	 rename to 	 	HR_EMP_FCT_OLD
					 		
create view 	 		HR_EMP_FCT		 	--	part.1
	 		(		 	--	opening
	 		"Business Unit"		 	--	Business Unit
,	 		"City"		 	--	City
,	 		"Company"		 	--	Company
,	 		"Company No"		 	--	Company No
,	 		"Cost Center"		 	--	Cost Center
,	 		"Country"		 	--	Country
,	 		"Department"		 	--	Department
,	 		"Division"		 	--	Division
,	 		"E-Mail"		 	--	E-Mail
,	 		"Employee Class"		 	--	Employee Class
,	 		"Employee ID"		 	--	Employee ID
,	 		"Employee Status"		 	--	Employee Status
,	 		"Employee Type"		 	--	Employee Type
,	 		"Employment Length in Years"		 	--	Employment Length in Years
,	 		"Employment Length in Months"		 	--	Employment Length in Months
,	 		"Employment Length in Days"		 	--	Employment Length in Days
,	 		"End Date"		 	--	End Date
,	 		"End Date YYYY"		 	--	End Date YYYY
,	 		"End Date QQ"		 	--	End Date QQ
,	 		"End Date MM"		 	--	End Date MM
,	 		"Event"		 	--	Event
,	 		"Event Reason"		 	--	Event Reason
,	 		"First Name"		 	--	First Name
,	 		"FTE"		 	--	FTE
,	 		"Gender"		 	--	Gender
,	 		"Hire Date"		 	--	Hire Date
,	 		"Hire Date YYYY"		 	--	Hire Date YYYY
,	 		"Hire Date QQ"		 	--	Hire Date QQ
,	 		"Hire Date MM"		 	--	Hire Date MM
,	 		"is FTE"		 	--	is FTE
,	 		"Job Code"		 	--	Job Code
,	 		"Entry Date"		 	--	Entry Date
,	 		"Entry Date YYYY"		 	--	Entry Date YYYY
,	 		"Entry Date QQ"		 	--	Entry Date QQ
,	 		"Entry Date MM"		 	--	Entry Date MM
,	 		"Last Name"		 	--	Last Name
,	 		"EDW Refresh"		 	--	EDW Refresh
,	 		"Location"		 	--	Location
,	 		"Location No"		 	--	Location No
,	 		"Manager ID"		 	--	Manager ID
,	 		"Manager"		 	--	Manager
,	 		"Hire Date Original"		 	--	Hire Date Original
,	 		"Hire Date Original YYYY"		 	--	Hire Date Original YYYY
,	 		"Hire Date Original QQ"		 	--	Hire Date Original QQ
,	 		"Hire Date Original MM"		 	--	Hire Date Original MM
,	 		"Pay Grade"		 	--	Pay Grade
,	 		"Position"		 	--	Position
,	 		"Standard Hours"		 	--	Standard Hours
,	 		"Start Date"		 	--	Start Date
,	 		"Start Date YYYY"		 	--	Start Date YYYY
,	 		"Start Date QQ"		 	--	Start Date QQ
,	 		"Start Date MM"		 	--	Start Date MM
,	 		"Title"		 	--	Title
,	 		"User ID"		 	--	User ID
,	 		"User Name"		 	--	User Name
	 		)		 	--	closing
as						--	start select
select		EMP.BUSINESS_UNIT		 	-- 	Business Unit
,			LOC.CITY		 	-- 	City
,			EMP.COMPANY		 	-- 	Company
,			EMP.COMPANY_CD		 	-- 	Company No
,			EMP.COST_CENTER		 	-- 	Cost Center
,			LOC.COUNTRY		 	-- 	Country
,			EMP.DEPARTMENT		 	-- 	Department
,			EMP.DIVISION_NAME		 	-- 	Division
,			EMP.EMAIL_ADDRESS		 	-- 	E-Mail
,			EMP.EMPLOYEE_CLASS		 	-- 	Employee Class
,			EMP.EMPLOYEE_ID		 	-- 	Employee ID
,			EMP.EMPLOYEE_STATUS		 	-- 	Employee Status
,			EMP.EMPLOYMENT_TYPE		 	-- 	Employee Type
,			case	EMP.EMPLOYEE_STATUS
			when	'Active'
		    then    trunc(trunc(months_between (CURRENT_DATE(), to_date(EMP.HIRE_DT)))/12)
			when	'Terminated'
		    then    trunc(trunc(months_between (EMP.START_DT, to_date(EMP.HIRE_DT)))/12)
            else
                    0
            end
,			case	EMP.EMPLOYEE_STATUS
			when	'Active'
    		then    mod(trunc(months_between(CURRENT_DATE(), to_date(EMP.HIRE_DT))), 12)
			when	'Terminated'
			then    mod(trunc(months_between(EMP.START_DT, to_date(EMP.HIRE_DT))), 12)
            else
                    0
            end
,			case	EMP.EMPLOYEE_STATUS
			when	'Active'
			then    CURRENT_DATE() - add_months(to_date(EMP.HIRE_DT), trunc(months_between(CURRENT_DATE(), to_date(EMP.HIRE_DT))))
            when	'Terminated'
			then    to_date(EMP.START_DT) - add_months(to_date(EMP.HIRE_DT), trunc(months_between(to_date(EMP.START_DT), to_date(EMP.HIRE_DT))))
            else
                    0
            end 
,			TO_DATE(END_DT)		 	-- 	End Date
,			YEAR(EMP.END_DT)		 	-- 	End Date YYYY
,			'Q' || QUARTER(EMP.END_DT)		 	-- 	End Date QQ
,			MONTH(EMP.END_DT)		 	-- 	End Date MM
,			EMP.EVENT		 	-- 	Event
,			EMP.EVENT_REASON		 	-- 	Event Reason
,			EMP.FIRST_NAME		 	-- 	First Name
,			EMP.FTE		 	-- 	FTE
,			NVL(PRS.GENDER,'NA')		 	-- 	Gender
,			TO_DATE(HIRE_DT)		 	-- 	Hire Date
,			YEAR(EMP.HIRE_DT)		 	-- 	Hire Date YYYY
,			'Q' || QUARTER(EMP.HIRE_DT)		 	-- 	Hire Date QQ
,			MONTH(EMP.HIRE_DT)		 	-- 	Hire Date MM
,			EMP.IS_FTE_FLG		 	-- 	is FTE
,			EMP.JOB_CODE		 	-- 	Job Code
,			TO_DATE(JOB_ENTRY_DT)		 	-- 	Entry Date
,			YEAR(EMP.JOB_ENTRY_DT)		 	-- 	Entry Date YYYY
,			'Q' || QUARTER(EMP.JOB_ENTRY_DT)		 	-- 	Entry Date QQ
,			MONTH(EMP.JOB_ENTRY_DT)		 	-- 	Entry Date MM
,			EMP.LAST_NAME		 	-- 	Last Name
,			EMP.LAST_REFRESH_DTM		 	-- 	EDW Refresh
,			EMP.LOCATION		 	-- 	Location
,			EMP.LOCATION_CD		 	-- 	Location No
,			EMP.MANAGER_ID		 	-- 	Manager ID
,			EMP.MANAGER_NAME		 	-- 	Manager
,			TO_DATE(ORIG_HIRE_DT)		 	-- 	Hire Date Original
,			YEAR(EMP.ORIG_HIRE_DT)		 	-- 	Hire Date Original YYYY
,			'Q' || QUARTER(EMP.ORIG_HIRE_DT)		 	-- 	Hire Date Original QQ
,			MONTH(EMP.ORIG_HIRE_DT)		 	-- 	Hire Date Original MM
,			EMP.PAY_GRADE		 	-- 	Pay Grade
,			EMP.POSITION		 	-- 	Position
,			EMP.STANDARD_HRS		 	-- 	Standard Hours
,			TO_DATE(EMP.START_DT)		 	-- 	Start Date
,			YEAR(EMP.START_DT)		 	-- 	Start Date YYYY
,			'Q' || QUARTER(EMP.START_DT)		 	-- 	Start Date QQ
,			MONTH(EMP.START_DT)		 	-- 	Start Date MM
,			EMP.TITLE		 	-- 	Title
,			EMP.USER_ID		 	-- 	User ID
,			EMP.USER_NAME		 	-- 	User Name
from	EDW_INT_TB.EMPLOYEE_JOB								EMP		--	from
		left outer join	EDW_SEM_MRT_VW.LOCATON_MAPPING		LOC
		ON	(
			EMP.LOCATION 			= LOC.LOCATION
			)	
		OR	(
			EMP.LOCATION_CD			= LOC.LOCATION
		AND	EMP.LOCATION			IS NULL
			)
		left outer join EDW_INT_TB.EMPLOYEE_PERSONAL		PRS
        on  EMP.EMPLOYEE_ID				= PRS.EMPLOYEE_ID
        and upper(PRS.ADDRESS_TYPE)     = 'HOME'
WHERE	EMP.EDW_EFFECTIVE_END_DTM	= '9999-12-31 00:00:00.000'		--(to pick only valid effective records)"						--	Join
