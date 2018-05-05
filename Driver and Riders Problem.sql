-- Driver & Riders' Problem
-- 1. For the last 30 days deduce the mean and median difference between Actual and Predicted ETA of all trips in the cities of ‘Qarth’ and ‘Meereen’
-- 2. Find all successfully signed up riders in ‘Qarth’ over the last 60 days who completed their first trip within 168 hours of their sign up.

- Get median in PostgreSQL

SELECT AVG(t.actural_eta - t.predicted_eta) - PERCENTILE_DISC(0.5) WITHIN GROUP OVER ()
FROM trips t JOIN cities c ON t.city_id = c.city_id
WHERE c.city_name IN ('Qarth', 'Meereen')
AND t.status = "completed"
AND t.request_at BETWEEN now() - interval '30 days' AND now()

- Find the riders

SELECT table1.client_id
FROME trips t JOIN cities c ON t.city_id = c.city_id
			  JOIN events e ON t.client_id = e.rider_id
WHERE e.event_name = "sign_up_success"
AND c.city_name = 'Qarth'
AND t.status = 'completed'
AND t.request_at >= e._ts - interval '168 hours'
AND e._ts >= now() - interval '60 days'

- More efficient

SELECT table1.client_id
FROM
(SELECT t.client_id, t.city_id
FROME trips t JOIN cities c ON t.city_id = c.city_id
WHERE c.city_name = 'Qarth'
AND t.status = 'completed') table1
JOIN events e on t.client_id = e.rider_id


