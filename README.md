#  Pizza Sales Analysis | SQL + Power BI – April 2025

This project presents a complete analysis of a pizza sales dataset using SQL Server and Power BI. With over 48,000 records, it explores time-based trends, customer preferences, ingredient usage, and revenue patterns. The Power BI dashboard delivers dynamic, interactive insights into pizza sales performance.

---

##  Project Objective

- Analyze pizza sales data to identify key business insights.
- Answer business questions using SQL queries.
- Design and publish an interactive Power BI dashboard for stakeholders.
- Showcase end-to-end data analysis skills including cleaning, transformation, modeling, and storytelling.

---

##  Tools Used

- **SQL Server** – Data exploration and analysis
- **Power BI** – Data visualization and dashboard creation
- **DAX** – Calculated fields and measures

---

##  Key Insights from SQL Analysis

| Insight | Value |
|--------|-------|
|  Most Active Hour | 12 PM (6.5K+ orders) |
|  Top Pizza Category | Classic (14.5K+ orders) |
|  Total Revenue | Calculated using `SUM(total_price)` |
|  Avg Order Value | Calculated using total revenue / distinct orders |
|  Unique Pizza Combinations | 32 (name + ingredients) |
|  Peak Sales Month | July |
|  Least Sales Month | October |

---

##  Power BI Dashboard Overview

The dashboard visualizes critical trends and answers business-focused questions such as:

### 1. **Peak Order Time (Hourly Trend)**
- **Chart**: Clustered Column Chart

### 2. **Most & Least Sold Pizza Category**
- **Chart**: Line Chart

### 3. **Total Unique Pizza**
- **Chart**: Card (KPI)

### 4. **Best and Worst Sales Months**
- **Chart**: Stacked Bar Chart

### 5. **Monthly Revenue with Percentage**
- **Chart**: Line + Stacked Column Chart

### 6. **Revenue by Day of Week**
- **Chart**: Line + Stacked Column Chart

### 7. **Top Pizza Ingredient Combinations**
- **Chart**: Stacked Bar Chart

### 8. **Most Frequently Used Ingredients**
- **Chart**: Clustered Bar Chart

### 9. **Sales by Pizza Size**
- **Chart**: Clustered Column Chart

---

##  Data Cleaning & Transformation

- Removed duplicate records to ensure data accuracy and consistency.
- Created a new table pizza_single_ingredients by transforming the pizza_ingredients column:
   * Selected relevant columns: pizza_id, pizza_category.
   * Split the pizza_ingredients column into individual ingredients — one per row — to enable detailed ingredient-level analysis.
  
- Enhanced the pizza_sales table with time-based features to support temporal analysis:
  
  * order_hour: Extracted from the order timestamp to analyze peak sales hours.
  * order_month: Extracted to observe monthly sales trends.
  * order_day: Extracted to evaluate daily sales performance.
    
- Applied string manipulation and tokenization using `STRING_SPLIT()`.

---

##  Extended SQL Analysis (Own Questions)

In addition to basic metrics, I explored deeper questions such as:

- Most preferred order time?
- Highest & lowest-selling pizza categories?
- Total unique pizzas (by name + ingredients)?
- Which month has the most/least sales?
- Revenue contribution per month and day of the week?
- Most used ingredients?
- Most common pizza size?

> All insights were derived from handcrafted SQL queries without relying on pre-built reports or tools.

---

##  File Structure
pizza_sales.csv
pizza report-1.pbix
Pizza sales .sql

##  Conclusion

This project was a great hands-on experience in:

- Translating raw transactional data into business insights.
- Crafting insightful SQL queries for exploratory and diagnostic analysis.
- Building a compelling Power BI dashboard that can aid real-world decision-making in food and beverage retail.

---

##  Contact

**Haritha S**  
mail: haritha6104@gmail.com  
contact: +91 9499979700  

---

 *If you found this project insightful, feel free to star the repo and follow for more analytics projects!*

