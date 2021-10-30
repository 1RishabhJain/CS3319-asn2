-- Script 1
SHOW databases;

-- Create/re-initialize the databases
DROP database IF EXISTS 53_assign2db;
CREATE database 53_assign2db;
USE 53_assign2db;
SHOW tables;

-- Create the passengers, passports, buses, bustrips, and bookings table
CREATE TABLE passengers (passengerid INT NOT NULL, firstname  VARCHAR(20) NOT NULL, lastname  VARCHAR(20) NOT NULL, PRIMARY KEY (passengerid));
CREATE TABLE passports (passportnumber CHAR(4) NOT NULL, countryofcitizenship  VARCHAR(30) NOT NULL, expirydate DATE NOT NULL, birthdate DATE NOT NULL, passengerid INT NOT NULL, FOREIGN KEY(passengerid) REFERENCES passengers(passengerid) ON DELETE CASCADE, PRIMARY KEY (passportnumber));
CREATE TABLE buses (licenseplatenum CHAR(7) NOT NULL, capacity INT NOT NULL, PRIMARY KEY (licenseplatenum));
CREATE TABLE bustrips (tripid INT NOT NULL, tripname VARCHAR(50) NOT NULL, startdate DATE NOT NULL, enddate DATE NOT NULL, country VARCHAR(30) NOT NULL, licenseplatenum CHAR(7) NOT NULL, FOREIGN KEY(licenseplatenum) REFERENCES buses(licenseplatenum), PRIMARY KEY (tripid));
CREATE TABLE bookings (tripprice DECIMAL(10,2) NOT NULL, tripid INT NOT NULL, passengerid INT NOT NULL, FOREIGN KEY(tripid) REFERENCES bustrips(tripid), FOREIGN KEY(passengerid) REFERENCES passengers(passengerid) ON DELETE CASCADE);
SHOW tables;
