-- Target Audience Analysis
-- Identify which audience segments convert at the highest rate.

SELECT 
    Target_Audience,
    COUNT(*) AS total_campaigns,
    ROUND(AVG(Conversion_Rate), 4) AS avg_conversion_rate,
    ROUND(AVG(ROI), 2) AS avg_roi,
    ROUND(AVG(CAST(REPLACE(REPLACE(Acquisition_Cost, '$', ''), ',', '') AS REAL)), 2) AS avg_acquisition_cost
FROM marketing_campaign_dataset
GROUP BY Target_Audience
ORDER BY avg_conversion_rate DESC;
