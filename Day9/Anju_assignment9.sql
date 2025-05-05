--1.      Create AFTER UPDATE trigger to track product price changes

CREATE TABLE product_price_audit (
    audit_id SERIAL PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(40),
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_name VARCHAR(50) DEFAULT CURRENT_USER
);

  CREATE OR REPLACE FUNCTION audit_product_price_change()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO product_price_audit (
        product_id,
        product_name,
        old_price,
        new_price
    )
    VALUES (
        OLD.product_id,
        OLD.product_name,
        OLD.unit_price,
        NEW.unit_price
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Create a row level trigger for below event:
--AFTER UPDATE OF unit_price ON products
--Test the trigger by updating the product price by 10% to any one product_id.

--Create Row-Level Trigger on products Table
CREATE TRIGGER trg_product_price_audit
AFTER UPDATE OF unit_price ON products
FOR EACH ROW
WHEN (OLD.unit_price IS DISTINCT FROM NEW.unit_price)
EXECUTE FUNCTION audit_product_price_change();

--Test the Trigger: Update Price by 10% for a Product
UPDATE products
SET unit_price = unit_price * 1.10
WHERE product_id = 101;

--Verify the Audit Log
SELECT * FROM product_price_audit
WHERE product_id = 101
ORDER BY change_date DESC;


--2.      Create stored procedure  using IN and INOUT parameters to assign tasks to employees

--Create employee_tasks Table
CREATE TABLE IF NOT EXISTS employee_tasks (
    task_id SERIAL PRIMARY KEY,
    employee_id INT,
    task_name VARCHAR(50),
    assigned_date DATE DEFAULT CURRENT_DATE
);


DROP PROCEDURE IF EXISTS assign_task(INT, VARCHAR, INT);

CREATE OR REPLACE PROCEDURE assign_task(
    IN p_employee_id INT,
    IN p_task_name VARCHAR,
    INOUT p_task_count INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employee_tasks (employee_id, task_name)
    VALUES (p_employee_id, p_task_name);

    SELECT COUNT(*) INTO p_task_count
    FROM employee_tasks
    WHERE employee_id = p_employee_id;

    RAISE NOTICE 'Task "%" assigned to employee %. Total tasks: %',
        p_task_name, p_employee_id, p_task_count;
END;
$$;

SELECT proname, pg_get_function_identity_arguments(p.oid) AS args
FROM pg_proc p
JOIN pg_namespace n ON n.oid = p.pronamespace
WHERE proname = 'assign_task' AND prokind = 'p';

DO $$
DECLARE
    task_total INT := 0;
BEGIN
    CALL assign_task(1, 'Review Reports', task_total);
END;
$$;

select * from employee_tasks