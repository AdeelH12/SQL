-- Total Sales: The overall revenue generated from all items sold

SELECT SUM(Sales) FROM grocery_data;

-- Average Sales: The average revenue per sale

SELECT AVG(Sales) AS Average_Sale FROM grocery_data;

-- Number of Items: The total count of different items sold

SELECT Item_Type, COUNT(*) as Items_Sold_Count
FROM grocery_data
GROUP BY Item_Type;

-- Average rating: The average customer rating for items sold

SELECT AVG(Rating) AS Average_Customer_Rating 
FROM grocery_data;

-- Total sales by fat content

SELECT Item_Fat_Content, SUM(Sales)  AS Total_Sales
FROM grocery_data
GROUP BY Item_Fat_Content;

-- Total sales by item type

SELECT Item_Type, SUM(Sales) as Total_Sales
FROM grocery_data
GROUP BY Item_Type;

-- Fat Content by Outlet for Total Sales
SELECT Item_Fat_Content, 
Outlet_Location_Type,
SUM(Sales) As Total_Sales
FROM grocery_data
GROUP BY Item_Fat_Content,
Outlet_Location_Type
ORDER BY Outlet_Location_Type ASC;

-- Total Sales By Outlet Establishment
SELECT Outlet_Establishment_Year, SUM(Sales) as Total_Sales
FROM grocery_data
GROUP BY Outlet_Establishment_Year;


-- Total Sales By Outlet Size
SELECT Outlet_Size, SUM(Sales) as Total_Sales
FROM grocery_data
GROUP BY Outlet_Size;

-- Total Sales By Outlet Location
SELECT Outlet_Location_Type, SUM(Sales) as Total_Sales
FROM grocery_data
GROUP BY Outlet_Location_Type;

-- total sales, average sales, number of items, average rating
SELECT Outlet_Type, SUM(Sales) AS Total_Sales, 
AVG(Sales) AS Average_Sales,  
AVG(Rating) AS Average_Rating,
COUNT(*) AS Total_Items_Sold
FROM grocery_data
GROUP BY Outlet_Type;