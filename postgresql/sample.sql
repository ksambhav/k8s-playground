SHOW
wal_level;
CREATE
EXTENSION IF NOT EXISTS "uuid-ossp";

-- Ensure the UUID extension is available (standard in most environments)
CREATE
EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE
EXTENSION IF NOT EXISTS  "pg_cron";


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
VALUES (12218.75, 12100.99, 'random@ftest.com') RETURNING order_id, created_at;


insert
into orders (order_weight_kg,
             total_amount,
             customer_email)
select (random() * 10000)::numeric as order_weight_kg, (random() * 1000)::numeric as total_amount, 'random@ftest.com' as customer_email
from generate_series(1, (random() * 100):: int) RETURNING order_id, created_at;

select *
from orders o
order by order_id;

SELECT pid, usename, application_name, backend_type, state
FROM pg_stat_activity
WHERE application_name ILIKE 'pg_cron scheduler';

SELECT cron.unschedule('load_test_insert'); -- Clear any existing
delete
from cron.job;
delete
from cron.job_run_details;

SELECT cron.schedule_in_database(
               'load_test_insert',
               '*/8 * * * * *',
               $$SET local PGPASSWORD = 'password';
INSERT INTO orders (order_weight_kg, total_amount, customer_email)
SELECT (random() * 10000)::numeric, (random() * 1000)::numeric, 'random@ftest.com'
FROM generate_series(1, (random() * 9 + 1):: int);
$$
,
    'db01',
    'samsoft'
);

SELECT jobid,
       jobname,
       database,
       username,
       nodename,
       active,
       schedule
FROM cron.job
WHERE jobname = 'load_test_insert';


-- Check the job execution history for db01
SELECT *
FROM cron.job_run_details
ORDER BY start_time DESC LIMIT 10;


SELECT *
FROM pg_hba_file_rules
WHERE database = 'db01';