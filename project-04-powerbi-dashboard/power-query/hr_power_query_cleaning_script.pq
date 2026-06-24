let
    Source = Csv.Document(
        File.Contents("C:\YOUR_FOLDER\data-analytics-portfolio\project-04-powerbi-dashboard\data\raw\HR_capstone_dataset.csv"),
        [Delimiter=",", Columns=10, Encoding=65001, QuoteStyle=QuoteStyle.None]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),

    ChangedTypes = Table.TransformColumnTypes(
        PromotedHeaders,
        {
            {"satisfaction_level", type number},
            {"last_evaluation", type number},
            {"number_project", Int64.Type},
            {"average_montly_hours", Int64.Type},
            {"time_spend_company", Int64.Type},
            {"Work_accident", Int64.Type},
            {"left", Int64.Type},
            {"promotion_last_5years", Int64.Type},
            {"Department", type text},
            {"salary", type text}
        }
    ),

    TrimmedText = Table.TransformColumns(
        ChangedTypes,
        {
            {"Department", each Text.Trim(Text.Clean(_)), type text},
            {"salary", each Text.Trim(Text.Clean(_)), type text}
        }
    ),

    RemovedDuplicates = Table.Distinct(TrimmedText),

    RenamedColumns = Table.RenameColumns(
        RemovedDuplicates,
        {
            {"satisfaction_level", "Satisfaction Level"},
            {"last_evaluation", "Last Evaluation"},
            {"number_project", "Number of Projects"},
            {"average_montly_hours", "Average Monthly Hours"},
            {"time_spend_company", "Years at Company"},
            {"Work_accident", "Work Accident"},
            {"left", "Left"},
            {"promotion_last_5years", "Promotion Last 5 Years"},
            {"salary", "Salary Level"}
        }
    ),

    StandardizedDepartment = Table.TransformColumns(
        RenamedColumns,
        {
            {"Department", each if _ = "RandD" then "R&D" else if _ = "hr" then "HR" else if _ = "IT" then "IT" else Text.Proper(_), type text},
            {"Salary Level", each Text.Proper(_), type text}
        }
    ),

    AddedEmployeeID = Table.AddIndexColumn(StandardizedDepartment, "Employee ID", 1, 1, Int64.Type),

    AddedAttritionStatus = Table.AddColumn(
        AddedEmployeeID,
        "Attrition Status",
        each if [Left] = 1 then "Left" else "Stayed",
        type text
    ),

    AddedPromotionStatus = Table.AddColumn(
        AddedAttritionStatus,
        "Promotion Status",
        each if [Promotion Last 5 Years] = 1 then "Promoted" else "Not Promoted",
        type text
    ),

    AddedWorkAccidentStatus = Table.AddColumn(
        AddedPromotionStatus,
        "Work Accident Status",
        each if [Work Accident] = 1 then "Had Accident" else "No Accident",
        type text
    ),

    AddedSatisfactionBand = Table.AddColumn(
        AddedWorkAccidentStatus,
        "Satisfaction Band",
        each if [Satisfaction Level] < 0.4 then "Low Satisfaction"
             else if [Satisfaction Level] < 0.7 then "Medium Satisfaction"
             else "High Satisfaction",
        type text
    ),

    AddedWorkloadBand = Table.AddColumn(
        AddedSatisfactionBand,
        "Workload Band",
        each if [Average Monthly Hours] < 160 then "Low Hours"
             else if [Average Monthly Hours] <= 220 then "Normal Hours"
             else "High Hours",
        type text
    ),

    AddedTenureBand = Table.AddColumn(
        AddedWorkloadBand,
        "Tenure Band",
        each if [Years at Company] <= 2 then "0-2 Years"
             else if [Years at Company] <= 4 then "3-4 Years"
             else if [Years at Company] <= 6 then "5-6 Years"
             else "7+ Years",
        type text
    ),

    AddedProjectLoadBand = Table.AddColumn(
        AddedTenureBand,
        "Project Load Band",
        each if [Number of Projects] <= 2 then "Low Project Load"
             else if [Number of Projects] <= 5 then "Normal Project Load"
             else "High Project Load",
        type text
    ),

    AddedSalaryRank = Table.AddColumn(
        AddedProjectLoadBand,
        "Salary Rank",
        each if [Salary Level] = "Low" then 1
             else if [Salary Level] = "Medium" then 2
             else if [Salary Level] = "High" then 3
             else null,
        Int64.Type
    ),

    ReorderedColumns = Table.ReorderColumns(
        AddedSalaryRank,
        {
            "Employee ID",
            "Satisfaction Level",
            "Last Evaluation",
            "Number of Projects",
            "Average Monthly Hours",
            "Years at Company",
            "Work Accident",
            "Work Accident Status",
            "Left",
            "Attrition Status",
            "Promotion Last 5 Years",
            "Promotion Status",
            "Department",
            "Salary Level",
            "Salary Rank",
            "Satisfaction Band",
            "Workload Band",
            "Tenure Band",
            "Project Load Band"
        }
    )
in
    ReorderedColumns