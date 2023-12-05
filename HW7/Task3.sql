-- Create the stored procedure
CREATE OR REPLACE PROCEDURE UPD_JOBSAL(
  IN id_job VARCHAR,
  IN new_min_salary NUMERIC,
  IN new_max_salary NUMERIC
)
AS $$
BEGIN
  -- Check if the job ID exists in the JOBS table
  PERFORM j.job_id FROM JOBS j WHERE j.job_id = id_job;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Invalid job ID: %', id_job;
  END IF;

  -- Check if the new maximum salary is less than the new minimum salary
  IF new_max_salary < new_min_salary THEN
    RAISE EXCEPTION 'Maximum salary cannot be less than minimum salary.';
  END IF;

  -- Update the minimum and maximum salaries for the specified job ID
  UPDATE JOBS
  SET min_salary = new_min_salary,
      max_salary = new_max_salary
  WHERE job_id = job_id;

  -- Print a success message
  RAISE NOTICE 'Minimum and maximum salaries updated for job ID: %', id_job;
EXCEPTION
  WHEN LOCK_NOT_AVAILABLE THEN
    RAISE EXCEPTION 'Row in the JOBS table is locked.';
END;
$$ LANGUAGE plpgsql;

-- Disable triggers on EMPLOYEES and JOBS tables
ALTER TABLE EMPLOYEES DISABLE TRIGGER ALL;
ALTER TABLE JOBS DISABLE TRIGGER ALL;

CALL UPD_JOBSAL('SY_ANAL', 7000, 140);
CALL UPD_JOBSAL('SY_ANAL', 7000, 14000);

ALTER TABLE EMPLOYEES ENABLE TRIGGER ALL;
ALTER TABLE JOBS ENABLE TRIGGER ALL;