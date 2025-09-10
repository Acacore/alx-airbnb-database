-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT * FROM properties
WHERE  property_id = (
    SELECT property_id FROM review WHERE AVG(rating) > 4.0
    ORDER BY property_id
)


-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT * FROM users
WHERE
user_id IN
(SELECT user_id FROM booking 
GROUP BY booking.user_id 
HAVING COUNT(booking) >= 3
ORDER BY COUNT(booking) DESC)
