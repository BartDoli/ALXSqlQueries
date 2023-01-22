CREATE PROCEDURE update_cart_price
    @product_id INT,
    @cart_id INT
AS
BEGIN
    DECLARE @product_price DECIMAL(10, 2)
    SELECT @product_price = p.cost FROM Product p WHERE p.id = @product_id

    UPDATE Cart 
    SET @product_price = @product_price + @product_price
    WHERE id = @cart_id
END
