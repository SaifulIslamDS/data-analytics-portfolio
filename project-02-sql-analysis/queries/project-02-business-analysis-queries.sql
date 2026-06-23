-- =====================================================
-- Project 2: Financial Transaction and Accounting Analysis
-- Business Analysis Queries
-- Database: financial_analytics_db
-- Table/View: financial_transactions_cleaned
-- =====================================================

-- 1. Overall financial KPI summary
SELECT
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_value,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_value,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Inflow' THEN transaction_amount ELSE 0 END), 2) AS total_inflow,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Outflow' THEN transaction_amount ELSE 0 END), 2) AS total_outflow,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Transfer' THEN transaction_amount ELSE 0 END), 2) AS total_transfer_value,
    ROUND(SUM(signed_amount), 2) AS estimated_net_cash_flow
FROM financial_transactions_cleaned;


-- 2. Transaction count and value by cash flow direction
SELECT
    cash_flow_direction,
    COUNT(*) AS transaction_count,
    ROUND(SUM(transaction_amount), 2) AS total_value,
    ROUND(AVG(transaction_amount), 2) AS average_value,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS transaction_share_pct
FROM financial_transactions_cleaned
GROUP BY cash_flow_direction
ORDER BY total_value DESC;


-- 3. Transaction type performance summary
SELECT
    transaction_type,
    cash_flow_direction,
    COUNT(*) AS transaction_count,
    ROUND(SUM(transaction_amount), 2) AS total_value,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_value,
    ROUND(MIN(transaction_amount), 2) AS min_transaction_value,
    ROUND(MAX(transaction_amount), 2) AS max_transaction_value
FROM financial_transactions_cleaned
GROUP BY transaction_type, cash_flow_direction
ORDER BY total_value DESC;


-- 4. Monthly transaction value and estimated net cash flow
SELECT
    transaction_year_month,
    COUNT(*) AS transaction_count,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_value,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Inflow' THEN transaction_amount ELSE 0 END), 2) AS inflow,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Outflow' THEN transaction_amount ELSE 0 END), 2) AS outflow,
    ROUND(SUM(signed_amount), 2) AS estimated_net_cash_flow
FROM financial_transactions_cleaned
GROUP BY transaction_year_month
ORDER BY transaction_year_month;


-- 5. Account-level transaction performance
SELECT
    account,
    COUNT(*) AS transaction_count,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_value,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_value,
    ROUND(SUM(signed_amount), 2) AS estimated_net_cash_flow
FROM financial_transactions_cleaned
GROUP BY account
ORDER BY total_transaction_value DESC;


-- 6. Category-level transaction performance
SELECT
    category,
    COUNT(*) AS transaction_count,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_value,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_value,
    ROUND(SUM(signed_amount), 2) AS estimated_net_cash_flow
FROM financial_transactions_cleaned
GROUP BY category
ORDER BY total_transaction_value DESC;


-- 7. Payment method usage and value
SELECT
    payment_method,
    COUNT(*) AS transaction_count,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_value,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_value,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS transaction_share_pct
FROM financial_transactions_cleaned
GROUP BY payment_method
ORDER BY total_transaction_value DESC;


-- 8. Top 10 customers/vendors by transaction value
SELECT
    customer_vendor,
    COUNT(*) AS transaction_count,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_value,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_value
FROM financial_transactions_cleaned
GROUP BY customer_vendor
ORDER BY total_transaction_value DESC
LIMIT 10;


-- 9. Top 10 customers/vendors by estimated net cash flow impact
SELECT
    customer_vendor,
    COUNT(*) AS transaction_count,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Inflow' THEN transaction_amount ELSE 0 END), 2) AS total_inflow,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Outflow' THEN transaction_amount ELSE 0 END), 2) AS total_outflow,
    ROUND(SUM(signed_amount), 2) AS estimated_net_cash_flow
FROM financial_transactions_cleaned
GROUP BY customer_vendor
ORDER BY estimated_net_cash_flow DESC
LIMIT 10;


-- 10. Bottom 10 customers/vendors by estimated net cash flow impact
SELECT
    customer_vendor,
    COUNT(*) AS transaction_count,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Inflow' THEN transaction_amount ELSE 0 END), 2) AS total_inflow,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Outflow' THEN transaction_amount ELSE 0 END), 2) AS total_outflow,
    ROUND(SUM(signed_amount), 2) AS estimated_net_cash_flow
FROM financial_transactions_cleaned
GROUP BY customer_vendor
ORDER BY estimated_net_cash_flow ASC
LIMIT 10;


-- 11. High-value transaction summary by account
SELECT
    account,
    COUNT(*) FILTER (WHERE transaction_value_band = 'High Value') AS high_value_transactions,
    ROUND(SUM(CASE WHEN transaction_value_band = 'High Value' THEN transaction_amount ELSE 0 END), 2) AS high_value_total,
    COUNT(*) AS total_transactions,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE transaction_value_band = 'High Value') / COUNT(*),
        2
    ) AS high_value_transaction_pct
FROM financial_transactions_cleaned
GROUP BY account
ORDER BY high_value_total DESC;


-- 12. Transaction value band summary
SELECT
    transaction_value_band,
    COUNT(*) AS transaction_count,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_value,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_value
FROM financial_transactions_cleaned
GROUP BY transaction_value_band
ORDER BY total_transaction_value DESC;


-- 13. Monthly running estimated net cash flow using window function
WITH monthly_cash_flow AS (
    SELECT
        transaction_year_month,
        ROUND(SUM(signed_amount), 2) AS monthly_net_cash_flow
    FROM financial_transactions_cleaned
    GROUP BY transaction_year_month
)
SELECT
    transaction_year_month,
    monthly_net_cash_flow,
    ROUND(
        SUM(monthly_net_cash_flow) OVER (
            ORDER BY transaction_year_month
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS running_estimated_net_cash_flow
FROM monthly_cash_flow
ORDER BY transaction_year_month;


-- 14. Rank accounts by total transaction value using window function
SELECT
    account,
    transaction_count,
    total_transaction_value,
    average_transaction_value,
    RANK() OVER (ORDER BY total_transaction_value DESC) AS value_rank
FROM (
    SELECT
        account,
        COUNT(*) AS transaction_count,
        ROUND(SUM(transaction_amount), 2) AS total_transaction_value,
        ROUND(AVG(transaction_amount), 2) AS average_transaction_value
    FROM financial_transactions_cleaned
    GROUP BY account
) account_summary
ORDER BY value_rank;


-- 15. Rank customers/vendors within each transaction type
WITH customer_type_summary AS (
    SELECT
        transaction_type,
        customer_vendor,
        COUNT(*) AS transaction_count,
        ROUND(SUM(transaction_amount), 2) AS total_transaction_value
    FROM financial_transactions_cleaned
    GROUP BY transaction_type, customer_vendor
),
ranked_customers AS (
    SELECT
        transaction_type,
        customer_vendor,
        transaction_count,
        total_transaction_value,
        RANK() OVER (
            PARTITION BY transaction_type
            ORDER BY total_transaction_value DESC
        ) AS customer_rank
    FROM customer_type_summary
)
SELECT
    transaction_type,
    customer_vendor,
    transaction_count,
    total_transaction_value,
    customer_rank
FROM ranked_customers
WHERE customer_rank <= 5
ORDER BY transaction_type, customer_rank;


-- 16. Month-over-month change in transaction value
WITH monthly_summary AS (
    SELECT
        transaction_year_month,
        ROUND(SUM(transaction_amount), 2) AS total_transaction_value
    FROM financial_transactions_cleaned
    GROUP BY transaction_year_month
)
SELECT
    transaction_year_month,
    total_transaction_value,
    LAG(total_transaction_value) OVER (ORDER BY transaction_year_month) AS previous_month_value,
    ROUND(
        total_transaction_value - LAG(total_transaction_value) OVER (ORDER BY transaction_year_month),
        2
    ) AS month_over_month_change,
    ROUND(
        100.0 * (
            total_transaction_value - LAG(total_transaction_value) OVER (ORDER BY transaction_year_month)
        ) / NULLIF(LAG(total_transaction_value) OVER (ORDER BY transaction_year_month), 0),
        2
    ) AS month_over_month_change_pct
FROM monthly_summary
ORDER BY transaction_year_month;


-- 17. Detect unusually high transactions using average + 2 standard deviations
WITH stats AS (
    SELECT
        AVG(transaction_amount) AS avg_amount,
        STDDEV(transaction_amount) AS stddev_amount
    FROM financial_transactions_cleaned
)
SELECT
    transaction_date,
    account,
    transaction_type,
    customer_vendor,
    payment_method,
    transaction_amount,
    transaction_value_band
FROM financial_transactions_cleaned, stats
WHERE transaction_amount > avg_amount + (2 * stddev_amount)
ORDER BY transaction_amount DESC;


-- 18. Account and transaction type matrix
SELECT
    account,
    ROUND(SUM(CASE WHEN transaction_type = 'Sale' THEN transaction_amount ELSE 0 END), 2) AS sale_value,
    ROUND(SUM(CASE WHEN transaction_type = 'Purchase' THEN transaction_amount ELSE 0 END), 2) AS purchase_value,
    ROUND(SUM(CASE WHEN transaction_type = 'Expense' THEN transaction_amount ELSE 0 END), 2) AS expense_value,
    ROUND(SUM(CASE WHEN transaction_type = 'Transfer' THEN transaction_amount ELSE 0 END), 2) AS transfer_value,
    ROUND(SUM(signed_amount), 2) AS estimated_net_cash_flow
FROM financial_transactions_cleaned
GROUP BY account
ORDER BY account;


-- 19. Payment method performance by transaction type
SELECT
    payment_method,
    transaction_type,
    COUNT(*) AS transaction_count,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_value,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_value
FROM financial_transactions_cleaned
GROUP BY payment_method, transaction_type
ORDER BY payment_method, total_transaction_value DESC;


-- 20. Final business summary query for README/case study
SELECT
    'Financial Accounting Transactions' AS analysis_area,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_value,
    ROUND(AVG(transaction_amount), 2) AS average_transaction_value,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Inflow' THEN transaction_amount ELSE 0 END), 2) AS estimated_inflow,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Outflow' THEN transaction_amount ELSE 0 END), 2) AS estimated_outflow,
    ROUND(SUM(CASE WHEN cash_flow_direction = 'Transfer' THEN transaction_amount ELSE 0 END), 2) AS transfer_value,
    ROUND(SUM(signed_amount), 2) AS estimated_net_cash_flow,
    COUNT(DISTINCT customer_vendor) AS unique_customers_vendors,
    COUNT(DISTINCT reference) AS unique_references
FROM financial_transactions_cleaned;
