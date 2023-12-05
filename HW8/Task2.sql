-- Disable triggers on EMPLOYEES, JOBS, and JOB_HISTORY tables
ALTER TABLE EMPLOYEES DISABLE TRIGGER ALL;
ALTER TABLE JOBS DISABLE TRIGGER ALL;
ALTER TABLE JOB_HISTORY DISABLE TRIGGER ALL;

-- Create the stored procedure
CREATE OR REPLACE PROCEDURE ADD_JOB_HIST(
  IN emp_id INT,
  IN new_job_id VARCHAR
)
AS $$
DECLARE
  hire_date DATE;
  min_salary NUMERIC;
BEGIN
  -- Retrieve the hire date and minimum salary for the new job
  SELECT hire_date, min_salary INTO hire_date, min_salary
  FROM EMPLOYEES
  JOIN JOBS ON EMPLOYEES.job_id = JOBS.job_id
  WHERE EMPLOYEES.employee_id = emp_id;

  -- Insert a new row into JOB_HISTORY with hire date as start date and today's date as end date
  INSERT INTO JOB_HISTORY(employee_id, start_date, end_date, job_id, department_id)
  VALUES (employee_id, hire_date, CURRENT_DATE, new_job_id, NULL);

  -- Update the hire date and job ID for the employee in EMPLOYEES table
  UPDATE EMPLOYEES
  SET hire_date = CURRENT_DATE,
      job_id = new_job_id,
      salary = min_salary + 500
  WHERE employee_id = employee_id;

  -- Print a success message
  RAISE NOTICE 'New job history added for employee ID: %', emp_id;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE EXCEPTION 'Employee with ID % not found.', emp_id;
END;
$$ LANGUAGE plpgsql;

-- Enable triggers on EMPLOYEES, JOBS, and JOB_HISTORY tables
ALTER TABLE EMPLOYEES ENABLE TRIGGER ALL;
ALTER TABLE JOBS ENABLE TRIGGER ALL;
ALTER TABLE JOB_HISTORY ENABLE TRIGGER ALL;

CALL ADD_JOB_HIST(106, 'SY_ANAL');