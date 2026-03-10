-- Exploratory Overview
-- Get a high-level summary of the dataset before diving deeper.

SELECT 
    COUNT(*) AS total_campaigns,
    COUNT(DISTINCT Campaign_ID) AS unique_campaigns,
    ROUND(AVG(ROI), 2) AS avg_roi,
    ROUND(AVG(Conversion_Rate), 2) AS avg_conversion_rate,
    ROUND(AVG(CAST(REPLACE(REPLACE(Acquisition_Cost, '$', ''), ',', '') AS REAL)), 2) AS avg_acquisition_cost,
    MIN(Date) AS earliest_date,
    MAX(Date) AS latest_date
FROM marketing_campaign_dataset;
