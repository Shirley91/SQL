-- Grandchildren & Grandparents
-- Given the following table that has parent’s id & children id, find all the grandparents and grandchildren.
id	name		parent_id
1	Bob			3
2	John		5
3	Larry		4
4	Kevin		0
5	Kyle		0
6	Jason		5
7	Mildred		4
8	Mabel		6

SELECT gp.name AS Groundparents, gc.name AS Groundchildren
FROM people AS gp, people AS p, people AS gc
WHERE gc.parent_id = p.id AND p.parent_id = gp.id;