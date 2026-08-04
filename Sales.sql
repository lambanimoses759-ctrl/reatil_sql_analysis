SELECT
   Sales_Rep,
   COUNT(*) AS Total_Transactions,
   ROUND(SUM(Quantity_Sold * Unit_Price * (1 - Discount)), 2) AS Total_Net_Revenue,
   ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Percent,
   ROUND(SUM(Quantity_Sold * Unit_Price * Discount), 2) AS Total_Discounts_Given
FROM vw_sales_data_cleaned
GROUP BY Sales_Rep
ORDER BY Total_Net_Revenue DESC;

SELECT
    CASE 
       WHEN Discount = 0 THEN '0% (Full Price)'
       WHEN Discount <= 0.10 THEN '1% - 10% (Low Discount)'
       WHEN Discount <= 0.20 then '11% - 20% (mEDIUM dISCOUNT)'
       else '20%+ (High Discount)'
	END AS  Discount_Tier,
    COUNT(*) AS Transactuion_Count,
    ROUND(SUM(Quantity_Sold * Unit_Price), 2) AS Gross_Revenue,
    ROUND(SUM(Quantity_Sold * Unit_Price * Discount), 2) AS Revenue_Lost_To_Discounts,
    ROUND(SUM(Quantity_Sold * Unit_Price * (1 - Discount)), 2) AS Net_Revenue
FROM sales_data
GROUP BY 1
ORDER BY Revenue_Lost_To_Discounts DESC;

SELECT
     Region,
     Product_Category,
     COUNT(*) AS Total_Orders,
     SUM(Quantity_Sold) AS Total_Units_Sold,
     ROUND(SUM(Quantity_Sold * Unit_Price * (1 - Discount)), 2) AS Net_Revenue,
     ROUND(AVG(Quantity_Sold * Unit_Price * (1 - Discount)), 2) AS Avg_Order_Value,
     RANK() OVER (PARTITION BY Region ORDER BY SUM(Quantity_Sold * Unit_Price * (1 - Discount)) DESC) AS Regional_Rank
FROM sales_data
GROUP BY Region, Product_Category
ORDER BY Region, Regional_Rank;

SELECT 
    Sales_Channel,
    Customer_Type,
    COUNT(*) AS Order_Count,
    SUM(Quantity_Sold) AS Total_Units_Sold,
    ROUND(SUM(Quantity_Sold * Unit_Price * (1 - Discount)), 2) AS Total_Net_Revenue,
    ROUND(AVG(Quantity_Sold * Unit_Price * (1 - Discount)), 2) AS Avg_Order_Value
FROM sales_data
GROUP BY Sales_Channel, Customer_Type
ORDER BY Sales_Channel, Customer_Type;

WITH Monthly_Sales AS (
    SELECT 
         SUBSTRING_INDEX(Sale_Date, '/', -1) AS Sale_Year,
        ROUND(SUM(Quantity_Sold * Unit_Price * (1 - Discount)), 2) AS Monthly_Net_Revenue
    FROM sales_data
    GROUP BY Sale_Year
)

SELECT 
    Sales_Channel,
    Customer_Type,
    COUNT(*) AS Order_Count,
    SUM(Quantity_Sold) AS Total_Units_Sold,
    ROUND(SUM(Quantity_Sold * Unit_Price * (1 - Discount)), 2) AS Net_Revenue,
    ROUND(AVG(Quantity_Sold * Unit_Price * (1 - Discount)), 2) AS Avg_Order_Value
FROM sales_data
GROUP BY Sales_Channel, Customer_Type
ORDER BY Sales_Channel, Customer_Type;
    
      
