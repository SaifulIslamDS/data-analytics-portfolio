# Case Study: Financial Transaction and Accounting Performance Analysis Using SQL

## 1. Project Title
Financial Transaction and Accounting Performance Analysis Using SQL

## 2. Business Problem
A business needs to analyze financial transaction data to understand transaction value, cash flow movement, account-level activity, payment method usage, customer/vendor performance, and monthly financial patterns.

The challenge is that raw financial data does not automatically show whether business activity is driven by inflows, outflows, or transfers. SQL analysis is needed to clean, classify, summarize, and interpret the data.

## 3. Project Objective
The objective of this project was to use SQL to:

- Import and validate financial transaction data
- Create a cleaned SQL view
- Classify transactions into inflows, outflows, and transfers
- Calculate financial KPIs
- Analyze accounts, categories, payment methods, and customer/vendor activity
- Identify monthly trends and net cash flow pressure
- Generate business recommendations

## 4. Dataset Source
The dataset used for this project is a Financial Accounting dataset from Kaggle. It includes transaction-level records with dates, accounts, descriptions, debit, credit, category, transaction type, customer/vendor, payment method, and reference fields.

## 5. Tools Used
- PostgreSQL
- DBeaver Community
- SQL
- GitHub

## 6. Dataset Overview
The dataset contains:

- Rows: 100,000
- Columns: 10
- Date range: 2023-01-01 to 2023-12-28

Main columns:

- Date
- Account
- Description
- Debit
- Credit
- Category
- Transaction_Type
- Customer_Vendor
- Payment_Method
- Reference

## 7. Data Cleaning and Validation Steps
The data preparation process included:

1. Creating a PostgreSQL database named `financial_analytics_db`.
2. Creating a raw table named `financial_transactions_raw`.
3. Importing the CSV into PostgreSQL using DBeaver.
4. Validating row count, missing values, duplicates, and date range.
5. Creating a cleaned SQL view named `financial_transactions_cleaned`.
6. Trimming text fields.
7. Creating date fields such as transaction year, month number, month name, and year-month.
8. Creating `transaction_amount` from Debit.
9. Creating `cash_flow_direction` using Transaction_Type.
10. Creating `signed_amount` for net cash flow analysis.
11. Creating `transaction_value_band` for high, medium, and low-value transaction analysis.

## 8. Important Dataset Limitation
During validation, Debit and Credit values were found to be identical across all records. Because of this, traditional debit-minus-credit analysis would not produce meaningful results.

To keep the analysis business-relevant, Debit was treated as the transaction amount, and Transaction_Type was used to classify each transaction as:

- Inflow
- Outflow
- Transfer

Transfers were excluded from net cash flow impact because they represent internal movement.

## 9. Analysis Process
The analysis was performed using SQL queries grouped into beginner, intermediate, and advanced levels.

The SQL analysis included:

- KPI summary queries
- Transaction type analysis
- Monthly trend analysis
- Account-level reporting
- Category-level reporting
- Payment method analysis
- Customer/vendor ranking
- CTE-based summaries
- Window function analysis
- Running net cash flow
- Month-over-month change
- Transaction value band analysis

## 10. Key KPIs
| KPI | Value |
|---|---:|
| Total Transactions | 100,000 |
| Total Transaction Value | $60,774,736.83 |
| Average Transaction Value | $607.75 |
| Total Inflow | $13,705,912.88 |
| Total Outflow | $30,381,058.29 |
| Transfer Value | $16,687,765.66 |
| Estimated Net Cash Flow | $-16,675,145.41 |

## 11. Key Insights
1. The dataset includes 100,000 financial transactions with a total transaction value of $60,774,736.83.

2. Total outflow is $30,381,058.29, which is significantly higher than total inflow of $13,705,912.88.

3. The estimated net cash flow is $-16,675,145.41, indicating strong outflow pressure.

4. Transfer transactions total $16,687,765.66. These were separated from operating cash flow because they represent internal movement.

5. Inventory is the highest-value account, with total transaction value of $15,282,657.25.

6. The Asset category has the highest total value, followed closely by Revenue.

7. Check is the highest-value payment method, with total transaction value of $15,324,618.14.

8. High-value transactions account for 29,042 records and $26,220,872.11 in total value.

9. All months show negative estimated net cash flow, indicating consistent cash outflow pressure across the year.

## 12. Business Recommendations
1. Monitor expense and purchase transactions because these transaction types drive negative estimated net cash flow.

2. Review high-value transactions regularly to detect unusual activity or financial control risks.

3. Track monthly net cash flow to identify periods of increased outflow pressure.

4. Analyze inventory-related activity because Inventory is the highest-value account.

5. Evaluate customer/vendor relationships using both total transaction value and net cash flow impact.

6. Separate transfers from operating cash flow reporting to avoid distorting business performance.

7. Use payment method analysis to support cash management and internal control decisions.

## 13. Final Business Impact
This SQL analysis helps business users understand financial activity beyond raw transaction totals. It identifies cash flow pressure, high-value accounts, transaction type behavior, payment method usage, and customer/vendor impact. The analysis supports better financial monitoring, cash flow control, vendor/customer review, and transaction risk management.

## 14. Challenges Faced
- Debit and Credit values were identical across all rows.
- Traditional accounting balance analysis was not meaningful with this dataset.
- A business logic approach was required using Transaction_Type to classify cash flow direction.
- The analysis needed to separate transfers from operating inflow/outflow activity.

## 15. What I Learned
This project strengthened my ability to:

- Set up PostgreSQL and DBeaver for analytics work
- Create database tables and SQL views
- Import and validate CSV data
- Identify dataset limitations
- Use SQL business logic with CASE WHEN
- Write aggregation, CTE, and window function queries
- Translate SQL results into business insights and recommendations

## 16. Recruiter-Friendly Summary
This project demonstrates SQL analytics skills using PostgreSQL and DBeaver. I imported and validated 100,000 financial transaction records, created a cleaned SQL view, classified transactions into inflows, outflows, and transfers, and wrote beginner-to-advanced SQL queries using aggregations, CASE WHEN, CTEs, window functions, rankings, and monthly trend analysis.
