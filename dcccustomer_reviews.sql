SELECT * FROM projects.customer_reviews;
-- Query to remove whitespace issue from the reviews
use projects;
select ReviewID, CustomerID, ProductID, ReviewDate, Rating,
replace(ReviewText,'  ',' ') as ReviewText
from projects.customer_reviews;