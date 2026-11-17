/*Q 2.17 */
SELECT SKU,SKU_Description 
FROM INVENTORY;

/* Q 2.18 */
SELECT SKU_Description,SKU 
FROM INVENTORY;

/*Q 2.19 */
SELECT WarehouseID 
FROM INVENTORY;

/*Q 2.20 */
SELECT DISTINCT WarehouseID 
FROM INVENTORY;

/* Q 2.21 */
SELECT WarehouseID,SKU,SKU_Description,QuantityOnHand,QuantityOnOrder 
FROM INVENTORY;

/* Q 2.22 */
SELECT * 
FROM INVENTORY;

/* Q 2.23 */
SELECT QuantityOnHand 
FROM INVENTORY 
WHERE QuantityOnHand > 0;

/* Q 2.24 */
SELECT SKU,SKU_Description 
FROM INVENTORY 
WHERE QuantityOnHand = 0;

/* Q 2.25 */
SELECT SKU,SKU_Description,WarehouseID 
FROM INVENTORY 
WHERE QuantityOnHand = 0 
ORDER BY WarehouseID;

/* Q 2.26 */
SELECT SKU,SKU_Description,WarehouseID 
FROM INVENTORY 
WHERE QuantityOnHand = 0 
ORDER BY WarehouseID DESC, SKU ASC;

/* Q 2.27 */
SELECT SKU,SKU_Description,WarehouseID 
FROM INVENTORY 
WHERE QuantityOnHand = 0 
AND QuantityOnOrder > 0 
ORDER BY WarehouseID DESC, SKU ASC;

/* Q 2.28 */
SELECT SKU,SKU_Description,WarehouseID 
FROM INVENTORY 
WHERE QuantityOnHand = 0 
OR QuantityOnOrder > 0 
ORDER BY WarehouseID DESC, SKU ASC;

/* Q 2.29 */
SELECT SKU,SKU_Description,WarehouseID 
FROM INVENTORY 
WHERE QuantityOnHand > 1 
AND QuantityOnHand < 10 ;

/* Q 2.30 */
SELECT SKU,SKU_Description,WarehouseID 
FROM INVENTORY 
WHERE QuantityOnHand BETWEEN 2 AND 9 ;

/* Q 2.31 */
SELECT DISTINCT SKU,SKU_Description 
FROM INVENTORY 
WHERE SKU_Description 
LIKE 'Half-Dome%';

/* Q 2.32 */
SELECT DISTINCT SKU,SKU_Description 
FROM INVENTORY 
WHERE SKU_Description LIKE '%Climb%';

/* Q 2.33 */
SELECT DISTINCT SKU,SKU_Description 
FROM INVENTORY 
WHERE SKU_Description LIKE '__d%';

/* Q 2.34 */
SELECT
COUNT(QuantityOnHand) AS QuantityOnHandCount,
COUNT(*) AS NumberOfRows,
SUM(QuantityOnHand) AS TotalItemsOnHand,
AVG(QuantityOnHand) AS AverageItemsOnHand,
MIN(QuantityOnHand) AS MinQuantityOnHand,
MAX(QuantityOnHand) AS MaxQuantityOnHand
FROM
INVENTORY;

/* Q 2.35 */
-- COUNT(*) counts the number of rows(32) in the Table while SUM gets the total of all the values in the stated column --

/* Q 2.36 */
SELECT 
WarehouseID,
SUM(QuantityOnHand) AS TotalItemsOnHand 
FROM INVENTORY 
GROUP BY WarehouseID 
ORDER BY TotalItemsOnHand DESC;

/* Q 2.37 */
SELECT 
WarehouseID,
SUM(QuantityOnHand) AS TotalItemsOnHandLT3 
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID 
ORDER BY TotalItemsOnHandLT3 DESC;

/* Q 2.38 */
SELECT 
WarehouseID,
SUM(QuantityOnHand) AS TotalItemsOnHandLT3 
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID 
HAVING COUNT(QuantityOnHand) < 2
ORDER BY TotalItemsOnHandLT3 DESC;

/* Q 2.39 */
-- The correct SQL execution order
-- #6+7   SELECT DISTINCT department_id                                 
-- #1     FROM employees                                                
-- #2     JOIN orders ON customers.customer_id = orders.customer_id     
-- #3     WHERE salary > 3000                                          
-- #4     GROUP BY department 
-- #5     HAVING AVG(salary) > 5000 
-- #8     ORDER BY department 
-- #9     LIMIT 10 OFFSET 5 
-- #10    OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY;