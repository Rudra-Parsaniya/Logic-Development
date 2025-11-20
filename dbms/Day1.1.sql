-- Create the EMP table
CREATE TABLE EMP (
    EID INT PRIMARY KEY,
    EName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    JoiningDate DATE,
    City VARCHAR(50),
    Gender VARCHAR(10)
);

-- Insert data into the EMP table
INSERT INTO EMP (EID, EName, Department, Salary, JoiningDate, City, Gender)
VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot', 'Male'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad', 'Male'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda', 'Male'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot', 'Female'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar', 'Male'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad', 'Female'),
(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot', 'Female'),
(108, 'Manish', 'IT', 22000, '1990-04-20', 'Baroda', 'Male'),
(109, 'Kavita', 'Admin', 35000, '1992-03-12', 'Ahmedabad', 'Female'),
(110, 'Suresh', 'HR', 28000, '1991-11-05', 'Jamnagar', 'Male'),
(111, 'Pooja', 'IT', 19000, '1991-01-30', 'Rajkot', 'Female'),
(112, 'Amit', 'Admin', 42000, '1990-08-19', 'Baroda', 'Male'),
(113, 'Rekha', 'HR', 31000, '1992-07-02', 'Ahmedabad', 'Female'),
(114, 'Vijay', 'IT', 20000, '1990-06-11', 'Rajkot', 'Male'),
(115, 'Meera', 'Admin', 38000, '1991-10-09', 'Jamnagar', 'Female');

-- Create the SALES_DATA table
CREATE TABLE SALES_DATA (
    Region VARCHAR(50),
    Product VARCHAR(50),
    Sales_Amount INT,
    Year INT
);

-- Insert data into the SALES_DATA table
INSERT INTO SALES_DATA (Region, Product, Sales_Amount, Year)
VALUES
('North America', 'Watch', 1500, 2023),
('Europe', 'Mobile', 1200, 2023),
('Asia', 'Watch', 1800, 2023),
('North America', 'TV', 900, 2024),
('Europe', 'Watch', 2000, 2024),
('Asia', 'Mobile', 1000, 2024),
('North America', 'Mobile', 1600, 2023),
('Europe', 'TV', 1500, 2023),
('Asia', 'TV', 1100, 2024),
('North America', 'Watch', 1700, 2024),
('Asia', 'Watch', 2200, 2024),
('Europe', 'Mobile', 1400, 2024),
('North America', 'TV', 1300, 2023),
('Asia', 'TV', 1000, 2023),
('Europe', 'Watch', 1800, 2023),
('North America', 'Mobile', 1100, 2024),
('Asia', 'Laptop', 3000, 2023),
('Europe', 'Laptop', 3500, 2024),
('North America', 'Laptop', 2800, 2024),
('Asia', 'Mobile', 1300, 2023);


--QUERIES ON EMP TABLE
--Part – A
--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.

select MAX(Salary) as Maximum, MIN(Salary) as Minimum
from EMP

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively. 

select SUM(Salary) as Total_Sal, AVG(Salary) as Average_Sal
from EMP

--3. Find total number of employees of EMPLOYEE table

select COUNT(EID) as Total_Employees 
from EMP

--4. Find highest salary from Rajkot city.

select MAX(Salary) as Max_Salary_Rajkot 
from EMP
where City = 'Rajkot'

--5. Give maximum salary from IT department.

select MAX(Salary) as Max_Salary_IT 
from EMP
where Department = 'IT'

--6. Count employee whose joining date is after 8-Feb-91.

select COUNT(EID) as Employee_Count
from EMP
where JoiningDate > '1991-02-08'

--7. Display average salary of Admin department.

select AVG(Salary) as Max_Salary_Admin 
from EMP
where Department = 'Admin'

--8. Display total salary of HR department. 

select SUM(Salary) as Total_Salary_HR 
from EMP
where Department = 'HR'

--9. Count total number of cities of employee without duplication.

SELECT COUNT(DISTINCT City) AS Unique_cities
FROM EMP;

--10. Count unique departments. 

select count(Distinct Department) as Unique_Departments
from EMP

--11. Give minimum salary of employee who belongs to Ahmedabad.

select MIN(Salary) as Min_Salary_Ahemdabad
from EMP
where City = 'Ahmedabad'

--12. Find city wise highest salary.

select City, MAX(Salary)
from EMP
group by City

--13. Find department wise lowest salary.

select Department, MIN(Salary)
from EMP
group by Department

--14.  Display city with the total number of employees belonging to each city.

select City, Count(EID)
from EMP
group by City

--15. Give total salary of each department of EMP table. 

select Department, SUM(Salary)
from EMP
group by Department

--16. Give average salary of each department of EMP table without displaying the respective department name.

select AVG(Salary)
from EMP
group by Department

--17. Count the number of employees for each department in every city.

select Department, City, COUNT(EID)
from EMP
group by Department,City

--18. Calculate the total salary distributed to male and female employees. 

select Gender, SUM(Salary)
from EMP
group by Gender

--19. Give city wise maximum and minimum salary of female employees

select City, MAX(Salary), MIN(Salary)
from EMP
where Gender = 'Female'
group by City

--20. Calculate department, city, and gender wise average salary. 

select Department, City, Gender, AVG(Salary)
from EMP
group by Department,City,Gender

--Part – B

--1. Count the number of employees living in Rajkot. 

select COUNT(EID) as Rajkot_Employees
from EMP
where City = 'Rajkot'

--2 Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.

select (MAX(Salary) - MIN(Salary)) as Difference
from EMP

--3. Display the total number of employees hired before 1st January, 1991. 

select COUNT(EID) as Hired_Before_1991
from EMP
where JoiningDate <= '1991-01-01'

--Part – C
--1. Count the number of employees living in Rajkot or Baroda.

select COUNT(EID) as Employees_Count
from EMP
where City in ('Rajkot','Baroda')

--2. Display the total number of employees hired before 1st January, 1991 in IT department.

select COUNT(EID) as Employees_Count
from EMP
where JoiningDate <= '1991-01-01' AND Department = 'IT'

--3. Find the Joining Date wise Total Salaries.

select JoiningDate, SUM(Salary) as Total_Salary
from EMP
group by JoiningDate

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.

SELECT 
    Department,
	City,
    MAX(Salary) AS MaxSalary
FROM EMP
WHERE City LIKE 'R%'
GROUP BY City, Department;

--QUERIES ON SALES_DATA TABLE
--Part – A

--1. Display Total Sales Amount by Region.

select Region, SUM(Sales_Amount)
from SALES_DATA
group by Region

--2. Display Average Sales Amount by Product. 

select Product, AVG(Sales_Amount) as Average_Sales
from SALES_DATA
group by Product

--3. Display Maximum Sales Amount by Year. 

select Year, MAX(Sales_Amount) as Max_Sales
from SALES_DATA
group by Year

--4. Display Minimum Sales Amount by Region and Year.

select Region, Year, MIN(Sales_Amount) as Min_Sales
from SALES_DATA
group by Region, Year 

--5. Count of Products Sold by Region.

select Region, COUNT(Product) as Product_Count
from SALES_DATA
group by Region

--6. Display Sales Amount by Year and Product.

select Year, Product, SUM(Sales_Amount) as Total_Sales
from SALES_DATA
group by Product, Year

--7. Display Regions with Total Sales Greater Than 5000.

select Region, SUM(Sales_Amount) as Total_Sales
from SALES_DATA
group by Region
having SUM(Sales_Amount) > 5000

--8. Display Products with Average Sales Less Than 10000.

select Product, AVG(Sales_Amount) as Average_Sales
from SALES_DATA
group by Product
having AVG(Sales_Amount) < 10000

--9. Display Years with Maximum Sales Exceeding 500. 

select Year, MAX(Sales_Amount) as Maximum_Sales
from SALES_DATA
group by Year
having MAX(Sales_Amount) >= 500

--10. Display Regions with at Least 3 Distinct Products Sold.

select Region, count(DISTINCT Product) as Distinct_Product
from SALES_DATA
group by Region
having count(DISTINCT Product) >= 3

--11. Display Years with Minimum Sales Less Than 1000. 

select Year, Min(Sales_Amount)
from  SALES_DATA
group by year
having  Min(Sales_Amount) < 1000

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount. 

select Region, SUM(Sales_Amount) as Total_Sales_2023
from SALES_DATA
where year = '2023'
group by Region
order by SUM(Sales_Amount)

--13. 13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years. 
