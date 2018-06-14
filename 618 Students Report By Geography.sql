--618 Students Report By Geography 
--A U.S graduate school has students from Asia, Europe and America. The students' location information are stored in table student as below.
| name   | continent |
|--------|-----------|
| Jack   | America   |
| Pascal | Europe    |
| Xi     | Asia      |
| Jane   | America   |
--Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent. The output headers should be America, Asia and Europe respectively. It is guaranteed that the student number from America is no less than either Asia or Europe.
--For the sample input, the output is:
| America | Asia | Europe |
|---------|------|--------|
| Jack    | Xi   | Pascal |
| Jane    |      |        |


SELECT America, Asia, Europe
FROM 
    (SELECT @as:=0, @am:=0, @eu:=0) t,
    (SELECT @as:= @as + 1 AS asid, name AS Asia
     FROM student
     WHERE continent = 'Asia'
     ORDER BY Asia) AS t1
  RIGHT JOIN
    (SELECT @am:= @am + 1 AS amid, name AS America
     FROM student
     WHERE continent = 'America'
     ORDER BY America) AS t2
  ON asid = amid
  LEFT JOIN
    (SELECT @eu:= @eu + 1 AS euid, name AS Europe
     FROM student
     WHERE continent = 'Europe'
     ORDER BY Europe) AS t3
  ON amid = euid
;
