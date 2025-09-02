''' 1. Identify High-Usage Columns

From the queries you’ve been writing (JOIN, WHERE, ORDER BY), the commonly used columns are:

users

user_id → used in JOIN booking.user_id = users.user_id

email (optional) → often used in lookups (e.g., WHERE email = ?)

booking

booking_id (PK, often already indexed)

user_id → used in joins (JOIN users)

property_id → used in joins (JOIN properties)

date → used in filtering (WHERE date > ?) or ordering

properties

property_id → used in joins (JOIN booking)

property_name → sometimes searched (WHERE property_name LIKE ?)
'''



2. CREATE INDEX Statements

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

'''
3. Measure Performance (Before and After)
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
'''

'''
4. Expected Performance Improvement

Without index: sequential scan (O(n)) over entire table.

With index: index scan (O(log n)), using B-Tree lookup.

Joins become faster since the database engine uses indexed lookups on user_id and property_id.
'''