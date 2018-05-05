-- Member Movement
-- We have a table that has the following data fields: member_id, company_name, year_start
-- Answer the questions below:
-- Count members who ever moved from Microsoft to Google?
-- Count members who directly moved from Microsoft to Google?
-- Question to ask: what is the data type of year_start? Is it a timestamp or just a year (int, year)

SELECT COUNT(DISTINCT a.member_id)
FROM table a 
JOIN table b
ON a.member_id = b.member_id AND a.year_start < b.year_start
WHERE a.company_name = 'Microsoft' AND b.company_name = 'Google';

SELECT CCOUNT(DISTINCT c.member_id)
FROM
(SELECT a.*, ROW_NUMBER() OVER (PARTITION BY member_id ORDER BY year_start) rk
 FROM table a) c
JOIN
(SELECT b.*, ROW_NUMBER() OVER (PARTITION BY member_id ORDER BY year_start) rk
 FROM table b) d
ON c.member_id = d.member_id AND c.rk + 1 = d.rk
WHERE a.company_name = 'Microsoft' AND b.company_name = 'Google';
