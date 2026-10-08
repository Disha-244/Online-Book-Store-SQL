-- BASIC QUERIES : 
-- 1. Explore the books dataset
   SELECT * FROM books;

-- 2. Explore the customers dataset
   SELECT * FROM customers;

-- 3. Explore the orders dataset
   SELECT * FROM orders;

-- 4. Retrieve all books in the 'fiction' genre
   SELECT * FROM books
   WHERE genre = 'Fiction';

-- 5. Find books published after the year 1950;
   SELECT * FROM books
   WHERE published_year > 1950;

-- 6. List all customers from Canada
   SELECT * FROM customers
   WHERE country = 'Canada';

-- 7. Show orders placed in November 2023
   SELECT * FROM orders
   WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 8. Retrieve the total stock of books available
   SELECT SUM(stock) AS Total_stock
   FROM books;

-- 9. Find details of most expensive book
   SELECT * FROM books
   ORDER BY price DESC LIMIT 1;

-- 10. Find orders with more than 1 quantity of a book
   SELECT * FROM orders
   WHERE quantity > 1;

-- 11. Retrieve all orders where total amount exceeds $20
   SELECT * FROM orders 
   WHERE total_amount > 20;

-- 12. List all genres available in books table
   SELECT DISTINCT genre 
   FROM books;

-- 13. Find the book with lowest stock
   SELECT * FROM books
   ORDER BY stock ASC;

-- 14. Calculate the total revenue generated from all orders
   SELECT SUM(total_amount) AS Revenue 
   FROM orders;

-- 15. Count the total number of books
   SELECT COUNT(*) AS Total_books
   FROM books;

-- ADVANCED QUERIES : 
-- 16. Total number of books sold for each genre
   SELECT b.genre,SUM(o.quantity) AS total_books_sold
   FROM orders o
   JOIN books b
   ON o.book_id = b.book_id
   GROUP BY b.genre;
-- 17. List customers who have placed atleast 2 orders
   SELECT o.customer_id,c.name,COUNT(o.order_id) AS order_count
   FROM orders o
   JOIN customers c
   ON o.customer_id = c.customer_id
   GROUP BY o.customer_id,c.name
   HAVING COUNT(order_id)>=2;

