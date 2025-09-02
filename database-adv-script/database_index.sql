
-- CREATE INDEX Statements

-- Indexes for users table
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_users_users_email ON users(email);

-- Indexes for booking table
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_date ON booking(date);

-- Indexes for properties table
CREATE INDEX idx_properties_user_id ON properties(user_id);
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_properties_property_name ON properties(property_name);


["EXPLAIN ANALYZE"]

Measure Performance (Before and After)
Example Query (before index):
EXPLAIN ANALYZE
SELECT *
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE u.email = 'alice@mail.com'
ORDER BY b.date DESC;


Before indexes → The query planner will likely do sequential scans (slow for large tables).

Example Query (after index):
EXPLAIN ANALYZE
SELECT *
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE u.email = 'alice@mail.com'
ORDER BY b.date DESC;


After indexes → The planner will switch to index scans, drastically reducing execution time.

