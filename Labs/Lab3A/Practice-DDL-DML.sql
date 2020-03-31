-- FileName: Practice-DDL-DML.sql
-- Date: 2 Jan 2017

DROP TABLE IF EXISTS Practice;

CREATE TABLE Practice( 
	Part VARCHAR( 20 ),
	Material VARCHAR( 20 )
);

INSERT INTO Practice( Part, Material ) VALUES( 'BOLT', 'BRASS' );
INSERT INTO Practice( Part, Material ) VALUES( 'BOLT', 'STEEL' );
INSERT INTO Practice( Part, Material ) VALUES( 'BOLT', 'ALUMINIUM' );
INSERT INTO Practice( Part, Material ) VALUES( 'NUT', 'BRASS' );
INSERT INTO Practice( Part, Material ) VALUES( 'NUT', 'STEEL' );
INSERT INTO Practice( Part, Material ) VALUES( 'NUT', 'ALUMINIUM' );
INSERT INTO Practice( Part, Material ) VALUES( 'SCREW', 'BRASS' );
INSERT INTO Practice( Part, Material ) VALUES( 'SCREW', 'STEEL' );
INSERT INTO Practice( Part, Material ) VALUES( 'SCREW', 'ALUMINIUM' );
INSERT INTO Practice( Part, Material ) VALUES( 'WASHER', 'BRASS' );
INSERT INTO Practice( Part, Material ) VALUES( 'WASHER', 'STEEL' );
INSERT INTO Practice( Part, Material ) VALUES( 'WASHER', 'ALUMINIUM' );

--eof: Practice-DDL-DML.sql