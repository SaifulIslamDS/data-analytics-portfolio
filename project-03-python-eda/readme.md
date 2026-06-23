# Marketing Campaign Performance Analysis Using Python

## Project Overview

This project analyzes a marketing campaign performance dataset using Python. The goal is to evaluate campaign performance across channels, campaign types, customer segments, locations, target audiences, and time periods.

The project demonstrates Python-based data cleaning, exploratory data analysis, KPI calculation, business visualization, marketing performance analysis, and business recommendation development.

## Business Problem

A marketing team wants to understand which campaigns, channels, customer segments, and campaign types generate the strongest performance. The team also wants to evaluate cost efficiency, conversion behavior, engagement, and estimated profitability so that marketing budget can be allocated more effectively.

The main business questions are:

- Which marketing channels produce the strongest ROI?
- Which campaign types perform best?
- Which customer segments are most cost-efficient?
- How does campaign performance change over time?
- Which campaigns deliver the highest ROI?
- What factors are linked with campaign cost efficiency?

## Dataset

- Dataset: Marketing Campaign Performance Dataset
- Source: Kaggle
- File type: CSV
- Records: 200,000
- Columns: 16 raw columns
- Date range: 2021-01-01 to 2021-12-31

## Tools Used

- Python
- Pandas
- NumPy
- Matplotlib
- Jupyter Notebook
- GitHub

## Data Cleaning Process

The raw dataset was cleaned using Python and Pandas. The cleaning process included:

- Standardizing column names into snake_case
- Converting `Date` into datetime format
- Converting `Acquisition_Cost` from currency-formatted text into numeric values
- Extracting numeric days from the `Duration` column
- Checking for missing values
- Checking for duplicate rows
- Validating date ranges
- Creating new analytical fields:
  - `duration_days`
  - `year`
  - `month_no`
  - `month_name`
  - `year_month`
  - `ctr`
  - `estimated_conversions`
  - `cost_per_click`
  - `cost_per_conversion`
  - `estimated_revenue_from_roi`
  - `estimated_profit_from_roi`
  - `roi_band`
  - `engagement_band`

## Key KPIs

| KPI | Value |
|---|---:|
| Total Campaigns | 200,000 |
| Total Acquisition Cost | $2.50B |
| Average Acquisition Cost | $12,504.39 |
| Average ROI | 5.00 |
| Average Conversion Rate | 8.01% |
| Total Clicks | 109,954,406 |
| Total Impressions | 1,101,460,304 |
| Overall CTR | 9.98% |
| Average Engagement Score | 5.49 |
| Estimated Conversions | 8,804,580 |
| Average Cost per Click | $22.74 |
| Average Cost per Conversion | $284.04 |
| Estimated Revenue from ROI | $12.52B |
| Estimated Profit from ROI | $10.02B |

## Visualizations

The notebook includes the following visual analysis:

- Average ROI by marketing channel
- Conversion rate by campaign type
- Cost per conversion by customer segment
- Monthly average ROI trend
- Top 10 campaigns by ROI
- Correlation matrix of campaign performance metrics

## Key Insights

1. The dataset contains 200,000 marketing campaigns with total acquisition cost of approximately $2.50B.

2. The average ROI across all campaigns is 5.00, with an average conversion rate of 8.01%.

3. Website campaigns show the lowest cost per conversion among channels, making them the most cost-efficient channel in this dataset.

4. Facebook campaigns show the highest average ROI among channels, but differences between channels are relatively small.

5. Influencer campaigns show the strongest average ROI among campaign types, while Social Media campaigns show slightly lower ROI.

6. Foodies and Tech Enthusiasts are among the strongest customer segments by average ROI and estimated profitability.

7. Monthly ROI is relatively stable throughout the year, with September showing the highest average ROI.

8. Conversion rate has a strong negative relationship with cost per conversion, meaning campaigns with stronger conversion rates are more cost-efficient.

## Business Recommendations

1. Prioritize channels with stronger cost efficiency, especially Website campaigns based on cost per conversion.

2. Continue testing Facebook campaigns because they show the strongest average ROI among channels.

3. Increase investment in Influencer and Search campaigns where ROI performance is stronger.

4. Monitor campaigns with high acquisition cost but weak conversion performance to reduce inefficient spend.

5. Use customer segment analysis to improve targeting and campaign personalization.

6. Track ROI, conversion rate, CTR, and cost per conversion together instead of relying on one metric only.

## Files Included

| File / Folder | Description |
|---|---|
| `data/raw/` | Raw marketing campaign dataset |
| `cleaned-data/` | Cleaned dataset created using Python |
| `notebooks/` | Jupyter Notebook for cleaning and EDA |
| `visuals/` | Exported charts and visualizations |
| `insights/` | Business insights and recommendations |
| `docs/` | Case study and supporting documentation |
| `README.md` | Project documentation |

## Recruiter-Friendly Summary

Performed Python exploratory data analysis on a 200,000-row marketing campaign dataset to evaluate campaign ROI, conversion performance, channel effectiveness, customer segments, cost efficiency, and monthly trends. Used Pandas, NumPy, Matplotlib, feature engineering, and business analysis to generate actionable marketing recommendations.
