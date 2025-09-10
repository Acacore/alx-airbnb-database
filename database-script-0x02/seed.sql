INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('Admin', 'User', 'admin@example.com', 'hashed_password_789', NULL, 'admin'),
-- Hosts (10)
('Mary', 'Smith', 'mary.smith@example.com', 'hashed_password_456', '+233541234567', 'host'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_124', '+233541234577', 'host'),
('Bob', 'Smith', 'bob.smith@example.com', 'hashed_password_125', '+233541234569', 'host'),
('David', 'Brown', 'david.brown@example.com', 'hashed_password_126', '+233541234570', 'host'),
('Emma', 'Davis', 'emma.davis@example.com', 'hashed_password_127', '+233541234571', 'host'),
('Frank', 'Wilson', 'frank.wilson@example.com', 'hashed_password_128', '+233541234572', 'host'),
('Grace', 'Miller', 'grace.miller@example.com', 'hashed_password_129', '+233541234573', 'host'),
('Henry', 'Taylor', 'henry.taylor@example.com', 'hashed_password_130', '+233541234574', 'host'),
('Ivy', 'Anderson', 'ivy.anderson@example.com', 'hashed_password_131', '+233541234575', 'host'),
('Jack', 'Thomas', 'jack.thomas@example.com', 'hashed_password_132', '+233541234576', 'host'),

-- Guests (30)
('John', 'Doe', 'john.doe@example.com', 'hashed_password_133', '+233201234567', 'guest'),
('Sophia', 'White', 'sophia.white@example.com', 'hashed_password_134', '+233201234568', 'guest'),
('Liam', 'Hall', 'liam.hall@example.com', 'hashed_password_135', '+233201234569', 'guest'),
('Olivia', 'Young', 'olivia.young@example.com', 'hashed_password_136', '+233201234570', 'guest'),
('Noah', 'King', 'noah.king@example.com', 'hashed_password_137', '+233201234571', 'guest'),
('Ava', 'Scott', 'ava.scott@example.com', 'hashed_password_138', '+233201234572', 'guest'),
('Ethan', 'Green', 'ethan.green@example.com', 'hashed_password_139', '+233201234573', 'guest'),
('Mia', 'Adams', 'mia.adams@example.com', 'hashed_password_140', '+233201234574', 'guest'),
('James', 'Baker', 'james.baker@example.com', 'hashed_password_141', '+233201234575', 'guest'),
('Isabella', 'Nelson', 'isabella.nelson@example.com', 'hashed_password_142', '+233201234576', 'guest'),
('Lucas', 'Carter', 'lucas.carter@example.com', 'hashed_password_143', '+233201234577', 'guest'),
('Charlotte', 'Mitchell', 'charlotte.mitchell@example.com', 'hashed_password_144', '+233201234578', 'guest'),
('Benjamin', 'Perez', 'benjamin.perez@example.com', 'hashed_password_145', '+233201234579', 'guest'),
('Amelia', 'Roberts', 'amelia.roberts@example.com', 'hashed_password_146', '+233201234580', 'guest'),
('Elijah', 'Turner', 'elijah.turner@example.com', 'hashed_password_147', '+233201234581', 'guest'),
('Harper', 'Phillips', 'harper.phillips@example.com', 'hashed_password_148', '+233201234582', 'guest'),
('William', 'Campbell', 'william.campbell@example.com', 'hashed_password_149', '+233201234583', 'guest'),
('Evelyn', 'Parker', 'evelyn.parker@example.com', 'hashed_password_150', '+233201234584', 'guest'),
('Alexander', 'Evans', 'alexander.evans@example.com', 'hashed_password_151', '+233201234585', 'guest'),
('Abigail', 'Edwards', 'abigail.edwards@example.com', 'hashed_password_152', '+233201234586', 'guest'),
('Daniel', 'Collins', 'daniel.collins@example.com', 'hashed_password_153', '+233201234587', 'guest'),
('Ella', 'Stewart', 'ella.stewart@example.com', 'hashed_password_154', '+233201234588', 'guest'),
('Matthew', 'Sanchez', 'matthew.sanchez@example.com', 'hashed_password_155', '+233201234589', 'guest'),
('Scarlett', 'Morris', 'scarlett.morris@example.com', 'hashed_password_156', '+233201234590', 'guest'),
('Jackson', 'Rogers', 'jackson.rogers@example.com', 'hashed_password_157', '+233201234591', 'guest'),
('Victoria', 'Reed', 'victoria.reed@example.com', 'hashed_password_158', '+233201234592', 'guest'),
('Sebastian', 'Cook', 'sebastian.cook@example.com', 'hashed_password_159', '+233201234593', 'guest'),
('Aria', 'Morgan', 'aria.morgan@example.com', 'hashed_password_160', '+233201234594', 'guest'),
('Michael', 'Bell', 'michael.bell@example.com', 'hashed_password_161', '+233201234595', 'guest'),
('Emily', 'Murphy', 'emily.murphy@example.com', 'hashed_password_162', '+233201234596', 'guest')
ON CONFLICT (email) DO NOTHING;

-- Insert properties (50 total, 5 per host)
INSERT INTO properties (host_id, name, description, location, pricepernight)
VALUES
-- Mary Smith's properties
((SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 'Cozy Cottage', 'A small cozy cottage near the hills.', 'Accra', 45.00),
((SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 'Beach House', 'A relaxing house by the beach.', 'Cape Coast', 120.00),
((SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 'City Apartment', 'Modern apartment in the city center.', 'Accra', 80.00),
((SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 'Garden Villa', 'Spacious villa with a garden.', 'Kumasi', 150.00),
((SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 'Rustic Cabin', 'Cabin surrounded by nature.', 'Ho', 60.00),

-- Alice Johnson's properties
((SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 'Lake House', 'House with lake view.', 'Akosombo', 200.00),
((SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 'Downtown Loft', 'Loft in the heart of the city.', 'Accra', 100.00),
((SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 'Country Home', 'Quiet home in the countryside.', 'Tamale', 70.00),
((SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 'Penthouse Suite', 'Luxury penthouse with skyline view.', 'Accra', 300.00),
((SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 'Student Studio', 'Affordable studio for students.', 'Legon', 40.00),

-- Bob Smith's properties
((SELECT user_id FROM users WHERE email='bob.smith@example.com'),
 'Farm Stay', 'Experience life on a farm.', 'Sunyani', 55.00),
((SELECT user_id FROM users WHERE email='bob.smith@example.com'),
 'Luxury Villa', 'Elegant villa with private pool.', 'Takoradi', 250.00),
((SELECT user_id FROM users WHERE email='bob.smith@example.com'),
 'Budget Room', 'Simple room for budget travelers.', 'Kumasi', 25.00),
((SELECT user_id FROM users WHERE email='bob.smith@example.com'),
 'Seaside Bungalow', 'Bungalow steps from the sea.', 'Ada Foah', 90.00),
((SELECT user_id FROM users WHERE email='bob.smith@example.com'),
 'Eco Lodge', 'Sustainable eco-friendly lodge.', 'Amedzofe', 75.00),

-- David Brown's properties
((SELECT user_id FROM users WHERE email='david.brown@example.com'),
 'Hillside Retreat', 'Retreat with mountain views.', 'Aburi', 110.00),
((SELECT user_id FROM users WHERE email='david.brown@example.com'),
 'Heritage Home', 'Traditional styled home.', 'Cape Coast', 65.00),
((SELECT user_id FROM users WHERE email='david.brown@example.com'),
 'Business Hotel Room', 'Perfect for business trips.', 'Accra', 150.00),
((SELECT user_id FROM users WHERE email='david.brown@example.com'),
 'Artist Loft', 'Colorful artistic loft.', 'Kumasi', 95.00),
((SELECT user_id FROM users WHERE email='david.brown@example.com'),
 'Forest Cabin', 'Cabin in the forest.', 'Kintampo', 70.00),

-- Emma Davis's properties
((SELECT user_id FROM users WHERE email='emma.davis@example.com'),
 'Luxury Condo', 'Condo with modern facilities.', 'Accra', 180.00),
((SELECT user_id FROM users WHERE email='emma.davis@example.com'),
 'Beachfront Villa', 'Villa right on the beach.', 'Busua', 220.00),
((SELECT user_id FROM users WHERE email='emma.davis@example.com'),
 'Quiet Apartment', 'Peaceful residential area.', 'Tema', 60.00),
((SELECT user_id FROM users WHERE email='emma.davis@example.com'),
 'Herbal Retreat', 'Retreat with natural spa.', 'Volta Region', 130.00),
((SELECT user_id FROM users WHERE email='emma.davis@example.com'),
 'Desert Style Home', 'Unique desert-inspired design.', 'Navrongo', 85.00),

-- Frank Wilson's properties
((SELECT user_id FROM users WHERE email='frank.wilson@example.com'),
 'Harbor View', 'Apartment overlooking the harbor.', 'Takoradi', 140.00),
((SELECT user_id FROM users WHERE email='frank.wilson@example.com'),
 'Backpacker Hostel', 'Shared rooms for backpackers.', 'Accra', 20.00),
((SELECT user_id FROM users WHERE email='frank.wilson@example.com'),
 'Cliffside Home', 'Home on a cliff with great views.', 'Elmina', 160.00),
((SELECT user_id FROM users WHERE email='frank.wilson@example.com'),
 'Romantic Cottage', 'Perfect for couples.', 'Akosombo', 90.00),
((SELECT user_id FROM users WHERE email='frank.wilson@example.com'),
 'Suburban House', 'Family home in the suburbs.', 'Tema', 75.00),

-- Grace Miller's properties
((SELECT user_id FROM users WHERE email='grace.miller@example.com'),
 'Chalet', 'Mountain chalet with fireplace.', 'Aburi', 145.00),
((SELECT user_id FROM users WHERE email='grace.miller@example.com'),
 'Garden Cottage', 'Cottage with beautiful garden.', 'Cape Coast', 95.00),
((SELECT user_id FROM users WHERE email='grace.miller@example.com'),
 'Studio Flat', 'Compact city flat.', 'Accra', 55.00),
((SELECT user_id FROM users WHERE email='grace.miller@example.com'),
 'Countryside B&B', 'Bed and breakfast in nature.', 'Tamale', 65.00),
((SELECT user_id FROM users WHERE email='grace.miller@example.com'),
 'Urban Loft', 'Trendy loft in downtown.', 'Accra', 120.00),

-- Henry Taylor's properties
((SELECT user_id FROM users WHERE email='henry.taylor@example.com'),
 'Luxury Mansion', 'Huge mansion with pool.', 'Accra', 500.00),
((SELECT user_id FROM users WHERE email='henry.taylor@example.com'),
 'Simple Guesthouse', 'Affordable guesthouse.', 'Sunyani', 35.00),
((SELECT user_id FROM users WHERE email='henry.taylor@example.com'),
 'Lake Cottage', 'Small cottage by the lake.', 'Akosombo', 85.00),
((SELECT user_id FROM users WHERE email='henry.taylor@example.com'),
 'Townhouse', 'Family townhouse with garage.', 'Tema', 95.00),
((SELECT user_id FROM users WHERE email='henry.taylor@example.com'),
 'High-Rise Apartment', 'Apartment on 15th floor.', 'Accra', 150.00),

-- Ivy Anderson's properties
((SELECT user_id FROM users WHERE email='ivy.anderson@example.com'),
 'Garden Villa', 'Spacious villa with greenery.', 'Kumasi', 180.00),
((SELECT user_id FROM users WHERE email='ivy.anderson@example.com'),
 'Beach Shack', 'Simple beach shack stay.', 'Ada Foah', 45.00),
((SELECT user_id FROM users WHERE email='ivy.anderson@example.com'),
 'City Hotel Room', 'Modern hotel room.', 'Accra', 100.00),
((SELECT user_id FROM users WHERE email='ivy.anderson@example.com'),
 'Artist Cottage', 'Cottage for creatives.', 'Aburi', 75.00),
((SELECT user_id FROM users WHERE email='ivy.anderson@example.com'),
 'Eco Bungalow', 'Eco-friendly bungalow.', 'Hohoe', 90.00),

-- Jack Thomas's properties
((SELECT user_id FROM users WHERE email='jack.thomas@example.com'),
 'Luxury Penthouse', 'Penthouse with private terrace.', 'Accra', 350.00),
((SELECT user_id FROM users WHERE email='jack.thomas@example.com'),
 'Tiny House', 'Minimalist tiny house.', 'Cape Coast', 60.00),
((SELECT user_id FROM users WHERE email='jack.thomas@example.com'),
 'Mountain Cabin', 'Cabin with mountain air.', 'Aburi', 100.00),
((SELECT user_id FROM users WHERE email='jack.thomas@example.com'),
 'Urban Studio', 'Compact studio downtown.', 'Accra', 55.00),
((SELECT user_id FROM users WHERE email='jack.thomas@example.com'),
 'River Lodge', 'Lodge beside the river.', 'Akosombo', 120.00)
ON CONFLICT DO NOTHING;

-- Insert 15 bookings
INSERT INTO booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES
-- Booking 1 (Confirmed)
((SELECT property_id FROM properties LIMIT 1),
 (SELECT user_id FROM users WHERE email='john.doe@example.com'),
 '2025-09-05', '2025-09-08', 240.00, 'confirmed'),

-- Booking 2 (Pending)
((SELECT property_id FROM properties OFFSET 1 LIMIT 1),
 (SELECT user_id FROM users WHERE email='sophia.white@example.com'),
 '2025-09-10', '2025-09-12', 160.00, 'pending'),

-- Booking 3 (Confirmed)
((SELECT property_id FROM properties OFFSET 2 LIMIT 1),
 (SELECT user_id FROM users WHERE email='liam.hall@example.com'),
 '2025-09-15', '2025-09-18', 270.00, 'confirmed'),

-- Booking 4 (Canceled)
((SELECT property_id FROM properties OFFSET 3 LIMIT 1),
 (SELECT user_id FROM users WHERE email='olivia.young@example.com'),
 '2025-09-20', '2025-09-22', 150.00, 'canceled'),

-- Booking 5 (Confirmed)
((SELECT property_id FROM properties OFFSET 4 LIMIT 1),
 (SELECT user_id FROM users WHERE email='noah.king@example.com'),
 '2025-09-25', '2025-09-29', 320.00, 'confirmed'),

-- Booking 6 (Pending)
((SELECT property_id FROM properties OFFSET 5 LIMIT 1),
 (SELECT user_id FROM users WHERE email='ava.scott@example.com'),
 '2025-10-01', '2025-10-03', 180.00, 'pending'),

-- Booking 7 (Confirmed)
((SELECT property_id FROM properties OFFSET 6 LIMIT 1),
 (SELECT user_id FROM users WHERE email='ethan.green@example.com'),
 '2025-10-05', '2025-10-08', 210.00, 'confirmed'),

-- Booking 8 (Canceled)
((SELECT property_id FROM properties OFFSET 7 LIMIT 1),
 (SELECT user_id FROM users WHERE email='mia.adams@example.com'),
 '2025-10-10', '2025-10-12', 140.00, 'canceled'),

-- Booking 9 (Confirmed)
((SELECT property_id FROM properties OFFSET 8 LIMIT 1),
 (SELECT user_id FROM users WHERE email='james.baker@example.com'),
 '2025-10-15', '2025-10-18', 300.00, 'confirmed'),

-- Booking 10 (Confirmed)
((SELECT property_id FROM properties OFFSET 9 LIMIT 1),
 (SELECT user_id FROM users WHERE email='isabella.nelson@example.com'),
 '2025-10-20', '2025-10-23', 270.00, 'confirmed'),

-- Booking 11 (Pending)
((SELECT property_id FROM properties OFFSET 10 LIMIT 1),
 (SELECT user_id FROM users WHERE email='lucas.carter@example.com'),
 '2025-10-25', '2025-10-27', 160.00, 'pending'),

-- Booking 12 (Confirmed)
((SELECT property_id FROM properties OFFSET 11 LIMIT 1),
 (SELECT user_id FROM users WHERE email='charlotte.mitchell@example.com'),
 '2025-11-01', '2025-11-04', 240.00, 'confirmed'),

-- Booking 13 (Confirmed)
((SELECT property_id FROM properties OFFSET 12 LIMIT 1),
 (SELECT user_id FROM users WHERE email='benjamin.perez@example.com'),
 '2025-11-05', '2025-11-08', 195.00, 'confirmed'),

-- Booking 14 (Canceled)
((SELECT property_id FROM properties OFFSET 13 LIMIT 1),
 (SELECT user_id FROM users WHERE email='amelia.roberts@example.com'),
 '2025-11-10', '2025-11-12', 130.00, 'canceled'),

-- Booking 15 (Confirmed)
((SELECT property_id FROM properties OFFSET 14 LIMIT 1),
 (SELECT user_id FROM users WHERE email='elijah.turner@example.com'),
 '2025-11-15', '2025-11-18', 225.00, 'confirmed');



-- Insert payments (for confirmed bookings only)
INSERT INTO payments (booking_id, amount, payment_method)
VALUES
((SELECT booking_id FROM booking OFFSET 0 LIMIT 1), 240.00, 'credit_card'),
((SELECT booking_id FROM booking OFFSET 2 LIMIT 1), 270.00, 'paypal'),
((SELECT booking_id FROM booking OFFSET 4 LIMIT 1), 320.00, 'stripe'),
((SELECT booking_id FROM booking OFFSET 6 LIMIT 1), 210.00, 'credit_card'),
((SELECT booking_id FROM booking OFFSET 8 LIMIT 1), 300.00, 'paypal'),
((SELECT booking_id FROM booking OFFSET 9 LIMIT 1), 270.00, 'stripe'),
((SELECT booking_id FROM booking OFFSET 11 LIMIT 1), 240.00, 'credit_card'),
((SELECT booking_id FROM booking OFFSET 12 LIMIT 1), 195.00, 'paypal'),
((SELECT booking_id FROM booking OFFSET 14 LIMIT 1), 225.00, 'stripe');


-- Insert reviews for confirmed bookings
INSERT INTO review (property_id, user_id, rating, comment)
VALUES
((SELECT property_id FROM booking OFFSET 0 LIMIT 1),
 (SELECT user_id FROM users WHERE email='john.doe@example.com'),
 5, 'Amazing stay! The cottage was cozy and the host was very welcoming.'),

((SELECT property_id FROM booking OFFSET 2 LIMIT 1),
 (SELECT user_id FROM users WHERE email='liam.hall@example.com'),
 4, 'Great location in the city center, but a bit noisy at night.'),

((SELECT property_id FROM booking OFFSET 4 LIMIT 1),
 (SELECT user_id FROM users WHERE email='noah.king@example.com'),
 5, 'Beautiful villa with a garden, perfect for a family vacation.'),

((SELECT property_id FROM booking OFFSET 6 LIMIT 1),
 (SELECT user_id FROM users WHERE email='ethan.green@example.com'),
 3, 'Nice place, but the Wi-Fi was unreliable.'),

((SELECT property_id FROM booking OFFSET 8 LIMIT 1),
 (SELECT user_id FROM users WHERE email='james.baker@example.com'),
 4, 'Comfortable stay, very clean and spacious.'),

((SELECT property_id FROM booking OFFSET 9 LIMIT 1),
 (SELECT user_id FROM users WHERE email='isabella.nelson@example.com'),
 5, 'Fantastic penthouse with amazing views of the city skyline!'),

((SELECT property_id FROM booking OFFSET 11 LIMIT 1),
 (SELECT user_id FROM users WHERE email='charlotte.mitchell@example.com'),
 4, 'The apartment was lovely, but parking was a bit tricky.'),

((SELECT property_id FROM booking OFFSET 12 LIMIT 1),
 (SELECT user_id FROM users WHERE email='benjamin.perez@example.com'),
 5, 'Host was very kind and helpful, and the place was spotless.'),

((SELECT property_id FROM booking OFFSET 14 LIMIT 1),
 (SELECT user_id FROM users WHERE email='elijah.turner@example.com'),
 5, 'Loved the cabin in the mountains, very peaceful and relaxing.'),

((SELECT property_id FROM booking OFFSET 0 LIMIT 1),
 (SELECT user_id FROM users WHERE email='john.doe@example.com'),
 4, 'Would definitely come back, but water pressure could be better.');

-- Guest (John Doe) messaging Host (Mary Smith)
INSERT INTO messages (sender_id, recipient_id, message_body) VALUES
((SELECT user_id FROM users WHERE email='john.doe@example.com'),
 (SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 'Hi Mary, just confirming my arrival time for the cottage stay.'),
((SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 (SELECT user_id FROM users WHERE email='john.doe@example.com'),
 'Thanks John! I will be there to welcome you at 3 PM.'),

-- Guest (Sophia White) messaging Host (Alice Johnson)
((SELECT user_id FROM users WHERE email='sophia.white@example.com'),
 (SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 'Hello Alice, is there parking available at the property?'),
((SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 (SELECT user_id FROM users WHERE email='sophia.white@example.com'),
 'Hi Sophia, yes we have free parking for guests.'),

-- Guest (Liam Hall) messaging Host (Bob Smith)
((SELECT user_id FROM users WHERE email='liam.hall@example.com'),
 (SELECT user_id FROM users WHERE email='bob.smith@example.com'),
 'Can I check in earlier than 2 PM?'),
((SELECT user_id FROM users WHERE email='bob.smith@example.com'),
 (SELECT user_id FROM users WHERE email='liam.hall@example.com'),
 'Sure, you can check in from 12 PM onwards.'),

-- Guest (Olivia Young) messaging Host (David Brown)
((SELECT user_id FROM users WHERE email='olivia.young@example.com'),
 (SELECT user_id FROM users WHERE email='david.brown@example.com'),
 'Hi David, does the property have air conditioning?'),
((SELECT user_id FROM users WHERE email='david.brown@example.com'),
 (SELECT user_id FROM users WHERE email='olivia.young@example.com'),
 'Hello Olivia, yes, the house is fully air-conditioned.'),

-- Guest (Noah King) messaging Host (Emma Davis)
((SELECT user_id FROM users WHERE email='noah.king@example.com'),
 (SELECT user_id FROM users WHERE email='emma.davis@example.com'),
 'Hi Emma, just wanted to ask if pets are allowed.'),
((SELECT user_id FROM users WHERE email='emma.davis@example.com'),
 (SELECT user_id FROM users WHERE email='noah.king@example.com'),
 'Hi Noah, yes small pets are welcome!'),

-- Guest (Ethan Green) messaging Host (Frank Wilson)
((SELECT user_id FROM users WHERE email='ethan.green@example.com'),
 (SELECT user_id FROM users WHERE email='frank.wilson@example.com'),
 'Hi Frank, do you provide breakfast at the lodge?'),
((SELECT user_id FROM users WHERE email='frank.wilson@example.com'),
 (SELECT user_id FROM users WHERE email='ethan.green@example.com'),
 'Yes Ethan, we provide breakfast every morning at no extra cost.'),

-- Guest (James Baker) messaging Host (Grace Miller)
((SELECT user_id FROM users WHERE email='james.baker@example.com'),
 (SELECT user_id FROM users WHERE email='grace.miller@example.com'),
 'Hi Grace, does the property have a swimming pool?'),
((SELECT user_id FROM users WHERE email='grace.miller@example.com'),
 (SELECT user_id FROM users WHERE email='james.baker@example.com'),
 'Hello James, unfortunately no pool, but we have a beautiful garden.'),
 
-- Guest (Isabella Nelson) messaging Host (Henry Taylor)
((SELECT user_id FROM users WHERE email='isabella.nelson@example.com'),
 (SELECT user_id FROM users WHERE email='henry.taylor@example.com'),
 'Hi Henry, is there Wi-Fi in the apartment?'),
((SELECT user_id FROM users WHERE email='henry.taylor@example.com'),
 (SELECT user_id FROM users WHERE email='isabella.nelson@example.com'),
 'Yes Isabella, we provide free high-speed Wi-Fi.');
