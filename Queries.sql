-----Data Analysis

--List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM Employees
INNER join Salaries
ON Employees.emp_no = Salaries.salary
;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM Departments
INNER JOIN Dept_manager
ON Departments.dept_no = Dept_manager.dept_no
INNER JOIN Employees
ON Dept_manager.emp_no = employees.emp_no
;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT Dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM Employees
INNER JOIN Dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN Departments
ON Dept_emp.dept_no = Departments.dept_no
;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM Employees
WHERE first_name = 'Hercules'
AND last_name like 'B%'
;

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employees.emp_no, employees.last_name, employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_emp
ON Employees.emp_no = Dept_emp.emp_no
INNER JOIN Departments
ON Dept_emp.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales'
;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_emp
ON Employees.emp_no = Dept_emp.emp_no
INNER JOIN Departments
ON Dept_emp.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales'
OR Departments.dept_name = 'Development'
;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name,
COUNT (last_name)
FROM Employees
GROUP BY last_name
ORDER BY count(last_name) DESC
;