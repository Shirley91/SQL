-- Consective Days
-- Given the table below. What is the max number of consecutive days of product views for every user?
Date	User	proudctflag
11/1/17 1		Y
11/1/17 2		N
11/1/17 3		Y
11/2/17 2		N
11/3/17 2		N
11/4/17 3		N
-- Question to ask: how does the table look like? What data fields do we have?

- Consecutive days for each user
- Create a temp table for future reference
- Finde the max consecutive days that each user has viewed the product
CREATE TABLE tem AS(
SELECT User, DATEDIFF(DAY, Date, ROW_NUMBER() OVER (PARTITION BY User ORDER BY Date)) AS grp
FROM table
WHERE productflag = 'Y')

SELECT User, (CASE WHEN MAX(counts) = 1 THEN 0 ELSE MAX(counts) END) AS max_days
FROM
(SELECT User, grp, COUNT() AS counts
FROM tmp
GROUP BY 1,2
ORDER BY 1,2)
GROUP BY 1
ORDER BY 1;