-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    JoinDate DATE NOT NULL --[cite_start]); [cite: 272-278]
	)
-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL --[cite_start]); [cite: 279-288]
)
-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalOrderAmount DECIMAL(10,2) NOT NULL,
    Price DECIMAL(10,2) NOT NULL, -- Price at the time of sale
    OrderStatus VARCHAR(20) CHECK (OrderStatus IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
) --[cite_start]); [cite: 291-307]

-- Insert Sample Customers
INSERT INTO Customers (Name, JoinDate) VALUES
('Alice Smith', '2023-01-15'),
('Bob Johnson', '2023-02-20'),
('Charlie Brown', '2023-03-05'),
('David Lee', '2023-04-10'),
('Eve Davis', '2023-05-12');

-- Insert Sample Products
INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('16" Laptop', 'Computer', 1200.00, 10),
('Wireless Mouse', 'Computer', 25.00, 50),
('iPhone 15', 'Mobile', 999.00, 20),
('Galaxy S24', 'Mobile', 899.00, 30),
('Mechanical Keyboard', 'Computer', 75.00, 5),  -- Low stock
('4K Monitor', 'Computer', 450.00, 15),
('Desk Lamp', 'Home', 45.00, 100);             -- Never ordered

-- Insert Sample Orders
INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity, Price, TotalOrderAmount, OrderStatus) VALUES
-- High-value orders
(4, 3, '2024-10-01', 3, 999.00, 2997.00, 'Pending'),   -- David, iPhone 15
(2, 3, '2024-05-11', 2, 999.00, 1998.00, 'Shipped'),    -- Bob, iPhone 15
(1, 1, '2024-05-10', 1, 1200.00, 1200.00, 'Delivered'), -- Alice, Laptop
(2, 1, '2024-07-15', 1, 1200.00, 1200.00, 'Delivered'), -- Bob, Laptop

-- Repeat buyers (Alice on iPhone, Eve on Keyboard)
(1, 3, '2024-10-05', 1, 999.00, 999.00, 'Delivered'),  -- Alice, iPhone 15
(1, 3, '2024-10-10', 1, 999.00, 999.00, 'Delivered'),  -- Alice, iPhone 15 (Repeat)

-- Stock < Pending query (Keyboard: Stock 5, Pending 3+4=7)
(5, 5, '2024-11-15', 3, 75.00, 225.00, 'Pending'),    -- Eve, Keyboard
(5, 5, '2024-11-16', 4, 75.00, 300.00, 'Pending'),    -- Eve, Keyboard (Repeat)

-- Cancelled order before 2024
(2, 2, '2023-12-20', 1, 25.00, 25.00, 'Cancelled'),   -- Bob, Mouse

-- Other orders
(1, 2, '2024-05-10', 1, 25.00, 25.00, 'Delivered'),    -- Alice, Mouse
(3, 4, '2024-06-01', 1, 899.00, 899.00, 'Delivered');  -- Charlie, Galaxy S24


--QUERIES

--Question 1: List top 5 highest amount orders with Customer Name & Product Name. [cite: 310]

select top 5 c.Name, p.ProductName, o.TotalOrderAmount
from Orders o
join Customers c
on c.CustomerID = o.CustomerID
join Products p
on p.ProductID = o.ProductID
order by o.TotalOrderAmount DESC

--Question 2: List Products with Category which are never ordered. [cite: 311]

select p.ProductName, p.Category
from Products p
where ProductID not in (select ProductID from Orders)

--Question 3: List Category wise total orders, total ordered quantity and total order amount.

select p.Category, count(o.OrderID), sum(o.Quantity), sum(o.TotalOrderAmount)
from Products p
join Orders o
on p.ProductID = o.ProductID
group by p.Category

--Question 4: List Products with Average Price of "Computer" Category.

select ProductName, (select avg(Price) from Products where Category = 'Computer')
from Products
where Category = 'Computer'

--Question 5: Find Customers who ordered the same product more than once. (repeat buyers)

--Question 6: Which Product is highest selling in terms of quantity?

select top 1 p.ProductName as ProductName, sum(o.Quantity) as TotalQuantitySold
from Orders o
join Products p
on o.ProductID = p.ProductID
group by p.ProductName
order by sum(o.Quantity) desc

--Question 7: Delete those orders which are Cancelled and placed before '2024-01-01'. 
delete Orders
where OrderStatus = 'cancelled' and orderDate < '2024-01-01'

--Question 8: List products whose current stock is less than current pending orders.

select p.ProductName as ProductName, count(p.StockQuantity) as StockQuantity, sum(o.Quantity) as PendingQuantity
from Orders o
join Products p
on o.ProductID = p.ProductID
where o.OrderStatus = 'Pending'
group by p.ProductName
having count(p.StockQuantity) < sum(o.Quantity)

