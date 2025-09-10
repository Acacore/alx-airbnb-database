-- 1. Drop existing table if needed (careful in production!)
DROP TABLE IF EXISTS booking CASCADE;

-- 2. Create the parent Booking table with partitioning on start_date
CREATE TABLE booking (
    booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL REFERENCES properties(property_id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK(status IN('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (start_date);

-- 3. Create partitions (example: yearly partitions)
CREATE TABLE booking_2023 PARTITION OF booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Default partition to catch rows outside defined ranges
CREATE TABLE booking_default PARTITION OF booking
    DEFAULT;

-- 4. Indexes on partitions for performance
CREATE INDEX idx_booking_2023_start_date ON booking_2023(start_date);
CREATE INDEX idx_booking_2024_start_date ON booking_2024(start_date);
CREATE INDEX idx_booking_default_start_date ON booking_default(start_date);

-- 5. Example query on the partitioned table
EXPLAIN ANALYZE
SELECT *
FROM booking
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
