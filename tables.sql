CREATE DATABASE IF NOT EXISTS Ecommerce;

USE Ecommerce;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    active BOOLEAN 
);

CREATE TABLE payment_methods (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10) NOT NULL,
    name VARCHAR(10) NOT NULL,
    active BOOLEAN
);

CREATE TABLE countries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code_country VARCHAR(3) NOT NULL,
    country VARCHAR(100)
);

CREATE TABLE cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100),
    zip_code INT,
    countries_id INT NOT NULL,
    Foreign Key (countries_id ) REFERENCES countries(id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(200) NOT NULL,
    document_type VARCHAR(50),
    document_number VARCHAR(40),
    phone VARCHAR(20),
    cities_id INT NOT NULL,
    user_type ENUM("client", "seller") NOT NULL,
    register_date DATE,
    active BOOLEAN,
    address VARCHAR(250),
    Foreign Key (cities_id) REFERENCES cities(id)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(500) NOT NULL,
    price DOUBLE NOT NULL,
    stock INT,
    category_id INT NOT NULL,
    brand VARCHAR(100),
    product_Condition VARCHAR(50),
    vat DOUBLE,
    active BOOLEAN,
    Foreign Key (category_id) REFERENCES categories(id)
);

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reference INT NOT NULL,
    date DATE NOT NULL,
    payment_method_id INT NOT NULL,
    client_id INT NOT NULL,
    seller_id INT NOT NULL,
    Foreign Key (payment_method_id) REFERENCES payment_methods(id),
    Foreign Key (client_id) REFERENCES users(id),
    Foreign Key (seller_id) REFERENCES users(id)
);

CREATE TABLE sale_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DOUBLE NOT NULL,
    sale_id INT NOT NULL,
    Foreign Key (product_id) REFERENCES products(id),
    Foreign Key (sale_id) REFERENCES sales(id)
);