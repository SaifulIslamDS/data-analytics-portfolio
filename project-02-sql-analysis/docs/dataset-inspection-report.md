# Project 2 Dataset Inspection Report

## Dataset
- File: financial_accounting.csv
- Rows: 100,000
- Columns: 10

## Columns
- Date: object
- Account: object
- Description: object
- Debit: float64
- Credit: float64
- Category: object
- Transaction_Type: object
- Customer_Vendor: object
- Payment_Method: object
- Reference: int64

## Data Quality
- Missing values: 0 in all columns
- Full duplicate rows: 0
- Invalid dates: 0
- Date range: 2023-01-01 to 2023-12-28
- Unique customers/vendors: 100
- Unique references: 60,314
- Unique descriptions: 100,000

## Important Finding
Debit and Credit are identical for every row in this dataset.

This means:
- Do not calculate net balance as Credit - Debit, because it will always be zero.
- Use Debit or Credit as the transaction amount.
- Create a signed amount based on transaction type:
  - Sale = positive/inflow
  - Purchase = negative/outflow
  - Expense = negative/outflow
  - Transfer = neutral or separate movement category

## Account Distribution
| Account             |   count |
|:--------------------|--------:|
| Accounts Payable    |   25104 |
| Inventory           |   25054 |
| Accounts Receivable |   25038 |
| Cash                |   24804 |

## Category Distribution
| Category   |   count |
|:-----------|--------:|
| Revenue    |   25160 |
| Asset      |   25118 |
| Liability  |   24870 |
| Expense    |   24852 |

## Transaction Type Distribution
| Transaction_Type   |   count |
|:-------------------|--------:|
| Sale               |   25040 |
| Purchase           |   25022 |
| Expense            |   24985 |
| Transfer           |   24953 |

## Payment Method Distribution
| Payment_Method   |   count |
|:-----------------|--------:|
| Check            |   25131 |
| Bank Transfer    |   25069 |
| Cash             |   24949 |
| Credit Card      |   24851 |

## Recommended SQL Project Positioning
Use this as a financial transaction analytics project, not a strict double-entry accounting ledger project.

Recommended title:
Financial Transaction and Accounting Performance Analysis Using SQL
