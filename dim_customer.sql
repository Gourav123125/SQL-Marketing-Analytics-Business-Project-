use projects;
select * from projects.customers;
select * from projects.geography;
-- query to enrich customer data with geographical info
select CustomerID, CustomerName, Email, Gender, Age, Country, City
from customers left join geography on customers.geographyID=geography.geographyID;
 
