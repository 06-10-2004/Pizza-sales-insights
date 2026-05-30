# Pizza Sales Analysis – SQL + Power BI (April 2025)

![SQL Server](https://img.shields.io/badge/SQL-Server-orange.svg)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow.svg)
![DAX](https://img.shields.io/badge/DAX-Analytics-blue.svg)
![Data Analysis](https://img.shields.io/badge/Data-Analytics-red.svg)
![Visualization](https://img.shields.io/badge/Data-Visualization-blueviolet.svg)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen.svg)

---

## Project Overview
This project presents an end-to-end analysis of a pizza sales dataset using **SQL Server and Power BI**.  
With over **48,000 records**, it explores sales trends, customer preferences, ingredient usage, and revenue patterns.

The Power BI dashboard provides interactive insights to support data-driven decision-making in the food and beverage industry.

---

## Project Objective
- Analyze pizza sales data to extract business insights  
- Use SQL queries for data exploration and analysis  
- Build an interactive Power BI dashboard  
- Apply end-to-end analytics workflow (cleaning → transformation → visualization → storytelling)  

---

## Tools Used
- SQL Server – Data extraction and analysis  
- Power BI – Dashboard development  
- DAX – Measures and calculated columns  
- Excel – Data handling and validation  

---

## Key Insights from SQL Analysis

| Insight | Value |
|--------|------|
| Most Active Hour | 12 PM (6.5K+ orders) |
| Top Pizza Category | Classic (14.5K+ orders) |
| Peak Sales Month | July |
| Lowest Sales Month | October |
| Unique Pizza Combinations | 32 |
| Average Order Value | Revenue / Orders |

---

## Power BI Dashboard Overview

The dashboard visualizes key business metrics and answers important questions:

- Peak Order Time (Hourly Trend Analysis)  
- Best & Worst Performing Pizza Categories  
- Monthly Revenue Trends  
- Revenue by Day of Week  
- Ingredient Usage Analysis  
- Pizza Size Preferences  
- Top Selling Combinations  

---

## Data Cleaning & Transformation

- Removed duplicate records for data consistency  
- Split pizza ingredients into individual rows using `STRING_SPLIT()`  
- Created time-based features:
  - `order_hour`
  - `order_month`
  - `order_day`
- Enhanced dataset for time-series and ingredient-level analysis  

---

## Extended SQL Analysis

Additional business questions explored:

- Peak order timings  
- Best and worst-performing pizza categories  
- Monthly and seasonal sales trends  
- Ingredient popularity analysis  
- Revenue distribution across time periods  
- Pizza size preference patterns  

---

## File Structure

```text
pizza_sales.csv
pizza_sales.sql
pizza_report.pbix
```

---

## Conclusion
This project demonstrates how raw transactional data can be transformed into meaningful business insights using SQL and Power BI. It highlights skills in:

- Data cleaning and transformation  
- SQL-based analytical querying  
- Data visualization and dashboard design  
- Business storytelling using data  

---

## Author
**Haritha S**

**Tools Used:** SQL Server, Power BI, DAX, Excel, Data Visualization

