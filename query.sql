-- List of employees: employee number, last name, first name, gender, and salary.
select 
   e.emp_no, 
   e.last_name, 
   e.first_name, 
   e.gender, 
   s.salary
from employees e
left join salaries s 
on e.emp_no = s.emp_no
order by e.emp_no; 

-- List employees who were hired in 1986.
select emp_no, first_name, last_name 
from employees
where extract(year from hire_date) = 1986;

-- List the manager of each department: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select 
   dm.dept_no, 
   d.dept_name, 
   dm.emp_no, 
   e.last_name, 
   e.first_name, 
   dm.from_date, 
   dm.to_date
from dept_manager dm
left join departments d
on dm.dept_no = d.dept_no
left join employees e
on dm.emp_no = e.emp_no;

-- List the department of each employee: employee number, last name, first name, and department name.
select 
   e.emp_no, 
   e.last_name, 
   e.first_name, 
   d.dept_name
from employees e
inner join dept_emp de
on e.emp_no = de.emp_no
inner join departments d
on de.dept_no = d.dept_no
order by e.emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name = 'Hercules' 
and last_name like 'B%';

-- List all employees in the Sales department: employee number, last name, first name, and department name.
select 
   e.emp_no, 
   e.last_name, 
   e.first_name, 
   d.dept_name
from employees e
inner join dept_emp de
on e.emp_no = de.emp_no
inner join departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
order by e.emp_no;

-- List all employees in the Sales and Development departments: employee number, last name, first name, and department name.
select 
   e.emp_no, 
   e.last_name, 
   e.first_name, 
   d.dept_name
from employees e
inner join dept_emp de
on e.emp_no = de.emp_no
inner join departments d
on de.dept_no = d.dept_no
where d.dept_name in ('Sales', 'Development')
order by e.emp_no;

-- In descending order, list how many employees share each last name.
select 
   last_name, 
   count(last_name)
from employees
group by last_name
order by count(last_name) desc;