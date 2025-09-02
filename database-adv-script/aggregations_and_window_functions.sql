-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT * FROM users
WHERE
user_id IN
(SELECT user_id FROM booking 
GROUP BY booking.user_id 
HAVING COUNT(booking)
ORDER BY COUNT(booking) DESC)

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
-- aggregations_and_window_functions.sql
SELECT
  property_id,
  total_bookings,
  ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
  SELECT property_id,
         COUNT(*) AS total_bookings
  FROM booking
  GROUP BY property_id
) AS aggregated
ORDER BY total_bookings DESC;
