-- BASIC QUERIES

-- 1)	Retrieve all books in the "Fiction" genre
SELECT *
FROM Books
WHERE Genre = 'Fiction';

-- 2)	Find books published after the year 1950
SELECT * 
FROM Books
WHERE Published_Year > 1950;

-- 3)	List all customers from the Canada.
SELECT * 
FROM Customers
WHERE Country = 'Canada';

-- 4)	Show orders placed in November 2023.
SELECT * 
FROM Orders
WHERE Order_Date BETWEEN '2023-09-01' AND '2023-09-30';

-- 5)	Retrieve the total stock of books available.
SELECT SUM(Stock) AS total_stock
FROM Books;

-- 6)	Find the details of the most expensive book.
SELECT TOP 1 *
FROM Books
ORDER BY Price DESC;

-- 7)	Show all customers who ordered more than 1 quantity of a book.
SELECT *
FROM Orders
WHERE Quantity > 1;

-- 8)	Retrieve all orders where the total amount exceeds $20.
SELECT *
FROM Orders
WHERE Total_Amount > 20;

-- 9)	List all genres available in the Books table.
SELECT DISTINCT Genre
FROM Books;

-- 10)	Find the book with the lowest stock.
SELECT TOP 1 *
FROM Books
ORDER BY Stock ASC;

-- 11)	Calculate the total revenue generated from all orders.
SELECT ROUND(SUM(Total_Amount),2)
FROM Orders;


-- ADVANCED QUERIES
-- 1)	Retrieve the total number of books sold for each genre.
SELECT b.Genre,SUM(o.Quantity) AS total_sold_book
FROM Books AS b
JOIN Orders AS o
ON b.Book_Id  = o.Book_Id
GROUP BY b.Genre;

-- 2)	Find the average price of books in the "Fantasy" genre.
SELECT AVG(Price) AS average_books
FROM Books
WHERE Genre = 'Fantasy';

-- 3)	List customers who have placed at least 2 orders.
SELECT c.Name,COUNT(c.Customer_ID)
FROM Customers AS c
INNER JOIN Orders AS o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
HAVING COUNT(c.Customer_ID) >= 2;

-- 4)	Show the top 3 most expensive books of 'Fantasy' Genre.
SELECT TOP 3  *
FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC;

-- 5)	Retrieve the total quantity of books sold by each author.
SELECT b.Author,SUM(o.Quantity) AS sum_of_quantity
FROM Books AS b
JOIN Orders AS o
ON b.Book_ID = o.Book_ID
GROUP BY b.Author ;

-- 6)	List the cities where customers who spent over $30 are located.
SELECT c.City,o.Total_Amount
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Total_Amount > 30
ORDER BY o.Total_Amount DESC;

-- 7)	Find the customer who spent the most on orders.
SELECT TOP 1 c.NAME,ROUND(SUM(o.Total_Amount),2) 
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY SUM(o.Total_Amount) DESC;












