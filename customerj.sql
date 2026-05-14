-- Step 1: View original data
SELECT * FROM projects.customerjourney;

-- Step 2: Check duplicates
WITH duplicaterecord AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
            ORDER BY JourneyID
        ) AS row_num
    FROM projects.customerjourney
)
SELECT * FROM duplicaterecord
WHERE row_num > 1
ORDER BY JourneyID;

-- Step 3: Clean data (remove duplicates + fix nulls + uppercase stage)
WITH cleaned_data AS (
    SELECT 
        JourneyID,
        CustomerID,
        ProductID,
        VisitDate,
        UPPER(Stage) AS Stage,
        Action,
        COALESCE(NULLIF(Duration, 0), AVG(NULLIF(Duration, 0)) OVER (PARTITION BY VisitDate)) AS Duration,
        ROW_NUMBER() OVER (
            PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), Action
            ORDER BY JourneyID
        ) AS row_num
    FROM projects.customerjourney
)
SELECT 
    JourneyID,
    CustomerID,
    ProductID,
    VisitDate,
    Stage,
    Action,
    Duration
FROM cleaned_data
WHERE row_num = 1
ORDER BY JourneyID;

