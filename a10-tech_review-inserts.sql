-- Assignment 10 - Tech Review Relational Database
-- Authors: Nick Colburn
-- George Gutierrez
-- Joao Leite


INSERT INTO Manufacturers(name) VALUES
        ('Samsung'), -- mfctr_id = 1
        ('Apple'), -- mfctr_id = 2
        ('LG'), -- mfctr_id = 3
        ('Sony'), -- mfctr_id = 4
        ('Nokia'), -- mfctr_id = 5
        ('HTC'); -- mfctr_id = 6

INSERT INTO Retailers(name, region) VALUES
        ('Best Buy', 'North America'),
        ('Radioshack', 'North America'),
        ('Amazon', 'North America'),
        ('Costco', 'North America'),
        ('Apple', 'North America');
        
INSERT INTO Components(name, comp_type) VALUES
	-- Batteries
	('1560 mAh', 'Battery'), -- comp_id = 1 (iPhone 5s)
	('2300 mAh', 'Battery'), -- comp_id = 2 (Nexus 5, HTC One)
	('2600 mAh', 'Battery'), -- comp_id = 3 (Galaxy S4)
	('3000 mAh', 'Battery'), -- comp_id = 4 (xPeria Z1)
	('3400 mAh', 'Battery'), -- comp_id = 5 (Lumia 1520)
	
	-- Cameras
	('20.7 MP', 'Rear Camera'), -- comp_id = 6 (xPeria Z1)
	('20 MP', 'Rear Camera'), -- comp _id = 7 (Lumia 1520)
	('13 MP', 'Rear Camera'), -- comp_id = 8 (Galaxy S4)
	('8 MP', 'Rear Camera'), -- comp_id = 9 (iPhone 5s, Nexus 5)
	('4 MP', 'Rear Camera'), -- comp_id = 10 (HTC One)
	
	('2.1 MP', 'Front Camera'), -- comp_id = 11 (HTC One)
	('2 Megapixels', 'Front Camera'), -- comp_id = 12 (Galaxy S4, xPeria Z1)
	('1.2 MP', 'Front Camera'), -- comp_id = 13 (iPhone 5s, Lumia 1520)
	('1.3 MP', 'Front Camera'), -- comp_id = 14 (Nexus 5)
	
	-- Displays
	('HD Super AMOLED', 'Display'), -- comp_id = 15 (Galaxy S4)
	('Retina Display', 'Display'), -- comp_id = 16 (iPhone 5s)
	('Full HD IPS+', 'Display'), -- comp_id = 17 (Nexus 5)
	('TFT', 'Display'), -- comp_id = 18 (xPeria Z1)
	('Super LCD3', 'Display'), -- comp_id = 19 (HTC One)
	('IPS LCD', 'Display'), -- comp_id = 20 (Lumia 1520)
	
	-- RAM sizes
	('2 GB DDR3', 'Memory'), -- comp_id = 21 (Galaxy S4, Nexus 5, xPeria Z1, HTC One, Lumia 1520)
	('1 GB DDR3', 'RAM'), -- comp_id = 22 (iPhone 5s)
	
	-- Processors
	('Qualcomm Snapdragon 600', 'Processor'), -- comp_id = 23 (Galaxy S4, HTC One)
        ('A7', 'Processor'), -- comp_id = 24 (iPhone 5s)
        ('Qualcomm Snapdragon 800', 'Processor'), -- comp_id = 25 (Nexus 5, xPeria Z1, Lumia 1520)
	
	-- Misc. Items
	('Touch ID', 'Fingerprint Sensor'); -- comp_id = 26
	
INSERT INTO Countries(country_code, name) VALUES
        ('ARG', 'Argentina'), -- America Movil
        ('ARM', 'Armenia'), -- Orange
        ('AUS', 'Australia'), -- Virgin Mobile
        ('BRA', 'Brazil'), -- America Movil, Vivo, 
        ('BEL', 'Belgium') -- Orange
        ('CAN', 'Canada'), -- Virgin Mobile, Rogers Wireless, Telus Mobility, Bell Mobility
        ('CHL', 'Chile'), -- America Movil, Virgin Mobile
        ('COL', 'Colombia'), -- America Movil, Virgin Mobile
        ('DOM', 'Dominican Republic'), -- America Movil
        ('ECU', 'Ecuador'), -- America Movil
        ('SLV', 'El Salvador'), -- America Movil
        ('FRA', 'France'), -- Orange, Virgin Mobile, 
        ('GBR', 'United Kingdom'), -- Orange, Virgin Mobile
        ('GTM', 'Guatemala'), -- America Movil
        ('HND', 'Honduras') -- America Movil
        ('IND', 'India'), -- Virgin Mobile
        ('JAM', 'Jamaica'), -- America Movil
        ('LUX', 'Luxembourg'), -- Orange
        ('MEX', 'Mexico'), -- America Movil
        ('MDA', 'Moldova'), -- Orange
        ('NIC', 'Nicaragua'), -- America Movil
        ('PAN', 'Panama'), -- America Movil
        ('PRY', 'Paraguay'), -- America Movil
        ('PER', 'Peru'), -- America Movil
        ('POL', 'Poland'), -- Orange, Virgin Mobile
        ('PRT', 'Portugal') -- Orange
        ('ROU', 'Romania'), -- Orange
        ('RUS', 'Russia') -- MTS
        ('SVK', 'Slovakia'), -- Orange
        ('SPN', 'Spain'), -- Orange
        ('ZAF', 'South Africa'), -- Virgin Mobile
        ('CHE', 'Switzerland'), -- Orange
        ('URY', 'Uruguay'), -- America Movil 
        ('USA', 'United States'); -- America Movil, Verizon Wireless, AT&T, T-Mobile, Virgin Mobile
        
INSERT INTO Carriers(name, country_code) VALUES
        ('Verizon Wireless', (SELECT country_code FROM Countries WHERE country_code = 'USA')),
        ('Sprint', (SELECT country_code FROM Countries WHERE country_code = 'USA')),
        ('AT&T', (SELECT country_code FROM Countries WHERE country_code = 'USA')),
        ('T-Mobile',(SELECT country_code FROM Countries WHERE country_code = 'USA')),
        ('Virgin Mobile', (SELECT country_code FROM Countries WHERE country_code = 'AUS')),
        ('Virgin Mobile', (SELECT country_code FROM Countries WHERE country_code = 'USA')),
        ('Virgin Mobile', (SELECT country_code FROM Countries WHERE country_code = 'CAN')),
        ('Virgin Mobile', (SELECT country_code FROM Countries WHERE country_code = 'FRA')),
        ('Virgin Mobile', (SELECT country_code FROM Countries WHERE country_code = 'IND')),
        ('Virgin Mobile', (SELECT country_code FROM Countries WHERE country_code = 'POL')),
        ('Virgin Mobile', (SELECT country_code FROM Countries WHERE country_code = 'ZAF')),
        ('Virgin Mobile', (SELECT country_code FROM Countries WHERE country_code = 'GBR')),
        ('Virgin Mobile', (SELECT country_code FROM Countries WHERE country_code = 'CHL')),
        ('Virgin Mobile', (SELECT country_code FROM Countries WHERE country_code = 'COL')),
        ('Rogers Wireless', (SELECT country_code FROM Countries WHERE country_code = 'CAN')),
        ('Telus Mobility', (SELECT country_code FROM Countries WHERE country_code = 'CAN')),
        ('Bell Mobility', (SELECT country_code FROM Countries WHERE country_code = 'CAN')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'USA')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'MEX')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'BRA')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'COL')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'ECU')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'PER')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'CHL')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'PRY')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'URY')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'PRI')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'DOM')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'JAM')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'GTM')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'SLV')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'HND')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'NIC')),
        ('America Movil', (SELECT country_code FROM Countries WHERE country_code = 'PAN')),
        ('Vivo', (SELECT country_code FROM Countries WHERE country_code = 'BRA')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'ARM')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'BEL')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'SPN')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'FRA')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'LUX')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'MDA')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'POL')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'PRT')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'ROU')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'SVK')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'CHE')),
        ('Orange', (SELECT country_code FROM Countries WHERE country_code = 'GBR')),
        ('MTS', (SELECT country_code FROM Countries WHERE country_code = 'RUS'));
        
INSERT INTO Software(name, version) VALUES
	('Android', 'KitKat'), -- soft_id = 1
        ('Android', 'Jelly Bean'), -- soft_id = 2
        ('iOS', '7.0'), -- soft_id = 3 
        ('Windows Phone 8', 'Update 3'); -- soft_id = 4 (Lumia 1520)

INSERT INTO Devices(name, model_number, listed_price, mfctr_id, soft_id, release_date, weight, height, length, width) VALUES
        -- dev_id = 1, CDMA Model
        ('Galaxy S4', 'SCH-I545', 599.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=1) , (SELECT soft_id FROM Software WHERE soft_id=2),'2013-04-26', 4.6,  136.7, 69.6, 7.9),
        
        -- dev_id = 2, International Model (GSM)
        ('Galaxy S4', 'GT-I9500', 545.00, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=1) , (SELECT soft_id FROM Software WHERE soft_id=2),'2012-05-01', 4.6,  136.6, 69.8, 7.9),
        
        -- dev_id = 3
        ('Nexus 5 (16GB)', 'LG-D820', 349.00, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=4) , (SELECT soft_id FROM Software WHERE soft_id=1),'2013-10-31', 4.59, 137.9, 69.2, 8.6),
        
        -- dev_id = 4
        ('Nexus 5 (32GB)', 'LG-D820', 399.00, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=4) , (SELECT soft_id FROM Software WHERE soft_id=1),'2013-10-31', 4.59, 137.9, 69.2, 8.6),
        
        -- dev_id = 5
        ('iPhone 5s (16GB)', 'A1533', 649.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=2) , (SELECT soft_id FROM Software WHERE soft_id=3),'2013-09-20', 3.95, 123.8, 58.6, 7.6),
        
        -- dev_id = 6
        ('iPhone 5s (32GB)', 'A1533', 749.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=2) , (SELECT soft_id FROM Software WHERE soft_id=3),'2013-09-20', 3.95, 123.8, 58.6, 7.6),
        
        -- dev_id = 7
        ('iPhone 5s (64GB)', 'A1533', 849.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=2) , (SELECT soft_id FROM Software WHERE soft_id=3),'2013-09-20', 3.95, 123.8, 58.6, 7.6),
        
	-- dev_id = 8, North America Model
        ('xPeria Z1', 'C6906', 649.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=4) , (SELECT soft_id FROM Software WHERE soft_id=2), '2013-09-20', 6.0, 144, 74, 8.5),
        
        -- dev_id = 9, Worldwide Model
        ('xPeria Z1', 'L39h', 649.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=4) , (SELECT soft_id FROM Software WHERE soft_id=2), '2013-09-20', 6.0, 144, 74, 8.5),
        
        -- dev_id = 10, North America Model
        ('HTC One (32 GB)', '801n', 599.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=6) , (SELECT soft_id FROM Software WHERE soft_id=2), '2013-03-01', 5.04, 137.4, 68.2, 9.3),

	-- dev_id = 11, North America Model
        ('HTC One (64 GB)', '801n', 669.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=6) , (SELECT soft_id FROM Software WHERE soft_id=2), '2013-03-01', 5.04, 137.4, 68.2, 9.3),
        
        -- dev_id = 12, Europe/Middle East/Africa Model
        ('HTC One (32 GB)', 'M7_UL', 599.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=6) , (SELECT soft_id FROM Software WHERE soft_id=2), '2013-03-01', 5.04, 137.4, 68.2, 9.3),
        
        -- dev_id = 13, Europe/Middle East/Africa Model
        ('HTC One (64 GB)', 'M7_UL', 669.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=6) , (SELECT soft_id FROM Software WHERE soft_id=2), '2013-03-01', 5.04, 137.4, 68.2, 9.3),
        
        -- dev_id = 14, United States Model 
        ('Lumia 1520', 'RM-940', 584.99, (SELECT mfctr_id FROM Manufacturers WHERE mfctr_id=5) , (SELECT soft_id FROM Software WHERE soft_id=4), '2013-11-13', 7.37, 162.8, 85.4, 8.7);
        
       
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

INSERT INTO Supports(dev_id, country_code, carrier) VALUES
        		
	-- Samsung Galaxy S4 (CDMA Version)
	((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Verizon Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Sprint')),
    	((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Telus Mobility')),
    	((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Bell Mobility')),
    	-- Samsung Galaxy S4 (GSM Version)
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'AT&T')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'T-Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'AUS'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Rogers Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'BRA'), (SELECT name FROM Carriers WHERE name = 'Vivo')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'GBM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'ARM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'BEL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'SPN'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'FRA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'LUX'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'MDA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'PUL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'PRT'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'ROU'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'SVK'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'CHE'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT country_code FROM Countries WHERE country_code = 'RUS'), (SELECT name FROM Carriers WHERE name = 'MTS')),
    	
    	-- Nexus 5 16 GB Model
    	((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Sprint')),
    	((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'T-Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Rogers Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Telus Mobility')),
    	((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Bell Mobility')),
    	-- Nexus 5 32 GB Model
    	((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Sprint')),
    	((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'T-Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Rogers Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Telus Mobility')),
    	((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Bell Mobility')),

    	-- iPhone 5s 16 GB model
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Verizon Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'AT&T')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Sprint')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'T-Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'FRA'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'AUS'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'GBM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'ARM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'BEL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'SPN'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'FRA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'LUX'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'MDA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'PUL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'PRT'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'ROU'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'SVK'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'CHE'), (SELECT name FROM Carriers WHERE name = 'Orange')),
	((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT country_code FROM Countries WHERE country_code = 'CHE'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	-- iPhone 5s 32 GB model
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Verizon Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'AT&T')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Sprint')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'T-Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'FRA'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'AUS'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'GBM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'ARM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'BEL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'SPN'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'FRA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'LUX'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'MDA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'PUL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'PRT'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'ROU'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'SVK'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=6), (SELECT country_code FROM Countries WHERE country_code = 'CHE'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	-- iPhone 5s 64 GB Model
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Verizon Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'AT&T')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Sprint')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'T-Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'FRA'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'AUS'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),    	
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'GBM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'ARM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'BEL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'SPN'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'FRA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'LUX'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'MDA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'PUL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'PRT'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'ROU'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'SVK'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=7), (SELECT country_code FROM Countries WHERE country_code = 'CHE'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	
    	-- Sony Xperia Z1 US Model
    	((SELECT dev_id FROM Devices WHERE dev_id=8), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'AT&T')),
    	
    	-- Sony Xperia Z1 International Model
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'AUS'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Bell Mobility')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Rogers Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'GBM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'ARM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'BEL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'SPN'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'FRA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'LUX'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'MDA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'PUL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'PRT'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'ROU'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'SVK'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'CHE'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=9), (SELECT country_code FROM Countries WHERE country_code = 'RUS'), (SELECT name FROM Carriers WHERE name = 'MTS')),
    	
    	-- HTC One US Model 32 GB
    	((SELECT dev_id FROM Devices WHERE dev_id=10), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Verizon Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=10), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'AT&T')),
    	((SELECT dev_id FROM Devices WHERE dev_id=10), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Sprint')),
    	((SELECT dev_id FROM Devices WHERE dev_id=10), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'T-Mobile')),
    	
    	-- HTC One US Model 64 GB
    	((SELECT dev_id FROM Devices WHERE dev_id=11), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'AT&T')),
    	((SELECT dev_id FROM Devices WHERE dev_id=11), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'Sprint')),
    	((SELECT dev_id FROM Devices WHERE dev_id=11), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'T-Mobile')),
    	
    	
	-- HTC One International Model 32 GB
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Rogers Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Telus Mobility')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Bell Mobility')),    	
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'AUS'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),    	
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'GBM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'ARM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'BEL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'SPN'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'FRA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'LUX'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'MDA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'PUL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'PRT'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'ROU'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'SVK'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'CHE'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'RUS'), (SELECT name FROM Carriers WHERE name = 'MTS')),
    	
    	-- HTC One International Model 64 GB
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Rogers Wireless')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Telus Mobility')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'CAN'), (SELECT name FROM Carriers WHERE name = 'Bell Mobility')),    	
    	((SELECT dev_id FROM Devices WHERE dev_id=12), (SELECT country_code FROM Countries WHERE country_code = 'AUS'), (SELECT name FROM Carriers WHERE name = 'Virgin Mobile')),    	
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'GBM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'ARM'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'BEL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'SPN'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'FRA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'LUX'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'MDA'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'PUL'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'PRT'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'ROU'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'SVK'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'CHE'), (SELECT name FROM Carriers WHERE name = 'Orange')),
    	((SELECT dev_id FROM Devices WHERE dev_id=13), (SELECT country_code FROM Countries WHERE country_code = 'RUS'), (SELECT name FROM Carriers WHERE name = 'MTS')),
	
	-- Nokia Lumia 1520 US Model
	((SELECT dev_id FROM Devices WHERE dev_id=14), (SELECT country_code FROM Countries WHERE country_code = 'USA'), (SELECT name FROM Carriers WHERE name = 'AT&T'));
    	
INSERT INTO Radio_spectrum(carrier_name, radio_spectrum) VALUES
	((SELECT name FROM Carriers WHERE name = 'Verizon Wireless'), 'CDMA'),
	((SELECT name FROM Carriers WHERE name = 'Verizon Wireless'), 'LTE'),
	((SELECT name FROM Carriers WHERE name = 'AT&T'), 'GSM'),
	((SELECT name FROM Carriers WHERE name = 'AT&T'), 'HSPA+'),
	((SELECT name FROM Carriers WHERE name = 'AT&T'), 'LTE'),
	((SELECT name FROM Carriers WHERE name = 'T-Mobile'), 'GSM'),
	((SELECT name FROM Carriers WHERE name = 'T-Mobile'), 'HSPA+'),
	((SELECT name FROM Carriers WHERE name = 'T-Mobile'), 'LTE'),
	((SELECT name FROM Carriers WHERE name = 'Sprint'), 'CDMA'),
	((SELECT name FROM Carriers WHERE name = 'Sprint'), 'LTE'),
	((SELECT name FROM Carriers WHERE name = 'Virgin Mobile'), 'CDMA'), -- USA
	((SELECT name FROM Carriers WHERE name = 'Virgin Mobile'), 'GSM'), -- outside USA
	((SELECT name FROM Carriers WHERE name = 'Virgin Mobile'), 'LTE'),
	((SELECT name FROM Carriers WHERE name = 'Rogers Wireless'), 'GSM'), -- Canada
	((SELECT name FROM Carriers WHERE name = 'Rogers Wireless'), 'HSPA+'), -- Canada
	((SELECT name FROM Carriers WHERE name = 'Rogers Wireless'), 'LTE'), -- Canada
	((SELECT name FROM Carriers WHERE name = 'Telus Mobility'), 'CDMA'), -- Canada
	((SELECT name FROM Carriers WHERE name = 'Telus Mobility'), 'HSPA+'), -- Canada
	((SELECT name FROM Carriers WHERE name = 'Bell Mobility'), 'CDMA'), -- Canada
	((SELECT name FROM Carriers WHERE name = 'Bell Mobility'), 'HSPA+'), -- Canada
	((SELECT name FROM Carriers WHERE name = 'America Movil'), 'CDMA'), -- Mexico
	((SELECT name FROM Carriers WHERE name = 'America Movil'), 'HSPA+'), -- Mexico
	((SELECT name FROM Carriers WHERE name = 'Vivo'), 'CDMA'), -- Brazil
	((SELECT name FROM Carriers WHERE name = 'Vivo'), 'GSM'), -- Brazil
	((SELECT name FROM Carriers WHERE name = 'Vivo'), 'HSPA+'), -- Brazil
	((SELECT name FROM Carriers WHERE name = 'Orange'), 'GSM'), -- UK
	((SELECT name FROM Carriers WHERE name = 'MTS'), 'GSM'), -- RUSSIA

INSERT INTO Internals(dev_id, comp_id) VALUES
	-- the following internals are for the Samsung Galaxy S4
	-- USA Model
	((SELECT dev_id FROM Devices WHERE dev_id = 1), (SELECT comp_id FROM Components WHERE comp_id = 3)),
	((SELECT dev_id FROM Devices WHERE dev_id = 1), (SELECT comp_id FROM Components WHERE comp_id = 8)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 1), (SELECT comp_id FROM Components WHERE comp_id = 12)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 1), (SELECT comp_id FROM Components WHERE comp_id = 15)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 1), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 1), (SELECT comp_id FROM Components WHERE comp_id = 23)),
	-- International Model
	((SELECT dev_id FROM Devices WHERE dev_id = 2), (SELECT comp_id FROM Components WHERE comp_id = 3)),
	((SELECT dev_id FROM Devices WHERE dev_id = 2), (SELECT comp_id FROM Components WHERE comp_id = 8)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 2), (SELECT comp_id FROM Components WHERE comp_id = 12)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 2), (SELECT comp_id FROM Components WHERE comp_id = 15)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 2), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 2), (SELECT comp_id FROM Components WHERE comp_id = 23)),
	
	-- the following internals are for the Nexus 5 
	-- 16 GB Model
	((SELECT dev_id FROM Devices WHERE dev_id = 3), (SELECT comp_id FROM Components WHERE comp_id = 2)),
	((SELECT dev_id FROM Devices WHERE dev_id = 3), (SELECT comp_id FROM Components WHERE comp_id = 9)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 3), (SELECT comp_id FROM Components WHERE comp_id = 14)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 3), (SELECT comp_id FROM Components WHERE comp_id = 17)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 3), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 3), (SELECT comp_id FROM Components WHERE comp_id = 25)),
	-- 32 GB Model
	((SELECT dev_id FROM Devices WHERE dev_id = 4), (SELECT comp_id FROM Components WHERE comp_id = 2)),
	((SELECT dev_id FROM Devices WHERE dev_id = 4), (SELECT comp_id FROM Components WHERE comp_id = 9)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 4), (SELECT comp_id FROM Components WHERE comp_id = 14)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 4), (SELECT comp_id FROM Components WHERE comp_id = 17)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 4), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 4), (SELECT comp_id FROM Components WHERE comp_id = 25)),
	
	-- the following internals are for the iPhone 5s 
	-- 16 GB Model
	((SELECT dev_id FROM Devices WHERE dev_id = 5), (SELECT comp_id FROM Components WHERE comp_id = 1)),
	((SELECT dev_id FROM Devices WHERE dev_id = 5), (SELECT comp_id FROM Components WHERE comp_id = 9)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 5), (SELECT comp_id FROM Components WHERE comp_id = 13)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 5), (SELECT comp_id FROM Components WHERE comp_id = 16)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 5), (SELECT comp_id FROM Components WHERE comp_id = 22)),
	((SELECT dev_id FROM Devices WHERE dev_id = 5), (SELECT comp_id FROM Components WHERE comp_id = 24)),
	((SELECT dev_id FROM Devices WHERE dev_id = 5), (SELECT comp_id FROM Components WHERE comp_id = 26)),
	-- 32 GB Model
	((SELECT dev_id FROM Devices WHERE dev_id = 6), (SELECT comp_id FROM Components WHERE comp_id = 1)),
	((SELECT dev_id FROM Devices WHERE dev_id = 6), (SELECT comp_id FROM Components WHERE comp_id = 9)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 6), (SELECT comp_id FROM Components WHERE comp_id = 13)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 6), (SELECT comp_id FROM Components WHERE comp_id = 16)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 6), (SELECT comp_id FROM Components WHERE comp_id = 22)),
	((SELECT dev_id FROM Devices WHERE dev_id = 6), (SELECT comp_id FROM Components WHERE comp_id = 24)),
	((SELECT dev_id FROM Devices WHERE dev_id = 6), (SELECT comp_id FROM Components WHERE comp_id = 26)),
	-- 64 GB Model
	((SELECT dev_id FROM Devices WHERE dev_id = 7), (SELECT comp_id FROM Components WHERE comp_id = 1)),
	((SELECT dev_id FROM Devices WHERE dev_id = 7), (SELECT comp_id FROM Components WHERE comp_id = 9)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 7), (SELECT comp_id FROM Components WHERE comp_id = 13)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 7), (SELECT comp_id FROM Components WHERE comp_id = 16)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 7), (SELECT comp_id FROM Components WHERE comp_id = 22)),
	((SELECT dev_id FROM Devices WHERE dev_id = 7), (SELECT comp_id FROM Components WHERE comp_id = 24)),
	((SELECT dev_id FROM Devices WHERE dev_id = 7), (SELECT comp_id FROM Components WHERE comp_id = 26)),
	
	-- the following internals are for the xPeria Z1
	-- North America Model
	((SELECT dev_id FROM Devices WHERE dev_id = 8), (SELECT comp_id FROM Components WHERE comp_id = 4)),
	((SELECT dev_id FROM Devices WHERE dev_id = 8), (SELECT comp_id FROM Components WHERE comp_id = 6)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 8), (SELECT comp_id FROM Components WHERE comp_id = 12)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 8), (SELECT comp_id FROM Components WHERE comp_id = 18)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 8), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 8), (SELECT comp_id FROM Components WHERE comp_id = 25)),
	-- Worldwide Model
	((SELECT dev_id FROM Devices WHERE dev_id = 9), (SELECT comp_id FROM Components WHERE comp_id = 4)),
	((SELECT dev_id FROM Devices WHERE dev_id = 9), (SELECT comp_id FROM Components WHERE comp_id = 6)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 9), (SELECT comp_id FROM Components WHERE comp_id = 12)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 9), (SELECT comp_id FROM Components WHERE comp_id = 18)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 9), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 9), (SELECT comp_id FROM Components WHERE comp_id = 25)),
	
	-- the following internals are for the HTC One
	-- North America Model, 32 GB
	((SELECT dev_id FROM Devices WHERE dev_id = 10), (SELECT comp_id FROM Components WHERE comp_id = 2)),
	((SELECT dev_id FROM Devices WHERE dev_id = 10), (SELECT comp_id FROM Components WHERE comp_id = 10)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 10), (SELECT comp_id FROM Components WHERE comp_id = 11)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 10), (SELECT comp_id FROM Components WHERE comp_id = 19)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 10), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 10), (SELECT comp_id FROM Components WHERE comp_id = 23)),
	-- North America Model, 64 GB
	((SELECT dev_id FROM Devices WHERE dev_id = 11), (SELECT comp_id FROM Components WHERE comp_id = 2)),
	((SELECT dev_id FROM Devices WHERE dev_id = 11), (SELECT comp_id FROM Components WHERE comp_id = 10)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 11), (SELECT comp_id FROM Components WHERE comp_id = 11)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 11), (SELECT comp_id FROM Components WHERE comp_id = 19)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 11), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 11), (SELECT comp_id FROM Components WHERE comp_id = 23)),
	-- Europe/Middle East/Africa Model, 32 GB
	((SELECT dev_id FROM Devices WHERE dev_id = 12), (SELECT comp_id FROM Components WHERE comp_id = 2)),
	((SELECT dev_id FROM Devices WHERE dev_id = 12), (SELECT comp_id FROM Components WHERE comp_id = 10)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 12), (SELECT comp_id FROM Components WHERE comp_id = 11)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 12), (SELECT comp_id FROM Components WHERE comp_id = 19)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 12), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 12), (SELECT comp_id FROM Components WHERE comp_id = 23)),
	-- Europe/Middle East/Africa Model, 64 GB
	((SELECT dev_id FROM Devices WHERE dev_id = 13), (SELECT comp_id FROM Components WHERE comp_id = 2)),
	((SELECT dev_id FROM Devices WHERE dev_id = 13), (SELECT comp_id FROM Components WHERE comp_id = 10)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 13), (SELECT comp_id FROM Components WHERE comp_id = 11)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 13), (SELECT comp_id FROM Components WHERE comp_id = 19)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 13), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 13), (SELECT comp_id FROM Components WHERE comp_id = 23)),
	
	-- the following internals are for the HTC One
	-- United States Model, 32 GB
	((SELECT dev_id FROM Devices WHERE dev_id = 14), (SELECT comp_id FROM Components WHERE comp_id = 5)),
	((SELECT dev_id FROM Devices WHERE dev_id = 14), (SELECT comp_id FROM Components WHERE comp_id = 7)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 14), (SELECT comp_id FROM Components WHERE comp_id = 13)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 14), (SELECT comp_id FROM Components WHERE comp_id = 20)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 14), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 14), (SELECT comp_id FROM Components WHERE comp_id = 25)),
	-- International Model, 32 GB
	((SELECT dev_id FROM Devices WHERE dev_id = 15), (SELECT comp_id FROM Components WHERE comp_id = 5)),
	((SELECT dev_id FROM Devices WHERE dev_id = 15), (SELECT comp_id FROM Components WHERE comp_id = 7)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 15), (SELECT comp_id FROM Components WHERE comp_id = 13)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 15), (SELECT comp_id FROM Components WHERE comp_id = 20)), 
	((SELECT dev_id FROM Devices WHERE dev_id = 15), (SELECT comp_id FROM Components WHERE comp_id = 21)),
	((SELECT dev_id FROM Devices WHERE dev_id = 15), (SELECT comp_id FROM Components WHERE comp_id = 25));
	
