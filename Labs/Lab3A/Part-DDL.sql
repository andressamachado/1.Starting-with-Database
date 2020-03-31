-- FileName: Part-DDL.sql

DROP TABLE IF EXISTS Part_T;

CREATE TABLE Part_T( 
   Part VARCHAR( 20 ),
   Material VARCHAR( 20 ),
   Size VARCHAR( 10 ),
   Cost NUMERIC( 9,2 )
);

-- eof: Part-DDL.sql

