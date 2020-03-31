--- observe the order of drops and creates
--- observe the concept of "if exists"
DROP TABLE IF EXISTS ParkVegetation_T;
DROP TABLE IF EXISTS Vegetation_T;
DROP TABLE IF EXISTS Park_T;
DROP TABLE IF EXISTS Province_T;

CREATE TABLE Province_T( 
	Abbreviation	CHAR( 2 ) NOT NULL,
	Province 		CHAR( 35 ),
    Capital			CHAR( 30 ),
   -- think about the use of naming a constraint - benefit of this syntax
	CONSTRAINT Abbreviation_PK PRIMARY KEY( Abbreviation )
	);

CREATE TABLE Park_T(
	ParkID 			CHAR( 4 ) NOT NULL, 
	Abbreviation 	CHAR( 2 ) NOT NULL,
	ParkName 			varchar( 45 ),
	CONSTRAINT Park_PK PRIMARY KEY( ParkID ),
	--- observe references and column names being same or different
    CONSTRAINT Abbrev_FK  FOREIGN KEY( Abbreviation ) REFERENCES Province_T( Abbreviation )
);

CREATE TABLE Vegetation_T(
	VegID 			CHAR( 4 ) NOT NULL,
	VegName 		varchar( 45 ),
	CONSTRAINT Vegetation_PK PRIMARY KEY( VegID )
);

CREATE TABLE ParkVegetation_T(
	VegID			CHAR( 4 ) NOT NULL,
	ParkID			CHAR( 4 ) NOT NULL,
	CONSTRAINT VegID_FK  FOREIGN KEY( VegID ) REFERENCES Vegetation_T( VegID ),
	CONSTRAINT ParkID_FK  FOREIGN KEY( ParkID ) REFERENCES Park_T( ParkID ),
	--- observe composite primary key
	CONSTRAINT ParkVegetation_PK PRIMARY KEY( ParkID, VegID )
);

