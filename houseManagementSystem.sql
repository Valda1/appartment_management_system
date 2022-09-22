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
apartmentNo int,
userType varchar(10) not null,
firstName varchar(50) not null,
lastName varchar(50) not null,
password varchar(50) not null,
email varchar(50) not null,
phoneNumber int not null,
PRIMARY KEY(userID),
FOREIGN KEY(apartmentNo) REFERENCES apartments(apartmentID)
);

INSERT INTO users (userType, firstName, lastName, password, email, phoneNumber) VALUES ("MANAGER","John", "Smith", "johnsmith", "john@gmail.com", 22763999);
INSERT INTO users (apartmentNo, userType, firstName, lastName, password, email, phoneNumber) VALUES (1, "OWNER", "Valda", "Bimbirule", "valdab", "valda@gmail.com", 22673344);
INSERT INTO users (apartmentNo, userType, firstName, lastName, password, email, phoneNumber) VALUES (2, "OWNER", "Peter", "White", "peterwhite", "peter@inbox.lv", 28555668);
INSERT INTO users (apartmentNo, userType, firstName, lastName, password, email, phoneNumber) VALUES (2, "OWNER", "Marta", "White", "martawhite", "marta@inbox.lv", 22997822);
INSERT INTO users (apartmentNo, userType, firstName, lastName, password, email, phoneNumber) VALUES (3, "OWNER", "Izabella", "Petrova", "izabella", "petrova@mail.com", 28886621);
INSERT INTO users (apartmentNo, userType, firstName, lastName, password, email, phoneNumber) VALUES (4, "OWNER", "David", "Smart", "davidsmart", "david@gmail.com", 68988855);
INSERT INTO users (apartmentNo, userType, firstName, lastName, password, email, phoneNumber) VALUES (5, "OWNER", "Anna", "Liepa", "annaliepa", "anna.liepa@gmail.com", 64422246);
INSERT INTO users (apartmentNo, userType, firstName, lastName, password, email, phoneNumber) VALUES (6, "OWNER", "Maria", "Kowalska", "mariak", "kowalska@mail.net", 22777665);
INSERT INTO users (apartmentNo, userType, firstName, lastName, password, email, phoneNumber) VALUES (6, "OWNER", "Jakub", "Kowalski", "jakubk", "jakub@mail.net", 66234489);
INSERT INTO users (apartmentNo, userType, firstName, lastName, password, email, phoneNumber) VALUES (7, "OWNER", "Anna", "Johnson", "annajohnson", "anna.j@gmail.com", 63335498);

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

CREATE TABLE IF NOT EXISTS waterMeasurements(
measurementID int not null AUTO_INCREMENT,
coldWaterMeasurementCurrent DOUBLE not null,
coldWaterConsumption DOUBLE not null,
hotWaterMeasurementCurrent DOUBLE not null,
hotWaterConsumption DOUBLE not null,
submitAt TIMESTAMP default current_timestamp,
userID int,
apartmentNo int,
PRIMARY KEY(measurementID),
FOREIGN KEY(userID) REFERENCES users(userID),
FOREIGN KEY(apartmentNo) REFERENCES apartments(apartmentID)
);

CREATE TABLE IF NOT EXISTS voting(
votingID int not null AUTO_INCREMENT,
votingTitle VARCHAR (255) not null,
votingAnswer VARCHAR (100),
votingStatus VARCHAR (100),
votingAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
userID int,
apartmentNo int,
PRIMARY KEY(votingID),
FOREIGN KEY(userID) REFERENCES users(userID),
FOREIGN KEY(apartmentNo) REFERENCES apartments (apartmentID)
);

CREATE TABLE IF NOT EXISTS messages(
messageID int not null AUTO_INCREMENT,
messageTitle VARCHAR (500),
messageStatus VARCHAR (100),
messageComment VARCHAR (700), 
commentOnMessageID int,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
userID int,
apartmentNo int,
PRIMARY KEY(messageID),
FOREIGN KEY(userID) REFERENCES users(userID),
FOREIGN KEY(apartmentNo) REFERENCES apartments (apartmentID)
);

CREATE TABLE IF NOT EXISTS invoices(
invoiceID int not null AUTO_INCREMENT,
invoiceNo VARCHAR (100),
invoiceTitle VARCHAR (255),
invoiceCompany VARCHAR (255),
invoiceIssueDate VARCHAR (100),
invoiceDescription VARCHAR (500),
invoiceSubTotal DOUBLE,
invoiceTax DOUBLE,
invoiceTotalAmount DOUBLE,
invoiceStatus VARCHAR (100),
invoicePaidOn VARCHAR (100),
PRIMARY KEY(invoiceID)
);

SELECT * FROM users;
SELECT * FROM waterMeasurements;
SELECT * FROM voting;
SELECT * FROM messages;
SELECT * FROM invoices;

DELETE FROM users WHERE firstName = 'John' AND lastName = 'Smith' AND apartmentNo = 1;


