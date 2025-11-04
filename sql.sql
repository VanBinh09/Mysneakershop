-- Tạo database
CREATE DATABASE IF NOT EXISTS store CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE store;

-- Bảng người dùng (user)
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(100) NOT NULL,
                       role ENUM('ADMIN', 'USER') DEFAULT 'USER',
                       email VARCHAR(100),
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bảng sản phẩm (product)
CREATE TABLE products (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          price DECIMAL(10,2) NOT NULL,
                          image VARCHAR(500),
                          description TEXT,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bảng đơn hàng
CREATE TABLE orders (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        user_id INT NOT NULL,
                        total DECIMAL(10,2) NOT NULL,
                        status ENUM('PENDING','COMPLETED','CANCELLED') DEFAULT 'PENDING',
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Bảng chi tiết đơn hàng
CREATE TABLE order_items (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             order_id INT NOT NULL,
                             product_id INT NOT NULL,
                             quantity INT DEFAULT 1,
                             price DECIMAL(10,2) NOT NULL,
                             FOREIGN KEY (order_id) REFERENCES orders(id),
                             FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ✅ Dữ liệu mẫu: tài khoản admin và user
INSERT INTO users (username, password, role, email) VALUES
   ('admin', '123', 'ADMIN', 'admin@gmail.com'),
   ('bin', '12', 'USER', 'user@gmail.com');

-- ✅ Dữ liệu mẫu: sản phẩm
INSERT INTO products (name, price, image, description) VALUES
        ('Áo Thun Nam Basic', 150000.00, 'ao-thun.jpg', 'Áo thun nam chất cotton mềm mịn.'),
        ('Giày Sneaker Trắng', 550000.00, 'giay-trang.jpg', 'Giày thể thao trẻ trung, năng động.'),
        ('Túi Xách Nữ', 350000.00, 'tui-xach.jpg', 'Túi xách thời trang cao cấp.'),
        ('Quần Jean Nam', 320000.00, 'quan-jean.jpg', 'Quần jean slimfit co giãn.');


SELECT * FROM users;