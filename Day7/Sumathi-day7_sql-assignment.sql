/*1.     Rank employees by their total sales
(Total sales = Total no of orders handled, JOIN employees and orders table)*/
SELECT
	E.EMPLOYEE_ID,
	CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS EMPLOYEE_NAME,
	O.ORDER_ID,
	RANK() OVER (
		PARTITION BY e.employee_id
		ORDER BY o.order_id
	) AS TOTAL_ORDERS
FROM
	EMPLOYEES E
	RIGHT JOIN ORDERS O ON E.EMPLOYEE_ID = O.EMPLOYEE_ID
	order by employee_id;

/*2.      Compare current order's freight with previous and next order for each customer.
(Display order_id,  customer_id,  order_date,  freight,
Use lead(freight) and lag(freight).*/

SELECT
	ORDER_ID,
	CUSTOMER_ID,
	ORDER_DATE,
	FREIGHT,
	LAG(FREIGHT) OVER (
		ORDER BY
			ORDER_ID
	) AS PREVIOUS_ORDERFREIGHT,
	FREIGHT - LAG(FREIGHT) OVER (
		ORDER BY
			ORDER_ID
	) AS FREIGHT_DIFFERENCES
FROM
	ORDERS;

---- Lead ----

SELECT
	ORDER_ID,
	CUSTOMER_ID,
	ORDER_DATE,
	FREIGHT,
	Lead(FREIGHT) OVER (
		ORDER BY
			ORDER_ID
	) AS Next_orderFreight,
	  FREIGHT -LEAD(FREIGHT) OVER (
		ORDER BY
			ORDER_ID
	) AS FREIGHT_DIFFERENCES
FROM
	ORDERS;

 
/*3.     Show products and their price categories, product count in each category, avg price:
        	(HINT:
·  	Create a CTE which should have price_category definition:
        	WHEN unit_price < 20 THEN 'Low Price'
            WHEN unit_price < 50 THEN 'Medium Price'
            ELSE 'High Price'
·  	In the main query display: price_category,  product_count in each price_category,  ROUND(AVG(unit_price)::numeric, 2) as avg_price)*/
SELECT
	CASE
		WHEN UNIT_PRICE < 20 THEN 'Low Price'
		WHEN UNIT_PRICE < 50 THEN 'Medium Price'
		ELSE 'HIGH price'
	END AS PRICE_CATEGORY,
	COUNT(CATEGORY_ID) AS PRODUCT_COUNT,
	ROUND(AVG(UNIT_PRICE)::NUMERIC, 2) AS AVG_PRICE
FROM
	PRODUCTS
GROUP BY
	PRICE_CATEGORY;

