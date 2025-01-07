WITH CTE AS(SELECT * 
FROM bike_share_yr_0
UNION ALL
SELECT * 
FROM bike_share_yr_1)

select dteday,season, a.yr, weekday, hr, rider_type, riders, price, cogs,
CAST(price AS decimal(5,2)) * riders as revenue,
CAST(price AS decimal(5,2)) * riders - CAST(price AS decimal(3,1)) * COGS as profit
from cte a left join cost_table b
	on a.yr = b.yr