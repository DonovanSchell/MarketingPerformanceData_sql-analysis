-- Location Efficiency
-- Determine which cities deliver the best campaign performance.

SELECT 
    Location,
    COUNT(*) AS total_campaigns,
    ROUND(AVG(ROI), 2) AS avg_roi,
    ROUND(AVG(CAST(REPLACE(REPLACE(Acquisition_Cost, '$', ''), ',', '') AS REAL)), 2) AS avg_acquisition_cost,
    ROUND(AVG(Conversion_Rate), 4) AS avg_conversion_rate
FROM marketing_campaign_dataset
GROUP BY Location
ORDER BY avg_roi DESC;
