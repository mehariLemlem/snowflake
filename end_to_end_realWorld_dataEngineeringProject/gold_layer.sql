-- Create Gold schema
CREATE SCHEMA IF NOT EXISTS GOLD;

-- Check if raw data is loaded to bronze tables
use pacificretail_db.bronze;
select * from <table_name>;

-- If data is not loaded to bronze tables execute respective tasks
show tasks;
execute task <task_name>;

-- Verify the streams for data changes
show streams;
select * from <stream_name>;

-- verify data availability in silver tables
use pacificretail_db.silver;

select * from <table_name>;

-- If data is not available, execute respective tasks
show tasks;
execute task <task_name>;

