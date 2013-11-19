-- Assignment 9 - Tech Review Relational Database
-- Authors: Nick Colburn
--          George Gutierrez
--          Joao Leite

--DROP TABLE device;
CREATE TABLE Manufacturer
(
	name 	  	VARCHAR(20) NOT NULL,
	CONSTRAINT mfctr_PK PRIMARY KEY(name)
);

CREATE TABLE Retailers
(
  	name    	VARCHAR(20) NOT NULL,
  	CONSTRAINT retailers_PK PRIMARY KEY(name) 
);

CREATE TABLE Components
(	
        name    	VARCHAR(20) NOT NULL,
        comp_type	VARCHAR(20),	-- component type (type must be an SQL keyword)
        specification 	VARCHAR(20),
        CONSTRAINT retailers_PK PRIMARY KEY(name) 
);

CREATE TABLE Countries
(
	country_code	VARCHAR(3) NOT NULL,
	name		VARCHAR(20),
	CONSTRAINT countries_PK PRIMARY KEY(country_code)
);

CREATE TABLE Carriers
(
	name    	VARCHAR(20) NOT NULL,
	radio_spectrum	VARCHAR(10),
	CONSTRAINT carriers_PK PRIMARY KEY(name)
);

CREATE TABLE Software
(
	name    	VARCHAR(20),
	version		DECIMAL(3,1)
);
  
CREATE TABLE Devices
(
	name 		VARCHAR(20) NOT NULL,
	model_number	VARCHAR(20) NOT NULL,
	listed_price	DECIMAL(5,2),
	manufacturer	VARCHAR(20),	-- FK from Manufacturers
	software	VARCHAR(20),	-- FK from Software
	version		DECIMAL(3,1),	-- FK software version from Software
	weight		VARCHAR(3), 	-- assumption: weight given is in ounces
	release_date	DATE,	
	dimensions	CHAR(8), 	-- (xx-xx-xx) format, in millimeters
	CONSTRAINT devices_PK PRIMARY KEY(name, model_number),
	CONSTRAINT devices_mfctr_FK FOREIGN KEY(manufacturer) REFERENCES Manufacturers(name),
	CONSTRAINT devices_carrier_FK FOREIGN KEY(carrier) REFERENCES Carriers(name),
);

CREATE TABLE Supports
(
	name		VARCHAR(20) NOT NULL,	-- FK from Devices 
	model_number	VARCHAR(20) NOT NULL,	-- FK from Devices
	carrier		VARCHAR(20) NOT NULL,	-- FK from Carriers
	country		VARCHAR(3)  NOT NULL,	-- FK from Countries
	CONSTRAINT supports_PK PRIMARY KEY(name, model_number, carrier, country),
	CONSTRAINT supports_device_FK FOREIGN KEY(name, model_number) REFERENCES Devices(name, model_number),
	CONSTRAINT supports_carrier_FK FOREIGN KEY(carrier) REFERENCES Carriers(name),
	CONSTRAINT supports_country_FK FOREIGN KEY(country) REFERENCES Countries(country_code),
);

CREATE TABLE Sales
(
	retailer	VARCHAR(20) NOT NULL, 	-- FK from Retailers
	name		VARCHAR(20) NOT NULL,	-- FK from Devices
	model_number	VARCHAR(20) NOT NULL,	-- FK from Devices
	sale_price	DECIMAL(5,2) NOT NULL,
	
);

CREATE TABLE Users
(
	username	VARCHAR(20) NOT NULL,
	first_name	VARCHAR(20),
	last_name	VARCHAR(20),
	CONSTRAINT USERS_PK PRIMARY KEY(username)
);  

CREATE TABLE Reviews
(
 	name		VARCHAR(20),	-- FK from Devices
  	model_number	VARCHAR(20),	-- FK from Devices
  	username	VARCHAR(20) NOT NULL,	-- CK & FK from Users
  	rating		DECIMAL(2,1),	-- users can give partial ratings
  	review		VARCHAR(1000),	-- need to determine appropriate size for this
  	CONTRAINT reviews_PK PRIMARY KEY(username) REFERNCES Users(username),
  	CONSRAINT reviews_device_FK FOREIGN KEY(name, model_number) REFERENCES Devices(name, model_number),
);








