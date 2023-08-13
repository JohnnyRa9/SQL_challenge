-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hOM1qI
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Data Modeling for Employees Database and Documentation

CREATE TABLE "employees" (
    -- Employees number is a primary key
    "emp_no" INT   NOT NULL,
    -- Employees have a title id employees(emp_title_id)
    "emp_title_id" VARCHAR   NOT NULL,
    -- Employees birth date
    "birth_date" DATE   NOT NULL,
    -- Employees first name
    "first_name" VARCHAR   NOT NULL,
    -- Employees last name
    "last_name" VARCHAR   NOT NULL,
    -- Employees Gender
    "sex" VARCHAR   NOT NULL,
    -- Employees hired date
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    -- Department number is a primary key
    "dept_no" VARCHAR   NOT NULL,
    -- Department names
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_manager" (
    -- Department number in department manger list.
    "dept_no" VARCHAR   NOT NULL,
    -- Employees number in department manger list.
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    -- Employees number in department employees list.
    "emp_no" INT   NOT NULL,
    -- Department number in department employees list
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "titles" (
    -- Title id is a primary key.
    "title_id" VARCHAR   NOT NULL,
    -- List of titles
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salaries" (
    -- Employees number in salaries.
    "emp_no" INT   NOT NULL,
    -- Employees salaries
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

