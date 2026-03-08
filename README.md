# Online Book Store Database Analysis (SQL)

A comprehensive SQL project focused on building and analyzing a relational database for an Online Book Store. This project demonstrates database schema design, data importation, and complex query execution to derive business insights.

## 📝 Project Overview
This project involves creating a structured database system to manage books, customers, and sales orders. It includes various SQL techniques to answer business-critical questions, such as tracking stock levels, identifying top customers, and analyzing sales performance by genre and author.

## 🚀 Key Features
- **Relational Schema Design:** Created structured tables for `Books`, `Customers`, and `Orders` with defined Primary and Foreign keys.
- **Data Importation:** Efficiently imported large datasets from CSV files into PostgreSQL.
- **Advanced Querying:** Solved real-world business problems using JOINS, Aggregations.
- **Inventory Management:** Queries to calculate remaining stock after fulfilling orders.
- **Sales Analytics:** Identified top-selling authors, expensive genres, and high-value customers.

## 🛠️ Tools & Technologies Used
- **PostgreSQL:** Used for database creation and management.
- **SQL (Structured Query Language):** Core language used for DDL (Data Definition) and DML (Data Manipulation).
- **Data Analysis:** Applied logical functions (COALESCE, SUM, COUNT, GROUP BY) for reporting.

## 📂 Database Schema
The project consists of three main tables:
1. **Books:** Details like Book_ID, Title, Author, Genre, Price, and Stock.
2. **Customers:** Information on Name, Email, and City.
3. **Orders:** Links customers and books with Order_Date, Quantity, and Total_Amount.



## 📊 Key Insights Extracted
- Identified the **top 3 most expensive books** in the 'Fantasy' genre.
- Listed **cities** where customers spent over $30.
- Calculated the **total quantity of books sold** per author.
- Found the **most popular book** based on order frequency.
- Calculated **remaining stock** dynamically by subtracting sold units from initial inventory.

## 📂 File Description
- `SQL Queries.sql`: Contains the complete SQL script—from database creation to final analysis queries.

## 💡 How to Use
1. Install **PostgreSQL** or any SQL editor (like pgAdmin).
2. Create a database named `Online Book Store`.
3. Run the script provided in `SQL Queries.sql` to generate tables.
4. (Optional) Import your CSV data using the `COPY` command included in the script.
