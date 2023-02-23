show schemas;

show tables;

SELECT  
	customerShared.customer_id,
    rentalShared.inventory_id,
    paymentShared.payment_id,
    customerShared.first_name, 
    customerShared.last_name,
    customerShared.email,
    addressShared.address,
    addressShared.address2,
    cityShared.city,
    countryShared.country,
    paymentShared.amount,
    paymentShared.payment_date,
    rentalShared.return_date
FROM rentalShared
JOIN paymentShared ON rentalShared.rental_id = paymentShared.rental_id
JOIN customerShared ON paymentShared.customer_id = customerShared.customer_id
JOIN addressShared ON customerShared.address_id = addressShared.address_id
JOIN cityShared ON addressShared.city_id = cityShared.city_id
JOIN countryShared ON countryShared.country_id = cityShared.country_id;
-- ORDER BY rentalShared.inventory_id ASC;

SELECT  
	customerShared.customer_id,
    rentalShared.inventory_id,
    paymentShared.payment_id,
    customerShared.first_name, 
    customerShared.last_name,
    customerShared.email,
    addressShared.address,
    addressShared.address2,
    cityShared.city,
    countryShared.country,
    paymentShared.amount,
    paymentShared.payment_date,
    rentalShared.return_date
FROM rentalShared
JOIN paymentShared ON rentalShared.rental_id = paymentShared.rental_id
JOIN customerShared ON paymentShared.customer_id = customerShared.customer_id
JOIN addressShared ON customerShared.address_id = addressShared.address_id
JOIN cityShared ON addressShared.city_id = cityShared.city_id
JOIN countryShared ON countryShared.country_id = cityShared.country_id
WHERE rentalShared.inventory_id = 2646;

UPDATE paymentShared
SET amount = 10
WHERE payment_id = 2302;