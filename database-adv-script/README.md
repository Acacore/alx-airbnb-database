# SQL Join Queries Documentation

This document provides explanations for different types of SQL join queries used in relational databases. Each query is followed by its purpose and expected results.

---

## 1. INNER JOIN: Retrieve Bookings and Users

```sql
SELECT *
FROM booking
INNER JOIN users
ON booking.user_id = users.user_id;
Explanation
INNER JOIN returns only the rows where there is a match in both tables.

In this query:

We select all columns (*) from the booking and users tables.

The join condition is booking.user_id = users.user_id.

This ensures that only bookings linked to an existing user are retrieved.

Use Case
To display all bookings along with the user details (e.g., name, email) of the person who made each booking.

Result
Each row in the result represents a booking with its associated user information.

If a booking does not have a valid user_id, it will not appear.

2. LEFT JOIN: Retrieve Properties and Reviews
sql
Copy code
SELECT *
FROM properties
LEFT JOIN review
ON properties.property_id = review.property_id;
Explanation
LEFT JOIN returns all rows from the left table (properties), and matching rows from the right table (review).

If there is no match in the review table, the result will still include the property with NULL values for review fields.

Use Case
To display all properties, including those that have not yet received any reviews.

Result
Properties with reviews will have their reviews displayed alongside them.

Properties without reviews will still appear, but with NULL in the review columns.

3. FULL OUTER JOIN: Retrieve All Users and All Bookings
sql
Copy code
SELECT *
FROM users
FULL OUTER JOIN booking
ON booking.user_id = users.user_id;
Explanation
FULL OUTER JOIN returns all rows from both tables, regardless of whether there is a match.

If a user has no bookings, they will still appear with NULL in the booking fields.

If a booking is not linked to a user, it will still appear with NULL in the user fields.

Use Case
To get a complete list of users and bookings:

Users who have bookings.

Users who do not have bookings.

Bookings that are not associated with any user.

Result
All users and all bookings are included in the result set.

Missing relationships are represented with NULL values.


# SQL Subquery Documentation

This document provides professional explanations and examples for SQL queries that use **subqueries** and **correlated subqueries**. Each query includes its purpose, explanation, and example output.

---

## 1. Find Properties with Average Rating Greater Than 4.0

```sql
SELECT *
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
Explanation
The goal is to find all properties where the average review rating is greater than 4.0.

We use a subquery inside the WHERE clause:

The subquery groups reviews by property_id.

It calculates the average rating for each property using AVG(rating).

The HAVING clause filters only those properties with an average rating greater than 4.0.

The outer query retrieves all property details (*) from the properties table where the property ID matches the result of the subquery.

Use Case
To highlight top-rated properties on a booking platform.

Useful for generating "Top Properties" lists.

