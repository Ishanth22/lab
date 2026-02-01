
# **1. JOBS TABLE – DDL & DML**

### **1. Create JOBS table with DEFAULT constraints**

```sql
CREATE TABLE jobs (
    job_id NUMBER PRIMARY KEY,
    job_title VARCHAR2(30) DEFAULT ' ',
    min_salary NUMBER DEFAULT 8000,
    max_salary NUMBER
);
```

### **1.1 Insert a record**

```sql
INSERT INTO jobs VALUES (101, 'Manager', 12000, 25000);
```

### **1.2 Update min_salary of employees table**

```sql
UPDATE employees
SET min_salary = 5000;
```

### **1.3 Rename column job_id to job_number**

```sql
ALTER TABLE jobs
RENAME COLUMN job_id TO job_number;
```

### **1.4 Add first_name and last_name columns**

```sql
ALTER TABLE jobs
ADD (first_name VARCHAR2(20), last_name VARCHAR2(20));
```

### **1.5 Job titles ordered by first_name (DESC)**

```sql
SELECT job_title
FROM jobs
ORDER BY first_name DESC;
```

### **1.6 Display first_name and last_name**

```sql
SELECT first_name, last_name
FROM jobs;
```

### **1.7 Maximum and Minimum salary**

```sql
SELECT MAX(max_salary), MIN(min_salary)
FROM jobs;
```

### **1.8 First name in UPPERCASE**

```sql
SELECT UPPER(first_name)
FROM jobs;
```

### **1.9 Remove right-side spaces**

```sql
SELECT RTRIM(first_name)
FROM jobs;
```

### **1.10 Select first 7 records**

```sql
SELECT *
FROM jobs
WHERE ROWNUM <= 7;
```

---

# **2. LOAN TABLE**

### **Create Loan table**

```sql
CREATE TABLE Loan (
    Loan_ID VARCHAR2(10) PRIMARY KEY,
    Loan_Desc VARCHAR2(35) NOT NULL,
    Loan_amount NUMBER(6),
    interst_rate NUMBER(6)
);
```

### **Perform queries (1.1, 1.4, 1.6, 1.8, 1.10)**

**Insert**

```sql
INSERT INTO Loan VALUES ('L101', 'Home Loan', 500000, 8);
```

**Add first_name, last_name**

```sql
ALTER TABLE Loan
ADD (first_name VARCHAR2(20), last_name VARCHAR2(20));
```

**Select names**

```sql
SELECT first_name, last_name FROM Loan;
```

**Uppercase**

```sql
SELECT UPPER(first_name) FROM Loan;
```

**First records**

```sql
SELECT * FROM Loan WHERE ROWNUM <= 7;
```

---

# **3. EMPLOYEES TABLE WITH CONSTRAINTS**

 **Create table**


CREATE TABLE employees (
    employee_id NUMBER CONSTRAINT pk_emp PRIMARY KEY,
    first_name VARCHAR2(20),
    last_name VARCHAR2(20),
    email VARCHAR2(30),
    phone_number NUMBER,
    hire_date DATE,
    job_id NUMBER,
    salary NUMBER,
    commission NUMBER,
    manager_id NUMBER,
    department_id NUMBER,
    CONSTRAINT uq_dept_mgr UNIQUE (department_id, manager_id)
);
```

### **3.1 Insert record**

```sql
INSERT INTO employees
VALUES (1,'Ishanth','R','ish@gmail.com',987654321,
SYSDATE,101,25000,500,200,10);
```

### **3.2 Update email & commission**

```sql
UPDATE employees
SET email = 'not available',
    commission = 100;
```

### **3.3 Rename column**

```sql
ALTER TABLE employees
RENAME COLUMN job_id TO job_number;
```

### **3.4 Alias names**

```sql
SELECT first_name AS "First Name",
       last_name AS "Last Name"
FROM employees;
```

### **3.5 Order by first name DESC**

```sql
SELECT *
FROM employees
ORDER BY first_name DESC;
```

### **3.6 Salary and PF (15%)**

```sql
SELECT first_name, last_name, salary,
       salary*0.15 AS PF
FROM employees;
```

### **3.7 Max & Min salary**

```sql
SELECT MAX(salary), MIN(salary)
FROM employees;
```

### **3.8 Uppercase**

```sql
SELECT UPPER(first_name)
FROM employees;
```

### **3.9 Trim spaces**

```sql
SELECT TRIM(first_name)
FROM employees;
```

### **3.10 First 10 records**

```sql
SELECT *
FROM employees
WHERE ROWNUM <= 10;
```

---

# **4. DEPARTMENT TABLE (DDL & DML)**

### **Create table**

```sql
CREATE TABLE Department (
    department_id NUMBER,
    department_name VARCHAR2(30),
    manager_id NUMBER,
    location_id NUMBER
);
```

### **Insert records**

```sql
INSERT INTO Department VALUES (10,'Administration',200,1700);
INSERT INTO Department VALUES (20,'Marketing',201,1800);
INSERT INTO Department VALUES (30,'Shipping',114,1700);
INSERT INTO Department VALUES (40,'Human Resources',203,2400);
INSERT INTO Department VALUES (50,'Delivery',200,1500);
```

### **Add column**

```sql
ALTER TABLE Department
ADD dept_floor_no NUMBER;
```

### **Add Primary Key**

```sql
ALTER TABLE Department
ADD CONSTRAINT pk_dept PRIMARY KEY (department_id);
```

### **Drop vs Truncate**

```sql
DROP TABLE Department;
TRUNCATE TABLE Department;
```

**Difference**

* `DROP` → removes table structure + data
* `TRUNCATE` → removes data only (structure remains)

---

## **DML Queries**

### **1. Sort LOCATION_ID DESC**

```sql
SELECT * FROM Department
ORDER BY location_id DESC;
```

### **2. MIN location_id group by department**

```sql
SELECT department_name, MIN(location_id)
FROM Department
GROUP BY department_name;
```

### **3. Manager ID > 200**

```sql
SELECT * FROM Department
WHERE manager_id > 200;
```

### **4. Insert new record**

```sql
INSERT INTO Department
VALUES (60,'Finance',300,3000,NULL);
```

### **5. Update Marketing dept**

```sql
UPDATE Department
SET department_id = 25
WHERE department_name = 'Marketing';
```

### **6. Display all**

```sql
SELECT * FROM Department;
```

### **7. Unique manager IDs**

```sql
SELECT DISTINCT manager_id
FROM Department;
```

### **8. Count records**

```sql
SELECT COUNT(*)
FROM Department;
```


