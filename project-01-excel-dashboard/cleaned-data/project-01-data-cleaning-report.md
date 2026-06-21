# Project 01 Data Cleaning Report

## Dataset
- File: `superstore_sales_raw.csv`
- Project: Retail Sales and Profitability Dashboard Using Excel
- Cleaning tool: Excel Power Query

## Raw Dataset Profile
- Rows: 10,194
- Columns: 21
- Missing values: 0 across all columns
- Full duplicate rows: 0
- Repeated business line items when ignoring `Row ID`: 2
- Order Date range: 2023-01-03 to 2026-12-30
- Ship Date range: 2023-01-07 to 2027-01-05
- Country/Region values: United States, Canada
- Postal Code note: Keep as text because Canada postal codes are alphanumeric.

## Cleaning Decisions
1. Promoted first row as headers.
2. Converted dates using US date culture because raw dates use M/D/YYYY format.
3. Kept `Postal Code` as text, not number.
4. Trimmed and cleaned text columns.
5. Removed duplicate business rows using all business columns except `Row ID`.
6. Kept negative profit values because they are valid loss-making transactions, not data errors.
7. Added analytical columns for dashboard slicing and KPI analysis.

## Expected Cleaned Dataset Profile
- Rows after duplicate business row removal: 10,192
- Columns after calculated fields: 29
- Orders: 5,111 unique orders
- Customers: 804 unique customers
- Products: 1,862 unique products
- Loss-making rows after cleaning: 1,900

## Added Columns
- `Order Year`
- `Order Month No`
- `Order Month Name`
- `Order Year-Month`
- `Shipping Days`
- `Profit Margin`
- `Profit Status`
- `Discount Band`
- `Sales Bucket`

## Next Step
Load the cleaned query to an Excel Table named `Sales_Cleaned`, then use it for KPI calculations, pivot tables, and the final dashboard.
