-- Assignment 10 - Tech Review Relational Database
-- Authors: Nick Colburn
-- George Gutierrez
-- Joao Leite


INSERT INTO Manufacturers(name) VALUES
        ('Samsung'), -- mfctr_id = 1
        ('Apple'), -- mfctr_id = 2
        ('Motorola'), -- mfctr_id = 3
        ('LG'), -- mfctr_id = 4
        ('Sony'), -- mfctr_id = 5
        ('RIM'), -- mfctr_id = 6
        ('Nokia'), -- mfctr_id = 7
        ('HTC'); -- mfctr_id = 8

INSERT INTO Retailers(name, region) VALUES
        ('Best Buy', 'North America'),
        ('Radioshack', 'North America'),
        ('Amazon', 'North America'),
        ('Costco', 'North America'),
        ('Apple', 'North America');
        
INSERT INTO Components(name, comp_type) VALUES
	-- RAM sizes
	('2 GB DDR3', 'Memory'), -- comp_id = 1 (Galaxy S4,)
	('1 GB DDR3', 'RAM'), -- comp_id = 2 (iPhone 5s, )
	
	-- Cameras
	('13 MP', 'Rear Camera'), -- comp_id = 3 (Galaxy S4,)
	('8 MP', 'Rear Camera'), -- comp_id = 4 (iPhone 5s, )
	('2 Megapixels', 'Front Camera'), -- comp_id = 5 (Galaxy S4,)
	('1.2 MP' 'Front Camera'), -- comp_id = 6 (iPhone 5s, )
        
        -- specific components for Galaxy S4
        ('2600 mAh', 'Battery'), -- comp_id = 7
        ('HD Super AMOLED', 'Display'), -- comp_id = 8
	('Qualcomm Snapdragon 600', 'Processor'), -- comp_id = 9

	-- components for the iPhone 5s
	('A7', 'Processor'), -- comp_id = 10
	('Retina Display', 'Display'), -- comp_id = 11
	('Touch ID', 'Fingerprint Sensor'), -- comp_id = 12
	('1560 mAh', 'Battery'); -- comp_id = 13
	
	

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
        
INSERT INTO Carriers(name, country_code) VALUES
        ('Verizon Wireless', 'USA'),
        ('Sprint', 'USA'),
        ('AT&T', 'USA'),
        ('T-Mobile', 'USA'),
        ('Virgin Mobile', 'USA'),
        ('Rogers Wireless', 'CAN'),
        ('Telus Mobility', 'USA'),
        ('Bell Mobility', 'CAN'),
        ('America Movil', 'MEX'),
        ('Vivo', 'BRA'),
        ('Orange', 'MEX'),
        ('MTS', 'MEX'),
        ('BSNL', 'MEX');
        
INSERT INTO Software(name, version) VALUES
	('Android', 'KitKat'), -- soft_id = 1
        ('Android', 'Jelly Bean'), -- soft_id = 2
        ('Android', 'Ice Cream Sandwich'), -- soft_id = 3
        ('iOS', '7.0'), -- soft_id = 4
        ('iOS', '6.0'); -- soft_id = 5

INSERT INTO Devices(name, model_number, listed_price, mfctr_id, soft_id, release_date, weight, height, width, depth) VALUES
        -- dev_id = 1
        ('Galaxy S4',           'GT-I9505',     637.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=1) , (SELECT soft_id FROM Software WHERE soft_id=3),'2013-04-26', 4.6,  136.6, 69.8, 7.9),
        -- dev_id = 2
        ('Galaxy S3',           'I9300',        569.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=1) , (SELECT soft_id FROM Software WHERE soft_id=2),'2012-05-01', 4.6,  136.6, 70.6, 8.6),
        -- dev_id = 3
        ('DROID MAXX',          'XT1080',       499.00, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=3) , (SELECT soft_id FROM Software WHERE soft_id=2),'2013-07-23', 4.48, 130.7, 68.9, 7.1),
        -- dev_id = 4
        ('Nexus 5 (16GB)',      'LG-D820',      349.00, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=4) , (SELECT soft_id FROM Software WHERE soft_id=3),'2013-10-31', 4.59, 137.9, 69.2, 8.6),
        -- dev_id = 5
        ('iPhone 5S (16GB)',     'A1533',       649.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=2) , (SELECT soft_id FROM Software WHERE soft_id=4),'2013-09-20', 3.95, 123.8, 58.6, 7.6),
        -- dev_id = 6
        ('iPhone 5S (32GB)',     'A1533',       649.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=2) , (SELECT soft_id FROM Software WHERE soft_id=4),'2013-09-20', 3.95, 123.8, 58.6, 7.6),
        -- dev_id = 7
        ('iPhone 5S (64GB)',     'A1533',       649.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=2) , (SELECT soft_id FROM Software WHERE soft_id=4),'2013-09-20', 3.95, 123.8, 58.6, 7.6);

INSERT INTO Sales(dev_id, retailer_id, sale_price) VALUES
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT retailer_id FROM Retailers WHERE name='Amazon'),          199.99),
        ((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT retailer_id FROM Retailers WHERE name='Best Buy'),        0.0),
        ((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT retailer_id FROM Retailers WHERE name='Best Buy'),        149.99),
        ((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT retailer_id FROM Retailers WHERE name='Best Buy'),        49.99),
        ((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT retailer_id FROM Retailers WHERE name='Best Buy'),        299.99),    
		((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT retailer_id FROM Retailers WHERE name='Best Buy'),        249.99);                      

INSERT INTO Users(username, first_name, last_name) VALUES
        ('George91340',        'George', 'Gutierrez'),
        ('NickColburn', 'Nick', 'Colburn'),
        ('Joao_Brazil', 'Joao', 'Leite'),
        ('Spaz', 'Steven', 'Paz'),
        ('El Profe', 'Alvaro', 'Monge');

INSERT INTO Reviews(dev_id, username, rating, review) VALUES
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT username FROM Users WHERE username='George91340'), 4.5, 'Best Phone I have owned. Great device, but there are minor nuisances like constant wifi notifications.'),
        ((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT username FROM Users WHERE username='NickColburn'), 4.5, 'Best iPhone model yet! The camera is greatly improved and the fingerprint scanner is awesome!'),
        ((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT username FROM Users WHERE username='Joao_Brazil'), 4.0, 'I love the long lasting battery on the RAZR MAXX. No more needing to carry a charger around for this guy!'),
        ((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT username FROM Users WHERE username='Spaz'), 4.0, 'Kit Kat brings some fun cool new features to the phone. The only downside is that the camera struggles under auto setting.'),
        ((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT username FROM Users WHERE username='El Profe'), 4.5, 'Amazing phone! I only wish that the cheap plastic casing makes it feel and look like a cheap phone.');

INSERT INTO Supports(dev_id, country, carrier) VALUES
        -- Samsung Galaxy S4 = dev_id 1		
		-- Samsung Galaxy S3 = dev_id 2
		-- Motorola DROID MAXX = dev_id 3
		-- LG Nexus 5 (16 GB) = dev_id 4
		-- Apple iPhone 5S (16GB) = dev_id 5
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country_code FROM Countries WHERE name = 'Brazil'), (SELECT name FROM Carriers WHERE name = 'Vivo')),
        ((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE name = 'United States'), (SELECT name FROM Carriers WHERE name = 'AT&T')),
        ((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT country_code FROM Countries WHERE name = 'United States'), (SELECT name FROM Carriers WHERE name = 'T-Mobile')),
        ((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT country_code FROM Countries WHERE name = 'United States'), (SELECT name FROM Carriers WHERE name = 'Sprint')),
        ((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE name = 'United States'), (SELECT name FROM Carriers WHERE name = 'Verizon Wireless')),
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country_code FROM Countries WHERE name = 'United States'), (SELECT name FROM Carriers WHERE name = 'Orange'));
    
INSERT INTO Radio_spectrum(carrier_name, radio_spectrum) VALUES
	((SELECT name FROM Devices WHERE name = 'Verizon'), 'CDMA'),
	((SELECT name FROM Devices WHERE name = 'AT&T'), 'GSM'),
	((SELECT name FROM Devices WHERE name = 'T-Mobile'), 'GSM'),
	((SELECT name FROM Devices WHERE name = 'Sprint'), 'CDMA'),
	((SELECT name FROM Devices WHERE name = 'Virgin Mobile'), 'CDMA'),
	((SELECT name FROM Devices WHERE name = 'Rogers Wireless'), 'GSM'),
	((SELECT name FROM Devices WHERE name = 'Telus Mobility'), 'CDMA'),
	((SELECT name FROM Devices WHERE name = 'Telus Mobility'), 'HSPA+'),
	((SELECT name FROM Devices WHERE name = 'Bell Mobility'), 'CDMA'),
	((SELECT name FROM Devices WHERE name = 'Bell Mobility'), 'HSPA+'),
	((SELECT name FROM Devices WHERE name = 'America Movil'), 'CDMA'),
	((SELECT name FROM Devices WHERE name = 'America Movil'), 'HSPA+'),
	((SELECT name FROM Devices WHERE name = 'Vivo'), 'CDMA'),
	((SELECT name FROM Devices WHERE name = 'Vivo'), 'GSM'),
	((SELECT name FROM Devices WHERE name = 'Vivo'), 'HSPA+'),
	((SELECT name FROM Devices WHERE name = 'Orange'), 'GSM'),
	((SELECT name FROM Devices WHERE name = 'MTS'), 'GSM'), -- RUSSIA
	((SELECT name FROM Devices WHERE name = 'BSNL'), 'GSM'); -- INDIA

INSERT INTO Internals(dev_id, comp_id) VALUES
	-- the following internals are for the Samsung Galaxy S4
	((SELECT name = FROM Devices WHERE dev_id = '1'),(SELECT name FROM Components WHERE comp_id = '1'),
	((SELECT name = FROM Devices WHERE dev_id = '1'),(SELECT name FROM Components WHERE comp_id = '3'), 
	((SELECT name = FROM Devices WHERE dev_id = '1'),(SELECT name FROM Components WHERE comp_id = '5'), 
	((SELECT name = FROM Devices WHERE dev_id = '1'),(SELECT name FROM Components WHERE comp_id = '7'), 
	((SELECT name = FROM Devices WHERE dev_id = '1'),(SELECT name FROM Components WHERE comp_id = '8'),
	((SELECT name = FROM Devices WHERE dev_id = '1'),(SELECT name FROM Components WHERE comp_id = '9'),
	-- the following internals are for the iPhone 5s (16 GB)
	((SELECT name = FROM Devices WHERE dev_id = '5'),(SELECT name FROM Components WHERE comp_id = '2'),
	((SELECT name = FROM Devices WHERE dev_id = '5'),(SELECT name FROM Components WHERE comp_id = '4'), 
	((SELECT name = FROM Devices WHERE dev_id = '5'),(SELECT name FROM Components WHERE comp_id = '6'), 
	((SELECT name = FROM Devices WHERE dev_id = '5'),(SELECT name FROM Components WHERE comp_id = '10'), 
	((SELECT name = FROM Devices WHERE dev_id = '5'),(SELECT name FROM Components WHERE comp_id = '11'),
	((SELECT name = FROM Devices WHERE dev_id = '5'),(SELECT name FROM Components WHERE comp_id = '12'),
	((SELECT name = FROM Devices WHERE dev_id = '5'),(SELECT name FROM Components WHERE comp_id = '13'),
	-- the following internals are for the iPhone 5s (32 GB)
	((SELECT name = FROM Devices WHERE dev_id = '6'),(SELECT name FROM Components WHERE comp_id = '2'),
	((SELECT name = FROM Devices WHERE dev_id = '6'),(SELECT name FROM Components WHERE comp_id = '4'), 
	((SELECT name = FROM Devices WHERE dev_id = '6'),(SELECT name FROM Components WHERE comp_id = '6'), 
	((SELECT name = FROM Devices WHERE dev_id = '6'),(SELECT name FROM Components WHERE comp_id = '10'), 
	((SELECT name = FROM Devices WHERE dev_id = '6'),(SELECT name FROM Components WHERE comp_id = '11'),
	((SELECT name = FROM Devices WHERE dev_id = '6'),(SELECT name FROM Components WHERE comp_id = '12'),
	((SELECT name = FROM Devices WHERE dev_id = '6'),(SELECT name FROM Components WHERE comp_id = '13');
