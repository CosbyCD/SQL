/*
Context and Purpose:
Creates or ensures the existence of a table named 'holidays' with columns for holiday name, start date, and end date.
*/

-- Create the 'holidays' table if it doesn't exist
CREATE TABLE IF NOT EXISTS public.holidays (
    holiday_name text COLLATE pg_catalog."default",
    holiday_start_date date,
    holiday_end_date date
);

-- Set the table to use the default tablespace
ALTER TABLE public.holidays SET TABLESPACE pg_default;

-- Set the table's owner to 'postgres'
ALTER TABLE public.holidays OWNER TO postgres;
