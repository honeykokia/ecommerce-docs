CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    gender SMALLINT NOT NULL,
    birthday DATE,
    phone VARCHAR(20) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    last_login_at TIMESTAMP NOT NULL
);

CREATE TABLE promotions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    discount_type VARCHAR(50) NOT NULL,
    discount_value INT NOT NULL,
    description VARCHAR(255),
    image_url VARCHAR(255),
    is_active BOOLEAN NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    image_url VARCHAR(255),
    in_stock INT NOT NULL,
    rating DOUBLE PRECISION,
    sold_count INT,
    short_description VARCHAR(300),
    promotion_id INT,
    category_id INT,
    FOREIGN KEY (promotion_id) REFERENCES promotions (id) ON DELETE SET NULL,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE SET NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_number VARCHAR(100) NOT NULL UNIQUE,
    status VARCHAR(50) NOT NULL, -- 存儲 OrderStatus 枚舉值
    payment_method VARCHAR(50) NOT NULL, -- 存儲 PaymentMethod 枚舉值
    is_paid BOOLEAN NOT NULL,
    paid_at TIMESTAMP NULL,
    cancelled_at TIMESTAMP NULL,
    shipping_method VARCHAR(50) NOT NULL, -- 存儲 ShippingMethod 枚舉值
    shipping_address VARCHAR(255) NOT NULL,
    shipping_status VARCHAR(50) NOT NULL, -- 存儲 ShippingStatus 枚舉值
    total_price INT NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE carts (
    id SERIAL PRIMARY KEY,
    quantity INT NOT NULL,
    unit_price INT NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);
CREATE TABLE cart_items (
    id SERIAL PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price INT NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    payment_method VARCHAR(50) NOT NULL, -- 存儲 PaymentMethod 枚舉值
    status VARCHAR(50) NOT NULL, -- 存儲 PaymentStatus 枚舉值
    amount INT NOT NULL,
    transaction_id VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    order_id INT UNIQUE,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

CREATE TABLE product_tags (
    product_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (product_id, tag_id),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);