/*
CREATE VIEW login_user_view AS
SELECT
    u.name AS full_name,
    u.email username,
    u.document_type,
    u.document_number,
    u.phone,
    c.city,
    u.address,
    u.user_type AS role
FROM
    users u
JOIN
    cities c ON u.cities_id = c.id;
*/
CREATE VIEW users_sales_view AS
SELECT
    u.name AS full_name,
    u.document_number,
    s.reference,
    s.date,
    pa.name payment_method,
    GROUP_CONCAT(po.name SEPARATOR ', ') AS products,
    SUM(sd.price) AS total
FROM 
    sales s 
LEFT JOIN users u ON s.client_id = u.id
LEFT JOIN payment_methods pa ON s.payment_method_id = pa.id
LEFT JOIN sale_details sd ON sd.sale_id = s.id
LEFT JOIN products po ON sd.product_id = po.id
GROUP BY s.id


-- CREATE VIEW users_sales_view AS
-- SELECT
--     u.name AS full_name,
--     u.document_number,
--     s.reference,
--     s.date,
--     pa.name payment_method,
--     po.name product,
--     sd.price
-- FROM 
--     sales s 
-- JOIN
--     users u ON s.client_id = u.id,

--     payment_methods pa ON s.payment_method_id = pa.id,
 
--     sale_details sd ON sd.sale_id = s.id,

--     products po ON sd.product_id = po.id



