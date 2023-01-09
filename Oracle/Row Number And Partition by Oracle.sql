-- Row Number And Partition by Oracle

-- https://www.oracletutorial.com/oracle-analytic-functions/oracle-row_number/
-- https://docs.oracle.com/database/121/SQLRF/functions170.htm#SQLRF06100

WITH cte_products AS (
    SELECT 
        row_number() OVER(
            ORDER BY list_price DESC
        ) row_num, 
        product_name, 
        list_price
    FROM 
        products
)
SELECT * FROM cte_products
WHERE row_num > 30 and row_num <= 40;

WITH cte_products AS (
SELECT 
    row_number() OVER(
        PARTITION BY category_id
        ORDER BY list_price DESC
    ) row_num, 
    category_id,
    product_name, 
    list_price
FROM 
    products
)
SELECT * FROM cte_products
WHERE row_num = 1;

SELECT department_id, first_name, last_name, salary
FROM
(
  SELECT
    department_id, first_name, last_name, salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary desc) rn
  FROM employees
)
WHERE rn <= 3
ORDER BY department_id, salary DESC, last_name;