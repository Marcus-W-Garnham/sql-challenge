SELECT * FROM "Departments";
SELECT * FROM "Dept_emp";
SELECT * FROM "Dept_manager";
SELECT * FROM "Employees";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT E.emp_no, E.first_name, E.Last_name, E.sex, S.salary
FROM "Employees" as E
INNER JOIN "Salaries" as S ON
S.emp_no=E.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT E.first_name, E.last_name, E.hire_date
FROM "Employees" as E
where hire_date between '1/1/1986'and '12/31/1986'

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT DM.emp_no, DM.dept_no, D.dept_name, E.first_name, E.Last_name
FROM "Dept_manager" as DM
JOIN "Departments" as D ON
DM.dept_no=D.dept_no
JOIN "Employees" as E
ON DM.emp_no = E.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM "Employees" as E
JOIN "Dept_emp" as DE
ON DE.emp_no = E.emp_no
JOIN "Departments" as D
ON D.dept_no = DE.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is
-- "Hercules" and last names begin with "B."

SELECT E.first_name, E.last_name, E.sex
FROM "Employees" as E
where first_name = 'Hercules'
and last_name like 'B%';

-- 6. List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM "Employees" as E
JOIN "Dept_emp" as DE
ON DE.emp_no = E.emp_no
JOIN "Departments" as D
ON D.dept_no = DE.dept_no
where D.dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM "Employees" as E
JOIN "Dept_emp" as DE
ON DE.emp_no = E.emp_no
JOIN "Departments" as D
ON D.dept_no = DE.dept_no
where D.dept_name = 'Development' 
or D.dept_name = 'Sales';


-- 8. List the frequency count of employee last names 
-- (i.e., how many employees share each last name) in descending order.
