DROP TABLE Professor
DROP TABLE Project
DROP TABLE Dept
DROP TABLE Graduate
DROP TABLE work_in
DROP TABLE manage 
DROP TABLE supervise
DROP TABLE major
DROP TABLE work_dept
DROP TABLE runs
DROP TABLE advise
DROP TABLE work_proj 

CREATE TABLE Professor( ssn CHAR(11) NOT NULL, 
			name CHAR(30) NOT NULL, 
			age INTEGER NOT NULL, 
			rank INTEGER NOT NULL, 
			specialty CHAR(30) NOT NULL, 
			PRIMARY KEY(ssn)); 

CREATE TABLE Dept ( dno INTEGER NOT NULL, 
		    dname CHAR(30) NOT NULL, 
		    office CHAR(30) NOT NULL, 
		    ssn CHAR(11) NOT NULL, 
		    PRIMARY KEY(dno), 
		    FOREIGN KEY(ssn) REFERENCES Professor(ssn)); 

CREATE TABLE work_dept ( time_pc CHAR(20) NOT NULL, 
			 ssn CHAR(11) NOT NULL, 
			 dno INTEGER NOT NULL, 
			 PRIMARY KEY(ssn, dno), 
			 FOREIGN KEY(ssn) REFERENCES Professor(ssn), 
			 FOREIGN KEY(dno) REFERENCES Dept(dno));  

CREATE TABLE runs ( ssn CHAR(11) NOT NULL, 
		    dno INTEGER NOT NULL, 
		    PRIMARY KEY(ssn, dno), 
		    FOREIGN KEY(ssn) REFERENCES Professor(ssn), 
		    FOREIGN KEY(dno) REFERENCES Dept(dno)); 

CREATE TABLE Project (  pno INTEGER NOT NULL, 
		        sponsor CHAR(30) NOT NULL, 
			start_date CHAR(11) NOT NULL, 
			end_date CHAR(11) NOT NULL, 
			budget INTEGER NOT NULL, 
			ssn CHAR(11) NOT NULL, 
			PRIMARY KEY(pno), 
			FOREIGN KEY(ssn) REFERENCES Professor(ssn)); 

CREATE TABLE work_in(   ssn CHAR(11) NOT NULL, 
			pno INTEGER NOT NULL, 
			PRIMARY KEY(ssn, pno),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn), 
			FOREIGN KEY(pno) REFERENCES Project(pno)); 

CREATE TABLE manage( ssn CHAR(11) NOT NULL,
                        pno INTEGER NOT NULL,
                        PRIMARY KEY(ssn, pno),
                        FOREIGN KEY(ssn) REFERENCES Professor(ssn),
                        FOREIGN KEY(pno) REFERENCES Project(pno));
  		
CREATE TABLE Graduate(SSN CHAR(11) NOT NULL, 
			name CHAR(30) NOT NULL, 
			age INTEGER NOT NULL, 
			deg_pg CHAR(20) NOT NULL, 
			PRIMARY KEY(SSN)); 

CREATE TABLE supervise ( ssn CHAR(11) NOT NULL,
                        pno INTEGER NOT NULL,
			SSN CHAR(11) NOT NULL, 
                        PRIMARY KEY(ssn, pno, SSN),
                        FOREIGN KEY(ssn) REFERENCES Professor(ssn),
                        FOREIGN KEY(pno) REFERENCES Project(pno)
			FOREIGN KEY(SSN) REFERENCES Graduate(SSN));;

CREATE TABLE major (SSN CHAR(11) NOT NULL, 
			dno INTEGER NOT NULL, 
			PRIMARY KEY(SSN, dno), 
			FOREIGN KEY(SSN) REFERENCES Graduate(SSN), 
			FOREIGN KEY(dno) REFERENCES Dept));

CREATE TABLE advise (SSN CHAR(11) NOT NULL, 
			PRIMARY KEY(SSN),
			FOREIGN KEY(SSN) REFERENCES Graduate(SSN));  
