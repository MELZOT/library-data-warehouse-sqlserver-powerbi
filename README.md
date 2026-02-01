# library-data-warehouse-sqlserver-powerbi
Data Warehouse for academic library using SQL Server and Power BI
.---

## ▶️ How to Run the Project

1. Open SQL Server Management Studio and connect to your SQL Server instance.
2. Run `sql/createLibDW.sql` 
  - This creates the database, staging table, star schema and loads the data.
  - Edit the file path for the input text file if needed.
3. Run `sql/queriesLibDW.sql` to execute the analytical queries.
4. Open `powerbi/libraryDW-final.pbix` in Power BI Desktop.
5. Refresh the data source to load the warehouse tables.

---

## 📈 Power BI Report

The Power BI dashboard visualizes:

- Loan counts by department and gender
- Monthly loan trends
- Loan distribution by location and material type
- Yearly and quarterly summaries

Screenshots of the report are available in the `screenshots/` folder.

---

## 🎯 Skills Demonstrated

- Data Warehouse design (Star Schema)
- ETL using SQL
- OLAP-style queries and aggregations
- GROUP BY CUBE / ROLLUP
- Business Intelligence reporting
- Data modeling and visualization

---

## 📌 Notes

- SQL file paths may need to be adjusted depending on the local environment.
- Power BI requires a local SQL Server connection to refresh the dataset.

