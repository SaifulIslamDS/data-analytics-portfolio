# Project 2 Business Insights
## Financial Transaction and Accounting Performance Analysis Using SQL

## Executive Summary
This SQL project analyzes 100,000 financial transaction records from 2023. The analysis validates data quality, creates a cleaned SQL view, classifies transactions into inflow, outflow, and transfer movements, and uses SQL queries to evaluate transaction value, cash flow pressure, account activity, payment methods, customer/vendor activity, and monthly trends.

## Dataset Validation Notes
- Total rows: 100,000
- Missing values: 0
- Duplicate rows: 0
- Date range: 2023-01-01 to 2023-12-28
- Debit and Credit values were identical across all records.
- To keep the analysis business-relevant, Debit was treated as the transaction amount, while Transaction_Type was used to classify inflows, outflows, and transfers.

## Main KPIs
| KPI | Value |
|---|---:|
| Total Transactions | 100,000 |
| Total Transaction Value | $60,774,736.83 |
| Average Transaction Value | $607.75 |
| Total Inflow | $13,705,912.88 |
| Total Outflow | $30,381,058.29 |
| Transfer Value | $16,687,765.66 |
| Estimated Net Cash Flow | $-16,675,145.41 |

## Key Business Insights
1. The dataset contains 100,000 transactions with a total transaction value of $60,774,736.83 and an average transaction value of $607.75.

2. Outflow transactions represent the largest cash movement, totaling $30,381,058.29, compared with $13,705,912.88 in inflows. This creates an estimated net cash flow of $-16,675,145.41.

3. Transfer transactions account for $16,687,765.66. Since transfers are internal movements, they were excluded from net cash flow calculation.

4. Expense transactions have the highest total value among transaction types, followed closely by Transfer transactions. This suggests the business should monitor expense activity carefully.

5. Inventory is the highest-value account, with total transaction value of $15,282,657.25. This indicates inventory-related activity is a major driver of financial movement.

6. The highest-value category is Asset, with total transaction value of $15,270,030.86. Revenue is close behind, showing balanced activity across major accounting categories.

7. Check is the highest-value payment method, with $15,324,618.14 in total transaction value. Payment methods are relatively evenly distributed, but check and bank transfer activity should be monitored closely.

8. Every month in 2023 shows negative estimated net cash flow, suggesting consistent outflow pressure across the year.

9. Customer 28 has the highest total transaction value at $665,442.65. However, customer/vendor performance should be evaluated by both total activity and net cash flow impact.

10. High-value transactions represent 29,042 records and account for $26,220,872.11, making them important for financial monitoring.

## Business Recommendations
1. Monitor expense and purchase transactions more closely because they drive the negative estimated net cash flow.

2. Review high-value transactions regularly to identify unusual activity, large payments, or possible control risks.

3. Track monthly net cash flow to detect periods of increased outflow pressure.

4. Investigate high-activity customers/vendors by both total value and net impact, not transaction count alone.

5. Review inventory-related activity because Inventory is the highest-value account.

6. Use payment method analysis to improve cash management and internal control policies.

7. Separate transfers from income and expense reporting because transfers are internal movements and should not distort operating cash flow.

## Recruiter-Friendly Summary
Used PostgreSQL and DBeaver to analyze 100,000 financial transaction records. Created a cleaned SQL view, validated data quality, classified transactions into inflow/outflow/transfer categories, and wrote beginner-to-advanced SQL queries using aggregations, CASE WHEN logic, CTEs, window functions, rankings, monthly trends, and business reporting techniques.


### Note:
During data validation, Debit and Credit values were found to be identical across all records. To keep the analysis business-relevant, Debit was treated as the transaction amount, while Transaction_Type was used to classify inflows, outflows, and transfers.