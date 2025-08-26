
-- Insert sample users
INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('John', 'Doe', 'john.doe@example.com', 'hashed_password_123', '+233201234567', 'guest'),
('Mary', 'Smith', 'mary.smith@example.com', 'hashed_password_456', '+233541234567', 'host'),
('Admin', 'User', 'admin@example.com', 'hashed_password_789', NULL, 'admin'),
('Alice', 'Johnson', 'alice@example.com', 'hashed_password_124', 'host'),
('Bob', 'Smith', 'bob@example.com', 'hashed_password_125', 'host');


-- Insert properties for these hosts
INSERT INTO properties (host_id, name, description, location, pricepernight)
VALUES
((SELECT user_id FROM users WHERE email='mary.smith@example.com'), 
 'Beach House', 'A cozy house near the beach', 'Accra, Ghana', 150.00),
((SELECT user_id FROM users WHERE email='bob@example.com'), 
 'Mountain Cabin', 'A quiet cabin in the mountains', 'Kumasi, Ghana', 120.00);




 -- Insert sample bookings
INSERT INTO booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES(
    (SELECT property_id FROM properties LIMIT 1), (SELECT user_id FROM users WHERE role='guest' LIMIT 1),
    '2025-09-01', '2025-09-05', 500.00, 'confirmed'
),
(
    (SELECT property_id FROM properties OFFSET 1 LIMIT 1),(SELECT user_id FROM users WHERE role='guest' OFFSET 1 LIMIT 1),
    '2025-10-01', '2025-10-07', 700.00, 'pending'
)
(
    (SELECT property_id FROM properties OFFSET 2 LIMIT 1),(SELECT user_id FROM users WHERE role='guest' OFFSET 1 LIMIT 1),
    '2025-10-02', '2025-10-07', 700.00, 'pending'
);



-- Insert sample payments
INSERT INTO payments (booking_id, amount, payment_method)
VALUES
((SELECT booking_id FROM booking LIMIT 1 OFFSET 0), 200.00, 'credit_card'),  
((SELECT booking_id FROM booking LIMIT 1 OFFSET 1), 150.00, 'paypal'),
((SELECT booking_id FROM booking LIMIT 1 OFFSET 2), 300.00, 'stripe');  


-- Insert sample review
INSERT INTO review (property_id, user_id, rating, comment)
VALUES
(
    (SELECT property_id FROM properties LIMIT 1),
    (SELECT user_id FROM users WHERE role='guest' LIMIT 1),
    5,
    'Amazing property, loved staying here!'
),
(
    (SELECT property_id FROM properties OFFSET 1 LIMIT 1),
    (SELECT user_id FROM users WHERE role='guest' OFFSET 1 LIMIT 1),
    4,
    'Great location and clean rooms.'
);



-- Insert sample message
INSERT INTO messages (sender_id, recipient_id, message_body)
VALUES
(
    (SELECT user_id FROM users LIMIT 1),
    (SELECT user_id FROM users OFFSET 1 LIMIT 1),
    'Hello, is your property available for next weekend?'
),
(
    (SELECT user_id FROM users OFFSET 1 LIMIT 1),
    (SELECT user_id FROM users LIMIT 1),
    'Yes, it is available. Let me know if you want to book.'
);
