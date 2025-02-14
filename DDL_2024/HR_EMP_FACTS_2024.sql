-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2024-03-20 15:29:45 ADT
--   site:      SQL Server 2012
--   type:      SQL Server 2012



CREATE or REPLACE TABLE CITD_DATE 
    (
     date DATE NOT NULL , 
     cal_type VARCHAR (5) NOT NULL , 
     date_num INTEGER NOT NULL , 
     date_yyyy INTEGER NOT NULL , 
     date_yyyy_begin_dow INTEGER NOT NULL , 
     date_yyyy_end_dow INTEGER NOT NULL , 
     date_qq VARCHAR (2) NOT NULL , 
     date_qq_begin INTEGER NOT NULL , 
     date_qq_end INTEGER NOT NULL , 
     date_mm INTEGER NOT NULL , 
     date_mm__name VARCHAR (20) NOT NULL , 
     date_mm__name_abbr VARCHAR (5) NOT NULL , 
     date_mm_begin INTEGER NOT NULL , 
     date_mm_end INTEGER NOT NULL , 
     date_ww INTEGER NOT NULL , 
     date_dow INTEGER NOT NULL , 
     date_dow_name VARCHAR (20) NOT NULL , 
     date_day_month_year DATE NOT NULL , 
     date_day_month INTEGER NOT NULL , 
     active VARCHAR (1) NOT NULL  , 
     valid_from DATE NOT NULL , 
     valid_to DATE 
    )
;

CREATE or REPLACE TABLE HR_FCT_HEADCOUNT 
    (
     COUNTRY_ISO3166_2_CHAR3 VARCHAR (3) , 
     CMPY_CD VARCHAR (10) , 
     BU_CMPY_CD VARCHAR (10) , 
     BU_CD VARCHAR (10) , 
     DEPT_BU_CD VARCHAR (10) , 
     DEPT_CD VARCHAR (10) , 
     employee_id VARCHAR (20) NOT NULL , 
     EMP_STATUS VARCHAR (20) NOT NULL , 
     EVENT_CD VARCHAR (80) , 
     EVENT_REASON_CD VARCHAR (80) , 
     EMP_TYPE_CD VARCHAR (20) NOT NULL , 
     EMP_CLASS_CD VARCHAR (20) NOT NULL , 
     JOB_CODE VARCHAR (20) NOT NULL , 
     JOB_CODE_TITLE VARCHAR (120) , 
     JOB_GRADE VARCHAR (20) NOT NULL , 
     JOB_LEVEL VARCHAR (20) , 
     DATE_STARTED DATE , 
     DATE_ENDED DATE , 
     ACTIVE VARCHAR (1) NOT NULL  , 
     DURATION_IN_MONTHS INTEGER NOT NULL , 
     VOLUME_HC INTEGER NOT NULL 
    )
;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE or REPLACE TABLE                             2
-- CREATE INDEX                             0
-- ALTER TABLE                              0
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
