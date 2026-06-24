# DAX Measures

```DAX
-- =====================================================
-- Project 4: HR Attrition and Workforce Performance Dashboard
-- DAX Measures
-- Table name used below: HR_Cleaned
-- =====================================================

Total Employees =
COUNTROWS(HR_Cleaned)

Attrition Count =
CALCULATE(
    [Total Employees],
    HR_Cleaned[Left] = 1
)

Retained Employees =
CALCULATE(
    [Total Employees],
    HR_Cleaned[Left] = 0
)

Attrition Rate =
DIVIDE(
    [Attrition Count],
    [Total Employees]
)

Retention Rate =
DIVIDE(
    [Retained Employees],
    [Total Employees]
)

Average Satisfaction =
AVERAGE(HR_Cleaned[Satisfaction Level])

Average Evaluation =
AVERAGE(HR_Cleaned[Last Evaluation])

Average Monthly Hours =
AVERAGE(HR_Cleaned[Average Monthly Hours])

Average Projects =
AVERAGE(HR_Cleaned[Number of Projects])

Average Tenure =
AVERAGE(HR_Cleaned[Years at Company])

Promotion Count =
CALCULATE(
    [Total Employees],
    HR_Cleaned[Promotion Last 5 Years] = 1
)

Promotion Rate =
DIVIDE(
    [Promotion Count],
    [Total Employees]
)

Work Accident Count =
CALCULATE(
    [Total Employees],
    HR_Cleaned[Work Accident] = 1
)

Work Accident Rate =
DIVIDE(
    [Work Accident Count],
    [Total Employees]
)

Low Satisfaction Employees =
CALCULATE(
    [Total Employees],
    HR_Cleaned[Satisfaction Band] = "Low Satisfaction"
)

High Workload Employees =
CALCULATE(
    [Total Employees],
    HR_Cleaned[Workload Band] = "High Hours"
)

High Risk Active Employees =
CALCULATE(
    [Total Employees],
    HR_Cleaned[Attrition Status] = "Stayed",
    HR_Cleaned[Satisfaction Band] = "Low Satisfaction",
    HR_Cleaned[Workload Band] = "High Hours"
)

Attrition Rate by Selected Group =
DIVIDE(
    [Attrition Count],
    [Total Employees]
)
```
