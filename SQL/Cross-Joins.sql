-- Cross Join Table

Use food_db;

SELECT 
    *
FROM
    items;

SELECT 
    *
FROM
    variants;

SELECT 
    CONCAT(name, ' ', variant_name) AS Product_name,
    (price + variant_price) AS Product_price
FROM
    items
        CROSS JOIN
    variants;