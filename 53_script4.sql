-- Script 4
USE 53_assign2db;
CREATE VIEW tripdetails AS SELECT firstname, lastname, tripname, country, tripprice FROM passengers JOIN bookings ON passengers.passengerid = bookings.passengerid JOIN bustrips ON bustrips.tripid = bookings.tripid;
SELECT * FROM tripdetails;
SELECT * FROM tripdetails WHERE tripname = "Castles of Germany" ORDER BY tripprice DESC;
SELECT * FROM buses;
DELETE FROM buses WHERE licenseplatenum LIKE "%UWO%";
SELECT * FROM buses;
SELECT * FROM passports;
SELECT * FROM passengers;
DELETE FROM passports WHERE passports.countryofcitizenship = "Canada";
SELECT * FROM passports;
-- The reason why the info for passengers with Canadian passports is not deleted from passengers table is because we do not have ON DELETE CASCASE on passport
SELECT * FROM bustrips;
DELETE FROM bustrips WHERE bustrips.tripname = "California Wines";
SELECT * FROM bustrips;
DELETE FROM bustrips WHERE bustrips.tripname = "Arrivaderci Roma";
-- The above delete command does not work since it still has bookings for other passengers. Trip cannot be deleted if it is still being refrenced elsewhere.
SELECT * FROM passengers;
DELETE FROM passengers WHERE passengers.firstname = "Pam";
SELECT * FROM passengers;
SELECT * FROM tripdetails;
DELETE FROM passengers WHERE passengers.lastname = "Simpson";
SELECT * FROM tripdetails;
