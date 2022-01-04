--Data Analysis
--1.List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employees as emp left join salaries as sal
on(emp.emp_no = sal.emp_no)

--2.List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_Date
from employees 
where hire_date between '1986-01-01' and '1986-12-31'

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
select dept.dept_no, dept.dept_name, emp.last_name, emp.first_name, man.emp_no
from dept_manager as man left join department as dept 
	on(man.dept_no = dept.dept_no)
	inner join employees as emp
	on(man.emp_no = emp.emp_no)
--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp.emp_no,emp.last_name,emp.first_name,emp.dept_name
from employees as emp join dept_emp as dept_emp
	on(emp.emp_no = dept_emp.emp_no )
	join department as dept
	on(dept_emp.dept_no= dept.dept_no)
	
--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name ='Hercules'
and last_name like 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_no,emp.first_name,emp.last_name,dept.dept_name
from employees as emp join dept_emp
on(emp.emp_no=dept_emp.emp_no)
join department as dept
on(dept_emp.dep_no=dept.dept_no)
where dept_name='Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp join dept_emp
on(emp.emp_no=dept_emp.emp_no)
join department as dept
on(dept_emp.dep_no=dept.dept_no)
--where dept_name='Sales' or dept_name='Development';
where dept_name IN ('Sales', 'Development');


--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "Frequency count"
from employees
group by last_name
order by "last_name" DESC;
	

