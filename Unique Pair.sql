-- Unique Pair
-- Given the current table: WIth the id numbers and corresponding type.
-- Find the unique pair of id that are of the same type
-- Question to ask: what does the unique mean here? how does the output table looks like (what the interviewer would like to see)?

SELECT type, a.id, b.id 
FROM (
(SELECT id, type, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id) rk 
 FROM table) a
JOIN
(SELECT id, type, ROW_NUMBER() OVER (PARTITION BY type ORDER BY id) rk 
 FROM table) b
ON a.type = b.type AND a.rk < b.rk
)
WHERE b.id IS NOT NULL; -- pay attention to NULL 