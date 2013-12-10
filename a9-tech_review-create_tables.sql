-- Assignment 10 - Tech Review Relational Database
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
DROP TABLE Radio_spectrum;
DROP TABLE Carriers;
DROP TABLE Countries;
DROP TABLE Components;
DROP TABLE Retailers;
DROP TABLE Manufacturers;


CREATE TABLE Manufacturers
(
        mfctr_id        INTEGER NOT NULL AUTO_INCREMENT, -- Surrogate PK for Manufacturer
        name                VARCHAR(20),
        CONSTRAINT         mfctr_pk PRIMARY KEY(mfctr_id),-- mfctr_id is a simpler Pk than name, while still determining the same attributes
        CONSTRAINT        mfctr_ck UNIQUE(name)
);

CREATE TABLE Retailers
(
        retailer_id        INTEGER NOT NULL AUTO_INCREMENT,
        name                 VARCHAR(20),
        region                 VARCHAR(20),
        CONSTRAINT         retailers_pk PRIMARY KEY(retailer_id), -- both name+region will be the PK to distinguish any retailers with the same name in different regions
        CONSTRAINT        retailers_ck UNIQUE(name, region) -- name+region is used to determine retailers present in 2+ countries
);

CREATE TABLE Components
(
        comp_id         INTEGER NOT NULL AUTO_INCREMENT,         -- surrogate key introduced to make database easier to manage
        name                 VARCHAR(30),
        comp_type         VARCHAR(20),                                 -- component type (type must be an SQL keyword)
        CONSTRAINT        retailers_pk PRIMARY KEY(comp_id)         -- comp_id is a surrogate key
);


CREATE TABLE Countries
(
        country_code         CHAR(3) NOT NULL,
        name                 VARCHAR(20),
        CONSTRAINT         countries_pk PRIMARY KEY(country_code), -- country code is shorter than country name, so it should be used as PK
        CONSTRAINT        countries_ck UNIQUE(name)
);

CREATE TABLE Carriers
(
        name                 VARCHAR(20) NOT NULL, -- assumption: no two carriers will share the same name
        country_code        CHAR(3),
        CONSTRAINT         carriers_pk PRIMARY KEY(name), -- carrier name is enough to uniquely identify each tuple
        CONSTRAINT        carriers_fk FOREIGN KEY(country_code) REFERENCES Countries(country_code) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Radio_spectrum
(
        carrier_name        VARCHAR(20) NOT NULL, -- FK from Carriers
        radio_spectrum        VARCHAR(20) NOT NULL,
        CONSTRAINT         radio_spectrum_pk PRIMARY KEY(carrier_name, radio_spectrum),
        CONSTRAINT         radio_carriers_fk FOREIGN KEY(carrier_name) REFERENCES Carriers(name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Software
(
        soft_id                INTEGER NOT NULL AUTO_INCREMENT,
        name                 VARCHAR(20) NOT NULL,
        version         VARCHAR(20) NOT NULL, -- assumption: version number will be named or in XX.X format 
        CONSTRAINT         software_pk PRIMARY KEY(soft_id), -- software id will determine name and ver. # 
        CONSTRAINT         software_ck UNIQUE(name, version) -- name and version must be used because there may be several iterations of software with the same name. 
);
  
CREATE TABLE Devices
(
        dev_id                 INTEGER NOT NULL AUTO_INCREMENT,
        name                 VARCHAR(20),
        model_number         VARCHAR(20),
        listed_price         DECIMAL(5,2),         -- assumption: listed price is full retail price
        mfctr_id         INTEGER,         -- FK from Manufacturers
        soft_id         INTEGER,         -- FK from Software
        weight                 DECIMAL(3,2),         -- assumption: weight given is in ounces
        release_date         DATE,
        height                 DECIMAL(5,1),         -- assumption: values are in millimeters
        width                 DECIMAL(3,1),         -- assumption: values are in millimeters
        depth                 DECIMAL(3,1),        -- assumption: values are in millimeters
        CONSTRAINT devices_pk PRIMARY KEY(dev_id), -- dev_id is a surrogate key
        CONSTRAINT devices_mfctr_fk FOREIGN KEY(mfctr_id) REFERENCES Manufacturers(mfctr_id) ON UPDATE CASCADE ON DELETE RESTRICT,
        CONSTRAINT devices_software_fk FOREIGN KEY(soft_id) REFERENCES Software(soft_id) ON UPDATE CASCADE ON DELETE RESTRICT,
        CONSTRAINT devices_ck UNIQUE(name, model_number)
);

CREATE TABLE Users
(
        username         VARCHAR(20) NOT NULL, -- assumption: usernames in the database must be unique
        first_name         VARCHAR(20),
        last_name         VARCHAR(20),
        CONSTRAINT         users_pk PRIMARY KEY(username) -- usernames are unique and so can serve as the PK
);


CREATE TABLE Internals
(
        dev_id                 INTEGER NOT NULL, -- FK from Devices
        comp_id         INTEGER NOT NULL, -- FK from Components
        CONSTRAINT         dc_pk PRIMARY KEY(dev_id, comp_id),
        CONSTRAINT         dc_devices_fk FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT         dc_components_fk FOREIGN KEY(comp_id) REFERENCES Components(comp_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Supports
(
        dev_id                 INTEGER NOT NULL,         -- FK from Devices
        carrier         VARCHAR(20) NOT NULL,         -- FK from Carriers
        country         CHAR(3) NOT NULL,         -- FK from Countries
        CONSTRAINT         supports_pk PRIMARY KEY(dev_id, carrier, country),
        CONSTRAINT         supports_device_fk FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT         supports_carrier_fk FOREIGN KEY(carrier) REFERENCES Carriers(name) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT         supports_country_fk FOREIGN KEY(country) REFERENCES Countries(country_code) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Sales
(
        sale_id			   INTEGER NOT NULL AUTO_INCREMENT, 
		retailer_id        INTEGER NOT NULL, -- FK from Retailers
        dev_id             INTEGER NOT NULL,         -- FK from Devices
        sale_price         DECIMAL(5,2) NOT NULL,
        CONSTRAINT         sales_pk PRIMARY KEY(sale_id),
        CONSTRAINT         sales_device_fk FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT         sales_retailer_fk FOREIGN KEY(retailer_id) REFERENCES Retailers(retailer_id) ON UPDATE CASCADE ON DELETE CASCADE
        
);

CREATE TABLE Reviews
(
        dev_id                 INTEGER NOT NULL,         -- FK from Devices
        username         VARCHAR(20) NOT NULL,         -- FK from Users
        rating                 DECIMAL(2,1),                 -- users can give partial ratings
        review                 VARCHAR(1000),                 -- need to determine appropriate size for this
        CONSTRAINT         reviews_pk PRIMARY KEY(dev_id, username),
        CONSTRAINT         reviews_device_fk FOREIGN KEY(dev_id) REFERENCES Devices(dev_id) ON UPDATE CASCADE ON DELETE RESTRICT,
        CONSTRAINT         reviews_user_fk FOREIGN KEY(username) REFERENCES Users(username) ON UPDATE CASCADE ON DELETE CASCADE
);
