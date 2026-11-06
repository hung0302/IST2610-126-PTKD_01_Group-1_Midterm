
USE salon_mini;

-- 1. Completed appointments in January 2025
SELECT a.appointment_id,
       a.appointment_date,
       c.customer_id,
       c.full_name AS customer_name,
       s.stylist_id,
       s.full_name AS stylist_name
FROM appointments a
JOIN customers c ON a.customer_id = c.customer_id
JOIN stylists s ON a.stylist_id = s.stylist_id
WHERE a.status = 'Completed'
  AND a.appointment_date >= '2025-01-01'
  AND a.appointment_date < '2025-02-01'
ORDER BY a.appointment_date;


-- 2. Total appointments by service team in Q1 2025
SELECT t.team_id,
       t.name AS team_name,
       COUNT(a.appointment_id) AS total_appointments
FROM service_teams t
LEFT JOIN stylists s ON t.team_id = s.team_id
LEFT JOIN appointments a
       ON s.stylist_id = a.stylist_id
      AND a.appointment_date >= '2025-01-01'
      AND a.appointment_date < '2025-04-01'
GROUP BY t.team_id, t.name
ORDER BY t.team_id;


-- 3. Customers with appointments without service records,
-- excluding Cancelled appointments
SELECT DISTINCT c.customer_id,
       c.full_name AS customer_name
FROM customers c
JOIN appointments a ON c.customer_id = a.customer_id
LEFT JOIN service_records sr
       ON a.appointment_id = sr.appointment_id
WHERE sr.record_id IS NULL
  AND a.status <> 'Cancelled'
ORDER BY c.customer_id;


-- 4. Average service cost per Completed appointment by team
SELECT t.team_id,
       t.name AS team_name,
       ROUND(AVG(sr.cost), 2) AS average_service_cost
FROM service_teams t
JOIN stylists s ON t.team_id = s.team_id
JOIN appointments a ON s.stylist_id = a.stylist_id
JOIN service_records sr ON a.appointment_id = sr.appointment_id
WHERE a.status = 'Completed'
GROUP BY t.team_id, t.name
ORDER BY t.team_id;


-- 5. Top 3 stylists with most Completed appointments in 2025
SELECT s.stylist_id,
       s.full_name AS stylist_name,
       COUNT(a.appointment_id) AS completed_count
FROM stylists s
JOIN appointments a ON s.stylist_id = a.stylist_id
WHERE a.status = 'Completed'
  AND a.appointment_date >= '2025-01-01'
  AND a.appointment_date < '2026-01-01'
GROUP BY s.stylist_id, s.full_name
ORDER BY completed_count DESC, s.stylist_id ASC
LIMIT 3;


-- 6. Total payments by customer in 2025
SELECT c.customer_id,
       c.full_name AS customer_name,
       COALESCE(SUM(p.amount), 0) AS total_paid_2025
FROM customers c
LEFT JOIN appointments a ON c.customer_id = a.customer_id
LEFT JOIN payments p
       ON a.appointment_id = p.appointment_id
      AND p.payment_date >= '2025-01-01'
      AND p.payment_date < '2026-01-01'
GROUP BY c.customer_id, c.full_name
ORDER BY c.customer_id;


-- 7. Customers without any payment records
SELECT c.customer_id,
       c.full_name AS customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM appointments a
    JOIN payments p ON a.appointment_id = p.appointment_id
    WHERE a.customer_id = c.customer_id
)
ORDER BY c.customer_id;


-- 8. Total confirmed service costs by customer
SELECT c.customer_id,
       c.full_name AS customer_name,
       COALESCE(SUM(sr.cost), 0) AS total_service_cost
FROM customers c
LEFT JOIN appointments a ON c.customer_id = a.customer_id
LEFT JOIN service_records sr
       ON a.appointment_id = sr.appointment_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_service_cost DESC, c.customer_id ASC;


-- 9. Cancellation rate by stylist in 2025
SELECT s.stylist_id,
       s.full_name AS stylist_name,
       COUNT(a.appointment_id) AS total_appointments,
       SUM(CASE WHEN a.status = 'Cancelled'
                THEN 1 ELSE 0 END) AS cancelled_count,
       ROUND(
           100.0 * SUM(CASE WHEN a.status = 'Cancelled'
                            THEN 1 ELSE 0 END)
           / NULLIF(COUNT(a.appointment_id), 0),
           2
       ) AS cancellation_rate
FROM stylists s
LEFT JOIN appointments a
       ON s.stylist_id = a.stylist_id
      AND a.appointment_date >= '2025-01-01'
      AND a.appointment_date < '2026-01-01'
GROUP BY s.stylist_id, s.full_name
ORDER BY s.stylist_id;


-- 10. Customers with more than 3 Completed appointments in 2025
SELECT c.customer_id,
       c.full_name AS customer_name,
       COUNT(a.appointment_id) AS completed_count
FROM customers c
JOIN appointments a ON c.customer_id = a.customer_id
WHERE a.status = 'Completed'
  AND a.appointment_date >= '2025-01-01'
  AND a.appointment_date < '2026-01-01'
GROUP BY c.customer_id, c.full_name
HAVING COUNT(a.appointment_id) > 3
ORDER BY completed_count DESC;
