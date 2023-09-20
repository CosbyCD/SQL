/*
File: peak_ridership_holidays_analysis.sql

The provided query analyzes peak ridership during holidays by 
calculating the total ridership (user casual and member 
riders) for each holiday. It excludes rows with NULL holiday 
names, ensuring only valid holiday data is considered. The 
results offer insights into which holidays attract the highest
overall ridership, aiding in understanding the popularity of 
specific holidays among riders.
*/

SELECT
    td.holiday_name,
    TO_CHAR(COUNT(CASE WHEN ud.member_casual = 'casual' THEN 1 END) + COUNT(CASE WHEN ud.member_casual = 'member' THEN 1 END), '999,999') AS total_ridership
FROM
    user_data ud
LEFT JOIN temporal_data td ON ud.date_start = td.holiday_start_date
WHERE
    td.holiday_name IS NOT NULL
GROUP BY
    td.holiday_name
ORDER BY
    total_ridership DESC;
