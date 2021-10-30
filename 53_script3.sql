-- Script 2

-- Use required database
USE 53_assign2db;

-- Query 1
SELECT tripname FROM bustrips WHERE country = "Italy";

-- Query 2
SELECT DISTINCT lastname FROM passengers;

-- Query 3
SELECT * FROM bustrips ORDER BY tripname;

-- Query 4
SELECT tripname, country, startdate FROM bustrips WHERE startdate > "2022/04/30";

-- Query 5
SELECT firstname, lastname, birthdate FROM passports, passengers WHERE passengers.passengerid = passports.passengerid AND passports.countryofcitizenship = "USA";

-- Query 6
SELECT tripname, capacity FROM bustrips JOIN buses ON buses.licenseplatenum = bustrips.licenseplatenum JOIN bookings ON bustrips.tripid = bookings.tripid WHERE startdate > "2022/04/1" AND startdate < "2022/09/1";

-- Query 7
SELECT * FROM passengers JOIN passports ON passports.passengerid = passengers.passengerid WHERE expirydate < ADDDATE(CURDATE(), INTERVAL 1 YEAR);

-- Query 8
SELECT firstname, lastname, tripname FROM bookings JOIN bustrips ON bookings.tripid = bustrips.tripid JOIN passengers ON bookings.passengerid = passengers.passengerid WHERE passengers.lastname LIKE "S%";

-- Query 9
SELECT COUNT(*), tripname, bustrips.tripid FROM bookings JOIN bustrips ON bookings.tripid = bustrips.tripid WHERE bustrips.tripname = "Castles of Germany";

-- Query 10
SELECT country, SUM(tripprice) FROM bustrips JOIN bookings ON bustrips.tripid = bookings.tripid GROUP BY tripname;

-- Query 11
SELECT firstname, lastname, countryofcitizenship, tripname, country FROM bustrips JOIN bookings ON bustrips.tripid = bookings.tripid JOIN passengers ON bookings.passengerid = passengers.passengerid JOIN passports ON passengers.passengerid = passports.passengerid WHERE countryofcitizenship != country;

-- Query 12
SELECT bustrips.tripid, tripname FROM bustrips WHERE bustrips.tripid NOT IN (SELECT bookings.tripid FROM bookings);

-- Query 13
CREATE VIEW passengerpayment AS SELECT firstname, lastname, countryofcitizenship, SUM(tripprice) AS payment FROM passengers JOIN bookings ON passengers.passengerid = bookings.passengerid JOIN passports ON passengers.passengerid = passports.passengerid GROUP BY firstname;
SELECT firstname, lastname, countryofcitizenship, payment FROM passengerpayment WHERE payment = (SELECT MAX(payment) FROM passengerpayment);

-- Query 14
SELECT bustrips.tripname FROM bustrips JOIN bookings ON bustrips.tripid = bookings.tripid GROUP BY tripname HAVING COUNT(*) < 4 ORDER BY COUNT(*) DESC;

-- Query 15
SELECT bustrips.tripname AS "Bus Trip Name", COUNT(*) AS "Current Number of Passengers", buses.capacity AS "Capacity of Assigned Bus", buses.licenseplatenum AS "Current Bus Assigned License Plate" FROM bustrips JOIN bookings ON bustrips.tripid = bookings.tripid JOIN buses ON buses.licenseplatenum = bustrips.licenseplatenum GROUP BY tripname ORDER BY COUNT(*) DESC;
