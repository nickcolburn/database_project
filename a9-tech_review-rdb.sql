-- Assignment 9 - Tech Review Relational Database
-- Authors: Nick Colburn
-- George Gutierrez
-- Joao Leite

DROP TABLE Reviews;
DROP TABLE Users;
DROP TABLE Sales;
DROP TABLE Supports;
DROP TABLE Internals;
DROP TABLE Devices;
DROP TABLE Software;
DROP TABLE Carriers;
DROP TABLE Countries;
DROP TABLE Components;
DROP TABLE Retailers;
DROP TABLE Manufacturers;


CREATE TABLE Manufacturers
(
        name		VARCHAR(20) NOT NULL,
        CONSTRAINT mfctr_pk PRIMARY KEY(name) -- there is only 1 attribute in this table so it can serve as the PK
);

CREATE TABLE Retailers
(
	name 		VARCHAR(20) NOT NULL,
        region 		VARCHAR(20) NOT NULL,
        CONSTRAINT retailers_pk PRIMARY KEY(name, region) -- both name+region will be the PK to distinguish any retailers with the same name in different regions
);

CREATE TABLE Components
(
        comp_id 	INTEGER NOT NULL AUTO_INCREMENT, 	-- surrogate key introduced to make database easier to manage
        name 		VARCHAR(20),
        comp_type 	VARCHAR(20), 				-- component type (type must be an SQL keyword)
        specification 	VARCHAR(20),
        CONSTRAINT	retailers_pk PRIMARY KEY(comp_id) 	-- comp_id is a surrogate key
);


CREATE TABLE Countries
(
        country_code 	CHAR(3) NOT NULL,
        name 		VARCHAR(20),
        CONSTRAINT 	countries_pk PRIMARY KEY(country_code), -- country code is shorter than country name, so it should be used as PK
	CONSTRAINT	countries_ck UNIQUE(name)
);

CREATE TABLE Carriers
(
        name 		VARCHAR(20) NOT NULL, -- assumption: no two carriers will share the same name
        radio_spectrum 	VARCHAR(10),
        CONSTRAINT 	carriers_pk PRIMARY KEY(name) -- carrier name is enough to uniquely identify each tuple
);

CREATE TABLE Software
(
        name 		VARCHAR(20) NOT NULL,
        version 	VARCHAR(20) NOT NULL, -- assumption: version number will be in XX.X format or named
        CONSTRAINT 	software_pk PRIMARY KEY(name, version) -- name and version must be used because there may be several iterations of software with the same name. 
);
  
CREATE TABLE Devices
(
        dev_id 		INTEGER NOT NULL AUTO_INCREMENT,
        name 		VARCHAR(20),
        model_number 	VARCHAR(20),
        listed_price 	DECIMAL(5,2), 	-- assumption: listed price is full retail price
        manufacturer 	VARCHAR(20), 	-- FK from Manufacturers
        software_name 	VARCHAR(20), 	-- FK from Software
        version 	VARCHAR(20),	-- FK software version from Software
        weight 		DECIMAL(3,2), 	-- assumption: weight given is in ounces
        release_date 	DATE,
        height 		DECIMAL(5,1), 	-- assumption: values are in millimeters
        width 		DECIMAL(3,1), 	-- assumption: values are in millimeters
        depth 		DECIMAL(3,1),	-- assumption: values are in millimeters
        CONSTRAINT devices_pk PRIMARY KEY(dev_id), -- dev_id is a surrogate key
        CONSTRAINT devices_mfctr_fk FOREIGN KEY(manufacturer) REFERENCES Manufacturers(name) ON UPDATE CASCADE ON DELETE RESTRICT,
        CONSTRAINT devices_software_fk FOREIGN KEY(software_name, version) REFERENCES Software(name, version) ON UPDATE CASCADE ON DELETE RESTRICT,
        CONSTRAINT devices_ck UNIQUE(name, model_number)
);

CREATE TABLE Internals
(
        dev_id 		INTEGER NOT NULL, -- FK from Devices
        comp_id 	INTEGER NOT NULL, -- FK from Components
        CONSTRAINT 	dc_pk PRIMARY KEY(dev_id, comp_id),
        CONSTRAINT 	dc_devices_fk FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT 	dc_components_fk FOREIGN KEY(comp_id) REFERENCES Components(comp_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Supports
(
        dev_id 		INTEGER NOT NULL, 	-- FK from Devices
        carrier 	VARCHAR(20) NOT NULL, 	-- FK from Carriers
        country 	CHAR(3) NOT NULL, 	-- FK from Countries
        CONSTRAINT 	supports_PK PRIMARY KEY(dev_id, carrier, country),
        CONSTRAINT 	supports_device_fk FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT 	supports_carrier_fk FOREIGN KEY(carrier) REFERENCES Carriers(name) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT 	supports_country_fk FOREIGN KEY(country) REFERENCES Countries(country_code) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Sales
(
        retailer 	VARCHAR(20) NOT NULL, 	-- FK from Retailers
        dev_id 		INTEGER NOT NULL, 	-- FK from Devices
        sale_price 	DECIMAL(5,2) NOT NULL,
        CONSTRAINT 	sales_pk PRIMARY KEY(dev_id, retailer),
        CONSTRAINT 	sales_device_fk FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT 	sales_retailer_fk FOREIGN KEY(retailer) REFERENCES Retailers(name) ON UPDATE CASCADE ON DELETE CASCADE
        
);

CREATE TABLE Users
(
        username 	VARCHAR(20) NOT NULL, -- assumption: usernames in the database must be unique
        first_name 	VARCHAR(20),
        last_name 	VARCHAR(20),
        CONSTRAINT 	users_pk PRIMARY KEY(username) -- usernames are unique and so can serve as the PK
);

CREATE TABLE Reviews
(
        dev_id 		INTEGER NOT NULL, 	-- FK from Devices
        username 	VARCHAR(20) NOT NULL, 	-- FK from Users
        rating 		DECIMAL(2,1), 		-- users can give partial ratings
        review 		VARCHAR(1000), 		-- need to determine appropriate size for this
        CONSTRAINT 	reviews_pk PRIMARY KEY(dev_id, username),
        CONSTRAINT 	reviews_device_fk FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE RESTRICT,
        CONSTRAINT 	reviews_user_fk FOREIGN KEY(username) REFERENCES Users(username) ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO Manufacturers(name) VALUES
        ('Samsung'),
        ('Apple'),
        ('Motorola'),
        ('LG'),
        ('HTC');

INSERT INTO Retailers(name, region) VALUES
        ('Best Buy', 'North America'),
        ('Radioshack', 'North America'),
        ('Amazon', 'North America'),
        ('Costco', 'North America'),
        ('Apple', 'North America');
        
INSERT INTO Components(name, comp_type) VALUES
        ('13 MP', 'camera'),
        ('2600 mAh Lithium Ion', 'Battery'),
        ('HD Super AMOLED', 'Screen'),
        ('2 GB LPDDR3', 'Memory'),
        ('Snapdragon 600', 'CPU');

INSERT INTO Countries(country_code, name) VALUES
        ('AUS', 'Australia'),
        ('AUT', 'Austria'),
        ('BRA', 'Brazil'),
        ('CAN', 'Canada'),
        ('CHL', 'Chile'),
        ('CHN', 'China'),
        ('COL', 'Colombia'),
        ('DEU', 'Germany'),
        ('FRA', 'France'),
        ('GBR', 'United Kingdom'),
        ('GRC', 'Greece'),
        ('HKG', 'Hong Kong'),
        ('IND', 'India'),
        ('IRL', 'Ireland'),
        ('ITA', 'Italy'),
        ('JPN', 'Japan'),
        ('MEX', 'Mexico'),
        ('NLD', 'Netherlands'),
        ('NZL', 'New Zealand'),
        ('PHL', 'Phillipines'),
        ('PRI', 'Puerto Rico'),
        ('SGP', 'Singapore'),
        ('SWE', 'Sweden'),
        ('USA', 'United States');

INSERT INTO Carriers(name, radio_spectrum) VALUES
        ('Verizon Wireless', 'CDMA'),
        ('Sprint', 'CDMA'),
        ('AT&T', 'GSM'),
        ('T-Mobile', 'GSM'),
        ('Virgin Mobile', 'CDMA'),
        ('Rogers Wireless', 'GSM'),
        ('Telus Mobility', 'CDMA'),
        ('Bell Wireless', 'CDMA'),
        ('America Movil', 'tbd'),
        ('Telefonica', 'tbd'),
        ('Orange', 'tbd'),
        ('MTS', 'tbd'),
        ('BSNL', 'tbd');
        

INSERT INTO Software(name, version) VALUES
        ('Android', 'KitKat'),
        ('Android', 'Jelly Bean'),
        ('Android', 'Ice Cream Sandwich'),
        ('iOS', '7.0'),
        ('iOS', '6.0');

INSERT INTO Devices(name, model_number, listed_price, release_date, weight, height, width, depth) VALUES
        ('Galaxy S4', 'GT-I9505', 637.99, '2013-04-26', 4.6, 136.6, 69.8, 7.9),
        ('Galaxy S3', 'I9300', 569.99, 	'2012-05-01', 4.6, 136.6, 70.6, 8.6),
        ('DROID MAXX', 'XT1080', 499.00, '2013-07-23', 4.48, 130.7, 68.9, 7.1),
        ('Nexus 5 (16GB)', 'LG-D820', 349.00, '2013-10-31', 4.59, 137.9, 69.2, 8.6),
        ('iPhone 5S (16GB)', 'A1533', 649.99, '2013-09-20', 3.95, 123.8, 58.6, 7.6);
        
INSERT INTO Sales(dev_id, retailer, sale_price) VALUES
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT name FROM Retailers WHERE name='Amazon'),		199.99),
        ((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT name FROM Retailers WHERE name='Best Buy'),	0.0),
        ((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT name FROM Retailers WHERE name='Best Buy'),	149.99),
        ((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT name FROM Retailers WHERE name='Best Buy'),	49.99),
        ((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT name FROM Retailers WHERE name='Best Buy'),	299.99);
			
INSERT INTO Users(username, first_name, last_name) VALUES
        ('George91340',	'George', 'Gutierrez'),
        ('NickColburn', 'Nick', 'Colburn'),
        ('Joao_Brazil', 'Joao', 'Leite'),
        ('Spaz', 'Steven', 'Paz'),
        ('El Profe', 'Alvaro', 'Monge');

INSERT INTO Reviews(dev_id, username, rating, review) VALUES
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT username FROM Users WHERE username='George91340'), 4.5, 'Best Phone I have owned. Great device, but there are minor nuisances like constant wifi notifications.'),
        ((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT username FROM Users WHERE username='NickColburn'), 4.5, 'Best iPhone model yet! The camera is greatly improved and the fingerprint scanner is awesome!'),
        ((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT username FROM Users WHERE username='Joao_Brazil'), 4.0, 'I love the long lasting battery on the RAZR MAXX. No more needing to carry a charger around for this guy!'),
        ((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT username FROM Users WHERE username='Spaz'), 4.0, 'Kit Kat brings some fun cool new features to the phone. The only downside is that the camera struggles under auto setting.'),
        ((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT username FROM Users WHERE username='El Profe'), 4.5, 'Amazing phone! I only wish that the cheap plastic casing makes it feel and look like a cheap phone.');



