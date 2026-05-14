select * from projects.products;
-- Query to categories products based on their price
select ProductID, ProductName, Category, Price,
case 
when Price<50 then 'Low'
when Price between 50 and 200 then 'Medium'
else 'High'
end as pricecategory
from projects.products;
