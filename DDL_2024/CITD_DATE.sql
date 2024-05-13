CREATE TABLE CITD_DATE 
    (
     date DATE NOT NULL , 
     cal_type VARCHAR (5) NOT NULL , 
     date_num INTEGER NOT NULL , 
     date_yyyy INTEGER NOT NULL , 
     date_yyyy_begin_dow INTEGER NOT NULL , 
     date_yyyy_end_dow INTEGER NOT NULL , 
     date_qq VARCHAR (2) NOT NULL , 
     date_qq_begin DATE NOT NULL , 
     date_qq_end DATE NOT NULL , 
     date_mm INTEGER NOT NULL , 
     date_mm__name INTEGER NOT NULL , 
     date_mm__name_abbr INTEGER NOT NULL , 
     date_mm_begin INTEGER NOT NULL , 
     date_mm_end INTEGER NOT NULL , 
     date_ww INTEGER NOT NULL , 
     date_dow INTEGER NOT NULL , 
     date_dow_name INTEGER NOT NULL , 
     date_day_month_year VARCHAR (2) NOT NULL , 
     date_day_month VARCHAR (2) NOT NULL , 
     active VARCHAR (1) NOT NULL DEFAULT 'Y' , 
     valid_from DATE NOT NULL , 
     valid_to DATE 
    )
;