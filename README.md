# Amazon Sales Analysis Using MySQL

## 📌 Project Description
Developed a complete SQL-based data analysis project to explore and evaluate Amazon's retail sales data. The project involved:

- Designing a structured relational database  
- Analyzing transaction-level sales  
- Understanding customer behavior  
- Uncovering trends across products, branches, and time periods  

## 🛠️ Key Responsibilities

### 1. Database Design
Created a relational database (`Amazon_sales`) with a structured schema including:
- Customer information
- Product lines
- Invoice and transaction details
- Quantity, revenue, and timestamps

### 2. Data Exploration with SQL
- Wrote complex SQL queries to extract, clean, and analyze transactional data  
- Performed grouping, aggregation, filtering, and sorting for deep business insights  

### 3. Revenue & Product Analysis
- Identified top-selling product lines by quantity and revenue  
- Analyzed revenue generation across product categories and city branches  

### 4. Time-Series Trends
- Analyzed sales performance by **Month**, **Day of Week**, and **Time of Day**  
- Classified purchase periods as Morning, Afternoon, or Evening

### 5. Branch Performance
- Compared sales, quantity, and revenue across Naypyitaw, Yangon, and Mandalay  
- Evaluated top-performing branches by transaction volume and total revenue

### 6. Customer Behavior
- Segmented customers based on **gender** and **type (Member/Normal)**  
- Analyzed revenue contribution and buying patterns across segments

### 7. Feature Engineering
- Created new columns using SQL logic:
  - `Month_name` using `MONTHNAME(date)`
  - `Day_name` using `DAYNAME(date)`
  - `Time_of_day` using `CASE` on `Time` column  
- Classified customer satisfaction into **Good**, **Average**, and **Poor** ratings based on review scores

### 8. Insight Generation
- Derived over 20 actionable business insights using:
  - `GROUP BY`, `HAVING`, `CASE`, nested subqueries, and `ROW_NUMBER()`  
- Delivered trend-based, comparative, and segment-focused analyses

## 🧰 Key Skills & Tools

- **SQL (MySQL):** `SELECT`, `JOIN`, `GROUP BY`, `ORDER BY`, `HAVING`, `CASE`, Subqueries, Aggregate & Window Functions  
- **Database Management:** Table creation, schema design, indexing  
- **Data Transformation:** Date formatting, text parsing, type casting  
- **Feature Engineering:** `monthname()`, `dayname()`, `CASE` logic  
- **Visualization Prep:** Output data was used in Excel dashboards and PowerPoint presentations  

## 🏆 Achievements

- Delivered **20+ business insights** using SQL queries alone  
- Built a scalable and clean transactional database from scratch  
- Identified key revenue drivers and customer segments  
- Created presentation-ready insights and visual summaries  
- Enabled data-driven recommendations for sales, marketing, and logistics  

## 📈 Project Impact

This analysis provided a complete data-driven overview of Amazon’s retail sales operations:

- Identified high-performing product lines and regions  
- Highlighted patterns in customer preferences and behaviors  
- Supported business decisions with evidence from time, sales, and branch-level data  

## ✅ Conclusion

### 📍 Branch Performance
- **Naypyitaw** had the highest overall revenue across all branches  

### 🛍️ Product Line Trends
- **Health and Beauty** was the top-performing product line  
- Followed by **Home and Lifestyle** and **Food and Beverages**

### 👤 Customer Behavior
- **Member customers** were more active than non-members  
- **Female customers** showed higher purchase rates, especially in Fashion and Health categories  

### ⏰ Time-Based Insights
- **Evening** was the most active purchase period  
- **Sunday** recorded the most transactions  
- **January** had the highest total revenue  

### 💳 Payment Preferences
- **Ewallet** was the most commonly used payment method  

### 🌟 Customer Satisfaction
- **Home and Lifestyle** and **Electronic Accessories** had the highest average ratings
