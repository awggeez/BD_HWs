-- 1
SELECT (bit_length(name) + length(race)) as calculation
FROM demographics;

-- 2
SELECT id, bit_length(name) as name, birthday, bit_length(race) AS race
FROM demographics;

-- 3
SELECT ascii(substring(name, 1, 1)) as name;


-- 4
SELECT concat_ws(' ', prefix, 'first', 'last', suffix) as title
FROM names;

-- 5
SELECT
    RPAD(md5, LENGTH(sha256), '1') AS md5,
    LPAD(sha1, LENGTH(sha256), '0') AS sha1,
    sha256
FROM encryption;

-- 6
SELECT
    LEFT(project, commits) AS project,
    RIGHT(address, contributors) AS address
FROM repositories;

-- 7
SELECT
    project,
    commits,
    contributors,
    regexp_replace(address, '[0-9]', '!', 'g') AS address
FROM repositories;


-- 8
SELECT
    name,
    weight,
    price,
    ROUND((price / (weight / 1000.0)), 2) AS price_per_kg
FROM
    products
ORDER BY
    price_per_kg ASC,
    name ASC;
