# Partitioning Report

## Objective
The Booking table is large and queries filtering by `start_date` were slow.  
Partitioning by `start_date` was introduced to improve performance.

## Implementation
- Created a partitioned table `booking` with **RANGE partitioning** on `start_date`.
- Separate child tables were created for the years 2023 and 2024.
- A default partition (`booking_default`) was added to handle other dates.
- Indexes were added on the `start_date` column of each partition.

## Performance Testing
### Before Partitioning
Query:
```sql
EXPLAIN ANALYZE
SELECT * FROM booking WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
