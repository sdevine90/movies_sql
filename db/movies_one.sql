DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE films(
ID SERIAL8 primary key,
title VARCHAR(255) NOT NULL,
price INT8
);

CREATE TABLE customers(
ID SERIAL8 primary key,
name VARCHAR(255) NOT NULL,
funds INT8
);

CREATE TABLE tickets(
ID SERIAL8 primary key,
customer_id INT8 references customers(id),
film_id INT8 references films(id)
);

