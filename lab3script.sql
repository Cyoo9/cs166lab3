-- part 1 drop tables -- 

DROP TABLE Professor CASCADE;
DROP TABLE Dept CASCADE;
DROP TABLE work_dept CASCADE;
DROP TABLE Project CASCADE;
DROP TABLE work_in CASCADE;
DROP TABLE Graduate CASCADE;
DROP TABLE work_proj CASCADE;
DROP TABLE advise CASCADE;

-- part 2 drop tables -- 

/* DROP TABLE Place CASCADE;
DROP TABLE Telephone CASCADE; 
DROP TABLE Musicians CASCADE;
DROP TABLE Lives CASCADE;
DROP TABLE Instrument CASCADE;
DROP TABLE Plays CASCADE; 
DROP TABLE Album CASCADE;
DROP TABLE Songs CASCADE; 
DROP TABLE Perform CASCADE; */ 

-- part 1 code -- 
CREATE TABLE Professor( ssn CHAR(11) NOT NULL, 
			name CHAR(30) NOT NULL, 
			age INTEGER NOT NULL, 
			rank INTEGER NOT NULL, 
			specialty CHAR(30) NOT NULL, 
			PRIMARY KEY(ssn));  

CREATE TABLE Dept ( dno INTEGER, 
		    dname CHAR(30), 
		    office CHAR(30), 
		    ssn CHAR(11) NOT NULL, 
		    PRIMARY KEY(dno), 
		    FOREIGN KEY(ssn) REFERENCES Professor(ssn)
	            ); 

CREATE TABLE work_dept ( time_pc CHAR(20) NOT NULL, 
			 ssn CHAR(11) NOT NULL, 
			 dno INTEGER NOT NULL, 
			 PRIMARY KEY(ssn, dno), 
			 FOREIGN KEY(ssn) REFERENCES Professor(ssn), 
			 FOREIGN KEY(dno) REFERENCES Dept(dno));  
 

CREATE TABLE Project (  pno INTEGER, 
		        sponsor CHAR(30), 
			start_date CHAR(11), 
			end_date CHAR(11), 
			budget INTEGER,
			ssn CHAR(11) NOT NULL, 
			PRIMARY KEY(pno), 
			FOREIGN KEY(ssn) REFERENCES Professor(ssn)); 

CREATE TABLE work_in(   ssn CHAR(11) NOT NULL, 
			pno INTEGER NOT NULL, 
			PRIMARY KEY(ssn, pno),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn), 
			FOREIGN KEY(pno) REFERENCES Project(pno)); 

  		
CREATE TABLE Graduate(  ssn_grad CHAR(11), 
			ssn CHAR(11) NOT NULL, 
			dno INTEGER NOT NULL,
			name CHAR(30), 
			age INTEGER, 
			deg_pg CHAR(20), 
			PRIMARY KEY(ssn_grad), 
			FOREIGN KEY (dno) REFERENCES Dept(dno),
 			FOREIGN KEY (ssn) REFERENCES Professor(ssn)
			); 

CREATE TABLE work_proj ( pno INTEGER NOT NULL, 
		 	 ssn_grad CHAR(11) NOT NULL, 
			 PRIMARY KEY(pno, ssn_grad), 
			 FOREIGN KEY(pno) REFERENCES Project(pno), 
			 FOREIGN KEY(ssn_grad) REFERENCES Graduate(ssn_grad));

CREATE TABLE advise (ssn_grad CHAR(11) NOT NULL, 
			PRIMARY KEY(ssn_grad),
			FOREIGN KEY(ssn_grad) REFERENCES Graduate(ssn_grad));  

-- part 2 code -- 

DROP TABLE Place CASCADE; 
DROP TABLE Musicians CASCADE;
DROP TABLE Lives CASCADE;
DROP TABLE Instrument CASCADE;
DROP TABLE Plays CASCADE;
DROP TABLE Album CASCADE;
DROP TABLE Songs CASCADE;
DROP TABLE Perform CASCADE;


CREATE TABLE Place (phone_no CHAR(11), 
			address CHAR(30) NOT NULL,
			PRIMARY KEY(address));   

CREATE TABLE Musicians(name CHAR(30) NOT NULL, 
			ssn CHAR(11) NOT NULL, 
			PRIMARY KEY (ssn)); 

CREATE TABLE Lives (address CHAR(30) NOT NULL, 
			ssn CHAR(11) NOT NULL, 
			PRIMARY KEY(address, ssn), 
			FOREIGN KEY(address) REFERENCES Place(address), 
			FOREIGN KEY(ssn) REFERENCES Musicians(ssn)); 

CREATE TABLE Instrument ( instrId CHAR(11) NOT NULL, 
			key CHAR(11), 
			dname CHAR(30), 
			PRIMARY KEY(instrId)); 

CREATE TABLE Plays (ssn CHAR(11) NOT NULL, 
			instrId CHAR(11) NOT NULL, 
			PRIMARY KEY (ssn, instrId), 
			FOREIGN KEY (ssn) REFERENCES Musicians(ssn), 
			FOREIGN KEY (instrId) REFERENCES Instrument(instrId));  

CREATE TABLE Album (albumIdentifier CHAR(11), 
			speed INTEGER, 
			copyrightDate CHAR(11), 
			title CHAR(30), 
			ssn CHAR(11) NOT NULL,
			PRIMARY KEY (albumIdentifier), 
			FOREIGN KEY(ssn) REFERENCES Musicians(ssn)); 

CREATE TABLE Songs (songId CHAR(11), 
			song_title CHAR(30), 
			author CHAR(30), 
			albumIdentifier CHAR(11) NOT NULL, 
			PRIMARY KEY (songId), 
			FOREIGN KEY (albumIdentifier) REFERENCES Album(albumIdentifier)); 

CREATE TABLE Perform ( ssn CHAR(11) NOT NULL, 
			songId CHAR(11) NOT NULL, 
			PRIMARY KEY (ssn, songId), 
			FOREIGN KEY (ssn) REFERENCES Musicians(ssn), 
			FOREIGN KEY (songId) REFERENCES Songs (songId)); 

			







