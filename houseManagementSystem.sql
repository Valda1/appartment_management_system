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
votingTitle VARCHAR (255),
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
invoiceIssueDate DATE,
invoiceDescription VARCHAR (500),
invoiceSubTotal DOUBLE,
invoiceTax DOUBLE,
invoiceTotalAmount DOUBLE,
invoiceStatus VARCHAR (100),
invoiceDueDate DATE not null,
PRIMARY KEY(invoiceID)
);

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

INSERT INTO invoices ( invoiceNo, invoiceTitle, invoiceCompany, invoiceIssueDate, invoiceDescription, invoiceSubTotal, invoiceTax, invoiceTotalAmount, invoiceStatus, invoiceDueDate)
			VALUE ("INV-4657", "EXPENSES", "ELEKTRUM", "2022-08-09", "Electricity", 85.50, 14.50, 100.00, "PAID", "2022-08-25");
INSERT INTO invoices ( invoiceNo, invoiceTitle, invoiceCompany, invoiceIssueDate, invoiceDescription, invoiceSubTotal, invoiceTax, invoiceTotalAmount, invoiceStatus, invoiceDueDate)
			VALUE ("COM-135", "INCOMES", "Ping SIA", "2022-08-12", " Communal services", 45.50, 12.10, 57.60, "PAID", "2022-08-30");
INSERT INTO invoices ( invoiceNo, invoiceTitle, invoiceCompany, invoiceIssueDate, invoiceDescription, invoiceSubTotal, invoiceTax, invoiceTotalAmount, invoiceStatus, invoiceDueDate)
			VALUE ("COM-136", "INCOMES", "Ping SIA", "2022-08-12", " Communal services", 45.50, 12.10, 57.60, "PAID", "2022-08-30");
INSERT INTO invoices ( invoiceNo, invoiceTitle, invoiceCompany, invoiceIssueDate, invoiceDescription, invoiceSubTotal, invoiceTax, invoiceTotalAmount, invoiceStatus, invoiceDueDate)
			VALUE ("COM-137", "INCOMES", "Ping SIA", "2022-08-12", " Communal services", 45.50, 12.10, 57.60, "PAID", "2022-08-30");
INSERT INTO invoices ( invoiceNo, invoiceTitle, invoiceCompany, invoiceIssueDate, invoiceDescription, invoiceSubTotal, invoiceTax, invoiceTotalAmount, invoiceStatus, invoiceDueDate)
			VALUE ("COM-138", "INCOMES", "Ping SIA", "2022-08-30", "Commercial space rent", 100.00, 25.00, 125.00, "PAID", "2022-09-15");
INSERT INTO invoices ( invoiceNo, invoiceTitle, invoiceCompany, invoiceIssueDate, invoiceDescription, invoiceSubTotal, invoiceTax, invoiceTotalAmount, invoiceStatus, invoiceDueDate)
			VALUE ("INV-6657", "EXPENSES", "ELEKTRUM", "2022-09-10", "Electricity", 90.12, 21.00, 111.12, "UNPAID", "2022-09-25");

INSERT INTO waterMeasurements (coldWaterMeasurementCurrent, coldWaterConsumption, hotWaterMeasurementCurrent, hotWaterConsumption, userID, apartmentNo)
			VALUES (230.00, 4.5, 122.40, 2.4, 2, 1);
INSERT INTO waterMeasurements (coldWaterMeasurementCurrent, coldWaterConsumption, hotWaterMeasurementCurrent, hotWaterConsumption, userID, apartmentNo)
			VALUES (234.5, 4.0, 125.40, 3.00, 2, 1);
INSERT INTO waterMeasurements (coldWaterMeasurementCurrent, coldWaterConsumption, hotWaterMeasurementCurrent, hotWaterConsumption, userID, apartmentNo)
			VALUES (238.50, 4.5, 1274.00, 2.0, 2, 1);
INSERT INTO waterMeasurements (coldWaterMeasurementCurrent, coldWaterConsumption, hotWaterMeasurementCurrent, hotWaterConsumption, userID, apartmentNo)
			VALUES (48.00, 2.5, 67.50, 2.5, 5, 3);
INSERT INTO waterMeasurements (coldWaterMeasurementCurrent, coldWaterConsumption, hotWaterMeasurementCurrent, hotWaterConsumption, userID, apartmentNo)
			VALUES (22.00, 2.5, 31.00, 2.1, 6, 4);
INSERT INTO waterMeasurements (coldWaterMeasurementCurrent, coldWaterConsumption, hotWaterMeasurementCurrent, hotWaterConsumption, userID, apartmentNo)
			VALUES (160.00, 8.00, 128.00, 5.00, 7, 5);
            
INSERT INTO voting (votingTitle, votingStatus) VALUES ("START HEATING SEASON FROM 2022-09-12?", "PASSIVE");
INSERT INTO voting (votingTitle, votingStatus) VALUES ("WOULD YOU LIKE TO RENOVATE HOUSE?", "ACTIVE");
INSERT INTO voting (votingTitle, votingStatus) VALUES ("WILL YOU PARTICIPATE AT HOUSE PARTY ON 23RD SEPTEMBER?", "ACTIVE");
INSERT INTO voting (votingTitle, votingStatus) VALUES ("ARE YOU SORTING WASTE?", "PASSIVE");
INSERT INTO voting (votingTitle, votingAnswer, userID, apartmentNo) VALUES ("ARE YOU SORTING WASTE?", "YES", 2, 1);
INSERT INTO voting (votingTitle, votingAnswer, userID, apartmentNo) VALUES ("ARE YOU SORTING WASTE?", "YES", 5, 3);
INSERT INTO voting (votingTitle, votingAnswer, userID, apartmentNo) VALUES ("ARE YOU SORTING WASTE?", "NO", 6, 4);
INSERT INTO voting (votingTitle, votingAnswer, userID, apartmentNo) VALUES ("ARE YOU SORTING WASTE?", "YES", 7, 5);
INSERT INTO voting (votingTitle, votingAnswer, userID, apartmentNo) VALUES ("WOULD YOU LIKE TO RENOVATE HOUSE", "NO", 2, 1);
INSERT INTO voting (votingTitle, votingAnswer, userID, apartmentNo) VALUES ("WOULD YOU LIKE TO RENOVATE HOUSE", "YES", 5, 3);
INSERT INTO voting (votingTitle, votingAnswer, userID, apartmentNo) VALUES ("WOULD YOU LIKE TO RENOVATE HOUSE", "NO", 6, 4);
INSERT INTO voting (votingTitle, votingAnswer, userID, apartmentNo) VALUES ("WOULD YOU LIKE TO RENOVATE HOUSE", "YES", 7, 5);

INSERT INTO messages (messageTitle, messageStatus, userID) VALUES ("IS IT WARM AT YOUR APPARTMENT?", "ACTIVE", 1);
INSERT INTO messages (messageTitle, messageStatus, userID) VALUES ("SHOULD WE BUY NEW BENCH?", "PASSIVE", 1);
INSERT INTO messages (messageTitle, messageComment, userID, apartmentNo) VALUES ("SHOULD WE BUY NEW BENCH?", "YES", 2, 1);
INSERT INTO messages (messageTitle, messageComment, userID, apartmentNo) VALUES ("SHOULD WE BUY NEW BENCH?", "No, it's too expensive", 5, 3);
INSERT INTO messages (messageTitle, messageComment, userID, apartmentNo) VALUES ("SHOULD WE BUY NEW BENCH?", "But we already have one, it's still fine", 6, 4);
INSERT INTO messages (messageTitle, messageComment, userID, apartmentNo) VALUES ("SHOULD WE BUY NEW BENCH?", "I dont care", 7, 5);
INSERT INTO messages (messageTitle, messageComment, userID, apartmentNo) VALUES ("SHOULD WE BUY NEW BENCH?", "Dont we have more important topics to discuss?", 7, 5);

