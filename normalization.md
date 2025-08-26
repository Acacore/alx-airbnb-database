# Database Normalization Steps

This document explains how the database schema was normalized to **Third Normal Form (3NF)**.

---

## Entity-Relationship Diagram
![Database ERD](https://drive.google.com/file/d/1ay7MZ9hvpF4BJ7bLqSUtK6ID42aBaKO9/view?usp=sharing)

---

## First Normal Form (1NF)
- Ensured that all tables contain **atomic values** (no repeating groups or nested fields).
- Each table has a **primary key** that uniquely identifies its rows:
  - `User(user_id)`
  - `Property(property_id)`
  - `Booking(booking_id)`
  - `Payment(payment_id)`
  - `Review(review_id)`
  - `Message(message_id)`
- Example: Instead of storing multiple phone numbers in one field, only one value is stored per row.

---

## Second Normal Form (2NF)
- Achieved by ensuring there are **no partial dependencies**:
  - All non-key attributes in each table depend on the **whole primary key**, not just part of it.
  - Example: In `Booking`, attributes like `start_date`, `end_date`, and `status` depend only on `booking_id`.
  - In `Payment`, attributes like `amount` and `payment_date` depend only on `payment_id`.

---

## Third Normal Form (3NF)
- Ensured that there are **no transitive dependencies** (non-key attributes depending on other non-key attributes).
- Adjustments:
  1. **Booking Table**
     - The field `total_price` can be derived from `Property.pricepernight × number_of_days`.
     - To stay in strict 3NF, `total_price` should be removed, but it may be retained as a **denormalized field for performance**.
  2. **Review Table**
     - The column previously named `UniqueID` was replaced with `property_id` to properly indicate that reviews are associated with properties.
     - This avoids ambiguity and ensures correct foreign key relationships.

---

## Final Schema Integrity
- **User**: Holds only user-related information.  
- **Property**: Holds only property details, linked to a host (`host_id → user_id`).  
- **Booking**: Stores reservation details with links to `user_id` and `property_id`.  
- **Payment**: Stores payment details linked to `booking_id`.  
- **Review**: Stores reviews linked to both `user_id` and `property_id`.  
- **Message**: Stores messages between users (`sender_id`, `recipient_id`).  

Thus, the schema satisfies **Third Normal Form (3NF)** by eliminating redundancy and ensuring that every non-key attribute depends only on the primary key.
