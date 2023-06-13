
#List the number of films per category.

select f.category_id, sum(film_id) from sakila.film_category f
left join sakila.category c
on f.category_id = c.category_id
group by f.category_id;

#Display the first and the last names, as well as the address, of each staff member.

select s.staff_id, s.first_name, s.last_name, a.address from staff s
left join address a
on s.address_id = a.address_id;

#Display the total amount rung up by each staff member in August 2005.

select * from rental;
select staff_id, sum(rental_id) from rental
where month(rental_date) = 8 and year(rental_date) = 2005
group by staff_id;

#List all films and the number of actors who are listed for each film.

select f.film_id,f.title, sum(a.actor_id) from film f
join film_actor fa
on f.film_id = fa.film_id
join actor a
on fa.actor_id = a.actor_id
group by f.film_id;

# Using the payment and the customer tables as well as the JOIN command, 
# list the total amount paid by each customer. List the customers alphabetically by their last names.

select c.customer_id, c.first_name, c.last_name, sum(p.amount) total_payment from customer c
left join payment p 
on c.customer_id = p.customer_id
group by customer_id
order by c.last_name asc;