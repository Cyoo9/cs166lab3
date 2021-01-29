DROP TABLE Professor, Project, Dept, Graduate, work_in, manage, 
		supervise, major, work_dept, runs, advise, work_proj 

CREATE TABLE Professor( ssn CHAR(11) NOT NULL, 
			name CHAR(30) NOT NULL, 
			age INTEGER NOT NULL, 
			rank INTEGER NOT NULL, 
			specialty CHAR(30) NOT NULL, 
			PRIMARY KEY(ssn)); 




