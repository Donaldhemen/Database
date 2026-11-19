USE cape_codd;

/* Q 2.40 */
SELECT SKU, SKU_Description, i.WarehouseID, w.WarehouseCity, w.WarehouseState 
FROM INVENTORY AS i, WAREHOUSE AS w
WHERE WarehouseCity = 'Atlanta' OR WarehouseCity = 'Bangor' OR WarehouseCity = 'Chicago';

/* Q 2.41 */
SELECT SKU, SKU_Description, i.WarehouseID, w.WarehouseCity, w.WarehouseState 
FROM INVENTORY AS i, WAREHOUSE AS w
WHERE WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

/* Q 2.42 */
SELECT SKU, SKU_Description, i.WarehouseID, w.WarehouseCity, w.WarehouseState 
FROM INVENTORY AS i, WAREHOUSE AS w
WHERE WarehouseCity != 'Atlanta' AND WarehouseCity != 'Bangor' AND WarehouseCity != 'Chicago';

/* Q 2.43 */
SELECT SKU, SKU_Description, i.WarehouseID, w.WarehouseCity, w.WarehouseState 
FROM INVENTORY AS i, WAREHOUSE AS w
WHERE WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

/* Q 2.44 */
SELECT CONCAT (SKU_Description,' is located in ', WarehouseCity) AS ItemLocation
FROM INVENTORY, WAREHOUSE;

/* Q 2.45 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY 
WHERE WarehouseID IN (SELECT WarehouseID FROM WAREHOUSE WHERE Manager = 'Lucille Smith');

/* Q 2.46 */
SELECT i.SKU, i.SKU_Description, i.WarehouseID
FROM INVENTORY AS i, WAREHOUSE AS w
WHERE i.WarehouseID =  w.WarehouseID
AND w.Manager = 'Lucille Smith';

/* Q 2.47 */
SELECT i.SKU, i.SKU_Description, i.WarehouseID
FROM INVENTORY AS i INNER JOIN WAREHOUSE AS w
ON i.WarehouseID =  w.WarehouseID
WHERE w.Manager = 'Lucille Smith';

/* Q 2.48 */
SELECT WarehouseID, AVG(QuantityOnHand) AS AverageQuantityOnHand   
FROM INVENTORY
WHERE WarehouseID IN (SELECT WarehouseID FROM WAREHOUSE WHERE Manager = 'Lucille Smith')
GROUP BY WarehouseID;

/* Q 2.49 */
SELECT
    i.WarehouseID,
    AVG(i.QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY AS i, WAREHOUSE AS w
WHERE i.WarehouseID = w.WarehouseID
AND w.Manager = 'Lucille Smith'
GROUP BY i.WarehouseID;

/* Q 2.50 */
SELECT
    i.WarehouseID,
    AVG(i.QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY AS i
INNER JOIN WAREHOUSE AS w
ON i.WarehouseID = w.WarehouseID
WHERE w.Manager = 'Lucille Smith'
GROUP BY i.WarehouseID;

/* Q 2.51 */
SELECT
    w.WarehouseID,
    w.WarehouseCity,
    w.WarehouseState,
    w.Manager,
    i.SKU,
    i.SKU_Description,
    i.QuantityOnHand
FROM WAREHOUSE AS w
INNER JOIN INVENTORY AS i
ON w.WarehouseID = i.WarehouseID
WHERE w.Manager = 'Lucille Smith';

/* Q 2.52 */
SELECT
    WarehouseID,
    SUM(QuantityOnOrder) AS TotalItemsOnOrder,
    SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID, QuantityOnOrder;

/* Q 2.53 */
-- A subquery is unnecessary because all the information needed for question 2.52 is already available in the INVENTORY table.
-- A subquery is generally used when a query needs information from another query, such as filtering records based on results from another table.
-- We can perform the calculations directly using SUM() and GROUP BY

/* Q 2.54 */


/* Q 2.55 */
SELECT
    w.WarehouseID,
    w.WarehouseCity,
    w.WarehouseState,
    w.Manager,
    i.SKU,
    i.SKU_Description,
    i.QuantityOnOrder,
    i.QuantityOnHand
FROM WAREHOUSE AS w
LEFT JOIN INVENTORY AS i
ON w.WarehouseID = i.WarehouseID;