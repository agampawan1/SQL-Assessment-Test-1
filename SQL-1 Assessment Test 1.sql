select * from rental
select * from customer
select * from payment
select * from film


-- 1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.

SELECT customer_id
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;

-- Answer is Customer id-187 and 148

--2. How many films begin with the letter J?
select count(*) from film where title like 'J%';
--Total 20 count of film begin with the letter J

--3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?

SELECT c.customer_id, c.first_name, c.last_name, c.address_id
FROM customer c
INNER JOIN (
  SELECT MAX(customer_id) as max_customer_id
  FROM customer
  WHERE first_name LIKE 'E%' AND address_id < 500
) m
ON c.customer_id = m.max_customer_id;

--Customer_id with 434, first_name Eddie, Last_name Tomlin and address_id  439 has highest customer ID number whith name starts with 'E' and address ID lower than 500.


