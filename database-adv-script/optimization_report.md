# Optimization Report

## 1. Initial Query
The initial query retrieved all booking records along with details from the `users`, `properties`, and `payments` tables.  

### Issues:
- **SELECT * behavior**: Too many columns retrieved, including unnecessary ones.
- **Full table scans**: Without indexes, large tables would require sequential scans.
- **No filtering**: Every row was returned, even for canceled/pending bookings.
- **Execution time**: Higher due to heavy joins on multiple large tables.

---

## 2. Indexes Added
Indexes were created on frequently used columns:

- `booking.user_id` → speeds up JOIN with users.  
- `booking.property_id` → speeds up JOIN with properties.  
- `booking.booking_id` → speeds up JOIN with payments.  
- `users.email` → helps with lookups.  
- `properties.host_id`, `properties.name` → support filtering and searching.  

---

## 3. Optimized Query
Refactoring steps:
- Selected only **relevant columns**.  
- Added a **WHERE clause** to fetch only confirmed bookings.  
- Used **ORDER BY start_date** to make results more meaningful.  
- Relied on **indexes** to reduce join cost.  

---

## 4. Performance Comparison

### Before Optimization (no indexes, full scans):
