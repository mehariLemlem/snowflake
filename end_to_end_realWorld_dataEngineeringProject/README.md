# Snowflake real-world project case study #

## Goal ##
- Centralize data
- Enable Real-time analytics
- Improve scalability
- Enhance Data Quality
- Support advanced analytics

## Overall Architecture:
- Data sources (CSV, JSON, Parquet)
- Data storage (ADLS)
- Data warehouse (Snowflake)
- Data processing layers (Bronze, Silver, Gold)
- Reporting and Analytics tools

## Data Flow ##
- Data  source systems → ADLS (External Stages)
- ADLS → Bronze (COPY command)
- Bronze → Silver (Transformations and quality rules)
- Silver → Gold layer (Business specific aggregates)
- Gold → BI Tools (Reporting and Analytics)

## Key Snowflake Features ##
- External stages → (to connect ADLS account to the snowflake to pull the data)
- COPY command → (to load the data)
- Tasks → (to automate data loading and processing workflows)
- Streams → (to capture and process incremental changes)
- Time Travel → (for data recovery and historical analysis)
- Zero copy cloning → (for efficient environment provisioning for dev, test and prod)

## Key Components ##
- Snowflake DB
- External stage
- Multiple schema (bronze, silver, gold)
- Tables
- Tasks
- Streams
- Views