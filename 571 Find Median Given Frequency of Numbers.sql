--571. Find Median Given Frequency of Numbers
--The Numbers table keeps the value of number and its frequency.

+----------+-------------+
|  Number  |  Frequency  |
+----------+-------------|
|  0       |  7          |
|  1       |  1          |
|  2       |  3          |
|  3       |  1          |
+----------+-------------+
--In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.

--Write a query to find the median of all numbers and name the result as median.

SELECT AVG(Number) AS median
FROM (
      SELECT Number, Frequency, AccFreq, SumFreq 
      (SELECT Numbers,
              Frequency, @curFreq := @curFreq + Frequency AS AccFreq
       FROM Numbers n, (SELECT @curFreq := 0) r
       ORDER BY Number) AS t1,
      (SELECT SUM(Frequency) AS SumFreq FROM Numbers) AS t2
) AS t
WHERE AccFreq BETWEEN SumFreq / 2 AND SumFreq / 2 + Frequency
;

