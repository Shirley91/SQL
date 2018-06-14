--602 Friend Requests II: Who Has the Most Friends
--In social network like Facebook or Twitter, people send friend requests and accept others' requests as well.
--Table request_accepted holds the data of friend acceptance, while requester_id and accepter_id both are the id of a person.
| requester_id | accepter_id | accept_date|
|--------------|-------------|------------|
| 1            | 2           | 2016_06-03 |
| 1            | 3           | 2016-06-08 |
| 2            | 3           | 2016-06-08 |
| 3            | 4           | 2016-06-09 |
--Write a query to find the the people who has most friends and the most friends number. For the sample data above, the result is:
| id | num |
|----|-----|
| 3  | 3   |


SELECT ids AS id, COUNT(*) AS num
FROM
    (SELECT requester_id AS ids FROM request_accepted
     UNION ALL
     SELECT appeter_id AS ids FROM request_accepted) AS u
GROUP BY ids
ORDER BY COUNT(*) DESC
LIMIT 1
;