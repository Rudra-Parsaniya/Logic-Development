-- Create the DEPT table first, as PERSON depends on it
CREATE TABLE DEPT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

-- Create the PERSON table with a Foreign Key
CREATE TABLE PERSON (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(8, 2) NOT NULL,
    JoiningDate DATE NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES DEPT(DepartmentID)
);

-- Insert data into the DEPT table
INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location)
VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block'),
(6, 'Marketing', 'Mkt', 'F-Block'),
(7, 'Accounts', 'Acc', 'A-Block');

-- Insert data into the PERSON table
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City)
VALUES
(101, 'Rahul Tripathi', 2, 56000.00, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000.00, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000.00, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000.00, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000.00, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000.00, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000.00, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000.00, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500.00, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000.00, '2000-05-25', 'Jamnagar'),
(111, 'Alok Nath', 2, 36000.00, '2003-03-15', 'Ahmedabad'),
(112, 'Seema Jain', 3, 28000.00, '2002-06-18', 'Baroda'),
(113, 'Karan Singh', 1, 41000.00, '2004-11-30', 'Rajkot'),
(114, 'Riya Gupta', 5, 16000.00, '2001-02-12', 'Ahmedabad'),
(115, 'Suresh Patel', 7, 32000.00, '2003-08-20', 'Jamnagar'),
(116, 'Meena Kumari', 7, 30000.00, '2004-01-01', 'Rajkot'),
(117, 'Vikram Batra', NULL, 11000.00, '2005-04-05', 'Baroda');


--Queries: Part – A

--1. Combine information from Person and Department table using cross join or Cartesian product.

SELECT 
    p.PersonID,
    p.PersonName,
    d.DepartmentID,
    d.DepartmentName,
    d.Location
FROM PERSON p
CROSS JOIN DEPT d;

--2. Find all persons with their department name.

SELECT 
    p.PersonName,
    d.DepartmentName
FROM PERSON p
INNER JOIN DEPT d
ON p.DepartmentID = d.DepartmentID;


--3. Find all persons with their department name & code. 

SELECT 
    p.PersonName,
    d.DepartmentName,
	d.DepartmentCode
FROM PERSON p
INNER JOIN DEPT d
ON p.DepartmentID = d.DepartmentID;

--4. Find all persons with their department code and location.

SELECT 
    p.PersonName,
    d.Location,
	d.DepartmentCode
FROM PERSON p
INNER JOIN DEPT d
ON p.DepartmentID = d.DepartmentID;

--5. Find the detail of the person who belongs to Mechanical department.

SELECT 
    p.PersonID,
    p.PersonName,
    d.DepartmentID,
    p.Salary,
    p.JoiningDate,
	p.City
FROM PERSON p
INNER JOIN DEPT d
ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mechanical';

--6. Final person’s name, department code and salary who lives in Ahmedabad city

SELECT 
    p.PersonName,
    d.DepartmentCode,
    p.Salary
FROM PERSON p
INNER JOIN DEPT d
ON p.DepartmentID = d.DepartmentID
WHERE p.City = 'Ahmedabad';

--7. Find the person's name whose department is in C-Block. 


SELECT 
    p.PersonName
FROM PERSON p
INNER JOIN DEPT d
ON p.DepartmentID = d.DepartmentID
WHERE d.Location = 'C-Block';

--8. Retrieve person name, salary & department name who belongs to Jamnagar city.

SELECT 
    p.PersonName,
    d.DepartmentName,
    p.Salary
FROM PERSON p
INNER JOIN DEPT d
ON p.DepartmentID = d.DepartmentID
WHERE p.City = 'Jamnagar';

-- Retrieve person’s detail who joined the Civil department after 1-Aug-2001.

select p.PersonID, p.PersonName, p.DepartmentID, p.Salary, p.JoiningDate, p.City
from PERSON p
Join Dept d
on p.DepartmentID = d.DepartmentID
where DepartmentName = 'Civil' and
JoiningDate > '1-Aug-2001'

--10. Display all the person's name with the department whose joining date difference with the current date is more than 365 days. 

select p.PersonName, d.DepartmentName
from PERSON p
Join Dept d
on p.DepartmentID = d.DepartmentID
where Datediff(day,p.JoiningDate, getdate()) > 365

--11. Find department wise person counts.

select d.DepartmentName, count(PersonID)
from PERSON p
join Dept d
on p.DepartmentID = d.DepartmentID
group by DepartmentName

--12. Give department wise maximum & minimum salary with department name

select d.DepartmentName, max(Salary), min(salary)
from PERSON p
join Dept d
on p.DepartmentID = d.DepartmentID
group by DepartmentName

--13. Find city wise total, average, maximum and minimum salary.

select p.City, max(salary) as MAXIMUM, min(salary) as MINIMUM, avg(salary) as AVERAE, sum(salary) as TOTAL
from PERSON p
group by city

--14. Find the average salary of a person who belongs to Ahmedabad city. 

select avg(salary) as AVG_Ahmedabad
from PERSON p
where city = 'Ahmedabad'


--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department.

select 
p.PersonName + 'lives in' + p.City + 'and works in' + d.DepartmentName + 'Department'
from PERSON p
JOIN DEPT d
on p.DepartmentID = d.DepartmentID


--PART B

--2. Find city & department wise total, average & maximum salaries.

SELECT P.CITY, D.DepartmentName, sum(salary), avg(salary), max(salary)
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
group by City, DepartmentName

--3.  Find all persons who do not belong to any department.

SELECT 
    p.PersonName,
    p.PersonID,
    p.DepartmentID,
    p.JoiningDate,
    p.City
FROM 
    Person p
LEFT JOIN 
    DEPT d ON p.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentID IS NULL;

select * from PERSON
select * from DEPT


--4. Find all departments whose total salary is exceeding 100000.

SELECT d.DepartmentName, SUM(salary)
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
group by DepartmentName
having SUM(salary) > 100000


--Queries: Part – C

--1. List all departments who have no person.

SELECT d.DepartmentName, Count(PersonID)
from DEPT d
LEFT join PERSON P
on p.DepartmentID = d.DepartmentID
group by DepartmentName
having Count(PersonID) = 0

--2. List out department names in which more than two persons are working.

SELECT d.DepartmentName, Count(PersonID)
from DEPT d
LEFT join PERSON P
on p.DepartmentID = d.DepartmentID
group by DepartmentName
having Count(PersonID) > 2

--3. Give a 10% increment in the computer department employee’s salary. (Use Update).

UPDATE PERSON 
set Salary = Salary + 0.1*Salary
from PERSON P
JOIN DEPT d
on p.DepartmentID = d.DepartmentID
where DepartmentName = 'Computer'


---------------------------Advanced SQL Joins----------------------------


-- Part 1: Book & Author Schema

-- Create Author table
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NULL
);

-- Create Publisher table
CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL UNIQUE,
    City VARCHAR(50) NOT NULL
);

-- Create Book table with Foreign Keys
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT NOT NULL,
    PublisherID INT NOT NULL,
    Price DECIMAL(8, 2) NOT NULL,
    PublicationYear INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

-- Insert into Author
INSERT INTO Author (AuthorID, AuthorName, Country)
VALUES
(1, 'Chetan Bhagat', 'India'),
(2, 'Arundhati Roy', 'India'),
(3, 'Amish Tripathi', 'India'),
(4, 'Ruskin Bond', 'India'),
(5, 'Jhumpa Lahiri', 'India'),
(6, 'Paulo Coelho', 'Brazil'),
(7, 'Sudha Murty', 'India'),
(8, 'Vikram Seth', 'India'),
(9, 'Kiran Desai', 'India'); -- Author with no books

-- Insert into Publisher
INSERT INTO Publisher (PublisherID, PublisherName, City)
VALUES
(1, 'Rupa Publications', 'New Delhi'),
(2, 'Penguin India', 'Gurugram'),
(3, 'HarperCollins India', 'Noida'),
(4, 'Aleph Book Company', 'New Delhi'),
(5, 'Westland', 'Chennai');

-- Insert into Book
INSERT INTO Book (BookID, Title, AuthorID, PublisherID, Price, PublicationYear)
VALUES
(101, 'Five Point Someone', 1, 1, 250.00, 2004),
(102, 'The God of Small Things', 2, 2, 350.00, 1997),
(103, 'Immortals of Meluha', 3, 3, 300.00, 2010),
(104, 'The Blue Umbrella', 4, 1, 180.00, 1980),
(105, 'The Lowland', 5, 2, 400.00, 2013),
(106, 'Revolution 2020', 1, 1, 275.00, 2011),
(107, 'Sita: Warrior of Mithila', 3, 3, 320.00, 2017),
(108, 'The Room on the Roof', 4, 4, 200.00, 1956),
(109, 'A Suitable Boy', 8, 2, 600.00, 1993),
(110, 'Scion of Ikshvaku', 3, 5, 350.00, 2015),
(111, 'Wise and Otherwise', 7, 2, 210.00, 2002),
(112, '2 States', 1, 1, 260.00, 2009);

-- Part – A: Book Queries

select b.title, a.AuthorName
from Book b
join Author a
on b.AuthorID = a.AuthorID

--2. List all books with their publishers.

select b.title, p.PublisherName
from Book b
join Publisher p
on b.PublisherID = p.PublisherID

--3. List all books with their authors and publishers.

select b.title, a.AuthorName, p.PublisherName
from Book b
join Author a
on b.AuthorID = a.AuthorID
join Publisher p
on b.PublisherID = p.PublisherID

--4. List all books published after 2010 with their authors and publisher and price

select b.title, a.AuthorName, p.PublisherName, b.Price
from Book b
join Author a
on b.AuthorID = a.AuthorID
join Publisher p
on b.PublisherID = p.PublisherID
where PublicationYear > '2010'

--5. List all authors and the number of books they have written. 

select a.AuthorName , count(b.BookID)
from Author a
join Book b
on b.AuthorID = a.AuthorID
group by a.AuthorName

--6. List all publishers and the total price of books they have published. 

select sum(Price), p.PublisherName
from Publisher p
join Book b
on b.PublisherID = p.PublisherID
group by p.PublisherName

--7. List authors who have not written any books. 

select a.AuthorName , count(b.BookID)
from Author a
left join Book b
on b.AuthorID = a.AuthorID
group by a.AuthorName
having count(b.BookID) = 0


--8. Display total number of Books and Average Price of every Author.

select a.AuthorName , count(b.BookID), AVG(b.Price)
from Author a
left join Book b
on b.AuthorID = a.AuthorID
group by a.AuthorName

--9. lists each publisher along with the total number of books they have published, sorted from highest to lowest. 

select p.PublisherName, count(b.BookID)
from Publisher p
join Book b
on b.PublisherID = p.PublisherID
group by p.PublisherName
order by count(b.BookID) DESC

--10. Display number of books published each year. 

select b.PublicationYear, count(b.BookID)
from Book b
group by b.PublicationYear

--Part – B: Book Queries
--1. List the publishers whose total book prices exceed 500, ordered by the total price.

select  p.PublisherName, sum(Price)
from Publisher p
join Book b
on b.PublisherID = p.PublisherID
group by p.PublisherName
having sum(Price) > 500

--2. List most expensive book for each author, sort it with the highest price. 

select a.AuthorName ,b.Title, max(b.Price)
from Author a
join Book b
on b.AuthorID = a.AuthorID
group by a.AuthorName , b.Title
order by max(b.Price) DESC

--Part – C: Employee & Location Schema
--This final part is a design and query challenge.

--1. Create Table Schema Your first task is to create the database structure. Implement the following 6-table schema. You must define all Primary Key, Foreign Key, and other constraints necessary to make the database functional and maintain data integrity.

--Emp_info(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_info(Did, Dname)
--City_info(Cid, Cname, Did)
--District(Did, Dname, Sid)
--State(Sid, Sname, Cid)
--Country(Cid, Cname)

-- 1. COUNTRY TABLE
CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL UNIQUE
);
--------------------------------------------------------------

-- 2. STATE TABLE (Each state belongs to a country)
CREATE TABLE State (
    StateID INT PRIMARY KEY,
    Sname VARCHAR(100) NOT NULL UNIQUE,
    CountryID INT NOT NULL,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

--------------------------------------------------------------

-- 3. DISTRICT TABLE (Each district belongs to a state)
CREATE TABLE District (
    DistrictID INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL,
    StateID INT NOT NULL,
    FOREIGN KEY (StateID) REFERENCES State(StateID),
    UNIQUE (Dname, StateID)
);

--------------------------------------------------------------

-- 4. DEPARTMENT TABLE
CREATE TABLE Dept_info (
    DeptID INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL UNIQUE
);

--------------------------------------------------------------

-- 5. CITY TABLE (Each city belongs to a district)
CREATE TABLE City_info (
    CityID INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL,
    DistrictID INT NOT NULL,
    FOREIGN KEY (DistrictID) REFERENCES District(DistrictID),
    UNIQUE (Cname, DistrictID)
);
--------------------------------------------------------------

-- 6. EMPLOYEE TABLE (Employee has Department + City)
CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    DeptID INT NOT NULL,
    CityID INT NOT NULL,
    Salary DECIMAL(10,2),
    Experience INT,
    FOREIGN KEY (DeptID) REFERENCES Dept_info(DeptID),
    FOREIGN KEY (CityID) REFERENCES City_info(CityID)
);

-- COUNTRY
INSERT INTO Country (CountryID, Cname) VALUES
(1, 'India'),
(2, 'USA'),
(3, 'Canada'),
(4, 'Australia'),
(5, 'Japan');

-- STATE
INSERT INTO State (StateID, Sname, CountryID) VALUES
(10, 'Gujarat', 1),
(11, 'Maharashtra', 1),
(12, 'California', 2),
(13, 'Ontario', 3),
(14, 'Tokyo Prefecture', 5);

-- DISTRICT
INSERT INTO District (DistrictID, Dname, StateID) VALUES
(100, 'Ahmedabad', 10),
(101, 'Surat', 10),
(102, 'Los Angeles County', 12),
(103, 'Toronto District', 13),
(104, 'Tokyo Central', 14);

-- DEPT_INFO
INSERT INTO Dept_info (DeptID, Dname) VALUES
(201, 'HR'),
(202, 'Finance'),
(203, 'IT'),
(204, 'Marketing'),
(205, 'Production');

-- CITY_INFO
INSERT INTO City_info (CityID, Cname, DistrictID) VALUES
(301, 'Ahmedabad City', 100),
(302, 'Surat City', 101),
(303, 'Los Angeles', 102),
(304, 'Toronto', 103),
(305, 'Chiyoda', 104);

-- EMP_INFO
INSERT INTO Emp_info (Eid, Ename, DeptID, CityID, Salary, Experience) VALUES
(1, 'Ravi Patel', 201, 301, 50000, 5),
(2, 'Amit Shah', 203, 301, 60000, 4),
(3, 'John Smith', 204, 303, 75000, 6),
(4, 'Emma Johnson', 202, 304, 85000, 7),
(5, 'Kenji Sato', 205, 305, 90000, 8);
