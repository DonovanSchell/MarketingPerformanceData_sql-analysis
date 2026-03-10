-- Top Campaigns by Type (CTEs + Window Functions)
-- Rank campaigns within each type and compare individual performance to overall averages.

WITH campaign_metrics AS (
    SELECT 
        Campaign_ID,
        Company,
        Campaign_Type,
        Customer_Segment,
        Location,
        ROI,
        Conversion_Rate,
        Engagement_Score,
        CAST(REPLACE(REPLACE(Acquisition_Cost, '$', ''), ',', '') AS REAL) AS clean_acquisition_cost,
        ROUND(CAST(Clicks AS REAL) / NULLIF(Impressions, 0), 4) AS click_through_rate
    FROM marketing_campaign_dataset
),
ranked_campaigns AS (
    SELECT *,
        RANK() OVER (PARTITION BY Campaign_Type ORDER BY ROI DESC) AS roi_rank_within_type,
        RANK() OVER (PARTITION BY Campaign_Type ORDER BY Conversion_Rate DESC) AS conversion_rank_within_type,
        ROUND(AVG(ROI) OVER (PARTITION BY Campaign_Type), 2) AS avg_roi_for_type,
        ROUND(AVG(ROI) OVER (), 2) AS overall_avg_roi
    FROM campaign_metrics
)
SELECT 
    Campaign_ID,
    Company,
    Campaign_Type,
    Customer_Segment,
    Location,
    ROI,
    avg_roi_for_type,
    overall_avg_roi,
    ROUND(ROI - overall_avg_roi, 2) AS roi_vs_overall_avg,
    click_through_rate,
    roi_rank_within_type,
    conversion_rank_within_type
FROM ranked_campaigns
WHERE roi_rank_within_type <= 5
ORDER BY Campaign_Type, roi_rank_within_type;
