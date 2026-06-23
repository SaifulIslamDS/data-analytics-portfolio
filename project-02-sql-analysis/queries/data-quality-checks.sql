-- =====================================================
-- Project 2: Financial Transaction and Accounting Analysis
-- Data Quality Checks
-- =====================================================

-- 1. Total row count
SELECT COUNT(*) AS total_rows
FROM financial_transactions_raw;

-- 2. Missing value check
SELECT
    COUNT(*) FILTER (WHERE transaction_date IS NULL) AS missing_date,
    COUNT(*) FILTER (WHERE account IS NULL OR TRIM(account) = '') AS missing_account,
    COUNT(*) FILTER (WHERE description IS NULL OR TRIM(description) = '') AS missing_description,
    COUNT(*) FILTER (WHERE debit IS NULL) AS missing_debit,
    COUNT(*) FILTER (WHERE credit IS NULL) AS missing_credit,
    COUNT(*) FILTER (WHERE category IS NULL OR TRIM(category) = '') AS missing_category,
    COUNT(*) FILTER (WHERE transaction_type IS NULL OR TRIM(transaction_type) = '') AS missing_transaction_type,
    COUNT(*) FILTER (WHERE customer_vendor IS NULL OR TRIM(customer_vendor) = '') AS missing_customer_vendor,
    COUNT(*) FILTER (WHERE payment_method IS NULL OR TRIM(payment_method) = '') AS missing_payment_method,
    COUNT(*) FILTER (WHERE reference IS NULL) AS missing_reference
FROM financial_transactions_raw;

-- 3. Duplicate row check
SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(DISTINCT (
        transaction_date,
        account,
        description,
        debit,
        credit,
        category,
        transaction_type,
        customer_vendor,
        payment_method,
        reference
    )) AS duplicate_rows
FROM financial_transactions_raw;

-- 4. Date range check
SELECT
    MIN(transaction_date) AS start_date,
    MAX(transaction_date) AS end_date
FROM financial_transactions_raw;

-- 5. Debit and credit validation
SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE debit = credit) AS rows_where_debit_equals_credit,
    COUNT(*) FILTER (WHERE debit <> credit) AS rows_where_debit_not_equal_credit
FROM financial_transactions_raw;

-- 6. Transaction type distribution
SELECT
    transaction_type,
    COUNT(*) AS transaction_count
FROM financial_transactions_raw
GROUP BY transaction_type
ORDER BY transaction_count DESC;

-- 7. Category distribution
SELECT
    category,
    COUNT(*) AS transaction_count
FROM financial_transactions_raw
GROUP BY category
ORDER BY transaction_count DESC;

-- 8. Payment method distribution
SELECT
    payment_method,
    COUNT(*) AS transaction_count
FROM financial_transactions_raw
GROUP BY payment_method
ORDER BY transaction_count DESC;

-- 9. Cleaned view row count
SELECT COUNT(*) AS cleaned_rows
FROM financial_transactions_cleaned;

-- 10. Sample cleaned data
SELECT *
FROM financial_transactions_cleaned
LIMIT 10;