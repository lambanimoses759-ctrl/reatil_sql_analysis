 reatil_sql_analysis
An end-to-end SQL data analytics project auditing $59.69M in retail transactions, analyzing promotional discount leakage, regional trends, and MoM growth using MySQL
 Retail Performance & Financial Audit (SQL Analysis)

 Project Overview
This project provides an end-to-end financial audit and operational analysis of **1,000 retail transactions**. Using **MySQL Workbench**, raw transaction data was audited to resolve calculation inconsistencies in reported totals, evaluate regional product strongholds, analyze promotional discount leakage, and measure month-over-month revenue trends.

 Key Business Questions Addressed
1. **Financial Reconciliation:** What is the true verified Net Revenue and Net Profit after auditing raw product pricing, volumes, and discounts?
2. **Promotional Impact:** How much revenue is lost to heavy discounting, and does discounting drive higher order volumes?
3. **Regional Strategy:** Which product categories generate the highest net revenue in each geographic region?
4. **Revenue Volatility:** What are the month-over-month (MoM) growth patterns and seasonal peak months across 2023–2024?

 📊 Key Findings & Business Insights

* **Verified Net Baseline:** Audited total Net Revenue at **~$59.69M** across 1,000 transactions, removing discrepancies from raw reported figures.
* **Regional Product Winners:**
  * **North Region:** Clothing led with **~$4.42M** Net Revenue.
  * **East Region:** Electronics dominated with **~$4.19M** Net Revenue.
  * **West Region:** Furniture generated the highest regional net sales at **~$4.29M**.
  * **South Region:** Clothing held 1st place with **~$3.91M** Net Revenue.
* **Month-over-Month Volatility:** Sales peaked sharply in **August 2023 (+43.0% MoM rebound)** following a mid-year drop in July (-24.4% MoM), indicating high responsiveness to mid-year promotional campaigns.

  Tech Stack & SQL Techniques Used
* **Database Management:** MySQL Workbench
* **Aggregations & Math:** `SUM()`, `COUNT()`, `AVG()`, `ROUND()`
* **Conditional Logic:** Categorical bucketing using `CASE WHEN`
* **Advanced Analytics & Window Functions:** 
  * `RANK() OVER (PARTITION BY Region ORDER BY ...)` for regional matrix ranking
  * `LAG() OVER (ORDER BY Sales_Month)` for MoM trend calculations
* **Subqueries & Organization:** Common Table Expressions (CTEs) via `WITH` statements
* **Date Parsing:** `STR_TO_DATE()` and `DATE_FORMAT()` for standardizing raw date strings

 Repository Structure
```text
├── data/
│   └── sales_data.csv           Raw retail transactions dataset
├── sql/
│   └── sales_analysis.sql       Full MySQL script with all 5 analytical queries
└── README.md                    Project documentation and key executive takeaways
