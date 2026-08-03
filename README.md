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
**Repoprts:**<img width="1600" height="900" alt="Screenshot (2109)" src="https://github.com/user-attachments/assets/978e5e1f-e1de-4265-a040-2c48b3a6ea3c" />
<img width="1600" height="900" alt="Screenshot (2110)" src="https://github.com/user-attachments/assets/c0c943ab-d5eb-4d2b-9877-64b8ceede8a9" />
<img width="1600" height="900" alt="Screenshot (2111)" src="https://github.com/user-attachments/assets/b2c92e20-4b6c-4360-b613-735c77c8bcca" />



 Repository Structure
```text
├── data/
│   └── sales_data.csv           Raw retail transactions dataset
├── sql/
│   └── sales_analysis.sql       Full MySQL script with all 5 analytical queries
└── README.md                    Project documentation and key executive takeaways
