
USE salon_mini;

-- 1. SERVICE TEAMS (5 records)
INSERT INTO service_teams (team_id, name) VALUES
(1, 'Hair Cutting and Styling'),
(2, 'Hair Coloring and Bleaching'),
(3, 'Hair Perming and Straightening'),
(4, 'Hair Care and Treatment'),
(5, 'Hair Extensions');


-- 2. STYLISTS (7 records)
INSERT INTO stylists
(stylist_id, full_name, email, skill, team_id)
VALUES
(1, 'Nguyen Minh Anh', 'minhanh@salon.com',
 'Haircut and Layered Styling', 1),
(2, 'Tran Bao Ngoc', 'baongoc@salon.com',
 'Hair Coloring and Highlights', 2),
(3, 'Le Hoang Nam', 'hoangnam@salon.com',
 'Digital Perm and Hair Straightening', 3),
(4, 'Pham Thu Ha', 'thuha@salon.com',
 'Keratin and Scalp Treatment', 4),
(5, 'Do Quang Huy', 'quanghuy@salon.com',
 'Men Haircut and Styling', 1),
(6, 'Bui Thanh Mai', 'thanhmai@salon.com',
 'Balayage and Hair Bleaching', 2),
(7, 'Vu Khanh Linh', 'khanhlinh@salon.com',
 'Hair Extensions', 5);


-- 3. CUSTOMERS (11 records)
INSERT INTO customers
(customer_id, full_name, phone, preference_note)
VALUES
(1, 'Nguyen Thi Lan', '0901000001',
 'Prefers natural hairstyles'),
(2, 'Tran Van Minh', '0901000002',
 'Prefers short haircuts'),
(3, 'Le Thi Hoa', '0901000003',
 'Prefers ash brown hair color'),
(4, 'Pham Van Nam', '0901000004',
 'Prefers professional styling'),
(5, 'Hoang Thi Mai', '0901000005',
 'Has dry and damaged hair'),
(6, 'Do Van Long', '0901000006',
 'Prefers modern hairstyles'),
(7, 'Bui Thi Ha', '0901000007',
 'Interested in hair extensions'),
(8, 'Vu Van Tuan', '0901000008',
 'Prefers natural hair colors'),
(9, 'Dang Thi Linh', '0901000009',
 'Needs scalp care'),
(10, 'Ngo Van Son', '0901000010',
 'Prefers low-maintenance hairstyles'),
(11, 'Phan Thi Yen', '0901000011',
 NULL);


-- 4. APPOINTMENTS (20 records)
INSERT INTO appointments
(appointment_id, customer_id, stylist_id,
 appointment_date, status)
VALUES
(1, 1, 1, '2025-01-05 09:00:00', 'Completed'),
(2, 1, 2, '2025-01-20 10:00:00', 'Completed'),
(3, 1, 3, '2025-02-10 14:00:00', 'Completed'),
(4, 1, 4, '2025-04-15 09:00:00', 'Completed'),
(5, 2, 5, '2025-01-12 11:00:00', 'Completed'),
(6, 3, 2, '2025-02-18 13:00:00', 'Completed'),
(7, 4, 3, '2025-03-08 15:00:00', 'Completed'),
(8, 5, 4, '2025-04-10 10:00:00', 'Completed'),
(9, 6, 1, '2025-05-12 09:00:00', 'Completed'),
(10, 7, 7, '2024-12-15 14:00:00', 'Completed'),
(11, 8, 6, '2026-01-10 10:00:00', 'Completed'),
(12, 9, 4, '2025-07-20 13:00:00', 'Completed'),
(13, 10, 5, '2025-03-15 09:00:00', 'Completed'),
(14, 2, 2, '2025-01-25 10:00:00', 'Cancelled'),
(15, 3, 3, '2025-02-25 14:00:00', 'Pending'),
(16, 4, 4, '2025-10-05 11:00:00', 'Cancelled'),
(17, 5, 1, '2025-12-12 09:00:00', 'Completed'),
(18, 6, 5, '2025-03-22 10:00:00', 'Completed'),
(19, 8, 6, '2025-03-28 13:00:00', 'Cancelled'),
(20, 10, 3, '2025-06-15 10:00:00', 'Pending');


-- 5. SERVICE RECORDS (15 records)
INSERT INTO service_records
(record_id, appointment_id, service_summary,
 product_note, cost)
VALUES
(1, 1, 'Women Layered Haircut',
 'Professional shampoo', 250000),

(2, 2, 'Full Hair Coloring - Chocolate Brown',
 'Professional hair dye', 850000),

(3, 3, 'Digital Wave Perm',
 'Perm solution and neutralizer', 1200000),

(4, 4, 'Keratin Hair Treatment',
 'Keratin treatment products', 900000),

(5, 5, 'Men Haircut and Styling',
 'Styling wax', 180000),

(6, 6, 'Full Hair Coloring - Ash Brown',
 'Professional hair dye and toner', 1100000),

(7, 7, 'Natural Hair Straightening',
 'Straightening cream', 950000),

(8, 8, 'Deep Hair Repair Treatment',
 'Hair mask and protein treatment', 650000),

(9, 9, 'Women Haircut and Blow Dry',
 'Shampoo and heat protection spray', 300000),

(10, 10, 'Full Head Hair Extensions',
 'Human hair extensions', 3500000),

(11, 11, 'Balayage Hair Coloring',
 'Bleaching powder and toner', 1800000),

(12, 12, 'Scalp Detox Treatment',
 'Scalp cleansing products', 450000),

(13, 17, 'Women Layered Haircut',
 'Professional shampoo', 250000),

(14, 18, 'Men Haircut and Styling',
 'Styling wax', 180000),

(15, 13, 'Men Haircut and Styling',
 'Styling wax', 200000);


-- 6. PAYMENTS (15 records)
INSERT INTO payments
(payment_id, appointment_id, amount,
 payment_date, method)
VALUES
(1, 1, 250000, '2025-01-05 10:00:00', 'Cash'),
(2, 2, 850000, '2025-01-20 12:00:00', 'Card'),
(3, 3, 1200000, '2025-02-10 17:00:00', 'BankTransfer'),
(4, 4, 900000, '2025-04-15 11:00:00', 'Cash'),

(5, 6, 500000, '2025-02-18 16:00:00', 'Cash'),
(6, 6, 600000, '2025-02-20 09:00:00', 'BankTransfer'),

(7, 7, 400000, '2025-03-08 18:00:00', 'Card'),

(8, 8, 650000, '2025-04-10 12:00:00', 'Cash'),
(9, 9, 300000, '2025-05-12 10:00:00', 'Card'),
(10, 10, 3500000, '2024-12-15 17:00:00', 'BankTransfer'),
(11, 11, 1800000, '2026-01-10 15:00:00', 'Card'),
(12, 12, 450000, '2025-07-20 15:00:00', 'Cash'),
(13, 17, 250000, '2025-12-12 10:00:00', 'Cash'),
(14, 18, 180000, '2025-03-22 11:00:00', 'Card'),
(15, 5, 180000, '2025-01-12 12:00:00', 'Cash');


-- ==========================================
-- DATA VALIDATION
-- ==========================================

-- 7. Check record counts
SELECT 'service_teams' AS table_name,
       COUNT(*) AS total
FROM service_teams

UNION ALL
SELECT 'stylists', COUNT(*) FROM stylists

UNION ALL
SELECT 'customers', COUNT(*) FROM customers

UNION ALL
SELECT 'appointments', COUNT(*) FROM appointments

UNION ALL
SELECT 'service_records', COUNT(*) FROM service_records

UNION ALL
SELECT 'payments', COUNT(*) FROM payments;


-- 8. Check stylist foreign keys
SELECT s.stylist_id
FROM stylists s
LEFT JOIN service_teams t
ON s.team_id = t.team_id
WHERE t.team_id IS NULL;


-- 9. Check appointment foreign keys
SELECT a.appointment_id
FROM appointments a
LEFT JOIN customers c
ON a.customer_id = c.customer_id
LEFT JOIN stylists s
ON a.stylist_id = s.stylist_id
WHERE c.customer_id IS NULL
   OR s.stylist_id IS NULL;


-- 10. Check service record foreign keys
SELECT sr.record_id
FROM service_records sr
LEFT JOIN appointments a
ON sr.appointment_id = a.appointment_id
WHERE a.appointment_id IS NULL;


-- 11. Check payment foreign keys
SELECT p.payment_id
FROM payments p
LEFT JOIN appointments a
ON p.appointment_id = a.appointment_id
WHERE a.appointment_id IS NULL;


-- 12. Check appointment status and service records
SELECT a.appointment_id,
       a.status,
       COUNT(sr.record_id) AS record_count
FROM appointments a
LEFT JOIN service_records sr
ON a.appointment_id = sr.appointment_id
GROUP BY a.appointment_id, a.status
HAVING
    (a.status = 'Completed' AND record_count <> 1)
    OR
    (a.status <> 'Completed' AND record_count <> 0);


-- 13. Check payments without confirmed costs
SELECT p.payment_id,
       p.appointment_id
FROM payments p
LEFT JOIN appointments a
ON p.appointment_id = a.appointment_id
LEFT JOIN service_records sr
ON p.appointment_id = sr.appointment_id
WHERE sr.record_id IS NULL
   OR a.status <> 'Completed';


-- 14. Check total payments against service costs
SELECT sr.appointment_id,
       sr.cost,
       COALESCE(SUM(p.amount), 0) AS total_paid
FROM service_records sr
LEFT JOIN payments p
ON sr.appointment_id = p.appointment_id
GROUP BY sr.appointment_id, sr.cost
HAVING total_paid > sr.cost;


-- 15. Check customers with more than 3 completed appointments in 2025
SELECT c.customer_id,
       c.full_name,
       COUNT(*) AS completed_count
FROM customers c
JOIN appointments a
ON c.customer_id = a.customer_id
WHERE a.status = 'Completed'
  AND a.appointment_date >= '2025-01-01'
  AND a.appointment_date < '2026-01-01'
GROUP BY c.customer_id, c.full_name
HAVING COUNT(*) > 3;


-- 16. Check stylists without appointments in 2025
SELECT s.stylist_id,
       s.full_name
FROM stylists s
LEFT JOIN appointments a
ON s.stylist_id = a.stylist_id
AND a.appointment_date >= '2025-01-01'
AND a.appointment_date < '2026-01-01'
WHERE a.appointment_id IS NULL;


-- 17. Check teams without appointments in Q1 2025
SELECT t.team_id,
       t.name
FROM service_teams t
LEFT JOIN stylists s
ON t.team_id = s.team_id
LEFT JOIN appointments a
ON s.stylist_id = a.stylist_id
AND a.appointment_date >= '2025-01-01'
AND a.appointment_date < '2025-04-01'
GROUP BY t.team_id, t.name
HAVING COUNT(a.appointment_id) = 0;


-- 18. Check appointments with multiple payments
SELECT appointment_id,
       COUNT(*) AS payment_count
FROM payments
GROUP BY appointment_id
HAVING COUNT(*) > 1;


-- 19. Check outstanding debts
SELECT sr.appointment_id,
       sr.cost,
       COALESCE(SUM(p.amount), 0) AS total_paid,
       sr.cost - COALESCE(SUM(p.amount), 0) AS debt
FROM service_records sr
LEFT JOIN payments p
ON sr.appointment_id = p.appointment_id
GROUP BY sr.appointment_id, sr.cost
HAVING debt > 0;


-- 20. Check customers with appointment history but no payments
SELECT c.customer_id,
       c.full_name
FROM customers c
WHERE EXISTS (SELECT 1 FROM appointments a
              WHERE a.customer_id = c.customer_id)
  AND NOT EXISTS (SELECT 1
                  FROM payments p
                  JOIN appointments a
                  ON p.appointment_id = a.appointment_id
                  WHERE a.customer_id = c.customer_id);


-- 21. Check appointments with more than one service record (expected: 0 rows)
SELECT appointment_id,
       COUNT(*) AS record_count
FROM service_records
GROUP BY appointment_id
HAVING COUNT(*) > 1;


-- ==========================================
-- CONSTRAINT VIOLATION EXAMPLES
-- (commented out so the whole file still runs)
-- ==========================================

-- UNIQUE: appointment 1 already has a service record
-- INSERT INTO service_records (appointment_id, service_summary, cost)
-- VALUES (1, 'Duplicate record', 100000);

-- CHECK: cost must be >= 0
-- INSERT INTO service_records (appointment_id, service_summary, cost)
-- VALUES (15, 'Negative cost', -50000);

-- CHECK: amount must be > 0
-- INSERT INTO payments (appointment_id, amount, payment_date, method)
-- VALUES (1, 0, '2025-01-06 10:00:00', 'Cash');

-- ENUM: invalid payment method
-- INSERT INTO payments (appointment_id, amount, payment_date, method)
-- VALUES (1, 10000, '2025-01-06 10:00:00', 'Momo');

-- FOREIGN KEY: customer 999 does not exist
-- INSERT INTO appointments (customer_id, stylist_id, appointment_date, status)
-- VALUES (999, 1, '2025-01-01 09:00:00', 'Pending');
