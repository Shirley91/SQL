-- Highest Amount in Each Department
-- Order
Order_ID	Date		Department_ID	Amount	
A4896		11/1/16		1				18014
B4693		11/1/16		2				45944
C4001		11/1/16		3				28919
B4693		11/2/16		2				63522
B4693		11/3/16		2				48253
C4001		11/4/16		3				16295

-- Department
id 		Name
1		Development
2		IT
3		Sales
-- Find Order_ID that has the highest Amount in each of the department.

SELECT d.Name, o.Order_ID, MAX(o.Amount) OVER (PARTITION BY d.id)
FROM Order o
JOIN Department d
ON o.Department_ID = d.id;