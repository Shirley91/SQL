--574 Winning Candidate 
--Table: Candidate

+-----+---------+
| id  | Name    |
+-----+---------+
| 1   | A       |
| 2   | B       |
| 3   | C       |
| 4   | D       |
| 5   | E       |
+-----+---------+  
--Table: Vote

+-----+--------------+
| id  | CandidateId  |
+-----+--------------+
| 1   |     2        |
| 2   |     4        |
| 3   |     3        |
| 4   |     2        |
| 5   |     5        |
+-----+--------------+
--id is the auto-increment primary key,
--CandidateId is the id appeared in Candidate table.
--Write a sql to find the name of the winning candidate, the above example will return the winner B.

+------+
| Name |
+------+
| B    |
+------+

SELECT Name
FROM Candidate
     JOIN
     (SELECT CandidateId
      FROM Vote
      GROUP BY CandidateId
      ORDER BY COUNT(*) DISC
      LIMIT 1) AS winner
WHERE Candidate.id = winner.CandidateId
;

