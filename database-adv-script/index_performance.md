# Identify High-Usage Columns

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



# Expected Performance Improvement

Without index: sequential scan (O(n)) over entire table.

With index: index scan (O(log n)), using B-Tree lookup.

Joins become faster since the database engine uses indexed lookups on user_id and property_id.


