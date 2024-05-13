/*

		HR_EMP_ETL_Execution.cmd
		
		created:	20240311	Andy Rupp
		updated:
		
		to be executed at "c:\kinaxis_work\Project Development by BU\HR Human Resources\HR_PoC_Employee_20\ETL_2024\"
*/

snowsql -a arupp@kinaxis.com -d CITD_D1_DEV -s S2_HR -r ACCOUNTADMIN -w COMPUTE_WH -h rxptimr-kinaxis.snowflakecomputing.com

!set output_format=csv
!spool HR_EMP_ETL_Execution.csv
-- !output_file=HR_EMP_ETL_Execution.csv

!source CITD_REF_ORG.sql
!source HR_EMP_ETL_EMP_ADDR_PERSONAL.sql
!source HR_EMP_ETL_EMP_Country.sql

!source HR_EMP_ETL_EMP_Event.sql
!source HR_EMP_ETL_EMP_Event_Reason.sql
!source HR_EMP_ETL_EMP_Gender.sql
!source HR_EMP_ETL_EMP_Job_Code.sql
!source HR_EMP_ETL_EMP_Job_Position.sql
!source HR_EMP_ETL_EMP_Status.sql
!source HR_EMP_ETL_EMP_Type.sql
!source HR_EMP_ETL_Employee_Class.sql
!source HR_EMP_ETL_Office_Location.sql

!source HR_EMP_ETL_EMP_Employment.sql
!source HR_EMP_ETL_EMP_Job_2.sql
!source HR_EMP_ETL_Employee.sql
!source HR_EMP_ETL_EMP_Personal.sql
!source HR_EMP_ETL_HR_EMP_ADDR_WORK.sql

!source HR_EMP_ETL_FACTS_HEADCOUNT.sql

!spool off

snowsql 
	-c my_example_connection 
	-d sales_db 
	-s public 
	-q "select * from mytable limit 10" 
	-o output_format=csv 
	-o header=false 
	-o timing=false 
	-o friendly=false  > output_file.csv