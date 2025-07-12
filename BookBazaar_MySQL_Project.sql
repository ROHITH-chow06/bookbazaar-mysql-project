
-- BookBazaar MySQL Project

-- Books Table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(6,2),
    stock INT
);

-- Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(8,2),
    payment_date DATE,
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Reviews Table
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Sample Inserts
INSERT INTO books (title, author, genre, price, stock) VALUES
('Atomic Habits', 'James Clear', 'Self-help', 450.00, 30),
('The Alchemist', 'Paulo Coelho', 'Fiction', 299.00, 20),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 375.00, 25),
('Clean Code', 'Robert C. Martin', 'Programming', 550.00, 15),
('Deep Work', 'Cal Newport', 'Productivity', 400.00, 18);

INSERT INTO customers (name, email, phone) VALUES
('Rohith Chowdary', 'rohith@example.com', '9876543210'),
('Meera Iyer', 'meera@example.com', '9123456780'),
('Aman Khan', 'aman.khan@example.com', '8899001122');

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-06-01'),
(2, '2024-06-02'),
(3, '2024-06-03');

INSERT INTO order_items (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(3, 5, 2);

INSERT INTO payments (order_id, amount, payment_date, payment_method) VALUES
(1, 1199.00, '2024-06-01', 'UPI'),
(2, 375.00, '2024-06-02', 'Credit Card'),
(3, 1350.00, '2024-06-03', 'Net Banking');

INSERT INTO reviews (book_id, customer_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Life-changing book.', '2024-06-05'),
(2, 2, 4, 'Very inspiring.', '2024-06-06'),
(3, 3, 3, 'Good but overrated.', '2024-06-07');
