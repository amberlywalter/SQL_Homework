--Data Engineering 

CREATE TABLE Departments (
    dept_no VARCHAR(5)   NOT NULL,
    dept_name VARCHAR(100)   NOT NULL,
    PRIMARY KEY (dept_no)
);

SELECT *
FROM Departments
;


CREATE TABLE Titles (
    title_id VARCHAR(10)   NOT NULL,
    title VARCHAR(100)   NOT NULL,
    PRIMARY KEY (title_id)
);

SELECT *
FROM Titles
;

CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR(100)   NOT NULL,
    birth_date date NOT NULL,
	first_name VARCHAR(100)   NOT NULL,
    last_name VARCHAR(100)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

SELECT *
FROM Employees
;


CREATE TABLE Salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

SELECT *
FROM Salaries
;

CREATE TABLE Dept_manager (
    dept_no VARCHAR(5)   NOT NULL,
	emp_no INTEGER   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
	
);

SELECT *
FROM Dept_manager
;


CREATE TABLE Dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(5)   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

SELECT *
FROM Dept_emp
;


