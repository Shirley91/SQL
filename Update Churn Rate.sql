-- Update Churn Rate
-- Update newly registered FB users to an existing table. Add new column called flag indicating if the user is new or existing. Calculate the churn rate of these newly added users after two weeks. (Churn is defined as user not using FB in the most recent 7 days)
-- Question to ask: what is the definition of churn rate? what tables do we have, relationships among the tables and data fields needed?
-- Existing Table --
- Users
id  fname  lname  registered_date  last_login_date
1	Jason  Young  2015-01-02       2017-11-05
2	Lily   Li     2009-08-14       2017-11-30
3	Ankit  Gupta  2010-10-11       2017-12-01

-- New Table --
- Add a new column: flag

ALTER TABLE Users
	ADD COLUMN flag CHAR(3) NOT NULL;
UPDATE TABLE Users
	SET flag = 'old'
	WHERE registered_date < current_date();

- Add new users to the existing table

INSERT INTO User (fname, lname, registered_date, last_login_date, flag)
VALUES ('Rajesh','Atti', '2017-11-01','2017-12-01','new')

INSERT INTO User (fname, lname, registered_date, last_login_date, flag)
VALUES ('Ben','Hoffman', '2017-11-01','2017-11-13','new')

INSERT INTO User (fname, lname, registered_date, last_login_date, flag)
VALUES ('Zack','Jiang', '2017-11-01','2017-11-07','new')

- Calulate Churn Rate

WITH table1 AS
(SELECT COUNT(*) AS churn_users
FROM Users
WHERE flag = 'new' AND DATEDIFF(WEEK, registered_date, last_login_date) >= 2
AND DATEDIFF(DAY, last_login_date, current_date()) > 7)

WITH table2 AS
(SELECT COUNT(*) AS new_users
FROM Users
WHERE flag = 'new' AND DATEDIFF(WEEK, registered_date, last_login_date) >= 2)

SELECT table1.churn_users/table2.new_users AS churn_rate
FROM table1 JOIN table2

