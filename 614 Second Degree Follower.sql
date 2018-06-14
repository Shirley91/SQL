--614 Second Degree Follower
--In facebook, there is a follow table with two columns: followee, follower.

--Please write a sql query to get the amount of each followerís follower if he/she has one.

--For example:

+-------------+------------+
| followee    | follower   |
+-------------+------------+
|     A       |     B      |
|     B       |     C      |
|     B       |     D      |
|     D       |     E      |
+-------------+------------+
--should output:

+-------------+------------+
| follower    | num        |
+-------------+------------+
|     B       |  2         |
|     D       |  1         |
+-------------+------------+

-- IF ADD DISTINCT ?
SELECT DISTINCT f1.follower, COUNT(*) AS num
FROM follow f1
     INNER JOIN follow f2
     ON f1.follower = f2.followee
GROUP BY f1.follower
