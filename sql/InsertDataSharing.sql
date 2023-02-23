INSERT INTO countryShared
SELECT country_id, country, last_update
FROM country;

INSERT INTO cityShared
SELECT city_id, city, country_id, last_update
FROM city
WHERE country_id =
(
	SELECT country_id
	FROM country 
    WHERE country = 'United Kingdom'
);

INSERT addressShared
SELECT address_id, address, address2, district, city_id, postal_code, phone, last_update
FROM address 
WHERE city_id IN
( 
	SELECT city_id
	FROM city
    JOIN country ON country.country_id = city.country_id
	WHERE country = 'United Kingdom'
);

INSERT INTO customerShared
SELECT customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update
FROM customer
WHERE address_id IN
(
	SELECT address_id
	FROM address
    JOIN city ON address.city_id = city.city_id
    JOIN country ON country.country_id = city.country_id
	WHERE country = 'United Kingdom'
);

INSERT INTO paymentShared
SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
FROM payment
WHERE customer_id IN
(
	SELECT customer_id
	FROM customer
    JOIN address ON address.address_id = customer.address_id
    JOIN city ON address.city_id = city.city_id
    JOIN country ON country.country_id = city.country_id
	WHERE country = 'United Kingdom'
);

INSERT INTO rentalShared
SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
FROM rental
WHERE customer_id IN
(
	SELECT customer_id
	FROM customer
    JOIN address ON address.address_id = customer.address_id
    JOIN city ON address.city_id = city.city_id
    JOIN country ON country.country_id = city.country_id
	WHERE country = 'United Kingdom'
);
