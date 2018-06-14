--615 Average Salary: Departments VS Company
--Given two tables as below, write a query to display the comparison result (higher/lower/same) of the average salary of employees in a department to the company's average salary.
--Table: salary
| id | employee_id | amount | pay_date   |
|----|-------------|--------|------------|
| 1  | 1           | 9000   | 2017-03-31 |
| 2  | 2           | 6000   | 2017-03-31 |
| 3  | 3           | 10000  | 2017-03-31 |
| 4  | 1           | 7000   | 2017-02-28 |
| 5  | 2           | 6000   | 2017-02-28 |
| 6  | 3           | 8000   | 2017-02-28 |
--The employee_id column refers to the employee_id in the following table employee.
| employee_id | department_id |
|-------------|---------------|
| 1           | 1             |
| 2           | 2             |
| 3           | 2             |
--So for the sample data above, the result is:
| pay_month | department_id | comparison  |
|-----------|---------------|-------------|
| 2017-03   | 1             | higher      |
| 2017-03   | 2             | lower       |
| 2017-02   | 1             | same        |
| 2017-02   | 2             | same        |
	

SELECT depart_salary.pay_month, department_id, 
       CASE WHEN depart_avg > comp_avg THEN 'higher'
            WHEN depart_avg < comp_avg THEN 'lower'
            ELSE 'same' END AS comparison
FROM (
      SELECT department_id, AVG(amount) AS depart_avg, DATE_FORMAT(pay_date, '%Y-%m') AS pay_month
      FROM salary 
      JOIN employee 
      ON salary.employee_id = employee,employee_id
      GROUP BY department_id, pay_month
      ) AS depart_salary
  JOIN
      (
       SELECT AVG(amount) as comp_avg, DATE_FORMAT(pay_date, '%Y-%m') AS pay_month 
       FROM salary
       GROUP BY ATE_FORMAT(pay_date, '%Y-%m')
      ) AS comp_salary
  ON depart_salary.pay_month = comp_salary.pay_month
;
