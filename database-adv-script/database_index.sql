
-- CREATE INDEX Statements

-- Indexes for users table
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_users_users_email ON users(email);

-- Indexes for booking table
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_date ON booking(date);

-- Indexes for properties table
CREATE INDEX idx_properties_user_id ON properties(user_id);
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_properties_property_name ON properties(property_name);

