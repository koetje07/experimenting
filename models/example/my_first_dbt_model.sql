
-- Create a Snowflake stage to store the CSV file
CREATE STAGE my_stage;

-- Upload the CSV file to the Snowflake stage using the PUT command









PUT file:///Users/milan/experimenting/customers-100.csv @my_stage;

-- Create a file format that describes the format of the CSV file
CREATE FILE FORMAT my_file_format
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  RECORD_DELIMITER = '\n'
  SKIP_HEADER = 1;

  create or replace file format my_csv_format
  type = csv
  record_delimiter = '\n'
  field_delimiter = ','
  skip_header = 1
  null_if = ('NULL', 'null')
  empty_field_as_null = true
  FIELD_OPTIONALLY_ENCLOSED_BY = '0x22';

-- Create a dbt model that references the Snowflake stage and file format
-- Load the data from the CSV file into a Snowflake table
-- Replace the table name, schema name, and column names with your own
-- Make sure the column names match the headers in the CSV file
-- Make sure the file format matches the format of the CSV file
-- Make sure the stage name matches the name of the Snowflake stage you created
-- Make sure the path to the CSV file matches the path to the file on your local machine
-- Make sure the table name matches the name of the table you want to create in Snowflake
-- Make sure the schema name matches the name of the schema you want to create in Snowflake

--this works best!
CREATE or replace TABLE FIRST.my_table3 AS
  SELECT $1 AS id,
         $2 AS name,
         $3 AS age,
         $4 as f,
         $5 as g,
         $6 as h,
         $7 as j,
         $8 as e,
         $9 as o,
         $10 as u,
         $11 as p,
         $12 as n

  FROM @my_stage
  (FILE_FORMAT => my_csv_format);

CREATE or replace TABLE FIRST.my_table3 AS
SELECT *
FROM @my_stage
(FILE_FORMAT => my_csv_format);

copy into MY_TABLE2
from @my_stage
FILE_FORMAT=(FORMAT_NAME='my_csv_format');

select * from my_table3
limit 5;
