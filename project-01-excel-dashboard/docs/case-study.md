# Case Study: Retail Sales and Profitability Dashboard Using Excel

## 1. Project Title

Retail Sales and Profitability Dashboard Using Excel

## 2. Business Problem

A retail business needs a clear way to monitor sales, profit, discounts, product performance, customer segments, and regional performance. The business wants to identify which areas are performing well and which areas are reducing profitability.

The main challenge is that sales volume alone does not show the full business picture. Some products and categories may generate high sales but weak profit due to discounts, costs, or pricing issues.

## 3. Project Objective

The objective of this project was to build an Excel dashboard that helps business users:

* Monitor key sales and profit KPIs
* Understand regional and category performance
* Analyze customer segment contribution
* Evaluate the impact of discounts on profitability
* Identify product-level opportunities and risks
* Generate business recommendations from the data

## 4. Dataset Source

The dataset used for this project is a Superstore sales dataset collected from Kaggle. It contains retail transaction-level data including order information, customers, regions, products, sales, quantity, discount, and profit.

## 5. Tools Used

* Microsoft Excel
* Power Query
* Pivot Tables
* Pivot Charts
* Slicers
* KPI Cards

## 6. Dataset Overview

The dataset contains retail sales records with fields such as:

* Order ID
* Order Date
* Ship Date
* Ship Mode
* Customer ID
* Customer Name
* Segment
* Country/Region
* City
* State/Province
* Postal Code
* Region
* Product ID
* Category
* Sub-Category
* Product Name
* Sales
* Quantity
* Discount
* Profit

## 7. Data Cleaning Steps

The data was cleaned using Excel Power Query. The cleaning process included:

1. Promoting the first row as headers.
2. Assigning correct data types to date, text, and numeric columns.
3. Keeping Postal Code as text to preserve alphanumeric postal codes.
4. Trimming and cleaning text fields.
5. Removing duplicate business rows.
6. Validating that Ship Date is not earlier than Order Date.
7. Keeping negative profit values because they represent valid loss-making orders.
8. Creating additional analysis columns:

   * Order Year
   * Order Month Number
   * Order Month Name
   * Order Year-Month
   * Shipping Days
   * Profit Margin
   * Profit Status
   * Discount Band
   * Sales Bucket

## 8. Analysis Process

The cleaned dataset was loaded into Excel and analyzed using pivot tables. The pivot tables were used to calculate KPIs and summarize sales and profit performance by month, region, category, customer segment, product, and discount band.

The dashboard was then created using pivot charts, slicers, KPI cards, and executive insight boxes.

## 9. Key KPIs

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

## 10. Dashboard Features

The dashboard includes:

* KPI cards for sales, profit, margin, orders, and average order value
* Slicers for interactive filtering
* Monthly sales and profit trend
* Sales and profit by region
* Sales and profit by category
* Customer segment performance
* Discount impact analysis
* Top 10 products by sales
* Executive insights summary

## 11. Key Insights

1. The business generated $2.33M in total sales and $292.27K in profit, with an overall profit margin of 12.56%.

2. West was the strongest region by both sales and profit. East also performed strongly, while Central showed weaker profitability compared with its sales volume.

3. Technology was the strongest product category by both sales and profit.

4. Furniture generated high sales but weak profit, suggesting possible margin pressure, high costs, or discount issues.

5. Consumer customers generated the highest total sales, making them the largest revenue-contributing customer segment.

6. Medium and high discount bands produced negative profit, showing that aggressive discounting has a harmful impact on profitability.

7. Some products with high sales may not be highly profitable, so product decisions should consider both sales and profit.

## 12. Business Recommendations

1. Reduce aggressive discounts on low-margin and loss-making products.

2. Prioritize profitable Technology products and selected Office Supplies products in sales and marketing campaigns.

3. Review Furniture pricing, cost, and discount strategy to improve profit margin.

4. Investigate loss-making products before promoting them heavily.

5. Use regional performance insights to improve sales strategy in weaker markets.

6. Track profit margin along with sales when evaluating product and category performance.

## 13. Final Business Impact

This dashboard helps business users make better decisions by showing not only where sales are coming from, but also where profit is being created or lost. It supports better pricing, discount control, category management, regional planning, and product promotion decisions.

## 14. Challenges Faced

* Some records had negative profit, but these were valid business records and were kept for loss analysis.
* Postal Code needed to be stored as text because some values were alphanumeric.
* Sales performance needed to be analyzed together with profit because high sales did not always mean strong profitability.

## 15. What I Learned

This project strengthened my ability to:

* Clean business data using Power Query
* Build pivot-table-based analysis
* Create interactive Excel dashboards
* Design executive KPI cards
* Analyze profitability and discount impact
* Convert raw data into business recommendations

## 16. Recruiter-Friendly Summary

This project demonstrates practical Excel analytics skills by using Power Query, pivot tables, pivot charts, slicers, and KPI cards to analyze retail sales performance. The dashboard provides business insights into sales, profit, customer segments, regional performance, category performance, and discount impact.
