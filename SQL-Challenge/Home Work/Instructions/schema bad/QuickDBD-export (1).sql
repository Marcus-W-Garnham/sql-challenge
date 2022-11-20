-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    -- department code
    "dept_no" string  NOT NULL ,
    -- department name
    "dept_name" string  NOT NULL ,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
    )
)

GO

CREATE TABLE "Dept_emp" (
    -- employee number
    "emp_no" int  NOT NULL ,
    -- department code
    "dept_no" string  NOT NULL 
)

GO

CREATE TABLE "Dept_manager" (
    -- department code
    "dept_no" string  NOT NULL ,
    -- employee number
    "emp_no" int  NOT NULL 
)

GO

CREATE TABLE "Employees" (
    -- employee number
    "emp_no" int  NOT NULL ,
    -- employee title code (staff or engineer or)
    "emp_title" string  NOT NULL ,
    -- date they where born
    "birth_date" date  NOT NULL ,
    -- first name
    "first_name" string  NOT NULL ,
    -- last name
    "last_name" string  NOT NULL ,
    -- what sex they are
    "sex" string  NOT NULL ,
    -- when where they hired
    "hire_date" date  NOT NULL ,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
    )
)

GO

CREATE TABLE "Salaries" (
    -- employee number
    "emp_no" string  NOT NULL ,
    -- how much they are paid
    "salary" int  NOT NULL 
)

GO

CREATE TABLE "Titles" (
    -- job code
    "title_id" string  NOT NULL ,
    -- what is there job
    "title" string  NOT NULL ,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
    )
)

GO

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no")
GO

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no")
GO

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no")
GO

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no")
GO

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "Titles" ("title_id")
GO

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no")
GO

