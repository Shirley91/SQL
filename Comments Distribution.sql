-- Comments Distribution
-- Having table 1: content_actions with fields of user_id|content_id|conent_type|target_id, where content_type could be either "comment" or "post"} . Use sql to answer following questions:
-- What is the total number of comments and total number of posts?
-- What is the distribution of comments?

-- question to ask: how does the posting and commenting work?

SELECT content_type, COUNT(DISTINCT content_id)
FROM content_actions
GROUP BY content_type;

- Find the corresponding post & comment
- Do a left join to find the post without comment
- Final count of post_id based on number of comments
SELECT c_cnt, COUNT(p_id)
FROM
(SELECT p_id, COUNT(c_id) AS c_cnt
FROM
(SELECT content_id AS p_id
FROM content_actions
WHERE content_type = 'post') AS a
LEFT JOIN
(SELECT content_id AS c_id, target_id AS c
FROM content_actions
WHERE content_type = 'comment') AS b
ON a.p_id = b.target_id
GROUP BY p_id)
GROUP BY c_cnt;


