-- 1. Pull list of first name, last name and email of all our customers.

/*-- Approach:
-- First thing is locate in which table you can find relevant data.
    -- What all information has been asked for.
*/ 
    
select
	first_name,
    last_name,
    email
   from customer; 


 -- 2. Pull the first name , last name , store they are working in and email of all our staff.
 
 /*
    -- First identify in which table your data is present.
    -- what column you need to provide.
*/

select
	first_name,
    last_name,
    store_id,
    email
    from staff;
	

-- 2. Distinct  
-- Find out how types of ratings we have in our inventory for films. 
-- list down all the available ratings.


select
	count( distinct rating)
	from film;

select
	distinct rating
	from film;


-- Find out the no. of unique staff who are renting out movies.

select
	distinct staff_id
    from rental;


-- Question
-- can you pull up the records of our films and see if there are any other rental duration apart from 6,5,7,3 days.

select
	distinct rental_duration
    from film 
		where rental_duration not in (6,5,7,3); 

select
	distinct rental_duration
    from film;

-- Question.
-- Find out how many transactions/payment made where value is 0.99$
-- pull up records of customer_id, rental_id, amount, payment_date.

select
	count(*)
		from payment
			where amount = 0.99;

select
	customer_id,
    rental_id,
    amount,
    payment_date
		from payment
			where amount = 0.99;
            

-- Question 
-- Pull up the same records as above of transcation made after 1st of january 2006.

select
	customer_id,
    rental_id,
    amount,
    payment_date
		from payment
			where amount = 0.99
				and payment_date > '2006-01-01';
-- 'yyyy-mm-dd'


-- Question
-- I'd like to look at payment records of our long-term customers to learn about their purchase patterns.
-- Could you pull all payments from our first 100 customers (based on customer Id) ?


select
	customer_id,
    rental_id,
    amount,
    payment_date
		from payment
			where customer_id <= 100;
            
select
	customer_id,
    rental_id,
    amount,
    payment_date
		from payment
			where customer_id between 1 and 100;






