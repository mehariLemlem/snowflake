use pacificretail_db.bronze;

-- captures customers changes
CREATE OR REPLACE STREAM customer_changes_stream ON TABLE raw_customer
    APPEND_ONLY = TRUE;

-- Captures products changes
CREATE OR REPLACE STREAM product_changes_stream ON TABLE raw_product
    APPEND_ONLY = TRUE;

-- captures orders changes    
CREATE OR REPLACE STREAM order_changes_stream ON TABLE raw_order
    APPEND_ONLY = TRUE;

-- to see available streams
show streams in pacificretail_db.bronze