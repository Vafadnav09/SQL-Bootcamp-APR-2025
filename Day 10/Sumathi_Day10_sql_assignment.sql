/*1.	Write  a function to Calculate the total stock value for a given category:
(Stock value=ROUND(SUM(unit_price * units_in_stock)::DECIMAL, 2)
Return data type is DECIMAL(10,2) */
CREATE OR REPLACE FUNCTION get_total_cost(p_product_id INT)
RETURNS DECIMAL(10,2)
LANGUAGE plpgsql
AS $$ 
DECLARE 
v_stock_value DECIMAL(10,2);
BEGIN
SELECT 
ROUND(SUM(unit_price * units_in_stock)::DECIMAL, 2)
INTO v_stock_value
FROM products p
WHERE p.Product_id = p_product_id ;	

RETURN v_stock_value;

END;
$$;

SELECT get_total_cost (10);

select product_id from products

----2.Try writing a   cursor query which I executed in the training

Create OR REPLACE procedure update_price_with_curson()
LANGUAGE plpgsql
AS $$ 
DECLARE 
product_cursor CURSOR FOR 
SELECT product_id, product_name,unit_price, units_in_stock
FROM products 
WHERE discontinued =0;

product_record RECORD;
v_new_price Decimal(10,2);

BEGIN 

OPEN product_cursor;

LOOP 

--fetch the next row
FETCH product_cursor INTO product_record;

---exit when no more rows to fetch
EXIT WHEN NOT FOUND;

---calculate new unit price
IF product_record.units_in_stock < 10 THEN 
v_new_price := product_record.unit_price * 1.1; --10% increase 
ELSE 
v_new_price := product_record.unit_price * 0.95 ;---5% Decrese
END IF;

---update product 
UPDATE products
SET unit_price = ROUND(v_new_price, 2)
WHERE product_id = product_record.product_ID;

RAISE NOTICE 'Updated % price from % to % ',
product_record.product_name,
product_record.unit_price,
v_new_price;
END LOOP;

CLOSE product_cursor;
END;
$$;

--To execute 
CALL update_price_with_curson();

SELECT * FROM products
