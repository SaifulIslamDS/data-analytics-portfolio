# Marketing Campaign Performance Analysis Using Python

## Project Status
Project 3 is in progress.

## Objective
Analyze marketing campaign performance using Python to identify channel performance, campaign effectiveness, cost efficiency, customer segment behavior, and business recommendations for marketing budget optimization.

## Dataset
- Source: Kaggle
- File: `marketing_campaign_dataset.csv`
- Rows: 200,000
- Columns: 16
- Date range: 2021-01-01 to 2021-12-31

## Tools
- Python
- Pandas
- NumPy
- Matplotlib
- Jupyter Notebook

## Current Project Structure

```text
project-03-python-eda/
│
├── data/
│   └── raw/
│       └── marketing_campaign_dataset.csv
│
├── cleaned-data/
│   └── marketing_campaign_cleaned.csv
│
├── notebooks/
│   └── marketing_campaign_eda.ipynb
│
├── visuals/
│
├── insights/
│
├── docs/
│   └── dataset-inspection-report.md
│
└── README.md
```

## Cleaning Steps
- Standardized column names
- Converted Date to datetime
- Converted Acquisition_Cost from currency text to numeric
- Extracted duration days from Duration
- Created time columns
- Created CTR, estimated conversions, CPC, and cost per conversion
- Created ROI and engagement bands

## Key KPIs
- Total Campaigns
- Total Acquisition Cost
- Average ROI
- Average Conversion Rate
- Total Clicks
- Total Impressions
- Overall CTR
- Average Engagement Score
- Estimated Conversions
- Average Cost per Conversion

## Next Step
Run the notebook locally and review the initial EDA outputs.
