CREATE DATABASE Shop

USE Shop
go

CREATE TABLE product 
(
    id INT PRIMARY KEY,
    name VARCHAR(255),
    cost DECIMAL(10,2)
)

CREATE TABLE costumer 
(
    id INT PRIMARY KEY,
    address VARCHAR(255),
    login VARCHAR(255),
    password VARCHAR(255),
    discount DECIMAL(10,2)
)

CREATE TABLE cart 
(
    id INT PRIMARY KEY,
    costumer_id INT,
    FOREIGN KEY (costumer_id) REFERENCES costumer(id)
)

ALTER TABLE cart ADD price DECIMAL(10, 2)

CREATE TABLE single_unit 
(
    position INT,
    product_id INT,
    cart_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (cart_id) REFERENCES cart(id)
)


-- insert into product list 
INSERT INTO product (id, name, cost) VALUES (1, 1, 9.99);
INSERT INTO product (id, name, cost) VALUES (2, 2, 19.99);
INSERT INTO product (id, name, cost) VALUES (3, 3, 29.99);
INSERT INTO product (id, name, cost) VALUES (4, 4, 39.99);

INSERT INTO product (id, name, cost) VALUES (5, 'mleko', 3.99);


-- show product table
SELECT id, name, cost FROM product;


-- add to certain table
INSERT INTO cart (id, costumer_id) VALUES (1, 1);
INSERT INTO costumer (id, address, login, password, discount) VALUES (1, 'Warsaw' , 'Adam123', 'kot12345', 0)


-- show costumer 
SELECT costumer.*
FROM costumer
JOIN cart ON costumer.id = cart.costumer_id
WHERE cart.id = 1


-- update table values
UPDATE costumer SET address = 'new address', login = 'new_login' WHERE id = 1;

-- add to cart 
INSERT INTO single_unit (product_id, cart_id, position) VALUES (1, 1, 1);
INSERT INTO single_unit (product_id, cart_id, position) VALUES (5, 1, 4);


-- delete from table
DELETE FROM single_unit WHERE product_id = 1 AND cart_id = 1;

--delete only certain amount from table
DELETE FROM single_unit WHERE product_id = 1 AND cart_id = 1 ORDER BY id LIMIT 2;

---------------------- stored procedure -----------------------------

-- execute stored procedure to update the cart final price
EXEC update_cart_price @product_id = 2, @cart_id = 1


-- check if procedure is created and then deletes it
IF OBJECT_ID('update_cart_price', 'P') IS NOT NULL 
BEGIN
    DROP PROCEDURE update_cart_price
END

------------------------- Show cart -------------------------

-- show cart with final price of the stored products
SELECT cart.id, cart.costumer_id, SUM(product.cost) as final_price
FROM cart
JOIN single_unit ON cart.id = single_unit.cart_id
JOIN product ON single_unit.product_id = product.id
GROUP BY cart.id, cart.costumer_id

-- show cart, products list in cart
SELECT product.name, product.cost 
FROM product
JOIN single_unit ON product.id = single_unit.product_id
JOIN cart ON single_unit.cart_id = cart.id
WHERE cart.id = 1

-- show cart with costumer info
SELECT product.name, product.cost, single_unit.position, cart.costumer_id, costumer.address, costumer.discount
FROM product
JOIN single_unit ON product.id = single_unit.product_id
JOIN cart ON single_unit.cart_id = cart.id
JOIN costumer ON cart.costumer_id = costumer.id

-- show cart with products, count and final price
SELECT cart.id, cart.costumer_id, product.name, COUNT(single_unit.product_id) as count, SUM(product.cost) as final_price
FROM cart
JOIN single_unit ON cart.id = single_unit.cart_id
JOIN product ON single_unit.product_id = product.id
GROUP BY cart.id, cart.costumer_id, product.name
