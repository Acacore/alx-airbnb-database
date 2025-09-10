-- Example 1: Check performance of booking queries by user_id
EXPLAIN ANALYZE
SELECT * 
FROM booking 
WHERE user_id = 'some-user-uuid';

-- Example 2: Check performance of property search by location
EXPLAIN ANALYZE
SELECT * 
FROM properties
WHERE location = 'Accra';

-- Example 3: Check performance of joining bookings with users and payments
EXPLAIN ANALYZE
SELECT b.booking_id, u.first_name, u.last_name, p.amount
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN payments p ON b.booking_id = p.booking_id
WHERE b.start_date BETWEEN '2024-05-01' AND '2024-05-31';

-------------------------------------------------------
-- Identified bottlenecks → Implement improvements
-------------------------------------------------------

-- Add index on frequently filtered column (location)
CREATE INDEX IF NOT EXISTS idx_properties_location ON properties(location);

-- Add composite index for booking queries filtering by (user_id, start_date)
CREATE INDEX IF NOT EXISTS idx_booking_user_start_date 
ON booking(user_id, start_date);

-- Add covering index for payments on (booking_id, amount)
CREATE INDEX IF NOT EXISTS idx_payments_booking_amount 
ON payments(booking_id, amount);

-------------------------------------------------------
-- Re-run query performance checks after indexing
-------------------------------------------------------
EXPLAIN ANALYZE
SELECT * 
FROM booking 
WHERE user_id = 'some-user-uuid';

EXPLAIN ANALYZE
SELECT * 
FROM properties
WHERE location = 'Accra';

EXPLAIN ANALYZE
SELECT b.booking_id, u.first_name, u.last_name, p.amount
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN payments p ON b.booking_id = p.booking_id
WHERE b.start_date BETWEEN '2024-05-01' AND '2024-05-31';
