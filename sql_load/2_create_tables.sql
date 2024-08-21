CREATE TABLE pizza_types
(
    pizza_type_id TEXT PRIMARY KEY,
    name TEXT,
    category TEXT,
    ingredients TEXT
);

CREATE TABLE pizzas
(
    pizza_id TEXT PRIMARY KEY,
    pizza_type_id TEXT,
    size TEXT,
    price NUMERIC,
    FOREIGN KEY (pizza_type_id) REFERENCES pizza_types (pizza_type_id)
);

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_time TIME
);

CREATE TABLE order_details
(
    order_details_id INT PRIMARY KEY,
    order_id INT,
    pizza_id TEXT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

-- Set ownership of the tables to the postgres user
ALTER TABLE pizzas OWNER to postgres;
ALTER TABLE pizza_types OWNER to postgres;
ALTER TABLE orders OWNER to postgres;
ALTER TABLE order_details OWNER to postgres;

-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_pizza_type_id ON pizzas (pizza_type_id);
CREATE INDEX idx_order_id ON order_details (order_id);