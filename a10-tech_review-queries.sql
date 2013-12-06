-- Assignment 10 - Tech Review Queries
-- Authors: Nick Colburn
-- George Gutierrez
-- Joao Leite

-- Queries for Java Database Application

-- Shows all devices sold with respective name, model_number, listed_price and sale_price
SELECT r.name AS Retailer_Name, d.name AS Device_Name , d.model_number AS Device_Model, d.listed_price AS Listed_Price, s.sale_price AS Sale_Price  FROM Sales s
        LEFT OUTER JOIN Retailers r on s.retailer_id = r.retailer_id
        LEFT OUTER JOIN Devices d ON d.dev_id = s.dev_id;

-- Shows all devices who Android with Samsung as manufacturer.
SELECT d.name AS Device_name, m.name AS Manufacturer_Name, s.name AS Software_name, s.version AS Software_version FROM Devices d
		LEFT OUTER JOIN Manufacturers m ON d.mfctr_id = m.mfctr_id
		LEFT OUTER JOIN Software s ON d.soft_id = s.soft_id
WHERE m.name = 'Samsung';

-- Shows all devices not made for United States and its respective carrier
SELECT d.name AS Device_name, d.model_number, s.country AS Country, c.name AS Carrier_name FROM Supports s
		LEFT OUTER JOIN Devices d ON s.dev_id = d.dev_id
		LEFT OUTER JOIN Carriers c ON c.name = s.carrier
WHERE s.country NOT IN (SELECT country_code FROM Countries WHERE name='United States');

-- Shows the device with the higher sale price
SELECT d.name, d.model_number, r.name, s.sale_price FROM Sales s
		NATURAL JOIN Devices d 
		LEFT OUTER JOIN Retailers r ON r.retailer_id = s.retailer_id
WHERE s.sale_price >= (SELECT MAX(sale_price) FROM Sales);

-- Shows all devices available, with the quantity sold and the total revenue per device
SELECT d.name, d.model_number, s.sale_price, COUNT(s.dev_id) AS Qty_sold, r.name AS Retailer_name FROM Devices d
		LEFT OUTER JOIN Sales s ON s.dev_id = d.dev_id
		LEFT OUTER JOIN Retailers r ON s.retailer_id = r.retailer_id
GROUP BY d.name;
		 
