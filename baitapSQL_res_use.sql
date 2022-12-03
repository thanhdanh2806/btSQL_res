
-- 5 người đã like nhà hàng nhiều nhất
SELECT users.user_id, users.full_name , SUM(rate_res.amount) as luot_like
FROM users 
INNER JOIN rate_res
ON users.user_id = rate_res.user_id
INNER JOIN restaurants
ON rate_res.res_id = restaurants.res_id 
GROUP BY users.user_id
ORDER BY luot_like DESC
LIMIT 5
;

-- 2 nhà hàng có lượt like nhiều nhất
SELECT restaurants.res_id, restaurants.res_name, SUM(rate_res.amount) as total_like
FROM restaurants 
INNER JOIN rate_res
ON restaurants.res_id = rate_res.res_id
INNER JOIN users
ON users.user_id = rate_res.user_id 
GROUP BY restaurants.res_id
ORDER BY total_like DESC
LIMIT 2
;

-- tìm người đã đặt hàng nhiều nhất
select users.full_name as name , orders.amount as dat_hang
FROM users
INNER JOIN orders
ON users.user_id = orders.user_id
INNER JOIN foods
ON orders.food_id = foods.food_id
ORDER BY orders.amount DESC
;

-- tìm người dùng không hoạt dộng trong hệ thống
SELECT users.full_name as name, rate_res.amount as likes, orders.amount as orders
FROM rate_res
INNER JOIN orders
ON rate_res.user_id = orders.user_id
INNER JOIN users
ON orders.user_id = users.user_id
WHERE rate_res.amount  = 0 AND orders.amount = 0
;

-- tính trung bình sub_food của một food
SELECT sub_food.food_id as id , foods.food_name as ten_mon , AVG(sub_food.sub_price) as trung_binh
FROM sub_food
LEFT JOIN foods
ON sub_food.food_id = foods.food_id
GROUP BY id
;







