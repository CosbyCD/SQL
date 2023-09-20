/*
File: rider_behavior_holiday_percentage_comparison.sql

The provided query analyzes rider behavior in relation to 
holidays by calculating the average percentages of casual 
and member riders for each holiday. It computes the 
proportion of each rider type during holidays and excludes
rows without valid holiday names. The results offer insights
into how rider preferences vary on different holidays, 
aiding in understanding the influence of holidays on rider
composition. The outcomes are presented in descending order
of the average percentage of casual riders, facilitating 
identification of holidays with prominent casual rider 
participation.
*/


SELECT
    td.holiday_name,
    ROUND(AVG(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) * 100) AS avg_casual_riders_percentage,
    ROUND(AVG(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) * 100) AS avg_member_riders_percentage
FROM
    user_data ud
LEFT JOIN temporal_data td ON ud.date_start = td.holiday_start_date
WHERE
    td.holiday_name IS NOT NULL
GROUP BY
    td.holiday_name
ORDER BY
    avg_casual_riders_percentage DESC;
