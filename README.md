# Nano Bike A.Ş Data Analysis

## Overview

This analysis focuses on the performance metrics of Nano Bike A.Ş, a bike-sharing service. The data includes hourly sales, revenue, profit, and rider types over a specified period. The analysis aims to identify the most profitable times, seasons, and rider types to optimize business strategies.

## Key Performance Indicators (KPIs)

### Revenue and Profit

- **Total Revenue:** $5M
- **Total Profit:** $4.88M
- **Profit Margin:** 98.33%

### Riders

- **Total Riders:** 1M

### KPI over Time

The KPI over Time graph shows the sum of riders, average profit, and average revenue from January to December. The data indicates a peak in rider activity and revenue during the mid-year months (May to August), with a gradual decline towards the end of the year.
![Power BI Report](https://raw.githubusercontent.com/urbainnoel/Nano-bike-Data-Analysis/main/nano_bike_power_bi_report.png)

### Revenue by Season

- **Qtr 1:** $145
- **Qtr 2:** $283
- **Qtr 3:** $342
- **Qtr 4:** $369

The revenue is highest in Qtr 4, followed by Qtr 3, Qtr 2, and Qtr 1. This suggests that the service is more profitable in the latter half of the year.

### Riders Types

- **Casual Riders:** 19.89%
- **Registered Riders:** 80.11%

The majority of the riders are registered, indicating a loyal customer base.

## Hourly Sales Data

The hourly sales data shows higher earnings in midday and early evening hours, particularly around 10 to 15 hours. Days like Wednesday and Friday show notably higher sales, indicating variable profitability across the week.

## SQL Query for Data Extraction

The following SQL query is used to extract and calculate the necessary data for analysis:

```sql
WITH CTE AS (
    SELECT *
    FROM bike_share_yr_0
    UNION ALL
    SELECT *
    FROM bike_share_yr_1
)
SELECT
    dteday,
    season,
    a.yr,
    weekday,
    hr,
    rider_type,
    riders,
    price,
    cogs,
    CAST(price AS decimal(5,2)) * riders AS revenue,
    CAST(price AS decimal(5,2)) * riders - CAST(price AS decimal(3,1)) * COGS AS profit
FROM
    cte a
LEFT JOIN
    cost_table b
ON
    a.yr = b.yr;
```

## Conclusion

The analysis reveals that Nano Bike A.Ş has a strong performance with a high profit margin. The service is most profitable during midday and early evening hours, and in the latter half of the year. The majority of the riders are registered, suggesting a loyal customer base. These insights can be used to optimize marketing strategies, resource allocation, and customer engagement to further enhance profitability.
