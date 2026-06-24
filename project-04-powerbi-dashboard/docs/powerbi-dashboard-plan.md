# Power BI Dashboard Build Plan

## Project Title

HR Attrition and Workforce Performance Dashboard Using Power BI

## Recommended Table Name

`HR_Cleaned`

## Cleaned Dataset Target

| Item | Value |
|---|---:|
| Raw rows | 14,999 |
| Duplicate rows removed | 3,008 |
| Cleaned employee records | 11,991 |
| Attrition count | 1,991 |
| Attrition rate | 16.60% |

## Dashboard Pages

### Page 1: Executive Overview

KPIs:
- Total Employees
- Attrition Count
- Attrition Rate
- Retention Rate
- Average Satisfaction
- Average Monthly Hours
- Promotion Rate

Visuals:
- Attrition by Department
- Attrition by Salary Level
- Attrition by Satisfaction Band
- Employee count by Department
- Key insights text box

### Page 2: Attrition Drivers

Visuals:
- Attrition Rate by Satisfaction Band
- Attrition Rate by Workload Band
- Attrition Rate by Tenure Band
- Attrition Rate by Project Load Band
- Scatter chart: Satisfaction Level vs Average Monthly Hours, legend by Attrition Status

### Page 3: Department and Salary Analysis

Visuals:
- Department-level attrition rate
- Department-level employee count
- Salary level attrition rate
- Matrix: Department x Salary Level with attrition count/rate

### Page 4: Recommendations

Include:
- Main findings
- Business recommendations
- Dataset limitation note
- Dashboard usage explanation

## Recommended Slicers

- Department
- Salary Level
- Attrition Status
- Satisfaction Band
- Workload Band
- Tenure Band
- Project Load Band

## Expected Key Insights

1. Overall attrition rate after cleaning is 16.60%.
2. HR, Accounting, Technical, Support, and Sales have the highest attrition rates.
3. Low salary employees have the highest attrition rate.
4. Low satisfaction employees have a much higher attrition rate than medium and high satisfaction groups.
5. Employees with very low or very high workloads show higher attrition risk than normal workload employees.
6. Employees with 7 projects have 100% attrition in the cleaned dataset, indicating severe overload risk.
