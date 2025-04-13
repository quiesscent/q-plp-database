CREATE DATABASE bookstore_db;
USE bookstore_db;

-- Country
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Address
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT REFERENCES country(country_id)
);

-- Address Status
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) UNIQUE NOT NULL
);

-- Customer
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- Customer Address
CREATE TABLE customer_address (
    customer_id INT REFERENCES customer(customer_id),
    address_id INT REFERENCES address(address_id),
    status_id INT REFERENCES address_status(status_id),
    PRIMARY KEY (customer_id, address_id)
);

-- Book Language
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) UNIQUE NOT NULL
);

-- Publisher
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    contact_email VARCHAR(100)
);

-- Author
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

-- Book
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    publication_year INT,
    language_id INT REFERENCES book_language(language_id),
    publisher_id INT REFERENCES publisher(publisher_id),
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- Book-Author (Many-to-Many)
CREATE TABLE book_author (
    book_id INT REFERENCES book(book_id),
    author_id INT REFERENCES author(author_id),
    PRIMARY KEY (book_id, author_id)
);

-- Order Status
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) UNIQUE NOT NULL
);

-- Shipping Method
CREATE TABLE shipping_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    cost NUMERIC(10, 2)
);

-- Customer Order
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    shipping_method_id INT REFERENCES shipping_method(method_id),
    status_id INT REFERENCES order_status(status_id)
);

-- Order Line (Books in an Order)
CREATE TABLE order_line (
    order_id INT REFERENCES cust_order(order_id),
    book_id INT REFERENCES book(book_id),
    quantity INT NOT NULL,
    price NUMERIC(10, 2),
    PRIMARY KEY (order_id, book_id)
);

-- Order History
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT REFERENCES cust_order(order_id),
    status_id INT REFERENCES order_status(status_id),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Create an admin user with full access
CREATE USER IF NOT EXISTS 'admin_user'@'localhost' IDENTIFIED BY 'AdminPass123!';
GRANT ALL PRIVILEGES ON BookstoreDB.* TO 'admin_user'@'localhost';

-- Create a staff user with limited access (e.g., can insert, update but not drop tables)
CREATE USER IF NOT EXISTS 'staff_user'@'localhost' IDENTIFIED BY 'StaffPass123!';
GRANT SELECT, INSERT, UPDATE ON BookstoreDB.* TO 'staff_user'@'localhost';

-- Create a viewer user with read-only access
CREATE USER IF NOT EXISTS 'viewer_user'@'localhost' IDENTIFIED BY 'ViewPass123!';
GRANT SELECT ON BookstoreDB.* TO 'viewer_user'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;