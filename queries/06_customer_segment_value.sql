-- Customer Segment Value
-- Evaluate which customer segments generate the most value across key metrics.

SELECT 
    Customer_Segment,
    COUNT(*) AS total_campaigns,
    ROUND(AVG(ROI), 2) AS avg_roi,
    ROUND(AVG(Conversion_Rate), 4) AS avg_conversion_rate,
    ROUND(AVG(Engagement_Score), 2) AS avg_engagement_score,
    ROUND(AVG(CAST(REPLACE(REPLACE(Acquisition_Cost, '$', ''), ',', '') AS REAL)), 2) AS avg_acquisition_cost
FROM marketing_campaign_dataset
GROUP BY Customer_Segment
ORDER BY avg_roi DESC;
