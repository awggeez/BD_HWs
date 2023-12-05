CREATE OR REPLACE PROCEDURE NEW_JOB(
  IN job_id VARCHAR,
  IN job_title VARCHAR,
  IN min_salary NUMERIC
)
AS $$
DECLARE
  max_salary NUMERIC;
BEGIN
  max_salary := min_salary * 2;

  INSERT INTO JOBS(job_id, job_title, min_salary, max_salary)
  VALUES (job_id, job_title, min_salary, max_salary);

  -- Print a success message
  RAISE NOTICE 'New job added: % - %', job_id, job_title;
END;
$$ LANGUAGE plpgsql;

CALL NEW_JOB('SY_ANAL', 'System Analyst', 6000);