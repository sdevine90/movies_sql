
SELECT f.id, f.title, f.price, c.name, c.funds 
FROM customers c
INNER JOIN tickets t
ON t.customer_id = c.id
INNER JOIN films f
ON f.id = t.film_id;

-- SELECT * FROM tickets, customers, films WHERE tickets.customer_id = customers.id

--   #zombies.sql
--   -- First, find out the ID of John.
--   SELECT * FROM zombies WHERE name = 'John';

--   -- We just want the victim_id for our purposes.
--   SELECT victim_id FROM bitings WHERE zombie_id = 1;

--   -- Now we can get the people's names from the person_ids. Note that (2,3) is kind of like an array.
--   SELECT name FROM victims WHERE id IN (1,2);