Select* from orders
Select* from employees

-- Qn 7) List all orders with employee full names. (Inner join)

-- Add column to add the full_name 
ALTER TABLE employees
ADD COLUMN full_name VARCHAR(40)

--Update the full_name column
UPDATE employees
SET full_name = concat(first_name,' ',last_name)
WHERE full_name is NULL

--List all the orders with employee full name
SELECT o.order_id ,e.full_name AS Employee_full_name
from orders o
INNER JOIN 
employees e
ON o.employee_id = e.employee_id 
