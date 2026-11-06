CREATE DATABASE salon_mini;
USE salon_mini;

-- 1. Service teams
CREATE TABLE service_teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 2. Stylists
CREATE TABLE stylists (
    stylist_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    skill VARCHAR(100),
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES service_teams(team_id)
);

-- 3. Customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    preference_note TEXT
);

-- 4. Appointments
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    stylist_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Pending', 'Completed', 'Cancelled') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (stylist_id) REFERENCES stylists(stylist_id)
);

-- 5. Service records
CREATE TABLE service_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE,
    service_summary TEXT NOT NULL,
    product_note TEXT,
    cost DECIMAL(12,2) NOT NULL,
    CHECK (cost >= 0),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- 6. Payments
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_date DATETIME NOT NULL,
    method ENUM('Cash', 'BankTransfer', 'Card') NOT NULL,
    CHECK (amount > 0),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);
