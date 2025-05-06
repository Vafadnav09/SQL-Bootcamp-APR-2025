-----------------------Day 10 Assignment--------------------------

1.	--Write  a function to Calculate the total stock value for a given category:
--(Stock value=ROUND(SUM(unit_price * units_in_stock)::DECIMAL, 2)
--Return data type is DECIMAL(10,2)

CREATE OR REPLACE FUNCTION get_stock_value_by_category(
    p_category_id INT
)
RETURNS DECIMAL(10,2)
LANGUAGE plpgsql
AS $$
DECLARE
    v_stock_value DECIMAL(10,2);
BEGIN
    SELECT ROUND(SUM(unit_price * units_in_stock)::DECIMAL, 2)
    INTO v_stock_value
    FROM products
    WHERE category_id = p_category_id;

    RETURN COALESCE(v_stock_value, 0.00);
END;
$$;

SELECT get_stock_value_by_category(7);

select *from products where category_id =7

select count(*), unit_price , units_in_stock 
from products 
where category_id =7
group by unit_price , units_in_stock ;
