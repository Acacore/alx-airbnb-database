# alx-airbnb-database
This is Week One(1)


Project Name: [alx-airbnb-database]
Description

This project is a PostgreSQL database schema for a property rental system.
It includes tables for users, properties, bookings, payments, reviews, and messages, with UUID primary keys and properly linked foreign keys.

Tables
1. users

Columns: user_id (UUID, PK), first_name, last_name, email (unique), password_hash, phone_number, role (guest, host, admin), created_at

Notes: password_hash is stored hashed using pgcrypto (crypt() function)

2. properties

Columns: property_id (UUID, PK), host_id (FK → users), name, description, location, pricepernight, created_at, updated_at

Notes: updated_at auto-updates via trigger

3. booking

Columns: booking_id (UUID, PK), property_id (FK → properties), user_id (FK → users), start_date, end_date, total_price, status (pending, confirmed, canceled), created_at

4. payments

Columns: payment_id (UUID, PK), booking_id (FK → booking), amount, payment_date, payment_method (credit_card, paypal, stripe)

5. review

Columns: review_id (UUID, PK), property_id (FK → properties), user_id (FK → users), rating (1–5), comment, created_at

6. messages

Columns: message_id (UUID, PK), sender_id (FK → users), recipient_id (FK → users), message_body, sent_at