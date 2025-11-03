CREATE DATABASE IF NOT EXISTS mysneakershop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mysneakershop;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(100) NOT NULL,
                       role ENUM('ADMIN','USER') DEFAULT 'USER',
                       email VARCHAR(50),
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          price DECIMAL(10,2) NOT NULL,
                          image VARCHAR(255),
                          description TEXT,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        user_id INT NOT NULL,
                        total DECIMAL(10,2) NOT NULL,
                        status ENUM('PENDING','COMPLETED','CANCELLED') DEFAULT 'PENDING',
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             order_id INT NOT NULL,
                             product_id INT NOT NULL,
                             quantity INT DEFAULT 1,
                             price DECIMAL(10,2) NOT NULL,
                             FOREIGN KEY (order_id) REFERENCES orders(id),
                             FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Dữ liệu mẫu
INSERT INTO users (username, password, role, email)
VALUES
    ('admin', '123', 'ADMIN', 'admin@gmail.com'),
    ('bin', '12', 'USER', 'user@gmail.com');

INSERT INTO products (name, price, image, description) VALUES
                                                           ('Vintas Vivu - Low Top', 620000.00, 'vintas1.jpg', 'Mẫu giày Vintas...'),
                                                           ('Vintas Nauda EXT - High Top', 720000.00, 'vintas2.jpg', 'Mẫu high top...'),
                                                           ('Die-cut Insoles', 69000.00, 'insole.jpg', 'Insole 7mm');
