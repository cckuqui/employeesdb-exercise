# SQL Exercise - Employee Database

!['employees only' Image by Rob Gonyea from FreeImages](Images/employees_only.jpg)

## Data

The resources contains 6 cvs files, all of them containing employees information:

* Personal employees information

    ![employees preview](Images/employees.png)

* Deparments

    ![deparments preview](Images/departments.png)

* Employees by department

    ![employees by department](Images/dept_emp.png)

* Managers by deparment

    ![managers by deparment](Images/dept_manager.png)

* Titles per employee

    ![titles per employee](Images/titles.png)

* Salaries per employee

    ![salaries per employee](Images/salaries.png)

### Objective

* Sketch the ERD of the tables.
* Create the table schema for each csv file.
* Run the following queries:
  * List the following details of each employee: employee number, last name, first name, gender, and salary.
  * List employees who were hired in 1986.
  * List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
  * List the department of each employee with the following information: employee number, last name, first name, and department name.
  * List all employees whose first name is "Hercules" and last names begin with "B."
  * List all employees in the Sales department, including their employee number, last name, first name, and department name.
  * List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
  * In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
* Import the database into pandas and:
  * Create a histogram to visualize the most common salary ranges for employees.
  * Create a bar chart of average salary by title.

## Results

* Sketch the ERD of the tables.

    ![ERD](Images/ERD.png)

* The table schema can be found [here](schema.sql).
* Run the following queries:
  * List the following details of each employee: employee number, last name, first name, gender, and salary.

     ![1](Images/1.png)

  * List employees who were hired in 1986.

     ![2](Images/2.png)

  * List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
  
     ![3](Images/3.png)

  * List the department of each employee with the following information: employee number, last name, first name, and department name.
  
     ![4](Images/4.png)

  * List all employees whose first name is "Hercules" and last names begin with "B."
  
     ![5](Images/5.png)

  * List all employees in the Sales department, including their employee number, last name, first name, and department name.
  
     ![6](Images/6.png)

  * List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
  
     ![7](Images/7.png)

  * In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
  
     ![8](Images/8.png)

* The next analysis can be found [here](analysis.ipynb)
  * Create a histogram to visualize the most common salary ranges for employees.

    ![histogram](Images/histogram.png)

  * Create a bar chart of average salary by title.

    ![barchart](Images/barchart.png)

## Copyright

Photo by [Rob Gonyea](https://www.freeimages.com/photographer/rob_gonyea-59290) from [FreeImages](https://freeimages.com/).
