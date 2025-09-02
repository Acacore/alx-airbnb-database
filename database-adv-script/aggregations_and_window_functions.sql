-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT * FROM users
WHERE
user_id IN
(SELECT user_id FROM booking 
GROUP BY booking.user_id 
HAVING COUNT(booking)
ORDER BY COUNT(booking) DESC)

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT 
    property_id,
    COUNT(property_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(property_id) DESC) AS booking_rank
FROM booking
GROUP BY property_id
ORDER BY total_bookings DESC;