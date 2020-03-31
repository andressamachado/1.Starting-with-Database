DELETE FROM ParkVegetation_t;
DELETE FROM Vegetation_t;
DELETE FROM Park_t;
DELETE FROM Province_t; 

INSERT INTO Province_T VALUES( 'ON', 'Ontario', 'Toronto' );
-- proper syntax to insure any column order
--INSERT INTO Province_T (Abbreviation, Province, Capital) VALUES( 'ON', 'Ontario', 'Toronto' );
INSERT INTO Province_T VALUES( 'QC', 'Quebec', 'Quebec City' );
INSERT INTO Province_T VALUES( 'NL', 'Newfoundland & Labrador', 'St John"s' );


INSERT INTO Park_T( Abbreviation, ParkID, ParkName ) VALUES( 'ON', 'P01', 'Bruce Peninsula' );
INSERT INTO Park_T( Abbreviation, ParkID, ParkName ) VALUES( 'QC', 'P02', 'Forillon' );
INSERT INTO Park_T( Abbreviation, ParkID, ParkName ) VALUES( 'QC', 'P03', 'Saugnay' );
--UPDATE Park_T SET ParkName = 'Algonquin Provincial Park' WHERE ParkID = 'P03';
--DELETE FROM Park_T WHERE ParkName = 'Algonquin Provincial Park';

INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V01', 'White Spruce' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V02', 'Balsam Fir' );
INSERT INTO Vegetation_T( VegID, VegName ) VALUES( 'V03', 'Black Spruce' );


INSERT INTO ParkVegetation_T ( ParkID, VegID ) VALUES ( 'P01', 'V02' );
INSERT INTO ParkVegetation_T ( ParkID, VegID ) VALUES ( 'P02', 'V02' );
INSERT INTO ParkVegetation_T ( ParkID, VegID ) VALUES ( 'P03', 'V02' );



