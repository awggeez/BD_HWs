-- a
-- Create the stored function
CREATE OR REPLACE FUNCTION GET_JOB_COUNT(
  emp_id INTEGER
)
RETURNS INTEGER AS $$
DECLARE
  job_count INTEGER;
BEGIN
  -- Check if the employee ID exists in the EMPLOYEES table
  IF NOT EXISTS (SELECT 1 FROM EMPLOYEES WHERE employee_id = emp_id) THEN
    RAISE EXCEPTION 'Invalid employee ID: %', emp_id;
  END IF;

  -- Retrieve the number of different jobs the employee worked on
  SELECT COUNT(*) INTO job_count
  FROM (
    SELECT DISTINCT job_id
    FROM JOB_HISTORY
    WHERE employee_id = emp_id
      AND job_id != (SELECT job_id FROM EMPLOYEES WHERE employee_id = emp_id)
  ) AS job_counts;

  RETURN job_count;
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL; -- Return NULL in case of any error
END;
$$ LANGUAGE plpgsql;

-- b
DO $$
DECLARE
  job_count INTEGER;
BEGIN
  job_count := GET_JOB_COUNT(176);
  RAISE NOTICE 'Number of different jobs for employee ID 176: %', job_count;
END;
$$;