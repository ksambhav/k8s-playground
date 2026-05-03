CREATE TABLE dev01.raw_orders
(
    order_id       VARCHAR(36)    NOT NULL,
    -- Partition column MUST be part of the Primary Key
    created_at     DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_email VARCHAR(255),
    order_date     DATE,
    order_weight_kg DOUBLE,
    total_amount   DECIMAL(12, 2) NOT NULL
) ENGINE=OLAP
PRIMARY KEY(order_id, created_at)
PARTITION BY date_trunc('day', created_at)
-- DISTRIBUTED BY HASH(customer_email)
PROPERTIES (
    "replication_num" = "1",
    "enable_persistent_index" = "true"
);


select *
from dev01.raw_orders;