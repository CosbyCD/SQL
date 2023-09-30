/*
File: load_holidays_data.sql

Inserts various holiday records with their corresponding names and start dates into the 'holidays' table. 
Some holidays are single-day events while others span multiple days.
*/


INSERT INTO holidays (holiday_name, holiday_start_date) VALUES
    -- single-day holiday records--
	('New Year''s', '2022-01-01'),
   	('Martin Luther King Jr.', '2022-01-17'),
    	('Presidents Day', '2022-02-21'),
	('Easter', '2022-03-23'),
	('Memorial Day', '2022-05-27'),
	('Independence Day', '2022-07-04'),
	('Columbus Day', '2022-10-04'),
	('Halloween', '2022-10-31'),
	('Veterans Day', '2022-11-11'),
	('Thanksgiving', '2022-11-24'),
	('Christmas Day', '2022-12-25'),
	('Mother''s Day', '2022-05-18'),
	('Father''s Day', '2022-06-16'),
	('Boxing Day', '2022-12-26'),
	('International Worker''s Day (May Day)', '2022-05-01'),
	('Flag Day', '2022-06-14'),
	('Earth Day', '2022-04-22'),
	('Pi Day', '2022-03-14'),
	('International Women''s Day', '2022-03-08'),
	('Valentine''s Day', '2022-02-14'),
	('Juneteenth', '2022-06-19'),
	('Chinese New Year','2022-02-01'),
	('Diwali', '2022-10-24'),
	('Eid al-Fitr (End of Ramadan)', '2022-05-02'),
	('Eid al-Adha', '2022-07-09'),
	('Mardi Gras', '2022-03-01'),
	('Chicago St. Patrick''s Day Parade', '2022-03-12'),
	('Chicago Pride Parade', '2022-06-26'),

    -- multi-day holiday records --
    	('Oktoberfest', '2022-09-10'),
    	('Oktoberfest', '2022-09-11'),
    	('Oktoberfest', '2022-09-12'),
    	('Oktoberfest', '2022-09-13'),
    	('Oktoberfest', '2022-09-14'),
    	('Oktoberfest', '2022-09-15'),
    	('Oktoberfest', '2022-09-16'),
    	('Oktoberfest', '2022-09-17'),
    	('Oktoberfest', '2022-09-18'),
    	('Oktoberfest', '2022-09-19'),
    	('Chicago Air and Water Show', '2022-08-20'),
    	('Chicago Air and Water Show', '2022-08-21'),
    	('Taste of Chicago', '2022-06-08'),
    	('Taste of Chicago', '2022-06-09'),
    	('Taste of Chicago', '2022-06-10'),
    	('Chicago Blues Festival', '2022-06-09'),
    	('Chicago Blues Festival', '2022-06-10'),
    	('Chicago Blues Festival', '2022-06-11'),
    	('Chicago Blues Festival', '2022-06-12'),
    	('Chicago Jazz Festival', '2022-09-01'),
    	('Chicago Jazz Festival', '2022-09-02'),
    	('Chicago Jazz Festival', '2022-09-03'),
    	('Chicago Jazz Festival', '2022-09-04'),
    	('Lollapalooza', '2022-07-28'),
    	('Lollapalooza', '2022-07-29'),
    	('Lollapalooza', '2022-07-30'),
    	('Lollapalooza', '2022-07-31')
;
