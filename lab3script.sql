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


