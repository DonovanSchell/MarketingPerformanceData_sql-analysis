-- Campaign Type Performance
-- Compare ROI, conversion rate, and acquisition cost across campaign types.

SELECT 
    Campaign_Type,
    COUNT(*) AS total_campaigns,
    ROUND(AVG(ROI), 2) AS avg_roi,
    ROUND(AVG(Conversion_Rate), 4) AS avg_conversion_rate,
    ROUND(AVG(CAST(REPLACE(REPLACE(Acquisition_Cost, '$', ''), ',', '') AS REAL)), 2) AS avg_acquisition_cost
FROM marketing_campaign_dataset
GROUP BY Campaign_Type
ORDER BY avg_roi DESC;
