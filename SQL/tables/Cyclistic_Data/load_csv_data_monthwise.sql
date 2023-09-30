/*
File: load_csv_data_monthwise.sql

Executes a loop to import data from 12 separate files into corresponding tables using the COPY command.
*/

-- Loop through the months and copy data from CSV files
DO $$ 
DECLARE
    month_num INTEGER;
    table_name TEXT;
    csv_path TEXT;
BEGIN
    FOR month_num IN 1..12 LOOP
        table_name := 'cyclistic_data_' || month_num;
        csv_path := 'D:/phase_one_transform/2022' || LPAD(month_num::TEXT, 2, '0') || '-divvy-tripdata.csv';
        
        EXECUTE format('
            COPY %I FROM %L DELIMITER %L CSV HEADER;',
            table_name, csv_path, ',');
    END LOOP;
END $$;
