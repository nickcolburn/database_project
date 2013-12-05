-- Assignment 10 - Tech Review Queries
-- Authors: Nick Colburn
-- George Gutierrez
-- Joao Leite

-- Insert Table Statements
-- Populates tables with a minimum of 10 rows

INSERT INTO Manufacturers(name) VALUES
        ('Samsung'),
        ('Apple'),
        ('Motorola'),
        ('LG'),
        ('Sony'),
        ('RIM'),
        ('Nokia'),
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
        ('Reliance Communications', 'tbd'),
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
        ('Galaxy S3', 'I9300', 569.99,         '2012-05-01', 4.6, 136.6, 70.6, 8.6),
        ('DROID MAXX', 'XT1080', 499.00, '2013-07-23', 4.48, 130.7, 68.9, 7.1),
        ('Nexus 5 (16GB)', 'LG-D820', 349.00, '2013-10-31', 4.59, 137.9, 69.2, 8.6),
        ('iPhone 5S (16GB)', 'A1533', 649.99, '2013-09-20', 3.95, 123.8, 58.6, 7.6);
        
INSERT INTO Sales(dev_id, retailer, sale_price) VALUES
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT name FROM Retailers WHERE name='Amazon'),                199.99),
        ((SELECT dev_id FROM Devices WHERE dev_id=2), (SELECT name FROM Retailers WHERE name='Best Buy'),        0.0),
        ((SELECT dev_id FROM Devices WHERE dev_id=3), (SELECT name FROM Retailers WHERE name='Best Buy'),        149.99),
        ((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT name FROM Retailers WHERE name='Best Buy'),        49.99),
        ((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT name FROM Retailers WHERE name='Best Buy'),        299.99);
                        
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
        ((SELECT dev_id FROM Devices WHERE dev_id=4), (SELECT username FROM Users WHERE username='Spaz'), 4.0, 'Kit Kat brings some fun cool new features to the phone. The only downside is that the camera struggles under auto setting.'),
        ((SELECT dev_id FROM Devices WHERE dev_id=5), (SELECT username FROM Users WHERE username='El Profe'), 4.5, 'Amazing phone! I only wish that the cheap plastic casing makes it feel and look like a cheap phone.');

INSERT INTO Supports(dev_id, country, carrier) VALUES
        -- Samsung Galaxy S4 = dev_id 1
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country FROM Countries WHERE name = 'United States'), (SELECT carrier FROM Carriers WHERE country_code = 'USA'),
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country FROM Countries WHERE name = 'United States'), (SELECT carrier FROM Carriers WHERE name = 'AT&T'),
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country FROM Countries WHERE name = 'United States'), (SELECT carrier FROM Carriers WHERE name = 'T-Mobile'),
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country FROM Countries WHERE name = 'United States'), (SELECT carrier FROM Carriers WHERE name = 'Sprint'),
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country FROM Countries WHERE name = 'United States'), (SELECT carrier FROM Carriers WHERE name = 'Verizon Wireless'),
        ((SELECT dev_id FROM Devices WHERE dev_id=1), (SELECT country FROM Countries WHERE name = 'United States'), (SELECT carrier FROM Carriers WHERE name = 'Verizon Wireless');
