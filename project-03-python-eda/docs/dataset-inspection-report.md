# Project 3 Dataset Inspection Report

## Dataset
- File: `marketing_campaign_dataset.csv`
- Project: Marketing Campaign Performance Analysis Using Python
- Rows: 200,000
- Columns: 16
- Date range: 2021-01-01 to 2021-12-31
- Missing values: 0
- Full duplicate rows: 0
- Invalid dates: 0

## Columns

| Column | Data Type | Missing Values | Unique Values |
|---|---|---:|---:|
| Campaign_ID | int64 | 0 | 200,000 |
| Company | object | 0 | 5 |
| Campaign_Type | object | 0 | 5 |
| Target_Audience | object | 0 | 5 |
| Duration | object | 0 | 4 |
| Channel_Used | object | 0 | 6 |
| Conversion_Rate | float64 | 0 | 15 |
| Acquisition_Cost | object | 0 | 15,001 |
| ROI | float64 | 0 | 601 |
| Location | object | 0 | 5 |
| Language | object | 0 | 5 |
| Clicks | int64 | 0 | 901 |
| Impressions | int64 | 0 | 9,001 |
| Engagement_Score | int64 | 0 | 10 |
| Customer_Segment | object | 0 | 5 |
| Date | object | 0 | 365 |


## Key Data Quality Findings

1. The dataset contains 200,000 campaign records and 16 columns.
2. There are no missing values.
3. There are no duplicate rows.
4. The date column is valid and covers the full year 2021.
5. `Acquisition_Cost` is stored as text with dollar signs and commas, so it must be cleaned into a numeric field.
6. `Duration` is stored as text such as `30 days`, so it should be converted into a numeric `duration_days` column.
7. The dataset is suitable for Python EDA because it includes campaign type, channel, cost, ROI, clicks, impressions, conversion rate, engagement score, customer segment, and date.

## Recommended Cleaning Steps

- Standardize column names to snake_case.
- Convert `Date` to datetime.
- Convert `Acquisition_Cost` from currency text to numeric.
- Extract numeric days from `Duration`.
- Add `year`, `month_no`, `month_name`, and `year_month`.
- Add calculated metrics:
  - `ctr = clicks / impressions`
  - `estimated_conversions = clicks * conversion_rate`
  - `cost_per_click = acquisition_cost / clicks`
  - `cost_per_conversion = acquisition_cost / estimated_conversions`
  - `estimated_revenue_from_roi = acquisition_cost * roi`
  - `estimated_profit_from_roi = estimated_revenue_from_roi - acquisition_cost`
- Add analysis bands:
  - ROI band
  - Engagement band

## Initial KPI Summary

| KPI | Value |
|---|---:|
| Total Campaigns | 200,000 |
| Total Acquisition Cost | $2,500,878,608.00 |
| Average Acquisition Cost | $12,504.39 |
| Average ROI | 5.00 |
| Average Conversion Rate | 8.01% |
| Total Clicks | 109,954,406 |
| Total Impressions | 1,101,460,304 |
| Overall CTR | 9.98% |
| Average Engagement Score | 5.49 |
| Estimated Conversions | 8,804,580 |
| Average CPC | $22.74 |
| Average Cost per Conversion | $284.04 |

## Recommended Business Questions

1. Which marketing channels produce the highest average ROI?
2. Which campaign types are most cost-efficient?
3. Which customer segments generate stronger conversion performance?
4. Which target audiences produce the best ROI and conversion rate?
5. Which locations show the strongest engagement and campaign performance?
6. How does campaign performance change month by month?
7. Which campaigns are top performers by ROI?
8. Which channels should receive more budget?
9. Which campaigns need optimization due to low conversion or high cost per conversion?
10. What business recommendations can improve marketing budget allocation?
