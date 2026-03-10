-- Monthly Trends
-- Analyze campaign volume, ROI, engagement, and click activity across all 12 months.

SELECT 
    STRFTIME('%m', Date) AS month_num,
    CASE STRFTIME('%m', Date)
        WHEN '01' THEN 'January'
        WHEN '02' THEN 'February'
        WHEN '03' THEN 'March'
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
        WHEN '07' THEN 'July'
        WHEN '08' THEN 'August'
        WHEN '09' THEN 'September'
        WHEN '10' THEN 'October'
        WHEN '11' THEN 'November'
        WHEN '12' THEN 'December'
    END AS month_name,
    COUNT(*) AS total_campaigns,
    ROUND(AVG(ROI), 2) AS avg_roi,
    ROUND(AVG(Conversion_Rate), 4) AS avg_conversion_rate,
    ROUND(SUM(Clicks)) AS total_clicks,
    ROUND(SUM(Impressions)) AS total_impressions,
    ROUND(AVG(Engagement_Score), 2) AS avg_engagement_score
FROM marketing_campaign_dataset
GROUP BY month_num
ORDER BY month_num;
