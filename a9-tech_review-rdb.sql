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
  	region		VARCHAR(20), 
  	CONSTRAINT retailers_PK PRIMARY KEY(name, region)
);

CREATE TABLE Components
(	
        comp_id		INTEGER NOT NULL AUTO_INCREMENT,
        name    	VARCHAR(20),
        comp_type	VARCHAR(20),	-- component type (type must be an SQL keyword)
        specification 	VARCHAR(20),
        CONSTRAINT retailers_PK PRIMARY KEY(comp_id) 
);


CREATE TABLE Countries
(
	country_code	CHAR(3) NOT NULL,
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
	version		DECIMAL(3,1),
	CONSTRAINT software_PK PRIMARY KEY(name, version)
);
  
CREATE TABLE Devices
(
	dev_id 		INTEGER NOT NULL AUTO_INCREMENT,
	name 		VARCHAR(20),
	model_number	VARCHAR(20),
	listed_price	DECIMAL(5,2),
	manufacturer	VARCHAR(20),	-- FK from Manufacturers
	software	VARCHAR(20),	-- FK from Software
	version		DECIMAL(3,1),	-- FK software version from Software
	weight		VARCHAR(3), 	-- assumption: weight given is in ounces
	release_date	DATE,	
	dimensions	CHAR(8), 	-- (xx-xx-xx) format, in millimeters
	CONSTRAINT devices_PK PRIMARY KEY(dev_id),
	CONSTRAINT devices_mfctr_FK FOREIGN KEY(manufacturer) REFERENCES Manufacturers(name),
	CONSTRAINT devices_carrier_FK FOREIGN KEY(carrier) REFERENCES Carriers(name),
	CONSTRAINT devices_software_FK FOREIGN KEY(software, version) REFERENCES Software(name, version)
);

CREATE TABLE Device_composition
(
	dev_id		INTEGER NOT NULL, -- FK from Devices
	comp_id 	INTEGER NOT NULL, -- FK from Components
	CONSTRAINT dc_PK PRIMARY KEY(dev_id, comp_id),
	CONSTRAINT dc_devices_FK FOREIGN KEY(dev_id) REFERENCES Devices(dev_id),
	CONSTRAINT dc_components_FK FOREIGN KEY(comp_id) REFERENCES Components(comp_id)
	
);

CREATE TABLE Supports
(
	dev_id 		INTEGER NOT NULL, --FK from Devices
	carrier		VARCHAR(20) NOT NULL,	-- FK from Carriers
	country		CHAR(3)  NOT NULL,	-- FK from Countries
	CONSTRAINT supports_PK PRIMARY KEY(dev_id, carrier, country),
	CONSTRAINT supports_device_FK FOREIGN KEY(dev_id) REFERENCES Devices(dev_id),
	CONSTRAINT supports_carrier_FK FOREIGN KEY(carrier) REFERENCES Carriers(name),
	CONSTRAINT supports_country_FK FOREIGN KEY(country) REFERENCES Countries(country_code),
);

CREATE TABLE Sales
(
	retailer	VARCHAR(20) NOT NULL, 	-- FK from Retailers
	dev_id 		INTEGER NOT NULL, -- FK from Devices
	sale_price	DECIMAL(5,2) NOT NULL,
	CONSTRAINT sales_PK PRIMARY KEY(dev_id, retailer),
	CONSTRAINT sales_device_FK FOREIGN KEY(dev_id) REFERENCES Devices(dev_id),
	CONSTRAINT sales_retailer_FK FOREIGN KEY(retailer) REFERENCES Retailers(name)
	
);

CREATE TABLE Users
(
	username	VARCHAR(20) NOT NULL,
	first_name	VARCHAR(20),
	last_name	VARCHAR(20),
	CONSTRAINT users_PK PRIMARY KEY(username)
);  

CREATE TABLE Reviews
(
 	dev_id 		INTEGER NOT NULL, --FK from Devices
  	username	VARCHAR(20) NOT NULL,	-- CK & FK from Users
  	rating		DECIMAL(2,1),	-- users can give partial ratings
  	review		VARCHAR(1000),	-- need to determine appropriate size for this
  	CONSTRAINT reviews_PK PRIMARY KEY(username),
  	CONSTRAINT reviews_user_FM FOREIGN KEY(username) REFERENCES Users(username),
  	CONSTRAINT reviews_device_FK FOREIGN KEY(name, model_number) REFERENCES Devices(name, model_number),
);








