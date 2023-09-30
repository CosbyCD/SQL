/*
File: breakdown_ridership_holiday_analysis.sql

Analyzes various holidays' impact on bike ridership, providing statistics for segmented user groups.
Results include the holiday name, date, day of the week, and counts for both rider types, as well 
as total ridership. Data is ordered by day of the year.

*/
WITH holiday_dates AS (
    SELECT 
        'New Year''s Day' AS holiday_name,
        DATE_TRUNC('year', td.date_w) + INTERVAL '0 day' AS holiday_date,
        DATE_PART('doy', td.date_w) AS day_of_year,
        td.date_w,
        ud.member_casual
    FROM temporal_data td
    JOIN user_data ud ON td.date_w = ud.date_start
    WHERE EXTRACT(MONTH FROM td.date_w) = 1 AND EXTRACT(DAY FROM td.date_w) = 1
	    
    UNION ALL
    
    SELECT 
        'Martin Luther King Jr. Day' AS holiday_name,
        (DATE_TRUNC('year', started_at) + INTERVAL '14 days') + 
            (CASE WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '14 days') = 1 THEN INTERVAL '1 day'
			 ELSE INTERVAL '0 day' END) AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 1 AND EXTRACT(DAY FROM started_at) BETWEEN 15 AND 21
    
    UNION ALL
    
    SELECT 
        'Presidents Day' AS holiday_name,
        (DATE_TRUNC('year', started_at) + INTERVAL '45 days') + 
            (CASE WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '45 days') = 1 THEN INTERVAL '1 day' 
			 ELSE INTERVAL '0 day' END) AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 2 AND EXTRACT(DAY FROM started_at) BETWEEN 15 AND 21
    
    UNION ALL
    
    SELECT 
        'Easter Sunday' AS holiday_name,
        DATE_TRUNC('year', started_at) + INTERVAL '81 days' AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 3 AND EXTRACT(DAY FROM started_at) BETWEEN 22 AND 31
    
    UNION ALL
    
    SELECT 
        'Memorial Day' AS holiday_name,
        (DATE_TRUNC('year', started_at) + INTERVAL '146 days') + 
            (CASE WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '146 days') = 1 THEN INTERVAL '1 day' 
			 ELSE INTERVAL '0 day' END) AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 5 AND EXTRACT(DAY FROM started_at) BETWEEN 24 AND 31
    
    UNION ALL
    
    SELECT 
        'Independence Day' AS holiday_name,
        DATE_TRUNC('year', started_at) + INTERVAL '184 days' AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 7 AND EXTRACT(DAY FROM started_at) = 4
    
    UNION ALL
    
    SELECT 
        'Columbus Day' AS holiday_name,
        (DATE_TRUNC('year', started_at) + INTERVAL '276 days') + 
            (CASE WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '276 days') = 1 THEN INTERVAL '1 day' 
			 ELSE INTERVAL '0 day' END) AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 10 AND EXTRACT(DAY FROM started_at) BETWEEN 8 AND 14
    
    UNION ALL
    
    SELECT 
        'Halloween' AS holiday_name,
        DATE_TRUNC('year', started_at) + INTERVAL '303 days' AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 10 AND EXTRACT(DAY FROM started_at) = 31
    
    UNION ALL
    
    SELECT 
        'Veterans Day' AS holiday_name,
        DATE_TRUNC('year', started_at) + INTERVAL '314 days' AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 11 AND EXTRACT(DAY FROM started_at) = 11
    
    UNION ALL
    
    SELECT 
        'Thanksgiving Day' AS holiday_name,
        (DATE_TRUNC('year', started_at) + INTERVAL '324 days') + 
            (CASE WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '324 days') = 4 THEN INTERVAL '21 days' 
                  WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '324 days') = 5 THEN INTERVAL '20 days' 
                  WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '324 days') = 6 THEN INTERVAL '19 days' 
                  WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '324 days') = 7 THEN INTERVAL '18 days' 
                  WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '324 days') = 1 THEN INTERVAL '24 days' 
                  WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '324 days') = 2 THEN INTERVAL '23 days' 
                  WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '324 days') = 3 THEN INTERVAL '22 days' END) 
	AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 11 AND EXTRACT(DAY FROM started_at) BETWEEN 23 AND 29
    
    UNION ALL
    
    SELECT 
        'Christmas Day' AS holiday_name,
        DATE_TRUNC('year', started_at) + INTERVAL '358 days' AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 12 AND EXTRACT(DAY FROM started_at) = 25
    
    UNION ALL
    
    SELECT 
        'Labor Day' AS holiday_name,
        (DATE_TRUNC('year', started_at) + INTERVAL '244 days') + 
            (CASE WHEN EXTRACT(ISODOW FROM DATE_TRUNC('year', started_at) + 
							   INTERVAL '244 days') = 1 THEN INTERVAL '1 day' 
			 ELSE INTERVAL '0 day' END) AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 9 AND EXTRACT(DAY FROM started_at) = 1
    
    -- St Patrick's Day
    UNION ALL
    SELECT 
        'St Patrick''s Day' AS holiday_name,
        DATE_TRUNC('year', started_at) + INTERVAL '75 days' AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 3 AND EXTRACT(DAY FROM started_at) = 17
    
    -- Cinco de Mayo
    UNION ALL
    SELECT 
        'Cinco de Mayo' AS holiday_name,
        DATE_TRUNC('year', started_at) + INTERVAL '124 days' AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 5 AND EXTRACT(DAY FROM started_at) = 5
    
    -- Bastille Day
    UNION ALL
    SELECT 
        'Bastille Day' AS holiday_name,
        DATE_TRUNC('year', started_at) + INTERVAL '195 days' AS holiday_date,
        DATE_PART('doy', started_at) AS day_of_year,
        started_at AS start_date,
        member_casual
    FROM user_data
    WHERE EXTRACT(MONTH FROM started_at) = 7 AND EXTRACT(DAY FROM started_at) = 14
	)

SELECT 
    holiday_name,
    TO_CHAR(holiday_date, 'Month DD') || ' - Day ' || EXTRACT(DOY FROM holiday_date) AS holiday_date,
    TO_CHAR(holiday_date, 'Day') AS day_of_week,
    TO_CHAR(ROUND(AVG(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END), 2), '999,999,990.00') AS average_casual_riders,
    TO_CHAR(ROUND(AVG(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END), 2), '999,999,990.00') AS average_member_riders,
    TO_CHAR(SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END), '9,999,999') AS casual_riders_on_holiday,
    TO_CHAR(SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END), '9,999,999') AS member_riders_on_holiday,
    TO_CHAR(COUNT(*), '9,999,999') AS total_riders_on_holiday
FROM holiday_dates
GROUP BY holiday_name, holiday_date
ORDER BY MIN(day_of_year);
