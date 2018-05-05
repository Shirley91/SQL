-- Users' Shipping History
-- Based on the given advertisement spending tables, can you calculate the following questions?
-- Three tables: users (user_id, user_name), orders (order_id, user_id, order_cost), and order details (order_id, order_date, shipping_cost)

-- What’s the average cost of each advertisement?
-- What kind of metrics would you design in understanding whether the current advertisements can make our customers satisfied? Why? How would you calculate them?

-- Question to ask: what each table does? information contains? each data field means? Does each order has shipping cost? Does each user has placed any order?

SELECT u.user_name, o.order_id, SUM(o.order_cost + d.shipping_cost) as total_cost
FROM order_details d
LEFT JOIN order o ON o.order_id = d.order_id
LEFT JOIN user u ON u.user_id = o.user_id
GROUP BY 1,2
ORDER BY 1,2;