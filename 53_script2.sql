-- Script 2

-- Use required database
USE 53_assign2db;

-- Run select commands to show the empty tables
SELECT * FROM passengers;
SELECT * FROM passports;
SELECT * FROM bustrips;
SELECT * FROM buses;

-- Load bus data from external file
LOAD DATA LOCAL INFILE '/home/centos/rjain57/assignment2/loaddatafall2021.txt' INTO TABLE buses FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

-- Show newly loaded data
SELECT * FROM buses;

-- Insert Passenger Information
INSERT INTO passengers VALUES ("11", "Homer", "Simpson");
INSERT INTO passengers VALUES ("22", "Marge", "Simpson");
INSERT INTO passengers VALUES ("33", "Bart", "Simpson");
INSERT INTO passengers VALUES ("34", "Lisa", "Simpson");
INSERT INTO passengers VALUES ("35", "Maggie", "Simpson");
INSERT INTO passengers VALUES ("44", "Ned", "Flanders");
INSERT INTO passengers VALUES ("45", "Todd", "Flanders");
INSERT INTO passengers VALUES ("66", "Heidi", "Klum");
INSERT INTO passengers VALUES ("77", "Michael", "Scott");
INSERT INTO passengers VALUES ("78", "Dwight", "Schrute");
INSERT INTO passengers VALUES ("79", "Pam", "Beesly");
INSERT INTO passengers VALUES ("80", "Creed", "Bratton");
INSERT INTO passengers VALUES ("99", "Jake", "Peralta");
SELECT * FROM passengers;

-- Insert Passport Information
INSERT INTO passports VALUES("US10", "USA", "2025/01/01", "1970/02/19", "11");
INSERT INTO passports VALUES("US12", "USA", "2025/01/01", "1972/08/12", "22");
INSERT INTO passports VALUES("US13", "USA", "2025/01/01", "2001/05/12", "33");
INSERT INTO passports VALUES("US14", "USA", "2025/01/01", "2004/03/19", "34");
INSERT INTO passports VALUES("US15", "USA", "2025/01/01", "2012/09/17", "35");
INSERT INTO passports VALUES("US22", "USA", "2030/04/04", "1950/06/11", "44");
INSERT INTO passports VALUES("US23", "USA", "2018/03/03", "1940/06/24", "45");
INSERT INTO passports VALUES("GE11", "Germany", "2027/01/01", "1970/07/12", "66");
INSERT INTO passports VALUES("US88", "Canada", "2030/02/13", "1979/04/25", "77");
INSERT INTO passports VALUES("US89", "Canada", "2022/02/02", "1976/04/08", "78");
INSERT INTO passports VALUES("US90", "Italy", "2020/02/28", "1980/04/04", "79");
INSERT INTO passports VALUES("US91", "Germany", "2030/01/01", "1959/02/02", "80");
INSERT INTO passports VALUES("US99", "USA", "2032/10/18", "1978/09/18", "99");
SELECT * FROM passports;

-- Insert Bus Trip Information
INSERT INTO bustrips VALUES("1", "Castles of Germany", "2022/1/1", "2022/1/17", "Germany", "VAN1111");
INSERT INTO bustrips VALUES("2", "Tuscany Sunsets", "2022/3/3", "2022/3/14", "Italy", "TAXI222");
INSERT INTO bustrips VALUES("3", "California Wines", "2022/5/5", "2022/5/10", "USA", "VAN2222");
INSERT INTO bustrips VALUES("4", "Beaches Galore", "2022/4/4", "2022/4/14", "Bermuda", "TAXI222");
INSERT INTO bustrips VALUES("5", "Cottage Country", "2022/6/1", "2022/6/22", "Canada", "CAND123");
INSERT INTO bustrips VALUES("6", "Arrivaderci Roma", "2022/7/5", "2022/7/15", "Italy", "TAXI111");
INSERT INTO bustrips VALUES("7", "Shetland and Orkney", "2022/9/9", "2022/9/29", "UK", "TAXI111");
INSERT INTO bustrips VALUES("8", "Disney World and Sea World", "2022/6/10", "2022/6/20", "USA", "VAN2222");
INSERT INTO bustrips VALUES("9", "Punta Cana", "2022/5/1", "2022/5/15", "Dominican Republic", "VAN2222");
INSERT INTO bustrips VALUES("10", "Middlesex College Room 110", "2021/09/13", "2022/12/12", "Canada", "VAN2222");
SELECT * FROM bustrips;

-- Insert Booking Information
INSERT INTO bookings VALUES("500", "1", "11");
INSERT INTO bookings VALUES("500", "1", "22");
INSERT INTO bookings VALUES("200", "1", "33");
INSERT INTO bookings VALUES("200", "1", "34");
INSERT INTO bookings VALUES("200", "1", "35");
INSERT INTO bookings VALUES("600.99", "1", "66");
INSERT INTO bookings VALUES("400", "8", "44");
INSERT INTO bookings VALUES("200", "8", "45");
INSERT INTO bookings VALUES("600", "4", "78");
INSERT INTO bookings VALUES("600", "4", "80");
INSERT INTO bookings VALUES("550", "1", "78");
INSERT INTO bookings VALUES("300", "8", "33");
INSERT INTO bookings VALUES("300", "8", "34");
INSERT INTO bookings VALUES("600", "6", "11");
INSERT INTO bookings VALUES("600", "6", "22");
INSERT INTO bookings VALUES("100", "6", "33");
INSERT INTO bookings VALUES("100", "6", "34");
INSERT INTO bookings VALUES("100", "6", "35");
INSERT INTO bookings VALUES("300", "7", "11");
INSERT INTO bookings VALUES("400", "7", "44");
INSERT INTO bookings VALUES("500", "7", "77");
INSERT INTO bookings VALUES("7306.60", "10", "99");
SELECT * FROM bookings;

-- Update Entries
SELECT * FROM passports, passengers WHERE passengers.passengerid = passports.passengerid;
UPDATE passports JOIN passengers ON passports.passengerid = passengers.passengerid SET passports.countryofcitizenship = "Germany" WHERE passengers.firstname = "Dwight" AND passengers.lastname = "Schrute";
SELECT * FROM passports, passengers WHERE passengers.passengerid = passports.passengerid;
SELECT * FROM bustrips;
UPDATE bustrips SET licenseplatenum = "VAN1111" WHERE country = "USA";
SELECT * FROM bustrips;
