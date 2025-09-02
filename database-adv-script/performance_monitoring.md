# Performance Monitoring and Optimization Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and applying schema adjustments.

## Method
1. Used `EXPLAIN ANALYZE` to review execution plans for frequently used queries:
   - Fetching bookings by `user_id`.
   - Searching properties by `location`.
   - Joining bookings with users and payments for reporting.

2. Observed execution strategies and identified full table scans or inefficient joins.

## Findings
- Query on `booking.user_id` triggered a **sequential scan** instead of index usage.
- Query on `properties.location` also scanned the full table.
- The join query was slowed by lack of supporting indexes on `booking.start_date` and `payments.booking_id`.

## Improvements Implemented
- Added `idx_properties_location` on `properties(location)`.
- Added composite index `idx_booking_user_start_date` on `(user_id, start_date)`.
- Added covering index `idx_payments_booking_amount` on `(booking_id, amount)`.

## Results
- Booking queries by `user_id` now use **index scans** instead of sequential scans.
- Property search by `location` reduced execution cost significantly.
- Join queries now leverage indexes on join keys and filters, improving execution time.

## Conclusion
Indexing and schema adjustments improved query performance substantially.  
Next steps:
- Monitor queries with `pg_stat_statements` for continuous optimization.
- Consider table partitioning for bookings if dataset continues to grow.
- Periodically run `VACUUM ANALYZE` to keep statistics up-to-date.
