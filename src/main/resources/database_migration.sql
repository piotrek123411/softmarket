-- create database IF NOT EXISTS softmarket

CREATE TABLE IF NOT EXISTS Users (
                       id INT PRIMARY KEY,
                       name VARCHAR(255),
                       email VARCHAR(255) UNIQUE,
                       password VARCHAR(255),
                       role VARCHAR(20) CHECK (role IN ('SELLER', 'BUYER', 'ADMIN'))
);

CREATE TABLE IF NOT EXISTS Products (
                          id INT PRIMARY KEY,
                          name VARCHAR(255),
                          description TEXT,
                          price DECIMAL(10, 2),
                          quantity INT
);

CREATE TABLE IF NOT EXISTS Orders (
                        id INT PRIMARY KEY,
                        created_at TIMESTAMP,
                        status VARCHAR(20) CHECK (status IN ('PENDING', 'COMPLETED', 'CANCELLED')),
                        seller_id INT REFERENCES Users(id),
                        buyer_id INT REFERENCES Users(id),
                        product_id INT REFERENCES Products(id)
);

CREATE TABLE IF NOT EXISTS Discounts (
                           id INT PRIMARY KEY,
                           name VARCHAR(255),
                           percentage INT,
                           expiry_date DATE
);

CREATE TABLE IF NOT EXISTS CreditCards (
                             id INT PRIMARY KEY,
                             card_number VARCHAR(20),
                             card_holder_name VARCHAR(255),
                             expiry_date DATE,
                             cvv VARCHAR(5)
);