USE logistics_db;

/* Q 1 */
SELECT DISTINCT d.DriverID, d.Name, d.Rating
FROM Drivers AS d INNER JOIN Rides AS r
ON d.DriverID = r.DriverID
INNER JOIN Riders AS rd
ON r.RiderID = rd.RiderID
WHERE rd.City = 'Lagos'
ORDER BY d.Rating DESC
LIMIT 5;

/* Q 2 */
SELECT rd.RiderID, rd.Name, COUNT(r.RideID) AS RideCount
FROM Riders AS rd INNER JOIN Rides AS r
ON rd.RiderID = r.RiderID
WHERE rd.City = 'Lagos'
GROUP BY rd.RiderID, rd.Name
HAVING COUNT(r.RideID) > 5;

/* Q 3 */
SELECT SUM(r.Fare) AS TotalRevenue
FROM Rides AS r INNER JOIN Riders AS rd
ON r.RiderID = rd.RiderID
WHERE rd.City = 'Lagos';

/* Q 4 */
SELECT r.Area, COUNT(r.RideID) AS RideCount
FROM Rides AS r INNER JOIN Riders AS rd
ON r.RiderID = rd.RiderID
WHERE rd.City = 'Lagos'
AND r.Area IS NOT NULL
GROUP BY r.Area
ORDER BY RideCount DESC
LIMIT 1;

/* Q 5 */
SELECT d.DriverID, d.Name, SUM(r.Fare) AS TotalRevenue
FROM Drivers AS d INNER JOIN Rides AS r
ON d.DriverID = r.DriverID
INNER JOIN Riders AS rd
ON r.RiderID = rd.RiderID
WHERE rd.City = 'Lagos'
GROUP BY d.DriverID, d.Name
ORDER BY TotalRevenue DESC
LIMIT 1;

/* Q 6 */
SELECT RideID, Fare, (SELECT AVG(Fare) FROM Rides) AS AverageFare
FROM Rides
WHERE Fare > 1.5 * (SELECT AVG(Fare) FROM Rides)
OR Fare < 0.5 * (SELECT AVG(Fare) FROM Rides);
