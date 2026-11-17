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
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY 