-- Assignment 9 - Tech Review Relational Database
-- Authors: Nick Colburn
-- George Gutierrez
-- Joao Leite

DROP TABLE Reviews;
DROP TABLE Users;
DROP TABLE Sales;
DROP TABLE Supports;
DROP TABLE Device_composition;
DROP TABLE Devices;
DROP TABLE Software;
DROP TABLE Carriers;
DROP TABLE Countries;
DROP TABLE Components;
DROP TABLE Retailers;
DROP TABLE Manufacturers;


CREATE TABLE Manufacturers
(
        name VARCHAR(20) NOT NULL,
        CONSTRAINT mfctr_PK PRIMARY KEY(name)
);

CREATE TABLE Retailers
(
          name VARCHAR(20) NOT NULL,
          region VARCHAR(20),
          CONSTRAINT retailers_PK PRIMARY KEY(name, region)
);

CREATE TABLE Components
(
        comp_id INTEGER NOT NULL AUTO_INCREMENT,
        name VARCHAR(20),
        comp_type VARCHAR(20), -- component type (type must be an SQL keyword)
        specification VARCHAR(20),
        CONSTRAINT retailers_PK PRIMARY KEY(comp_id)
);


CREATE TABLE Countries
(
        country_code CHAR(3) NOT NULL,
        name VARCHAR(20),
        CONSTRAINT countries_PK PRIMARY KEY(country_code)
);

CREATE TABLE Carriers
(
        name VARCHAR(20) NOT NULL,
        radio_spectrum VARCHAR(10),
        CONSTRAINT carriers_PK PRIMARY KEY(name)
);

CREATE TABLE Software
(
        name VARCHAR(20),
        version DECIMAL(3,1),
        CONSTRAINT software_PK PRIMARY KEY(name, version)
);
  
CREATE TABLE Devices
(
        dev_id INTEGER NOT NULL AUTO_INCREMENT,
        name VARCHAR(20),
        model_number VARCHAR(20),
        listed_price DECIMAL(5,2), -- assumption: listed price is full retail price
        manufacturer VARCHAR(20), -- FK from Manufacturers
        software VARCHAR(20), -- FK from Software
        version DECIMAL(3,2), -- FK software version from Software
        weight DECIMAL(3,2), -- assumption: weight given is in ounces
        release_date DATE,
        height DECIMAL(5,1), -- assumption: values are in millimeters
        width DECIMAL(3,1), -- assumption: values are in millimeters
        depth DECIMAL(3,1), -- assumption: values are in millimeters
        CONSTRAINT devices_PK PRIMARY KEY(dev_id),
        CONSTRAINT devices_mfctr_FK FOREIGN KEY(manufacturer) REFERENCES Manufacturers(name) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT devices_software_FK FOREIGN KEY(software, version) REFERENCES Software(name, version) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Device_composition
(
        dev_id INTEGER NOT NULL, -- FK from Devices
        comp_id INTEGER NOT NULL, -- FK from Components
        CONSTRAINT dc_PK PRIMARY KEY(dev_id, comp_id),
        CONSTRAINT dc_devices_FK FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT dc_components_FK FOREIGN KEY(comp_id) REFERENCES Components(comp_id) ON UPDATE CASCADE ON DELETE CASCADE
        
);

CREATE TABLE Supports
(
        dev_id INTEGER NOT NULL, -- FK from Devices
        carrier VARCHAR(20) NOT NULL, -- FK from Carriers
        country CHAR(3) NOT NULL, -- FK from Countries
        CONSTRAINT supports_PK PRIMARY KEY(dev_id, carrier, country),
        CONSTRAINT supports_device_FK FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT supports_carrier_FK FOREIGN KEY(carrier) REFERENCES Carriers(name) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT supports_country_FK FOREIGN KEY(country) REFERENCES Countries(country_code) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Sales
(
        retailer VARCHAR(20) NOT NULL, -- FK from Retailers
        dev_id INTEGER NOT NULL, -- FK from Devices
        sale_price DECIMAL(5,2) NOT NULL,
        CONSTRAINT sales_PK PRIMARY KEY(dev_id, retailer),
        CONSTRAINT sales_device_FK FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT sales_retailer_FK FOREIGN KEY(retailer) REFERENCES Retailers(name) ON UPDATE CASCADE ON DELETE CASCADE
        
);

CREATE TABLE Users
(
        username VARCHAR(20) NOT NULL,
        first_name VARCHAR(20),
        last_name VARCHAR(20),
        CONSTRAINT users_PK PRIMARY KEY(username)
);

CREATE TABLE Reviews
(
        dev_id INTEGER NOT NULL AUTO_INCREMENT, -- FK from Devices
        username VARCHAR(20) NOT NULL, -- FK from Users
        rating DECIMAL(2,1), -- users can give partial ratings
        review VARCHAR(1000), -- need to determine appropriate size for this
        CONSTRAINT reviews_PK PRIMARY KEY(dev_id, username),
        CONSTRAINT reviews_device_FK FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT reviews_user_FK FOREIGN KEY(username) REFERENCES Users(username) ON UPDATE CASCADE ON DELETE CASCADE
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
        ('USA', 'United States'),
        ('MEX', 'Mexico'),
        ('FRA', 'France'),
        ('GBR', 'United Kingdom'),
        ('CAN', 'Canada');

INSERT INTO Carriers(name, radio_spectrum) VALUES
        ('Verizon Wireless', 'CDMA'),
        ('Sprint', 'CDMA'),
        ('AT&T', 'GSM'),
        ('T-Mobile', 'GSM'),
        ('Virgin Mobile', 'CDMA');

INSERT INTO Software(name, version) VALUES
        ('KitKat', 4.4),
        ('Jelly Bean', 4.1),
        ('Ice Cream Sandwich', 4.0),
        ('iOS 7', 7.0),
        ('iOS 6', 6.0);

-- Listed price needs to be the off-contract price
INSERT INTO Devices(name, model_number, listed_price, release_date, weight, height, width, depth) VALUES
        ('Galaxy S4', 'GT-I9505', 637.99, '2013-04-26', 4.6, 136.6, 69.8, 7.9),
        ('Galaxy S3', 'I9300', 569.99, '2012-05-01', 4.6, 136.6, 70.6, 8.6),
        ('DROID MAXX', 'XT1080', 499.00, '2013-07-23', 4.48, 130.7, 68.9, 7.1),
        ('Nexus 5 (16GB)', 'LG-D820', 349.00, '2013-10-31', 4.59, 137.9, 69.2, 8.6),
        ('iPhone 5S (16GB)', 'A1533', 649.99, '2013-09-20', 3.95, 123.8, 58.6, 7.6);
        
INSERT INTO Sales(dev_id, retailer, sale_price) VALUES
        
        -- So this is basiaclly how we need to insert the FK values
        ((SELECT dev_id salesFROM Devices WHERE dev_id=1),
	 (SELECT name FROM Retailers WHERE name='Best Buy'),199.99);
        /*(0.0),
        (149.99),
        (49.99),
        (299.99);*/
        
INSERT INTO Users(username, first_name, last_name) VALUES
        ('George91340', 'George', 'Gutierrez'),
        ('NickColburn', 'Nick', 'Colburn'),
        ('Joao_Brazil', 'Joao', 'Leite'),
        ('Spaz', 'Steven', 'Paz'),
        ('El Profe', 'Alvaro', 'Monge');

INSERT INTO Reviews(rating, review) VALUES
        (4.5, 'Best Phone I have owned. Great device, but there are minor nuisances like constant wifi notifications.'),
        (4.5, 'Best iPhone model yet! The camera is greatly improved and the fingerprint scanner is awesome!'),
        (4.0, 'I love the long lasting battery on the RAZR MAXX. No more needing to carry a charger around for this guy!'),
        (4.0, 'Kit Kat brings some fun cool new features to the phone. The only downside is that the camera struggles under auto setting.'),
        (4.5, 'Amazing phone! I only wish that the cheap plastic casing makes it feel and look like a cheap phone.');



