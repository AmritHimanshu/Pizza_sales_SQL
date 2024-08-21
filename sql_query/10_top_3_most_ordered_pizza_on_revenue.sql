-- Determine the top 3 most ordered pizza types based on revenue.

SELECT
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS total_revenue
FROM
    pizza_types
INNER JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
INNER JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY
    pizza_types.name
ORDER BY
    total_revenue DESC
LIMIT 3;