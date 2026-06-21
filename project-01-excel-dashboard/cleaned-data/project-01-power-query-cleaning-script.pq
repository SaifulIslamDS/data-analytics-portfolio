// Project 01: Retail Sales and Profitability Dashboard Using Excel
// Dataset: Superstore Sales Raw CSV
// Purpose: Clean the raw dataset in Excel Power Query before dashboard building.
// Instruction: Replace the File.Contents path with your local path, or keep your existing Source step and paste the cleaning steps after it.

let
    Source = Csv.Document(
        File.Contents("C:\\YOUR_FOLDER\\data-analytics-portfolio\\project-01-excel-dashboard\\data\\raw\\superstore_sales_raw.csv"),
        [Delimiter=",", Columns=21, Encoding=65001, QuoteStyle=QuoteStyle.Csv]
    ),

    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),

    ChangedTypes = Table.TransformColumnTypes(
        PromotedHeaders,
        {
            {"Row ID", Int64.Type},
            {"Order ID", type text},
            {"Order Date", type date},
            {"Ship Date", type date},
            {"Ship Mode", type text},
            {"Customer ID", type text},
            {"Customer Name", type text},
            {"Segment", type text},
            {"Country/Region", type text},
            {"City", type text},
            {"State/Province", type text},
            {"Postal Code", type text},
            {"Region", type text},
            {"Product ID", type text},
            {"Category", type text},
            {"Sub-Category", type text},
            {"Product Name", type text},
            {"Sales", type number},
            {"Quantity", Int64.Type},
            {"Discount", type number},
            {"Profit", type number}
        },
        "en-US"
    ),

    TextColumns = {
        "Order ID", "Ship Mode", "Customer ID", "Customer Name", "Segment",
        "Country/Region", "City", "State/Province", "Postal Code", "Region",
        "Product ID", "Category", "Sub-Category", "Product Name"
    },

    TrimmedCleanedText = Table.TransformColumns(
        ChangedTypes,
        List.Transform(
            TextColumns,
            each {_, each if _ = null then null else Text.Clean(Text.Trim(_)), type text}
        )
    ),

    // Row ID is a technical row identifier. Excluding it helps detect repeated business line items.
    RemovedDuplicateBusinessRows = Table.Distinct(
        TrimmedCleanedText,
        List.RemoveItems(Table.ColumnNames(TrimmedCleanedText), {"Row ID"})
    ),

    FilteredValidBusinessRows = Table.SelectRows(
        RemovedDuplicateBusinessRows,
        each [Order Date] <> null
            and [Ship Date] <> null
            and [Ship Date] >= [Order Date]
            and [Sales] <> null and [Sales] > 0
            and [Quantity] <> null and [Quantity] > 0
            and [Discount] <> null and [Discount] >= 0 and [Discount] <= 1
            and [Profit] <> null
    ),

    AddedOrderYear = Table.AddColumn(
        FilteredValidBusinessRows,
        "Order Year",
        each Date.Year([Order Date]),
        Int64.Type
    ),

    AddedOrderMonthNo = Table.AddColumn(
        AddedOrderYear,
        "Order Month No",
        each Date.Month([Order Date]),
        Int64.Type
    ),

    AddedOrderMonthName = Table.AddColumn(
        AddedOrderMonthNo,
        "Order Month Name",
        each Date.ToText([Order Date], "MMM", "en-US"),
        type text
    ),

    AddedOrderYearMonth = Table.AddColumn(
        AddedOrderMonthName,
        "Order Year-Month",
        each Date.ToText([Order Date], "yyyy-MM", "en-US"),
        type text
    ),

    AddedShippingDays = Table.AddColumn(
        AddedOrderYearMonth,
        "Shipping Days",
        each Duration.Days([Ship Date] - [Order Date]),
        Int64.Type
    ),

    AddedProfitMargin = Table.AddColumn(
        AddedShippingDays,
        "Profit Margin",
        each if [Sales] = null or [Sales] = 0 then null else [Profit] / [Sales],
        type number
    ),

    AddedProfitStatus = Table.AddColumn(
        AddedProfitMargin,
        "Profit Status",
        each if [Profit] < 0 then "Loss" else if [Profit] = 0 then "Break-even" else "Profit",
        type text
    ),

    AddedDiscountBand = Table.AddColumn(
        AddedProfitStatus,
        "Discount Band",
        each if [Discount] = 0 then "No Discount"
            else if [Discount] <= 0.2 then "Low Discount"
            else if [Discount] <= 0.5 then "Medium Discount"
            else "High Discount",
        type text
    ),

    AddedSalesBucket = Table.AddColumn(
        AddedDiscountBand,
        "Sales Bucket",
        each if [Sales] < 100 then "Low Sales (<100)"
            else if [Sales] < 500 then "Medium Sales (100-499)"
            else if [Sales] < 1000 then "High Sales (500-999)"
            else "Very High Sales (1000+)",
        type text
    ),

    SortedRows = Table.Sort(AddedSalesBucket, {{"Order Date", Order.Ascending}, {"Row ID", Order.Ascending}})

in
    SortedRows
