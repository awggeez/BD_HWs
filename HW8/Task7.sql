-- a
CREATE OR REPLACE FUNCTION check_sal_range_func()
    RETURNS TRIGGER AS
$$
DECLARE
    emp_count INT;
BEGIN
    SELECT count(*)
    INTO emp_count
    FROM employees
    WHERE job_id = NEW.job_id
      AND (salary < NEW.min_salary OR salary > NEW.max_salary);

    IF emp_count > 0 THEN
        RAISE EXCEPTION 'Salary range update conflicts with employee salaries %', emp_count;
    end if;

    RETURN NEW;
END
$$ LANGUAGE plpgsql;

-- CREATE TRIGGER check_sal_range2
--     BEFORE UPDATE OF min_salary, max_salary
--     FOR EACH ROW
-- EXECUTE FUNCTION check_sal_range_func()

-- b
SELECT min_salary, max_salary FROM jobs WHERE job_id = 'SY_ANAL';
SELECT employee_id, last_name, salary FROM employees WHERE job_id = 'SY_ANAL';

-- c
UPDATE jobs SET min_salary = 7500, max_salary = 10000 WHERE job_id = 'SY_ANAL';
SELECT min_salary, max_salary FROM jobs WHERE job_id = 'SY_ANAL';