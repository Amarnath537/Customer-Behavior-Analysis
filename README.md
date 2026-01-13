# 📊 Customer Behavior Analytics – End-to-End BI Project

## Project Overview
This project analyzes customer purchasing behavior using an end-to-end Business Intelligence(BI) pipeline. The goal is to uncover insights about customer segments, discounts, revenue, and product performance using Python, MySQL, and Power BI.

The Project simulates how a real analytics team processes raw business data, cleans it, stores it in a database, and builds dashboards for decision-making.


## Business Objectives
This project answers key business questions such as:
	· What percentage of customers are subscribed?
	· Which product categories generate the most revenue?
	· Which products are most purchased within each category?
	· How does customer behavior vary by age group?
	· What percentage of purchases receive discounts?
	· How should customers be segmented (New, Returning, Loyal)?


### Architecture

Raw CSV Data  
     ↓  
Python (Pandas – Cleaning & Validation)  
     ↓  
Cleaned Dataset  
     ↓  
SQLAlchemy  
     ↓  
MySQL Database  
     ↓  
SQL Analysis  
     ↓  
Power BI Dashboard


### Data Cleaning (Python - Pandas)
The raw dataset was profiled and cleaned using Python:
	· Checked column data types
	· Detected missing values
	· Filled missing numeric values using median (eg. Review rating category wise instead of global median value)
	· Removed duplicates
	· Validated age, price, and purchase ranges

This created a production-ready dataset.


### Database Loading (SQLAlchemy + MySQL)
The cleaned dataset was loaded into MySQL using SQLAlchemy:
	· Created MySQL connection
	· Loaded Pandas DataFrame into MySQL table
	· Verified row counts and data accuracy
	
This allowed SQL-based analytics to be performed on structured, reliable data.


### SQL Business Analysis
Key Analytical techniques used:
	· Aggregations (SUM, COUNT, AVG)
	· Conditional logic (CASE WHEN)
	· Window functions (DENSE_RANK)
	· Customer segmentation
	· Revenue and discount analysis


### Power BI Dashboard
The Power BI dashboard provides:
	· KPIs:
		○  Number of customers
		○ Average purchase amount
		○ Average review rating
	· Visuals:
		○ Customer subscription %
		○ Revenue & sales by category
		○ Revenue & sales by age group
		○ Interactive filters (gender, category, shipping type, subscription)
		
This allows business users to explore trends and customer behavior dynamically.


###💡Key Insights
	· Clothing and Accessories generate the highest revenue
	· Most customers are non-subscribers
	· Young Adults drive the highest revenue
	· Discount usage varies significantly across products
	· Loyal customers contribute a disproportionate share of sales


