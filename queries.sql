USE bookstore_db;

-- 1. Fetch all books with their authors and publishers
SELECT b.title, a.first_name || ' ' || a.last_name AS author, p.name AS publisher
FROM book b
JOIN book_author ba ON b.id = ba.book_id
JOIN author a ON ba.author_id = a.id
JOIN publisher p ON b.publisher_id = p.id;

-- 2. List all orders with customer name and status
SELECT co.id AS order_id, c.first_name || ' ' || c.last_name AS customer, os.status_name
FROM cust_order co
JOIN customer c ON co.customer_id = c.id
JOIN order_status os ON co.status_id = os.id;

-- 3. Count how many books are in each language
SELECT bl.language_name, COUNT(b.id) AS total_books
FROM book_language bl
LEFT JOIN book b ON bl.id = b.language_id
GROUP BY bl.language_name;

-- 4. Get total revenue from each book (price * quantity sold)
SELECT b.title, SUM(ol.quantity * ol.price) AS total_revenue
FROM order_line ol
JOIN book b ON ol.book_id = b.id
GROUP BY b.title
ORDER BY total_revenue DESC;

-- 5. List customers and their current addresses
SELECT c.first_name || ' ' || c.last_name AS customer, a.street, a.city, co.name AS country
FROM customer c
JOIN customer_address ca ON c.id = ca.customer_id
JOIN address a ON ca.address_id = a.id
JOIN country co ON a.country_id = co.id
JOIN address_status ast ON ca.status_id = ast.id
WHERE ast.status_name = 'Current';

-- 6. Update a customer's phone number
UPDATE customer
SET phone = '0711111111'
WHERE email = 'alice@example.com';

-- 7. Delete an old address (just as example)
DELETE FROM address
WHERE id = 3; -- Assuming it's not linked

-- 8. List books out of stock
SELECT title FROM book WHERE stock_quantity = 0;

-- 9. Show full order line details for a customer
SELECT co.id AS order_id, b.title, ol.quantity, ol.price
FROM cust_order co
JOIN order_line ol ON co.id = ol.order_id
JOIN book b ON ol.book_id = b.id
WHERE co.customer_id = 1;

-- 10. Order shipping methods by cost
SELECT * FROM shipping_method ORDER BY cost ASC;
