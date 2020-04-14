--1) List the following details of each employee: employee number, last name, first name, gender, and salary
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary 
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2) List employees who were hired in 1986
SELECT employees.first_name, employees.last_name
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no AS "Department Number", 
departments.dept_name AS "Department NAME", 
dept_manager.emp_no AS "Manager Employee Number",
dept_manager.to_date AS "Manager End Date",
employees.first_name AS "First Name", 
employees.last_name AS "Last Name"
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees
ON employees.emp_no = dept_manager.emp_no;

--4) List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no AS "Employee Number",
employees.last_name AS "Last Name",
employees.first_name AS "First Name",
departments.dept_name AS "Department Name"
FROM dept_emp
INNER JOIN departments
ON departments.dept_no=dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no;

--5)List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name AS "First Name", 
employees.last_name AS "Last Name",
employees.gender AS "Gender",
employees.hire_date AS "Hire Date",
employees.birth_date AS "Birth Date"
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--6)List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.first_name AS "First Name",
employees.last_name AS  "Last Name",
employees.emp_no AS "Employee Number",
departments.dept_name AS "Department Name"
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';


--7)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.first_name AS "First Name",
employees.last_name AS  "Last Name",
employees.emp_no AS "Employee Number",
departments.dept_name AS "Department Name"
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT employees.last_name,
COUNT(employees.last_name) AS "Frequency"
FROM employees
GROUP BY employees.last_name
ORDER BY
COUNT(employees.last_name) DESC;
 