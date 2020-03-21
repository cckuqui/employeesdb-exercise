-- Create Tables from EDR
CREATE TABLE "employees" (
    "emp_no" int NOT NULL,
    "birth_date" date NOT NULL,
    "first_name" varchar NOT NULL,
    "last_name" varchar NOT NULL,
    "gender" varchar NOT NULL,
    "hire_date" date NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "deparments" (
    "dept_no" varchar NOT NULL,
    "dept_name" varchar NOT NULL,
    CONSTRAINT "pk_deparments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar NOT NULL,
    "emp_no" int NOT NULL,
    "from_date" date NOT NULL,
    "to_date" date NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" varchar NOT NULL,
    "from_date" date NOT NULL,
    "to_date" date NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int NOT NULL,
    "salary" int NOT NULL,
    "from_date" date NOT NULL,
    "to_date" date NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" int NOT NULL,
    "title" varchar NOT NULL,
    "from_date" date NOT NULL,
    "to_date" date NOT NULL
);

-- Add foreing keys to tables
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "deparments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "deparments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Question 1 = List the following details of each employee: employee number, last name, first name, gender, and salary.
select 
   e.emp_no, 
   e.last_name, 
   e.first_name, 
   e.gender, 
   s.salary
from employees e
left join salaries s 
on e.emp_no = s.emp_no
where 
   to_date = (select max(to_date) from salaries); -- missing last salary, shows only info from last date

-----------------------------------------
select 
   e.emp_no, 
   e.last_name, 
   e.first_name, 
   e.gender, 
   s.salary
from employees e
left join (
	select 
       emp_no, 
       salary, 
       max(to_date) 
    from salaries 
    group by emp_no) s
on e.emp_no = s.emp_no;

-- Question 2 = List employees who were hired in 1986.
select emp_no, first_name, last_name 
from employees
where extract(year from hire_date) = 1986;

-- Question 3 = List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select 
   dm.dept_no, 
   d.dept_name, 
   dm.emp_no, 
   e.last_name, 
   e.first_name, 
   dm.from_date, 
   dm.to_date
from dept_manager dm
left join deparments d
on dm.dept_no = d.dept_no
left join employees e
on dm.emp_no = e.emp_no; -- missing last manager

-- Question 4 = List the department of each employee with the following information: employee number, last name, first name, and department name.
select 
   e.emp_no, 
   e.last_name, 
   e.first_name, 
   d.dept_name
from employees e
left join dept_emp de
on e.emp_no = de.emp_no
left join deparments d
on de.dept_no = d.dept_no; --missing last employement

-- Question 5 = List all employees whose first name is "Hercules" and last names begin with "B."


-- Question 6 = List all employees in the Sales department, including their employee number, last name, first name, and department name.


-- Question 7 = List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


-- Question 8 = In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
