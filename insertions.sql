USE bookstore_db;

-- Insert countries
INSERT INTO country (name) VALUES
('Kenya'),
('United States'),
('India');

-- Insert addresses
INSERT INTO address (street, city, postal_code, country_id) VALUES
('123 Nairobi Ave', 'Nairobi', '00100', 1),
('456 Silicon St', 'San Francisco', '94103', 2),
('789 Tech Road', 'Bangalore', '560001', 3);

-- Insert address statuses
INSERT INTO address_status (status_name) VALUES
('Current'),
('Old');

-- Insert customers
INSERT INTO customer (first_name, last_name, email, phone) VALUES
('Alice', 'Wambui', 'alice@example.com', '0712345678'),
('John', 'Doe', 'john@example.com', '0700123456');

-- Link customers to addresses
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),
(2, 2, 1);

-- Insert book languages
INSERT INTO book_language (language_name) VALUES
('English'),
('Swahili'),
('Hindi');

-- Insert publishers
INSERT INTO publisher (name, contact_email) VALUES
('Penguin Books', 'contact@penguin.com'),
('Safari Publishers', 'info@safaripub.co.ke');

-- Insert authors
INSERT INTO author (first_name, last_name) VALUES
('Ngugi', 'wa Thiong''o'),
('Chimamanda', 'Adichie'),
('George', 'Orwell');

-- Insert books
INSERT INTO book (title, isbn, publication_year, language_id, publisher_id, price, stock_quantity) VALUES
('Weep Not, Child', '9780143106764', 1964, 1, 1, 1500.00, 10),
('Half of a Yellow Sun', '9780007200283', 2006, 1, 1, 2000.00, 8),
('1984', '9780451524935', 1949, 1, 1, 1200.00, 15);

-- Link books to authors
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert shipping methods
INSERT INTO shipping_method (name, cost) VALUES
('Standard Shipping', 300.00),
('Express Delivery', 800.00);

-- Insert order statuses
INSERT INTO order_status (status_name) VALUES
('Pending'),
('Shipped'),
('Delivered'),
('Cancelled');

-- Insert customer orders
INSERT INTO cust_order (customer_id, shipping_method_id, status_id) VALUES
(1, 1, 1),
(2, 2, 2);

-- Insert order lines
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 2, 1500.00),
(1, 3, 1, 1200.00),
(2, 2, 1, 2000.00);

-- Insert order history
INSERT INTO order_history (order_id, status_id, changed_at) VALUES
(1, 1, NOW()),
(2, 1, NOW() - INTERVAL '2 days'),
(2, 2, NOW());
