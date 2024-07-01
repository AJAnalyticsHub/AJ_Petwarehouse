CREATE DATABASE IF NOT EXISTS AJ_PetWarehouse;

-- ---------------------------------------------------------
-- ------------- CREATING TABLES  --------------------------

CREATE TABLE IF NOT EXISTS products(
product_cat_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_category VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS customers(
customer_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
business_name VARCHAR(200) NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(200),
address VARCHAR(200) NOT NULL,
city VARCHAR(200) NOT NULL,
postcode VARCHAR(200) NOT NULL,
telephone VARCHAR(20),
latitude DEC(5,4) NOT NULL,
longitude DEC(5,4) NOT NULL
);

CREATE TABLE IF NOT EXISTS suppliers(
supplier_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
business_name VARCHAR(200) NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(200),
address VARCHAR(200) NOT NULL,
city VARCHAR(200) NOT NULL,
postcode VARCHAR(200) NOT NULL,
telephone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS pet_size(
pet_size_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
pet_size VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS pet_type(
pet_type_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
pet_type VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS sales(
sales_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_id int NOT NULL,
product_cat_id int NOT NULL,
sales int NOT NULL,
price int NOT NULL,
vet_approval VARCHAR(3) NOT NULL,
customer_id int NOT NULL,
supplier_id int NOT NULL,
pet_size_id int,
pet_type_id int,
rating int,
re_buy VARCHAR(3),
FOREIGN KEY(product_cat_id) 
REFERENCES products(product_cat_id),
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id),
FOREIGN KEY(supplier_id)
REFERENCES suppliers(supplier_id),
FOREIGN KEY(pet_size_id)
REFERENCES pet_size(pet_size_id),
FOREIGN KEY (pet_type_id)
REFERENCES pet_type(pet_type_id)
);

-- --------------------------------------------------------------------------------------
-- -- Original Dataset Had Few Unique Values For Products, Pet Size and Pet Type --------

INSERT INTO products (product_category) VALUES
('Equipment'),
('Toys'),
('Snacks'),
('Supplements'),
('Bedding'),
('Medicine'),
('Housing'),
('Food'),
('Clothes'),
('Accessories'),
('Grooming');

INSERT INTO pet_size (pet_size) VALUES
('extra-small'),
('small'),
('medium'),
('large'),
('extra-large');

INSERT INTO pet_type (pet_type) VALUES
('bird'),
('cat'),
('dog'),
('fish'),
('hamster'),
('rabbit');

-- -----------------------------------------------------------------------------------
-- ---- Other Values Added With The Data Import Wizard Tool And Custom CSV Files -----