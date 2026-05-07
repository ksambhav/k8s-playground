SHOW
wal_level;
CREATE
EXTENSION IF NOT EXISTS "uuid-ossp";

-- Ensure the UUID extension is available (standard in most environments)
CREATE
EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE orders
(
    -- Primary Key using UUIDv7 (Time-sorted)
    -- Note: If using Postgres 17+, use: DEFAULT uuidv7()
    -- For older versions, ensure your logic/extension provides the v7 generator
    order_id        UUID PRIMARY KEY        DEFAULT uuidv7(),

    -- Date type (stores date only: YYYY-MM-DD)
    order_date      DATE           NOT NULL DEFAULT CURRENT_DATE,

    -- Datetime type (stores date and time with microsecond precision)
    -- 'TIMESTAMPTZ' is recommended to handle timezone offsets correctly
    created_at      TIMESTAMPTZ    NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Double precision (8-byte floating point)
    -- Best for scientific data or coordinates
    order_weight_kg DOUBLE PRECISION,

    -- Numeric type (Better for currency than double)
    total_amount    NUMERIC(12, 2) NOT NULL,

    customer_email  VARCHAR(255)
);

-- Index on created_at for efficient time-range queries
CREATE INDEX idx_orders_created_at ON orders (created_at);


INSERT INTO orders (order_weight_kg, total_amount, customer_email)
VALUES (12218.75, 12100.99,
        '456aflsdkjalfjsdkaljsdkfalasdfjkhgasjkhdfgakjshdfgajkshdgfajshdgf@ftest.com') RETURNING order_id, created_at;

update orders
SET customer_email='kumar.sambhav.jain@gmail.com'
where order_id = '019dece2-5c60-7245-8610-d390f9818b1c';

select *
from orders o
order by order_id;




