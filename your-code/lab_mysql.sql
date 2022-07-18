
CREATE DATABASE lab_mysql;
USE lab_mysql;
CREATE TABLE cars (VIN VARCHAR(30), manufacturer VARCHAR(20), model VARCHAR(20),
       Year YEAR, color VARCHAR(20));
CREATE TABLE customers (customer_id INT, customername VARCHAR(20), phone VARCHAR(30), email VARCHAR(20), address VARCHAR(100), city VARCHAR(20), state VARCHAR(20), country VARCHAR(20)
, zip INT);
CREATE TABLE salesperson (staff_id INT, staffname VARCHAR(20), store VARCHAR(20));
CREATE TABLE invoices (invoicesnr INT, ivdate DATE, car VARCHAR(20), customername VARCHAR(20), staff_id INT);
SET sql_mode = "NO_AUTO_VALUE_ON_ZERO";
INSERT INTO cars(VIN, manufacturer, model, Year, color)
VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue') ,
('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Silver');
-- INSERT INTO salesperson(staff_id)
INSERT INTO customers(customer_id, customername, phone, email, address, city, state, country, zip)
VALUES ('10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
('20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),
('30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');
INSERT INTO salesperson(staff_id, staffname, store)
VALUES ('00001','Petey Cruiser', 'Madrid'),
('00002','Anna Sthesia', 'Barcelona'),
('00003','Paul Molive', 'Berlin'),
('00004','PGail Forcewind', 'Paris'),
('00005','Paige Turner', 'Mimia'),
('00006','Bob Frapples', 'Mexico City'),
('00007','Walter Melon', 'Amsterdam'),
('00008','Shonda Leer', 'São Paulo');
INSERT INTO invoices(invoicesnr, ivdate, car, customername, staff_id)
VALUES ('852399038','2018-08-22', '0', '1','3'),
('731166526','2018-12-31', '3', '0','5'),
('271135104','2019-01-22', '2', '2','7');


