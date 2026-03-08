--Create Database
Create Database "Online Book Store";

-- Create Tables
Drop Tables if exists Books;

Create Table Books(
	Book_ID	SERIAL 	Primary Key,
	Title VARCHAR (100),	
	Author VARCHAR (100),	
	Genre VARCHAR (50),	
	Published_Year INT,	
	Price Numeric (10,2),	
	Stock INT	
);

Drop Tables if exists Customers;

Create Table Customers(
	Customer_ID	SERIAL Primary Key,
	Name VARCHAR (100),	
	Email VARCHAR (100),	
	Phone VARCHAR (15),	
	City VARCHAR (50),	
	Country VARCHAR (150)	
);

Create Table Orders(
	Order_ID SERIAL Primary Key,
	Customer_ID	INT REFERENCES Customers(Customer_ID),
	Book_ID	INT REFERENCES Books(Book_ID),
	Order_Date Date,
	Quantity INT,
	Total_Amount Numeric (10, 2)
);
----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Retrieve All Different table Data
Select * from Books;
Select * from Customers;
Select * from Orders;

-- Import Data from csv into Books Table
copy Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
from 'D:\Excels Project\PostgreSQL practice\SQL Project\Books.csv'
CSV Header;

-- Import Data from csv into Customers Table
copy Customers(Customer_ID, Name, Email, Phone, City, Country)
from 'D:\Excels Project\PostgreSQL practice\SQL Project\Customers.csv'
CSV Header;

-- Import Data from csv into Orders Table
copy Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
from 'D:\Excels Project\PostgreSQL practice\SQL Project\Orders.csv'
CSV Header;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Retrieve all books in the "Fiction" genre
Select * from books 
where Genre = 'Fiction';

-- Find books published after the year 1950
Select * from books
where published_year > 1950;

-- List all customers from the Canada
Select * from customers
where country = 'Canada';

-- Show orders placed in November 2023
Select * from orders
where order_date Between '2023-11-01' And '2023-11-30';

-- Retrieve the total stock of books available
Select sum(stock) AS Total_Stock from Books;

-- Find the details of the most expensive book
Select * from Books
order by price desc
Limit 1;

-- Show all customers who ordered more than 1 quantity of a book
Select * from orders 
where quantity > 1;

-- Retrieve all orders where the total amount exceeds $20
Select * from orders 
where total_amount > 20;

-- List all genres available in the Books table
Select Distinct(genre) from books;

-- Find the book with the lowest stock
Select * from books
order by stock
Limit 1;

-- Calculate the total revenue generated from all orders
Select Sum(total_amount) AS Total_Revenue from Orders;

--Retrieve All Different table Data
Select * from Books;
Select * from Customers;
Select * from Orders;

-- Retrieve the total number of books sold for each genre
Select b.Genre, SUM(o.Quantity) AS Total_Book_Sold
from books b 
Join Orders o
ON b.book_id = o.book_id
Group by genre;

-- Find the average price of books in the "Fantasy" genre
Select Round(Avg(price),2) AS Avg_Price from Books
where Genre = 'Fantasy';

-- List customers who have placed at least 2 orders
 Select c.name
 from customers c
 Join orders o
 ON c.customer_id = o.customer_id
 Group by c.name
 Having count(o.order_id) >= 2;

-- Find the most frequently ordered book
select o.book_id,b.title
from books b 
JOIN orders o
ON b.book_id = o.book_id
group by o.book_id, b.title
order by count(o.order_id) desc
Limit 1;

-- Show the top 3 most expensive books of 'Fantasy' Genre
Select * from books
where genre = 'Fantasy'
order by price desc
Limit 3;

-- Retrieve the total quantity of books sold by each author
Select b.author, sum(o.quantity)
from orders o
Join books b
ON b.book_id = o.book_id
group by b.author;

-- List the cities where customers who spent over $30 are located
Select Distinct c.city, o.total_amount
from customers c
Join orders o
ON c.customer_id = o.customer_id
where o.total_amount > 30;

-- Find the customer who spent the most on orders
Select  c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
from customers c 
Join orders o
ON c.customer_id = o.customer_id
group by c.customer_id
order by Total_Spent desc
Limit 1;

-- Calculate the stock remaining after fulfilling all orders
Select b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Total_Sold,
(b.stock - COALESCE(SUM(o.quantity),0)) AS Remaining_Stock
from books b 
LEFT JOIN orders o
ON b.book_id = o.book_id
group by b.book_id
order by b.book_id;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Retrieve All Different table Data
Select * from Books;
Select * from Customers;
Select * from Orders;

