DROP VIEW IF EXISTS financial_transactions_cleaned;

CREATE VIEW financial_transactions_cleaned AS
SELECT
    transaction_date,

    EXTRACT(YEAR FROM transaction_date)::INT AS transaction_year,
    EXTRACT(MONTH FROM transaction_date)::INT AS transaction_month_no,
    TO_CHAR(transaction_date, 'Mon') AS transaction_month_name,
    TO_CHAR(transaction_date, 'YYYY-MM') AS transaction_year_month,

    TRIM(account) AS account,
    TRIM(description) AS description,

    debit,
    credit,
    debit AS transaction_amount,

    TRIM(category) AS category,
    TRIM(transaction_type) AS transaction_type,
    TRIM(customer_vendor) AS customer_vendor,
    TRIM(payment_method) AS payment_method,

    reference,

    CASE
        WHEN TRIM(transaction_type) = 'Sale' THEN 'Inflow'
        WHEN TRIM(transaction_type) IN ('Purchase', 'Expense') THEN 'Outflow'
        WHEN TRIM(transaction_type) = 'Transfer' THEN 'Transfer'
        ELSE 'Other'
    END AS cash_flow_direction,

    CASE
        WHEN TRIM(transaction_type) = 'Sale' THEN debit
        WHEN TRIM(transaction_type) IN ('Purchase', 'Expense') THEN -debit
        ELSE 0
    END AS signed_amount,

    CASE
        WHEN debit >= 800 THEN 'High Value'
        WHEN debit >= 400 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS transaction_value_band

FROM financial_transactions_raw
WHERE transaction_date IS NOT NULL
  AND debit IS NOT NULL
  AND credit IS NOT NULL
  AND debit > 0
  AND credit > 0;