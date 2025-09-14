SELECT*FROM shopping_trends.sales.transactions
LIMIT 5;


SELECT DISTINCT LOCATION
FROM shopping_trends.sales.transactions;

SELECT DISTINCT CATEGORY
FROM shopping_trends.sales.transactions;

SELECT DISTINCT ITEM_PURCHASED
FROM shopping_trends.sales.transactions;

SELECT MAX(Age)
FROM shopping_trends.sales.transactions;

SELECT MIN(Age)
FROM shopping_trends.sales.transactions;

SELECT MAX("Purchase Amount (USD)")
FROM shopping_trends.sales.transactions;

SELECT MIN("Purchase Amount (USD)")
FROM shopping_trends.sales.transactions;

SELECT MAX(Review_rating)
FROM shopping_trends.sales.transactions;

SELECT MIN(Review_rating)
FROM shopping_trends.sales.transactions;


SELECT MAX(PREVIOUS_PURCHASES)
FROM shopping_trends.sales.transactions;

SELECT MIN(PREVIOUS_PURCHASES)
FROM shopping_trends.sales.transactions;

SELECT to_date(processdate) AS purchase_date,
dayname(to_date(processdate)) AS day_name,
monthname(to_date(processdate)) AS month_name,
dayofmonth(to_date(processdate)) AS day_of_the_month,
to_char(processdate,'YYYY MM') As month_id,


SUM("Purchase Amount (USD)") AS revenue,
COUNT(DISTINCT customer_id) AS number_of_customers,

SUBSCRIPTION_STATUS,
SHIPPING_TYPE,
DISCOUNT_APPLIED,
PROMO_CODE_USED,
PAYMENT_METHOD,
FREQUENCY_OF_PURCHASES,
SEASON,
LOCATION,
CATEGORY,
LOCATION,
ITEM_PURCHASED,
COLOR,

CASE
 WHEN age BETWEEN 18 AND 30 THEN 'Youth'
 WHEN age BETWEEN 31 AND 40 THEN 'Adult'
 WHEN age BETWEEN 41 AND 50 THEN 'Senior'
 ELSE 'Elder'
END AS age_buckets,

CASE
    WHEN previous_purchases BETWEEN 1 AND 15 THEN '01. Low buy'
    WHEN previous_purchases BETWEEN 15 AND 35 THEN '02. Medium buy'
    ELSE '03. Good buy'
END AS Previous_purchase_buckets,

CASE
    WHEN Review_rating BETWEEN 2.5 AND 3.0 THEN '01. Bad'
    WHEN Review_rating BETWEEN 3.1 AND 4.0 THEN '02. Almost good'
    ELSE '03. Good'
END AS Review_buckets,

 CASE
       WHEN "Purchase Amount (USD)" BETWEEN 20 AND 30 THEN '01. Low spend'
       WHEN "Purchase Amount (USD)" BETWEEN 31 AND 40 THEN '02. Medium spend'
       WHEN "Purchase Amount (USD)" BETWEEN 41 AND 50 THEN '03. High spend'
       ELSE '04. Very high spend'
END AS Spend_buckets

FROM shopping_trends.sales.transactions

GROUP BY ALL;
