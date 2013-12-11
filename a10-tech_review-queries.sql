-- Assignment 10 - Tech Review Queries
-- Authors: Nick Colburn
-- George Gutierrez
-- Joao Leite

-- Queries for Java Database Application


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

-- Shows all devices available, with the quantity sold and the total revenue per device, excluding the ones sold by Amazon
SELECT d.name, d.model_number, s.sale_price, COUNT(s.dev_id) AS Qty_sold, r.name AS Retailer_name FROM Devices d
		LEFT OUTER JOIN Sales s ON s.dev_id = d.dev_id
		LEFT OUTER JOIN Retailers r ON s.retailer_id = r.retailer_id
WHERE s.retailer_id NOT IN (SELECT s.retailer_id FROM Retailers rr WHERE rr.name = 'Amazon')
GROUP BY d.name;


-- ## JAVA QUERIES ##

-- Show devices for a given value for rating. It shows 
SELECT r.rating AS Rating, d.name as Device_Name, d.model_number as Model_Number, m.name as Manufacturer_Name, s.name as Software_Name FROM Reviews r
	NATURAL JOIN Devices d
	LEFT OUTER JOIN Manufacturers m ON d.mfctr_id = m.mfctr_id
	LEFT OUTER JOIN Software s ON d.soft_id = s.soft_id
WHERE r.rating = 4.0; -- Replace 4.0 for the float value retrieved by the Java textfield


-- query to show devices based on screen size - the diagonal size can be found using height and width.
SELECT d.name, d.model_number AS model_number, m.name AS manufacturer_name, s.name AS software_name, d.height, d.width, SQRT(d.height*d.height + d.width*d.width) AS diagonal_size
FROM Devices d
	LEFT OUTER JOIN Manufacturers m ON d.mfctr_id = m.mfctr_id
	LEFT OUTER JOIN Software s ON d.soft_id = s.soft_id
GROUP BY diagonal_size
HAVING diagonal_size > 150.00; -- Replace 150 for the float value retrieved by the Java textfield

	
-- query to show devices based on price.
SELECT d.name, d.model_number AS model_number, m.name AS manufacturer_name, s.name AS software_name, d.listed_price FROM Devices d
	LEFT OUTER JOIN Manufacturers m ON d.mfctr_id = m.mfctr_id
	LEFT OUTER JOIN Software s ON d.soft_id = s.soft_id
GROUP BY d.listed_price
HAVING d.listed_price > 600.00; -- Replace 600.00 for the float value retrieved by the Java textfield
