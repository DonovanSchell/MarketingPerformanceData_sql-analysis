# Marketing Campaign Performance Analysis

**SQL Portfolio Project | SQLite | 200,000 rows**

A full exploratory analysis of 200,000 marketing campaigns using SQL. This project demonstrates practical data analysis skills including aggregations, grouping, date functions, CASE bucketing, CTEs, and window functions.

---

## Dataset

**Source:** [Marketing Campaign Performance Dataset – Kaggle](https://www.kaggle.com/datasets/manishabhatt22/marketing-campaign-performance-dataset)

**Size:** 200,000 rows | 15 columns | Full year 2021

**Key fields:** Campaign Type, Target Audience, Location, Customer Segment, ROI, Conversion Rate, Acquisition Cost, Clicks, Impressions, Engagement Score

> [!NOTE]
> This is a synthetically generated dataset. Performance metrics are intentionally uniform across segments — a finding that is itself documented in the analysis below.

---

## Business Questions

1. Which campaign type drives the best ROI?
2. Which target audience has the highest conversion rate?
3. Which locations deliver the most efficient campaigns?
4. Does campaign duration affect performance?
5. Which customer segment is most valuable?
6. Which individual campaigns outperform their campaign type average?
7. How do campaign volume and engagement trend month-over-month?

---

## Key Findings

**Performance is remarkably consistent across all segments.**
ROI averaged 5.0, conversion rate 8%, and acquisition cost ~$12,500 regardless of campaign type, audience, location, or customer segment. This uniformity is characteristic of synthetically generated data and was identified early in the exploratory analysis.

**Search and Influencer campaigns narrowly lead on ROI** (5.01 vs. 4.99 for Social Media and Email), though the difference is not practically significant.

**Miami and Los Angeles marginally outperform** other cities on average ROI (5.01), while New York trails slightly (4.98).

**Longer campaigns dominate the dataset.** 75% of campaigns ran 30+ days, making duration comparison limited. No meaningful performance difference was found between short and extended campaigns.

**Click-through rates vary significantly at the individual campaign level** — ranging from ~0.01 to 0.74 — despite flat averages, suggesting high individual variance masked by aggregation.

**No seasonal trends detected.** Campaign volume, ROI, and engagement scores remained flat across all 12 months of 2021.

---

## SQL Techniques Demonstrated

- `GROUP BY` with multiple aggregations
- `AVG()`, `COUNT()`, `SUM()`, `ROUND()`
- `CAST()` and `REPLACE()` for data type cleaning
- `STRFTIME()` for date parsing
- `CASE WHEN` for custom bucketing
- CTEs (Common Table Expressions)
- Window functions: `RANK() OVER (PARTITION BY ...)`, `AVG() OVER ()`
- `NULLIF()` for safe division
- Derived columns (click-through rate calculation)

---

## Repository Structure

```
MarketingPerformanceData_sql-analysis/
├── README.md
├── data/
│   └── marketing_campaign_dataset.csv
├── queries/
│   ├── 01_exploratory_overview.sql
│   ├── 02_campaign_type_performance.sql
│   ├── 03_target_audience_analysis.sql
│   ├── 04_location_efficiency.sql
│   ├── 05_duration_impact.sql
│   ├── 06_customer_segment_value.sql
│   ├── 07_top_campaigns_window_functions.sql
│   └── 08_monthly_trends.sql
└── insights.md
```

---

## Tools Used

- **SQLite** via DB Browser for SQLite
- **GitHub** for version control and portfolio hosting

---

## About

Built as part of a self-directed SQL learning portfolio.\
Connect on [LinkedIn](https://www.linkedin.com/in/donovan-schell-23306626/) or view more projects at [github.com/DonovanSchell](https://github.com/DonovanSchell).
