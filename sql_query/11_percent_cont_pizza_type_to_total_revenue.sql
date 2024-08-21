-- Calculate the percentage contribution of each pizza type to total revenue.

WITH pizza_types_revenue AS (
    SELECT
        pizza_types.category AS category,
        SUM(order_details.quantity * pizzas.price) AS pizza_revenue
    FROM
        pizzas
    INNER JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
    INNER JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
    GROUP BY
        pizza_types.category
),
total_revenue_pizza AS (
    SELECT
        SUM(pizza_revenue) AS total_revenue
    FROM
        pizza_types_revenue
)

SELECT
    pizza_types_revenue.category,
    pizza_types_revenue.pizza_revenue AS pizza_revenue,
    total_revenue_pizza.total_revenue AS total_revenue,
    ROUND((pizza_revenue/total_revenue)*100,2) AS percentage_contribution
FROM
    pizza_types_revenue
CROSS JOIN total_revenue_pizza
ORDER BY
    percentage_contribution DESC
