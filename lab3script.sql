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










