-- 1
SELECT title, pubname
FROM book;

-- 2
SELECT isbn, title, author
FROM book
WHERE pagesnum = (SELECT MAX(pagesnum) FROM book);

-- 3
SELECT author, count(*) as books_amount
FROM book
GROUP BY author
HAVING count(*) > 5;

-- 4
SELECT isbn, title, author
FROM book
WHERE pagesnum > (SELECT 2 * AVG(pagesnum) FROM book);

-- 5
SELECT categoryname
FROM category
WHERE (parentcat IS NOT NULL);


-- 6
SELECT author, count(*) AS books_amount
FROM book
GROUP BY author
ORDER BY books_amount DESC
LIMIT 1;

-- 7
select r.lastname, r.firstname
FROM book b
         JOIN borrowing br on br.isbn = b.isbn
         JOIN copy c on br.copynumber = c.copynumber
         JOIN reader r on r.id = br.readernr
WHERE b.author = 'Марк Твен'
GROUP BY r.lastname, r.firstname
HAVING count(DISTINCT b.isbn) = (SELECT count(*)
                                 FROM book
                                 WHERE book.author = 'Марк Твен');


-- 8
SELECT b.isbn, b.author, b.title
FROM book b
         JOIN (SELECT isbn, count(*) as copies
               FROM copy
               GROUP BY isbn
               HAVING count(*) > 0) cp ON b.isbn = cp.isbn;


-- 9
SELECT b.isbn, b.author, b.title, b.pubyear
FROM book b
ORDER BY b.pubyear
LIMIT 10;

-- 10
WITH RECURSIVE subcategories AS (SELECT categoryname, parentcat
                                 FROM category
                                 WHERE parentcat LIKE 'Sports'
                                 UNION
                                 SELECT categoryname, parentcat
                                 from subcategories
                                 WHERE parentcat LIKE 'Sports')
SELECT categoryname, parentcat
FROM subcategories;
