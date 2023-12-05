-- a
-- Create the stored function
CREATE OR REPLACE FUNCTION GET_YEARS_SERVICE(
  emp_id INTEGER
)
RETURNS INTEGER AS $$
DECLARE
  start_date DATE;
  years_of_service INTEGER;
BEGIN
  -- Check if the employee ID exists in the EMPLOYEES table
  SELECT hire_date INTO start_date FROM EMPLOYEES WHERE employee_id = emp_id;

  IF start_date IS NULL THEN
    RAISE EXCEPTION 'Invalid employee ID: %', emp_id;
  END IF;

  -- Calculate the number of years of service
  years_of_service := EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM start_date);

  RETURN years_of_service;
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL; -- Return NULL in case of any error
END;
$$ LANGUAGE plpgsql;

-- b
DO $$
BEGIN
  RAISE NOTICE 'Years of service for employee ID 999: %', GET_YEARS_SERVICE(999);
END;
$$;

-- c
DO $$
BEGIN
  RAISE NOTICE 'Years of service for employee ID 106: %', GET_YEARS_SERVICE(106);
END;
$$;

-- d
SELECT * FROM JOB_HISTORY WHERE employee_id = 106;
SELECT * FROM EMPLOYEES WHERE employee_id = 106;