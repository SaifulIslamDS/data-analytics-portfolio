# Retail Sales and Profitability Dashboard Using Excel

## Project Overview

This project analyzes Superstore retail sales data using Microsoft Excel. The goal was to build an executive-level dashboard that helps business users understand sales performance, profitability, discount impact, customer segments, product categories, and regional performance.

The project demonstrates Excel-based data cleaning, Power Query transformation, pivot table analysis, KPI tracking, dashboard design, and business insight generation.

## Business Problem

A retail business wants to understand which products, regions, categories, and customer segments are driving sales and profit. The company also wants to identify whether discounts are helping or hurting profitability.

The main business questions are:

* What is the overall sales and profit performance?
* Which regions generate the highest sales and profit?
* Which product categories are most profitable?
* How does discounting affect profitability?
* Which customer segments contribute the most revenue?
* Which products should be reviewed for pricing or promotion decisions?

## Dataset

* Dataset: Superstore Sales Dataset
* Source: Kaggle
* File type: CSV
* Tool used for cleaning: Excel Power Query
* Tool used for dashboarding: Microsoft Excel

## Tools Used

* Microsoft Excel
* Power Query
* Pivot Tables
* Pivot Charts
* Slicers
* KPI Cards
* Business Reporting

## Data Cleaning Process

The raw dataset was cleaned using Power Query before analysis. The cleaning process included:

* Promoting headers
* Correcting data types
* Keeping Postal Code as text because the dataset includes alphanumeric postal codes
* Trimming and cleaning text fields
* Removing duplicate business rows
* Validating order dates and ship dates
* Keeping negative profit values because they represent valid loss-making transactions
* Creating dashboard-ready columns such as:

  * Order Year
  * Order Month Name
  * Order Year-Month
  * Shipping Days
  * Profit Margin
  * Profit Status
  * Discount Band
  * Sales Bucket

## Key KPIs

| KPI                 |    Value |
| ------------------- | -------: |
| Total Sales         |   $2.33M |
| Total Profit        | $292.27K |
| Profit Margin       |   12.56% |
| Total Orders        |    5,111 |
| Average Order Value |  $455.13 |
| Total Quantity Sold |   38,644 |
| Average Discount    |   15.54% |
| Loss-Making Rows    |    1,900 |

## Dashboard Features

The Excel dashboard includes:

* Executive KPI cards
* Interactive slicers
* Monthly sales and profit trend
* Sales and profit by region
* Sales and profit by category
* Customer segment performance
* Discount impact on profitability
* Top 10 products by sales
* Executive insights summary

## Key Insights

1. The business generated $2.33M in total sales and $292.27K in profit, with an overall profit margin of 12.56%.

2. The West region generated the highest sales and profit, followed by the East region. The Central region showed weaker profitability compared with its sales volume.

3. Technology was the strongest category by both sales and profit, while Furniture generated high sales but weak profit. This suggests margin pressure in the Furniture category.

4. Consumer customers contributed the highest sales volume, making them the most important customer segment for revenue generation.

5. Discounting had a major negative impact on profitability. Medium and high discount bands generated losses, which shows that aggressive discounting should be controlled.

6. Some top-selling products were not necessarily the most profitable. Product performance should be evaluated using both sales and profit, not sales alone.

## Business Recommendations

1. Reduce aggressive discounts on low-margin and loss-making products.

2. Prioritize Technology and profitable Office Supplies products in marketing and sales campaigns.

3. Review Furniture pricing, cost structure, and discount strategy to improve category profitability.

4. Investigate loss-making products before promoting them heavily.

5. Use regional performance insights to improve sales strategy in weaker markets.

6. Track both sales and profit together when making product, discount, and promotional decisions.

## Dashboard Screenshot

![Excel Dashboard Overview](screenshots/excel_dashboard_overview.png)

## Files Included

| File / Folder   | Description                    |
| --------------- | ------------------------------ |
| `data/raw/`     | Raw Superstore dataset         |
| `cleaned-data/` | Cleaned Excel dataset          |
| `dashboard/`    | Final Excel dashboard workbook |
| `screenshots/`  | Dashboard screenshots          |
| `docs/`         | Case study documentation       |
| `README.md`     | Project documentation          |

## Recruiter-Friendly Summary

Built an interactive Excel sales dashboard using Power Query, pivot tables, KPI cards, slicers, and pivot charts to analyze retail sales, profit, discount impact, customer segments, product categories, and regional performance. Delivered business insights and recommendations focused on improving profitability and reducing loss-making discount strategies.
