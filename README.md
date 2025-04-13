# 📘 Bookstore Database Design & SQL Project

## 🧠 Overview

This hands-on project focuses on database design, table creation, data loading, and user management to create a well-organized, efficient system for handling complex data.

---

## 🛠️ Tools and Technologies

- **MySQL** – For building and managing the database
- **Draw.io** – For visualizing the database schema and relationships

---

## 🎯 Project Objective

To Design and implement a **relational database** that stores key information about the bookstore’s operations, including:

- Books
- Authors
- Customers
- Orders
- Shipping
- And more...

The database should allow for efficient data storage and quick, insightful queries.

---

## 🪜 Step-by-Step Instructions

1. **Create** a new MySQL database for the bookstore.
2. **Design** the table schema and select appropriate data types.
3. **Write SQL** commands to create the tables based on your schema.
4. **Set up user groups/roles** for controlled access and security.
5. **Test** the database using queries to retrieve and analyze data.

---


## 🗃️ Tables to Created

| Table Name          | Description |
|---------------------|-------------|
| `book`              | List of all books in the store |
| `book_author`       | Manages many-to-many relationship between books and authors |
| `author`            | List of all authors |
| `book_language`     | Possible languages of books |
| `publisher`         | Publishers of the books |
| `customer`          | Bookstore’s customers |
| `customer_address`  | Customer addresses (each customer can have multiple) |
| `address_status`    | Status of an address (e.g., current, old) |
| `address`           | All addresses in the system |
| `country`           | Countries where addresses are located |
| `cust_order`        | Orders placed by customers |
| `order_line`        | Books that are part of each order |
| `shipping_method`   | Shipping methods available for orders |
| `order_history`     | Record of order status history (e.g., ordered, cancelled) |
| `order_status`      | Statuses for an order (e.g., pending, shipped, delivered) |

---

## 📝 UML DIAGRAM

![Uml Digaram](./uml.png)
---

## 📌 Notes

- Used **Draw.io**  to visually map our ER diagram.
- Normalized our tables appropriately to avoid data redundancy.
- Used **foreign keys** and **indexes** to optimize relationships and performance.

---
