CREATE DATABASE IF NOT EXISTS JAVA_house_management_system;
DROP DATABASE IF EXISTS JAVA_house_management_system;

USE JAVA_house_management_system;

CREATE TABLE IF NOT EXISTS apartments(
apartmentID int not null auto_increment,
apartmentNo int not null,
sqm double not null,
floorNo int not null,
roomCount int not null,
PRIMARY KEY(apartmentID)
);

CREATE TABLE IF NOT EXISTS users(
userID int not null auto_increment,
apartmentID int,
userType varchar(10) not null,
firstName varchar(50) not null,
lastName varchar(50) not null,
password varchar(50) not null,
email varchar(50) not null,
phoneNumber int not null,
PRIMARY KEY(userID),
FOREIGN KEY(apartmentID) REFERENCES apartments(apartmentID)
);

DROP TABLE IF EXISTS apartments;
SELECT * FROM users;
SELECT * FROM apartments;
SELECT * FROM users WHERE userType = 'manager' && userID = 1;
SELECT userType FROM users WHERE userID = 1;

INSERT INTO users (userType, firstName, lastName, password, email, phoneNumber) VALUES ("manager","John", "Smith", "john", "john@gmail.com", 555);

INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (1, 29.00, 1, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (2, 29.00, 1, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (3, 29.00, 1, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (4, 29.00, 2, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (5, 29.00, 2, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (6, 29.00, 2, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (7, 29.00, 3, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (8, 29.00, 3, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (9, 29.00, 3, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (10, 29.00, 4, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (11, 29.00, 4, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (12, 29.00, 4, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (13, 29.00, 5, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (14, 29.00, 5, 2);
INSERT INTO apartments (apartmentNo, sqm, floorNo, roomCount) VALUES (15, 29.00, 5, 2);

INSERT INTO users (apartmentID, userType, firstName, lastName, password, email, phoneNumber) VALUES (1, "owner","Peter", "White", "peter", "peter@gmail.com", 444);
