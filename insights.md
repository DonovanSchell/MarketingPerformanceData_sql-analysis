# Key Insights & Analysis Notes

## About This Dataset

This analysis uses a synthetically generated dataset of 200,000 marketing campaigns
from 2021. Synthetic datasets are common on Kaggle and are useful for practicing SQL
techniques. However, they often lack the natural variation found in real-world data —
and that turned out to be one of the most important findings in this project.

---

## Finding 1: Performance Is Uniform Across All Segments

Across every dimension analyzed — campaign type, target audience, location, customer
segment, and month — key metrics were nearly identical:

- Average ROI: ~5.0
- Average Conversion Rate: ~8%
- Average Acquisition Cost: ~$12,500

**Business interpretation:** In a real dataset, this would be a red flag worth
escalating. Uniform performance across all segments typically indicates either a
data pipeline issue, a measurement problem, or that campaigns are not being
differentiated enough to produce meaningful variation.

---

## Finding 2: Search and Influencer Campaigns Narrowly Lead on ROI

| Campaign Type | Avg ROI | Avg Conversion Rate |
|---------------|---------|---------------------|
| Search        | 5.01    | 8.00%               |
| Influencer    | 5.01    | 8.03%               |
| Display       | 5.01    | 8.01%               |
| Social Media  | 4.99    | 8.01%               |
| Email         | 4.99    | 7.98%               |

**Business interpretation:** The differences are too small to be actionable. In a
real analysis, you would want to apply statistical significance testing before
making any budget reallocation recommendations based on these numbers.

---

## Finding 3: No Meaningful Geographic Variation

Miami and Los Angeles posted the highest average ROI (5.01), while New York trailed
slightly at 4.98. The ~0.03 difference across cities is not practically significant.

**Business interpretation:** In real-world marketing data, geographic variation is
often one of the strongest signals — driven by market saturation, cost of living,
competition, and audience behavior. The flatness here is further evidence of
synthetic data generation.

---

## Finding 4: Campaign Duration Has No Impact on Performance

75% of all campaigns ran 30+ days. The remaining 25% fell in the 11-20 day range.
No short campaigns (1-10 days) existed in the dataset, and performance was identical
across both duration groups.

**Business interpretation:** Duration analysis requires a more balanced distribution
across buckets to be meaningful. A follow-up question worth exploring with real data:
do diminishing returns appear after a certain campaign length?

---

## Finding 5: High Variance in Click-Through Rate at the Individual Level

While aggregated metrics were flat, individual campaign click-through rates (CTR)
ranged from as low as 0.01 to as high as 0.74. This suggests meaningful variation
exists at the campaign level that gets masked by averaging.

**Business interpretation:** This is a common real-world pattern. Aggregate averages
can hide outlier campaigns — both high performers worth replicating and low performers
worth cutting. Row-level analysis and ranking (as demonstrated in Query 7) is
essential for surfacing these signals.

---

## SQL Approach Notes

- `Acquisition_Cost` was stored as formatted text (e.g. `$12,174.00`) and required
  cleaning with `REPLACE()` and `CAST()` before any numeric analysis could be performed.
  This is a common real-world data quality issue.
- Window functions (`RANK() OVER`, `AVG() OVER`) were used in Query 7 to compare
  individual campaign performance against both their campaign type average and the
  overall dataset average — a technique commonly used in marketing performance reporting.
- Date functions (`STRFTIME()`) were used to extract month from the date field for
  time-series analysis.
