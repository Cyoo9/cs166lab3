DROP TABLE Professor CASCADE;
DROP TABLE Dept CASCADE;
DROP TABLE work_dept CASCADE;
DROP TABLE Project CASCADE;
DROP TABLE work_in CASCADE;
DROP TABLE Graduate CASCADE;
DROP TABLE work_proj CASCADE;
DROP TABLE advise CASCADE;

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

  		
CREATE TABLE Graduate(SSN CHAR(11), 
			dno INTEGER NOT NULL,
			name CHAR(30), 
			age INTEGER, 
			deg_pg CHAR(20), 
			PRIMARY KEY(SSN), 
			FOREIGN KEY (dno) REFERENCES Dept(dno) 
			); 

CREATE TABLE work_proj ( pno INTEGER NOT NULL, 
		 	 SSN CHAR(11) NOT NULL, 
			 PRIMARY KEY(pno, SSN), 
			 FOREIGN KEY(pno) REFERENCES Project(pno), 
			 FOREIGN KEY(SSN) REFERENCES Graduate(SSN));

CREATE TABLE advise (SSN CHAR(11) NOT NULL, 
			PRIMARY KEY(SSN),
			FOREIGN KEY(SSN) REFERENCES Graduate(SSN));  


