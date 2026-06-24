# Project 4 Dataset Inspection Report

## Dataset

File: `HR_capstone_dataset.csv`

## Raw Dataset Summary

| Item | Value |
|---|---:|
| Raw rows | 14,999 |
| Raw columns | 10 |
| Missing values | 0 |
| Exact duplicate rows | 3,008 |
| Rows after removing duplicates | 11,991 |

## Columns

- `satisfaction_level`
- `last_evaluation`
- `number_project`
- `average_montly_hours`
- `time_spend_company`
- `Work_accident`
- `left`
- `promotion_last_5years`
- `Department`
- `salary`

## Cleaning Decision

The dataset contains 3,008 exact duplicate rows. For the portfolio dashboard, duplicates should be removed in Power Query before adding an Employee ID. This produces a cleaner employee-level dashboard with 11,991 unique employee records.

## Cleaned Dataset KPI Preview

| KPI | Value |
|---|---:|
| Total Employees | 11,991 |
| Attrition Count | 1,991 |
| Retained Employees | 10,000 |
| Attrition Rate | 16.60% |
| Retention Rate | 83.40% |
| Average Satisfaction | 0.63 |
| Average Evaluation | 0.72 |
| Average Monthly Hours | 200.47 |
| Average Projects | 3.80 |
| Promotion Rate | 1.69% |

## Important Column Notes

- `average_montly_hours` is misspelled in the source file and should be renamed to `Average Monthly Hours`.
- `left` is the attrition indicator: `1 = Left`, `0 = Stayed`.
- `promotion_last_5years` should be converted into a readable status field.
- `Work_accident` should be converted into a readable status field.
- `salary` should be transformed into ordered salary groups: Low, Medium, High.
