
USE salon_mini;

-- ==========================================
-- PART D: CREATE VIEWS
-- ==========================================

-- 1. V_DETAIL
-- Appointment details with customer, stylist,
-- service team, and confirmed service cost

CREATE VIEW v_detail AS
SELECT
    a.appointment_id,
    a.appointment_date,
    a.status,
    c.customer_id,
    c.full_name AS customer_name,
    s.stylist_id,
    s.full_name AS stylist_name,
    t.team_id,
    t.name AS team_name,
    sr.cost AS service_cost
FROM appointments a
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN stylists s
    ON a.stylist_id = s.stylist_id
JOIN service_teams t
    ON s.team_id = t.team_id
LEFT JOIN service_records sr
    ON a.appointment_id = sr.appointment_id;


-- 2. V_GROUP_SUMMARY
-- Appointment statistics and total confirmed
-- service costs for each service team

CREATE VIEW v_group_summary AS
SELECT
    t.team_id,
    t.name AS team_name,
    COUNT(a.appointment_id) AS total_appointments,
    SUM(CASE
        WHEN a.status = 'Completed' THEN 1
        ELSE 0
    END) AS completed_count,
    SUM(CASE
        WHEN a.status = 'Cancelled' THEN 1
        ELSE 0
    END) AS cancelled_count,
    COALESCE(SUM(sr.cost), 0) AS total_service_cost
FROM service_teams t
LEFT JOIN stylists s
    ON t.team_id = s.team_id
LEFT JOIN appointments a
    ON s.stylist_id = a.stylist_id
LEFT JOIN service_records sr
    ON a.appointment_id = sr.appointment_id
GROUP BY t.team_id, t.name;


-- 3. V_DEBT
-- Total confirmed costs, total payments,
-- and outstanding debt for each customer

CREATE VIEW v_debt AS
SELECT
    c.customer_id,
    c.full_name AS customer_name,
    COALESCE(sc.total_service_cost, 0)
        AS total_service_cost,
    COALESCE(pm.total_paid, 0)
        AS total_paid,
    COALESCE(sc.total_service_cost, 0)
        - COALESCE(pm.total_paid, 0)
        AS outstanding_debt
FROM customers c

LEFT JOIN (
    SELECT
        a.customer_id,
        SUM(sr.cost) AS total_service_cost
    FROM appointments a
    JOIN service_records sr
        ON a.appointment_id = sr.appointment_id
    GROUP BY a.customer_id
) sc
    ON c.customer_id = sc.customer_id

LEFT JOIN (
    SELECT
        a.customer_id,
        SUM(p.amount) AS total_paid
    FROM appointments a
    JOIN payments p
        ON a.appointment_id = p.appointment_id
    GROUP BY a.customer_id
) pm
    ON c.customer_id = pm.customer_id;


-- ==========================================
-- VIEW VALIDATION
-- ==========================================

-- 4. Check appointment details
SELECT *
FROM v_detail
ORDER BY appointment_id;


-- 5. Check service team summary
SELECT *
FROM v_group_summary
ORDER BY team_id;


-- 6. Check customer debts
SELECT *
FROM v_debt
ORDER BY outstanding_debt DESC, customer_id;


-- 7. Check total confirmed costs and payments
SELECT
    SUM(total_service_cost) AS total_service_cost,
    SUM(total_paid) AS total_paid,
    SUM(outstanding_debt) AS total_outstanding_debt
FROM v_debt;
