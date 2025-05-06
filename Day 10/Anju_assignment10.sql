--Write  a function to Calculate the total stock value for a given category:

CREATE OR REPLACE FUNCTION get_total_stock_value(p_category_id INT)
RETURNS DECIMAL(10,2)
LANGUAGE plpgsql
AS $$
DECLARE
	v_total_value DECIMAL(10,2);
BEGIN
	SELECT ROUND(SUM(unit_price*units_in_stock)::DECIMAL,2)
	INTO v_total_value
	FROM products
	WHERE category_id = p_category_id;

	RETURN v_total_value;
END;
$$

SELECT get_total_stock_value(3);


--Try writing a   cursor query

--Create a cursor based function
CREATE OR REPLACE FUNCTION calculate_stock_cursor(p_category_id INT)
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE 	
	product_cursor CURSOR FOR
	SELECT product_name,unit_price,units_in_stock
	FROM products
	WHERE category_id = p_category_id;
rec RECORD;
v_stock_value DECIMAL(10,2);
BEGIN 	
	OPEN product_cursor;

	LOOP
		FETCH product_cursor INTO rec;
		EXIT WHEN NOT FOUND;

		v_stock_value :=ROUND((rec.unit_price *rec.units_in_stock)::NUMERIC,2);
		RAISE NOTICE 'Product: %, Stock Value: %,Category_id: %', rec.product_name, v_stock_value,p_category_id;
	END LOOP;	
	CLOSE product_cursor;
END;
$$
SELECT calculate_stock_cursor(5);




		