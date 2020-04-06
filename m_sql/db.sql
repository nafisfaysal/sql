
-- Display the employee last name, job ID, and start date of employees hired between February 20, 1998, and May 1, 1998. Order the query in ascending order by start date.        
SELECT last_name, job_id, hire_date FROM employees WHERE hire_date BETWEEN ’20 - Feb - 1998’ AND ’01 - May - 1998’ ORDER BY hire_date;

-- Display the last name and department number of all employees in departments 20 and 50 in alphabetical order by name.
SELECT last_name, department_id FROM employees WHERE department_id IN (20, 50) ORDER BY last_name;

-- Display the last name and hire date of every employee who was hired in 1994.
SELECT last_name, hire_date FROM employees WHERE hire_date LIKE ’%94’;

-- Display the last name, salary, and commission for all employees who earn commissions. Sort data in descending order of salary and commissions_Title.
SELECT last_name, salary, commission_Title FROM employees WHERE commission_Title IS NOT NULL ORDER BY salary DESC, commission_Title DESC;


-- Display the last name of all employees who have an a and an e in their last name.
SELECT last_name FROM employees WHERE last_name LIKE ’%a%’ AND last_name LIKE ’%e%’;


-- Answers the questions using Employee, Locations and Department Table Data.

-- Write a query to display the last name, department number, and department name for all employees.
SELECT e.last_name, e.department_id, d.department_name FROM employees e, departments d WHERE e.department_id = d.department_id;

-- Write a query to display the employee last name, department name, location ID, and city of all employees who earn a commission.
SELECT e.last_name, d.department_name, d.location_id, l.city FROM employees e, departments d, locations l WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND e.commission_title IS NOT NULL;

-- Answers the questions using Employee, Locations and Department Table Data.

-- Write a query to display the last name, job, department number, and department name for all employees who work in Toronto.
SELECT e.last_name, e.job_id, e.department_id, d.department_name FROM employees e JOIN departments d ON (e.department_id = d.department_id) JOIN locations l ON (d.location_id = l.location_id) WHERE LOWER(l.city) = ’toronto’;

-- Display the last name, salary, and commission for all employees who earn commissions. Sort data in descending order of salary and commissions.Title.
SELECT last_name, salary, commission_title FROM employees WHERE commission_title IS NOT NULL ORDER BY salary DESC, commission_title DESC;


-- Display the employee last name and employee number along with their manager’s last name and manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
SELECT e.last_name "Employee", e.employee_id "EMP#", m.last_name "Manager", m.employee_id "Mgr#" FROM employees e join employees m ON (e.manager_id = m.employee_id);

-- Answers the questions using Employee and Department Table Data.

-- display the minimum, maximum, sum, and average salary for each job type
SELECT job_id, ROUND(MAX(salary), 0) "Maximum", ROUND(MIN(salary), 0) "Minimum", ROUND(SUM(salary), 0) "Sum", ROUND(AVG(salary), 0) "Average" FROM employees GROUP BY job_id;

-- Write a query to display the number of people with the same job.
SELECT job_id, COUNT(*) FROM employees GROUP BY job_id;

-- Display the manager number and the salary of the lowest paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.
SELECT manager_id, MIN(salary) FROM employees WHERE manager_id IS NOT NULL GROUP BY manager_id HAVING MIN(salary) > 6000 ORDER BY MIN(salary) DESC;

-- Write a query to display each department’s name, location, number of employees, and the average salary for all employees in that department. Label the columns Name, Location, Number of People, and Salary, respectively. Round the average salary to two decimal places.
SELECT d.department_name "Name", d.location_id "Location", COUNT(*) "Number of People", ROUND(AVG(salary), 2) "Salary" FROM employees e, departments d WHERE e.department_id = d.department_id GROUP BY d.department_name, d.location_id;


-- Answers the questions using Employee and Department Table Data.

-- Write a query to display the last name and hire date of any employee in the same department as Zlotkey. Exclude Zlotkey.
SELECT last_name, hire_date FROM employees WHERE department_id = (SELECT department_id FROM employees WHERE last_name = ’Zlotkey’) AND last_name <> ’Zlotkey’;


-- Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary.
SELECT employee_id, last_name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees) ORDER BY salary;

-- Display the last name and salary of every employee who reports to King.
SELECT last_name, salary FROM employees WHERE manager_id = (SELECT employee_id FROM employees WHERE last_name = ’King’);

-- Write a query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a u in their name.
SELECT employee_id, last_name, salary FROM employees WHERE department_id IN (SELECT department_id FROM employees WHERE last_name like ’ % u % ’) AND salary > (SELECT AVG(salary) FROM employees);
