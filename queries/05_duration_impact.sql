-- Duration Impact
-- Bucket campaigns by length and compare performance across duration groups.

SELECT 
    CASE 
        WHEN Duration <= 10 THEN '1-10 days (Short)'
        WHEN Duration <= 20 THEN '11-20 days (Medium)'
        WHEN Duration <= 30 THEN '21-30 days (Long)'
        ELSE '30+ days (Extended)'
    END AS duration_bucket,
    COUNT(*) AS total_campaigns,
    ROUND(AVG(ROI), 2) AS avg_roi,
    ROUND(AVG(Conversion_Rate), 4) AS avg_conversion_rate,
    ROUND(AVG(CAST(REPLACE(REPLACE(Acquisition_Cost, '$', ''), ',', '') AS REAL)), 2) AS avg_acquisition_cost
FROM marketing_campaign_dataset
GROUP BY duration_bucket
ORDER BY avg_roi DESC;
