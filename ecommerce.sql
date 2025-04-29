create database ecommercedb;
use ecommercedb;

-- 1. Brand
CREATE TABLE brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Product Category
CREATE TABLE product_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Color
CREATE TABLE color (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    hex_value VARCHAR(7) NOT NULL
);

-- 4. Size Category
CREATE TABLE size_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 5. Size Option (needs size_category)
CREATE TABLE size_option (
    id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    name VARCHAR(50) NOT NULL,
    sort_order INT,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

-- 6. Attribute Category
CREATE TABLE attribute_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- 7. Attribute Type (needs attribute_category)
CREATE TABLE attribute_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES attribute_category(id)
);

-- 8. Product (needs brand, product_category)
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- 9. Product Image (needs product)
CREATE TABLE product_image (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(500) NOT NULL,
    alt_text VARCHAR(255),
    is_primary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- 10. Product Attribute (needs product, attribute_type)
CREATE TABLE product_attribute (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_type_id INT,
    name VARCHAR(255) NOT NULL,
    value TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);

-- 11. Product Variation (needs product, color, size_option)
CREATE TABLE product_variation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color_id INT,
    size_option_id INT,
    sku VARCHAR(255) UNIQUE,
    additional_price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);

-- 12. Product Item (needs product_variation)
CREATE TABLE product_item (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_variation_id INT,
    stock_quantity INT DEFAULT 0,
    price DECIMAL(10,2) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(id)
);



-- Adding Product Data 

-- Insert Brands
INSERT INTO brand (name, description) VALUES ('Fashion Co', 'Trendy clothing brand');

-- Insert Product Categories
INSERT INTO product_category (name, description) VALUES ('Clothing', 'Apparel and fashion');

-- Insert Product
INSERT INTO product (name, brand_id, category_id, base_price, description)
VALUES ('Basic T-Shirt', 1, 1, 19.99, 'High-quality cotton T-shirt');

-- Insert Colors
INSERT INTO color (name, hex_value) VALUES ('Red', '#FF0000'), ('Blue', '#0000FF');

-- Insert Size Category
INSERT INTO size_category (name, description) VALUES ('Clothing Sizes', 'Standard clothing sizes');

-- Insert Size Options
INSERT INTO size_option (size_category_id, name, sort_order)
VALUES (1, 'M', 2), (1, 'L', 3);

-- Insert Product Variations
-- Red, M
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price)
VALUES (1, 1, 1, 'TSHIRT-RED-M', 0.00);

-- Red, L
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price)
VALUES (1, 1, 2, 'TSHIRT-RED-L', 0.00);

-- Blue, M
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price)
VALUES (1, 2, 1, 'TSHIRT-BLUE-M', 0.00);

-- Blue, L
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price)
VALUES (1, 2, 2, 'TSHIRT-BLUE-L', 0.00);

-- Insert Product Items (stock and price)
INSERT INTO product_item (product_variation_id, stock_quantity, price)
VALUES 
(1, 50, 19.99),
(2, 30, 19.99),
(3, 40, 19.99),
(4, 25, 19.99);


-- More Product Data

-- Brands
INSERT INTO brand (name, description) VALUES
('Nike', 'Global brand for sneakers and sportswear'),
('Adidas', 'Another global sportswear brand'),
('Zara', 'Trendy fashion for men and women'),
('Levi\'s', 'Denim specialists - jeans experts'),
('Local Ankara', 'Authentic African Ankara styles'),
('Burberry', 'Luxury trench coats and fashion');

-- Product Categories
INSERT INTO product_category (name, description) VALUES
('Footwear', 'Shoes, sneakers, heels, and more'),
('Clothing', 'Dresses, pants, tops, coats');

-- Products
INSERT INTO product (name, brand_id, category_id, base_price, description) VALUES
('Air Max Sneakers', 1, 1, 120.00, 'Popular Nike Air Max sneakers'),
('Classic Heels', 3, 1, 85.00, 'Elegant high heels for formal occasions'),
('Summer Dresses', 3, 2, 60.00, 'Light, colorful dresses for summer'),
('Cargo Pants', 2, 2, 50.00, 'Utility cargo pants with multiple pockets'),
('Ladies Jeans', 4, 2, 70.00, 'Stylish fitted jeans for women'),
('Men\'s Jeans', 4, 2, 75.00, 'Classic Levi\'s jeans for men'),
('Ankara Tops', 5, 2, 45.00, 'Vibrant Ankara printed tops'),
('Trench Coats', 6, 2, 200.00, 'Iconic Burberry trench coats');

-- Colors
INSERT INTO color (name, hex_value) VALUES
('Black', '#000000'),
('White', '#FFFFFF'),
('Red', '#FF0000'),
('Blue', '#0000FF'),
('Beige', '#F5F5DC');

-- Size Categories
INSERT INTO size_category (name, description) VALUES
('Footwear Sizes', 'Standard shoe sizes'),
('Clothing Sizes', 'Standard clothing sizes');

-- Size Options
-- Footwear sizes
INSERT INTO size_option (size_category_id, name, sort_order) VALUES
(1, '7', 1), (1, '8', 2), (1, '9', 3), (1, '10', 4), (1, '11', 5);

-- Clothing sizes
INSERT INTO size_option (size_category_id, name, sort_order) VALUES
(2, 'S', 1), (2, 'M', 2), (2, 'L', 3), (2, 'XL', 4);

-- Variations for Sneakers
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price) VALUES
(1, 1, 1, 'AIRMAX-BLACK-7', 0),
(1, 1, 2, 'AIRMAX-BLACK-8', 0),
(1, 2, 3, 'AIRMAX-WHITE-9', 0);

-- Variations for Heels
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price) VALUES
(2, 1, 2, 'HEELS-BLACK-8', 0),
(2, 3, 2, 'HEELS-RED-8', 5.00);

-- Variations for Dresses
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price) VALUES
(3, 4, 2, 'DRESS-BLUE-M', 0),
(3, 3, 3, 'DRESS-RED-L', 0);

-- Variations for Cargo Pants
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price) VALUES
(4, 1, 3, 'CARGO-BLACK-L', 0),
(4, 4, 2, 'CARGO-BLUE-M', 0);

-- Variations for Ladies Jeans
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price) VALUES
(5, 1, 2, 'LADIESJEANS-BLACK-M', 0);

-- Variations for Men's Jeans
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price) VALUES
(6, 1, 3, 'MENSJEANS-BLACK-L', 0);

-- Variations for Ankara Tops
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price) VALUES
(7, 3, 2, 'ANKARATOP-RED-M', 0),
(7, 4, 1, 'ANKARATOP-BLUE-S', 0);

-- Variations for Trench Coats
INSERT INTO product_variation (product_id, color_id, size_option_id, sku, additional_price) VALUES
(8, 5, 3, 'TRENCH-BEIGE-L', 0);

-- Stock for product items
INSERT INTO product_item (product_variation_id, stock_quantity, price) VALUES
(1, 20, 120.00),
(2, 15, 120.00),
(3, 10, 120.00),
(4, 8, 85.00),
(5, 5, 90.00),
(6, 12, 60.00),
(7, 10, 60.00),
(8, 18, 50.00),
(9, 14, 50.00),
(10, 22, 70.00),
(11, 16, 75.00),
(12, 9, 45.00),
(13, 7, 45.00),
(14, 6, 200.00);


-- Add customers and orders tables
CREATE TABLE customers (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    shipping_address TEXT,
    billing_address TEXT
);
CREATE TABLE orders (
    id INT PRIMARY KEY,
    order_number VARCHAR(50) UNIQUE,
    customer_id INT,  -- This references the customers table
    order_date TIMESTAMP,
    total_amount DECIMAL(10, 2),
    order_status VARCHAR(50),
    shipping_status VARCHAR(50),
    payment_status VARCHAR(50),
    discount_amount DECIMAL(10, 2),
    delivery_instructions TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);


-- Update product table to include number of items in stock 
ALTER TABLE product
ADD COLUMN stock_quantity INT DEFAULT 0;  -- Default to 0, can be updated as inventory changes



-- Adding Product images 
-- Sneakers
INSERT INTO product_image (product_id, image_url, alt_text, is_primary) VALUES
(1, 'https://images.pexels.com/photos/123456/pexels-photo-123456.jpeg', 'Stylish sneakers for men', TRUE),
(1, 'https://images.pexels.com/photos/654321/pexels-photo-654321.jpeg', 'Side view of trendy sneakers', FALSE);

-- Heels
INSERT INTO product_image (product_id, image_url, alt_text, is_primary) VALUES
(2, 'https://images.pexels.com/photos/789012/pexels-photo-789012.jpeg', 'Elegant high heels for women', TRUE),
(2, 'https://images.pexels.com/photos/345678/pexels-photo-345678.jpeg', 'Close-up of fashionable heels', FALSE);

-- Dresses
INSERT INTO product_image (product_id, image_url, alt_text, is_primary) VALUES
(3, 'https://images.pexels.com/photos/901234/pexels-photo-901234.jpeg', 'Beautiful summer dress', TRUE),
(3, 'https://images.pexels.com/photos/567890/pexels-photo-567890.jpeg', 'Back view of elegant dress', FALSE);

-- Cargo Pants
INSERT INTO product_image (product_id, image_url, alt_text, is_primary) VALUES
(4, 'https://images.pexels.com/photos/234567/pexels-photo-234567.jpeg', 'Comfortable cargo pants for men', TRUE),
(4, 'https://images.pexels.com/photos/890123/pexels-photo-890123.jpeg', 'Stylish cargo pants with pockets', FALSE);

-- Ladies Jeans
INSERT INTO product_image (product_id, image_url, alt_text, is_primary) VALUES
(5, 'https://images.pexels.com/photos/345678/pexels-photo-345678.jpeg', 'Slim fit ladies jeans', TRUE),
(5, 'https://images.pexels.com/photos/901234/pexels-photo-901234.jpeg', 'Casual ladies jeans outfit', FALSE);

-- Men's Jeans
INSERT INTO product_image (product_id, image_url, alt_text, is_primary) VALUES
(6, 'https://images.pexels.com/photos/456789/pexels-photo-456789.jpeg', 'Classic men\'s jeans', TRUE),
(6, 'https://images.pexels.com/photos/234567/pexels-photo-234567.jpeg', 'Men\'s jeans with a modern fit', FALSE);

-- Ankara Tops
INSERT INTO product_image (product_id, image_url, alt_text, is_primary) VALUES
(7, 'https://images.pexels.com/photos/567890/pexels-photo-567890.jpeg', 'Vibrant Ankara top for women', TRUE),
(7, 'https://images.pexels.com/photos/678901/pexels-photo-678901.jpeg', 'Ankara top with unique patterns', FALSE);

-- Trench Coats
INSERT INTO product_image (product_id, image_url, alt_text, is_primary) VALUES
(8, 'https://images.pexels.com/photos/789012/pexels-photo-789012.jpeg', 'Stylish trench coat for women', TRUE),
(8, 'https://images.pexels.com/photos/890123/pexels-photo-890123.jpeg', 'Trench coat with belt detail', FALSE);


-- Add number of items in stock
UPDATE product SET stock_quantity = 50 WHERE id = 1;  -- Sneakers
UPDATE product SET stock_quantity = 30 WHERE id = 2;  -- Heels
UPDATE product SET stock_quantity = 40 WHERE id = 3;  -- Dresses
UPDATE product SET stock_quantity = 60 WHERE id = 4;  -- Cargo Pants
UPDATE product SET stock_quantity = 45 WHERE id = 5;  -- Ladies Jeans
UPDATE product SET stock_quantity = 55 WHERE id = 6;  -- Men's Jeans
UPDATE product SET stock_quantity = 70 WHERE id = 7;  -- Ankara Tops
UPDATE product SET stock_quantity = 25 WHERE id = 8;  -- Trench Coats