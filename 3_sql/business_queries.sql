-- Q1). What is the total revenue genearted by male vs. female customers?
SELECT 
gender,
SUM(purchase_amount) AS revenue
FROM customer
GROUP BY 1;

-- Q2) Which customers used a discount but still spent more than the average purchase amount?
SELECT
customer_id,
purchase_amount,
(SELECT avg(purchase_amount) FROM customer) AS avg_purchase_amount
FROM customer
WHERE discount_applied = 'Yes'
AND purchase_amount > (SELECT avg(purchase_amount) FROM customer)
;

-- Q3) Which are the top 5 products with the highest average review rating?
SELECT 
item_purchased as product,
ROUND(AVG(review_rating),2) AS avg_product_rating
FROM customer
GROUP BY item_purchased
ORDER BY 2 DESC
LIMIT 5
;

-- Q4). Compare the average Purchase Amounts between Standard and Express Shipping.
SELECT 
shipping_type,
ROUND(AVG(purchase_amount),2) AS avg_purchase_amount
FROM customer
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY 1
ORDER BY 2 DESC
;

-- Q5). Do subscribed customers spend more? Compare average spend and total revenue between subscribers vs non-subscribers
SELECT 
CASE WHEN subscription_status = 'Yes' THEN 'Subcribers'
     WHEN subscription_status = 'NO' THEN 'Non-Subscribers'
     END AS subscription_status,
SUM(purchase_amount) AS total_purchase_amount,
ROUND(AVG(purchase_amount),2) AS avg_purchase_amount
FROM customer
GROUP BY 1
ORDER BY 3 DESC
;

-- Q6). Which 5 products have the highest percentage of purchases with discounts applied?
SELECT 
item_purchased AS product,
ROUND(SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) * 100/ COUNT(*),2) AS discount_percentage
FROM customer
GROUP BY 1
ORDER BY discount_percentage DESC
LIMIT 5
;


-- Q7). Segment customers into New, Returning, and Loyal based on their total number of previous purchase, and show the count of each segment.
SELECT
CASE WHEN previous_purchases < 5 THEN 'New'
     WHEN previous_purchases BETWEEN 5 AND 10 THEN 'Returning'
     WHEN previous_purchases > 10 THEN 'Loyal'
     ELSE 'Unknown' END AS customer_segment,
COUNT(DISTINCT customer_id) AS num_customers
FROM customer
GROUP BY customer_segment
ORDER BY 1
;

-- Q8). What are the top 3 most purchased products within each category?
WITH CTE AS(
	SELECT 
	item_purchased AS product,
	category,
    COUNT(*) AS total_orders,
	DENSE_RANK() OVER(PARTITION BY category ORDER BY COUNT(item_purchased) DESC) AS rnk
	FROM customer
	GROUP BY 1, 2
)
SELECT 
product,
category,
total_orders,
rnk
FROM CTE
WHERE rnk <= 3
ORDER BY category, rnk;


-- Q9) Are customers who are repeat buyers (more than 5 previous purchases) also likely to subscribe?
SELECT 
CASE WHEN subscription_status = 'Yes' THEN 'subscribers'
		   WHEN subscription_status = 'No' THEN 'non_subscribers'
           END AS customer_type,
COUNT(DISTINCT customer_id) AS customer_count
FROM customer
WHERE previous_purchases > 5
GROUP BY 1;


-- Q10) What is the revenue contribution of each age group?
SELECT 
age_group,
SUM(purchase_amount) AS revnue,
ROUND(SUM(purchase_amount) * 100/ (SELECT SUM(purchase_amount) FROM customer), 2) AS perc_of_contribution
FROM customer
GROUP BY age_group
ORDER BY perc_of_contribution DESC
;