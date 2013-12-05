-- Assignment 10 - Tech Review Queries
-- Authors: Nick Colburn
-- George Gutierrez
-- Joao Leite

-- Queries for Java Database Application

--Shows all devices sold with respective name, model_number, listed_price and sale_price
SELECT r.name AS Retailer_Name, d.name AS Device_Name , d.model_number AS Device_Model, d.listed_price AS Listed_Price, s.sale_price AS Sale_Price  FROM Sales s
	LEFT OUTER JOIN Retailers r on s.retailer = r.name
	LEFT OUTER JOIN Devices d ON d.dev_id = s.dev_id;

--shows all the components of the Nexus 5 device (add at least 1 more table to retrieve more info)
SELECT * FROM Components c
	LEFT OUTER JOIN Devices d ON d.dev_id = c.comp_id
WHERE d.name = 'Nexus 5 (16GB)';
