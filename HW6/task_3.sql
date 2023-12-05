-- Мы выводим в консоль данные студентов(поля Name и MartNr), у которых значение поля Note < 4 в таблице Check

SELECT s.Name, s.MatrNr FROM Student s
WHERE NOT EXISTS (
SELECT * FROM Check c WHERE c.MatrNr = s.MatrNr AND c.Note >= 4.0 );



-- 2) Мы выводим данные профессоров(ProfNr и Name), а также:
--      сумму кредитов по лекциям, которую они ведут;
--      в случае, если профессоры не ведут лекции - столбец "0" (сумма кредитов равна 0).

( SELECT p.ProfNr, p.Name, sum(lec.Credit)
FROM Professor p, Lecture lec
WHERE p.ProfNr = lec.ProfNr
GROUP BY p.ProfNr, p.Name)
UNION
( SELECT p.ProfNr, p.Name, 0
FROM Professor p
WHERE NOT EXISTS (
SELECT * FROM Lecture lec WHERE lec.ProfNr = p.ProfNr));


-- 3) Мы выводим информацию о студенте (Name), а также его оценку (Note), находяющуюся в таблице Check,
--     при условии, что данная оценка является наибольшей среди всех оценок по всем предметов(лекций).

SELECT s.Name, p.Note
FROM Student s, Lecture lec, Check c
WHERE s.MatrNr = c.MatrNr AND lec.LectNr = c.LectNr AND c.Note >= 4
AND c.Note >= ALL (
SELECT c1.Note FROM Check c1 WHERE c1.MatrNr = c.MatrNr )