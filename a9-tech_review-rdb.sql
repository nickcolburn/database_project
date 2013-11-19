-- Assignment 9 - Tech Review Relational Database
-- Authors: Nick Colburn
--          George Gutierrez
--          Joao Leite

--DROP TABLE device;
CREATE TABLE Manufacturer
(
	name 	  VARCHAR(20) NOT NULL,
	CONSTRAINT mfctr_PK PRIMARY KEY(name)
);

CREATE TABLE Retailers
(
  	name    VARCHAR(20) NOT NULL,
  	CONSTRAINT retailers_PK PRIMARY KEY(name) 
);
  
CREATE TABLE Devices
(
	name 		VARCHAR(30) NOT NULL,
	model_number	VARCHAR(30) NOT NULL,
	listed_price	DECIMAL(5,2),
	manufacturer	VARCHAR(30),
	carrier		VARCHAR(30),
	weight		VARCHAR(3), -- assumption: weight given is in ounces
	release_date	DATE,
	dimensions	CHAR(8), -- (xx-xx-xx) format, in millimeters
);

CREATE TABLE Software
(
	name    VARCHAR(25),
	version	DECIMAL(25)
)
