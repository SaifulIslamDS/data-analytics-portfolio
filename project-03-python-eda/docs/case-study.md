# Case Study: Marketing Campaign Performance Analysis Using Python

## 1. Project Title

Marketing Campaign Performance Analysis Using Python

## 2. Business Problem

A marketing team needs to understand which campaigns, channels, customer segments, and campaign types are producing the strongest performance. Campaign performance should not be evaluated by ROI alone; the business also needs to understand conversion rate, click-through rate, acquisition cost, cost per click, cost per conversion, and customer engagement.

## 3. Project Objective

The objective of this project was to use Python to clean, analyze, and visualize marketing campaign performance data in order to:

- Evaluate overall campaign performance
- Compare channels and campaign types
- Identify cost-efficient customer segments
- Analyze monthly performance patterns
- Detect top-performing campaigns
- Generate business recommendations for budget allocation

## 4. Dataset Source

The dataset used for this project is a marketing campaign performance dataset from Kaggle. It contains campaign-level marketing performance data across companies, campaign types, customer audiences, channels, locations, and performance metrics.

## 5. Tools Used

- Python
- Pandas
- NumPy
- Matplotlib
- Jupyter Notebook

## 6. Dataset Overview

The raw dataset contains:

- Rows: 200,000
- Columns: 16
- Missing values: 0
- Duplicate rows: 0
- Date range: 2021-01-01 to 2021-12-31

Raw columns include:

- Campaign_ID
- Company
- Campaign_Type
- Target_Audience
- Duration
- Channel_Used
- Conversion_Rate
- Acquisition_Cost
- ROI
- Location
- Language
- Clicks
- Impressions
- Engagement_Score
- Customer_Segment
- Date

## 7. Data Cleaning Steps

The dataset was cleaned using Pandas. The main cleaning steps were:

1. Standardized column names into snake_case.
2. Converted `Date` into datetime format.
3. Converted `Acquisition_Cost` from currency text into numeric format.
4. Extracted numeric campaign duration from the `Duration` field.
5. Checked for missing values and duplicates.
6. Created new analysis fields:
   - CTR
   - Estimated conversions
   - Cost per click
   - Cost per conversion
   - Estimated revenue from ROI
   - Estimated profit from ROI
   - ROI band
   - Engagement band
   - Year-month fields for trend analysis

## 8. Analysis Process

The analysis was performed in stages:

1. Initial dataset inspection
2. Data cleaning and validation
3. KPI calculation
4. Channel performance analysis
5. Campaign type performance analysis
6. Customer segment analysis
7. Monthly trend analysis
8. Top campaign analysis
9. Correlation analysis
10. Business insight and recommendation development

## 9. Key KPIs

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
| Average CPC | $22.74 |
| Average Cost per Conversion | $284.04 |
| Estimated Revenue from ROI | $12.52B |
| Estimated Profit from ROI | $10.02B |

## 10. Key Insights

1. The dataset contains 200,000 campaigns with total acquisition cost of approximately $2.50B.

2. Average campaign ROI is 5.00, and the average conversion rate is 8.01%.

3. Website campaigns have the lowest cost per conversion, making them the most cost-efficient channel in this dataset.

4. Facebook campaigns have the highest average ROI among channels, although channel differences are relatively small.

5. Influencer campaigns have the highest average ROI among campaign types.

6. Foodies and Tech Enthusiasts are strong customer segments by ROI and estimated profit.

7. Monthly ROI is stable throughout the year, with September showing the highest average ROI.

8. Conversion rate is strongly related to cost efficiency because stronger conversion rates reduce cost per conversion.

## 11. Business Recommendations

1. Allocate more budget toward cost-efficient channels, especially Website campaigns.

2. Continue testing and scaling Facebook campaigns because they show strong ROI performance.

3. Use Influencer and Search campaigns for ROI-focused growth strategies.

4. Improve or reduce campaigns with high acquisition cost and weak conversion rate.

5. Use customer segment analysis to personalize targeting and improve campaign efficiency.

6. Monitor ROI, conversion rate, CTR, cost per click, and cost per conversion together for balanced decision-making.

## 12. Final Business Impact

This analysis helps marketing teams make data-driven decisions about campaign budget allocation, channel strategy, customer targeting, and performance optimization. It provides a framework for evaluating campaigns using both revenue-focused and cost-efficiency metrics.

## 13. Challenges Faced

- Acquisition cost was stored as text and required conversion to numeric format.
- Duration was stored as text and required numeric extraction.
- ROI values required interpretation as a multiplier-style campaign performance metric.
- Estimated revenue and profit were derived from acquisition cost and ROI, so they should be treated as estimated business indicators.

## 14. What I Learned

This project strengthened my ability to:

- Clean marketing data using Python and Pandas
- Create business-focused calculated metrics
- Analyze marketing channel performance
- Evaluate campaign cost efficiency
- Create visualizations for business storytelling
- Translate EDA results into actionable business recommendations

## 15. Recruiter-Friendly Summary

Performed Python EDA on a 200,000-row marketing campaign dataset to analyze ROI, conversion rate, CTR, acquisition cost, customer segments, channels, and monthly performance. Built calculated metrics such as cost per click, cost per conversion, estimated revenue, and estimated profit to support marketing budget recommendations.
