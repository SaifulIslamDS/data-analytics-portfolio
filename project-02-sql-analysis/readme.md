# Financial Transaction and Accounting Performance Analysis Using SQL

## Project Overview
This project analyzes a financial accounting transaction dataset using PostgreSQL. The goal was to validate transaction data, create a cleaned SQL view, classify transactions into inflow, outflow, and transfer categories, and answer business questions using SQL.

The project demonstrates practical SQL skills for Data Analyst, BI Analyst, Business Analyst, Reporting Analyst, and Financial Analyst roles.

## Business Problem
A business wants to understand transaction activity, cash flow movement, account performance, payment method usage, customer/vendor activity, and monthly financial trends. The business also needs to identify whether financial activity is mainly driven by inflows, outflows, or internal transfers.

## Dataset
- Dataset: Financial Accounting Dataset
- Source: Kaggle
- Rows: 100,000
- Columns: 10
- Date range: 2023-01-01 to 2023-12-28
- File type: CSV

## Tools Used
- PostgreSQL
- DBeaver Community
- SQL
- GitHub

## Database Objects
| Object | Description |
|---|---|
| `financial_transactions_raw` | Raw imported transaction table |
| `financial_transactions_cleaned` | Cleaned SQL view with business logic columns |

## Data Validation
The dataset was validated using SQL quality checks.

| Check | Result |
|---|---:|
| Total rows | 100,000 |
| Missing values | 0 |
| Duplicate rows | 0 |
| Null transaction dates | 0 |
| Cleaned view rows | 100,000 |

## Important Dataset Limitation
During data validation, Debit and Credit values were found to be identical across all records. To keep the analysis business-relevant, Debit was treated as the transaction amount, while `Transaction_Type` was used to classify transactions as inflows, outflows, and transfers.

## Key KPIs
| KPI | Value |
|---|---:|
| Total Transactions | 100,000 |
| Total Transaction Value | $60,774,736.83 |
| Average Transaction Value | $607.75 |
| Total Inflow | $13,705,912.88 |
| Total Outflow | $30,381,058.29 |
| Transfer Value | $16,687,765.66 |
| Estimated Net Cash Flow | $-16,675,145.41 |

## SQL Skills Demonstrated
- Database creation
- Table creation
- CSV import into PostgreSQL
- Data type validation
- Data quality checks
- SQL views
- Aggregations
- `GROUP BY`
- `CASE WHEN`
- Date functions
- CTEs
- Window functions
- Ranking
- Running totals
- Month-over-month analysis
- Business reporting queries

## Business Questions Answered
1. What is the total transaction value?
2. What is the estimated inflow, outflow, transfer value, and net cash flow?
3. Which transaction types drive the highest value?
4. Which accounts have the highest transaction value?
5. Which categories have the highest transaction value?
6. Which payment methods are used most?
7. Which customers/vendors have the highest transaction value?
8. What is the monthly transaction trend?
9. What is the running estimated net cash flow?
10. Which transactions are high-value transactions?
11. Which customers/vendors have the strongest and weakest net impact?
12. Which accounts and transaction types drive financial movement?

## Key Insights
1. The dataset contains 100,000 financial transactions with total transaction value of $60,774,736.83.

2. Outflows total $30,381,058.29, while inflows total $13,705,912.88, producing an estimated net cash flow of $-16,675,145.41.

3. Transfer transactions total $16,687,765.66 and were separated from operating cash flow because they represent internal movement.

4. Inventory is the highest-value account, with $15,282,657.25 in transaction value.

5. Check is the highest-value payment method, with $15,324,618.14 in transaction value.

6. Every month shows negative estimated net cash flow, indicating consistent outflow pressure.

## Business Recommendations
1. Monitor expense and purchase transactions because they drive negative net cash flow.
2. Review high-value transactions regularly.
3. Track monthly cash flow trends to identify periods of increased pressure.
4. Analyze customer/vendor activity by both total value and net impact.
5. Separate transfers from operating inflow/outflow analysis.
6. Review inventory-related transactions because they represent the highest account-level activity.

## Files Included
| Folder/File | Description |
|---|---|
| `data/raw/` | Raw financial accounting CSV |
| `schema/schema.sql` | Table and cleaned view creation script |
| `queries/data_quality_checks.sql` | SQL data validation queries |
| `queries/business_analysis_queries.sql` | Business analysis SQL queries |
| `insights/business_insights.md` | Business insights and recommendations |
| `docs/case-study.md` | Full project case study |
| `README.md` | Project documentation |

## Recruiter-Friendly Summary
Developed a PostgreSQL financial transaction analysis project using 100,000 accounting records. Created a cleaned SQL view, performed data quality validation, classified transactions into inflows, outflows, and transfers, and wrote beginner-to-advanced SQL queries using aggregations, CTEs, window functions, rankings, and business logic to generate financial insights and recommendations.


### Note:
During data validation, Debit and Credit values were found to be identical across all records. To keep the analysis business-relevant, Debit was treated as the transaction amount, while Transaction_Type was used to classify inflows, outflows, and transfers. 