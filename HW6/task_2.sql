-- 1
INSERT INTO borrowing
VALUES ((SELECT id
         from reader
         WHERE firstname = 'Василий'
           AND lastname = 'Петров'), 123456, 4);


-- 2
DELETE
FROM book
WHERE pubyear > 2000;

-- 3
UPDATE Borrowing
SET ReturnDate = ReturnDate + INTERVAL '30 days'
WHERE ISBN IN (
    SELECT BookCat.ISBN
    FROM BookCat
    INNER JOIN Category ON BookCat.CategoryName = Category.CategoryName
    WHERE Category.CategoryName = 'Базы данных'
)
AND ReturnDate >= '2016-01-01';

