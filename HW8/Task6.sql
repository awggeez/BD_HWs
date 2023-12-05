CREATE SCHEMA EMPJOB_PKG;

CREATE OR REPLACE PROCEDURE EMPJOB_PKG.NEW_JOB(job_id character, job_title character, min_salary integer)
language plpgsql
as
$$
    BEGIN
        INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
        VALUES (job_id, job_title, min_salary, max_salary * 2);
    END;
$$;

-- b
CALL empjob_pkg.NEW_JOB('PR_MNG', 'Public Relations Manager', 6250);

-- c
-- Disable the UPDATE_JOB_HISTORY trigger
ALTER TABLE job_history DISABLE TRIGGER UPDATE_JOB_HISTORY;

-- Call the ADD_JOB_HIST procedure
CALL EMPJOB_PKG.ADD_JOB_HIST(110, 'PR_MAN');

-- Enable the UPDATE_JOB_HISTORY trigger
ALTER TABLE job_history ENABLE TRIGGER UPDATE_JOB_HISTORY;