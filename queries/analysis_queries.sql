-- ============================================
-- Hospital Management Data Analysis
-- Author: Laurel Anangwe
-- Tool: MySQL Workbench
-- Description: Analysis queries
-- ============================================


-- ============================================
-- Query 1: Staff Schedule Overview
-- Joins staff with their weekly schedule
-- ============================================
SELECT 
    s.staff_id, 
    s.staff_name, 
    ss.week, 
    ss.role,
    ss.service,
    ss.present
FROM staff AS s
JOIN staff_schedule AS ss
ON s.staff_name = ss.staff_name;


-- ============================================
-- Query 2: Staff Count Per Service
-- Shows which service has the highest number of staff
-- ============================================
SELECT 
    service, 
    COUNT(*) AS total_staff
FROM staff
GROUP BY service
ORDER BY total_staff DESC;


-- ============================================
-- Query 3: Active Staff Per Service Per Week
-- Shows which service has the most active staff per week
-- ============================================
SELECT 
    ss.week, 
    s.service, 
    COUNT(*) AS active_staff
FROM staff_schedule AS ss
JOIN staff AS s ON ss.staff_name = s.staff_name
WHERE ss.present = 1
GROUP BY ss.week, s.service
ORDER BY active_staff DESC
LIMIT 10;


-- ============================================
-- Query 4: Staff Morale vs Patient Refusals
-- Shows if low staff morale is linked to patient refusals
-- ============================================
SELECT 
    service, 
    AVG(patients_refused) AS avg_refused,
    AVG(staff_morale) AS avg_morale
FROM services_weekly
GROUP BY service;


-- ============================================
-- Query 5: Patient Admission Rate Per Service
-- Calculates the percentage of requests that result in admission
-- ============================================
SELECT 
    service,
    SUM(patients_request) AS total_requests,
    SUM(patients_admitted) AS total_admitted,
    ROUND(SUM(patients_admitted) / SUM(patients_request) * 100, 2) AS admission_rate
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;


-- ============================================
-- Query 6: Average Patient Satisfaction Per Service
-- Ranks services by average patient satisfaction score
-- ============================================
SELECT 
    service,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
FROM services_weekly
GROUP BY service
ORDER BY avg_satisfaction DESC;


-- ============================================
-- Query 7: Weekly Bed Occupancy Rate
-- Analyzes bed usage efficiency per service per week
-- ============================================
SELECT 
    week, 
    service,
    patients_admitted,
    available_beds,
    ROUND(patients_admitted / available_beds * 100, 2) AS occupancy_rate
FROM services_weekly
ORDER BY occupancy_rate DESC;


-- ============================================
-- Query 8: Impact of Events on Patient Refusals
-- Shows how special events affect refusals, beds and morale
-- ============================================
SELECT 
    event,
    ROUND(AVG(patients_refused), 2) AS avg_refused,
    ROUND(AVG(available_beds), 2) AS avg_beds,
    ROUND(AVG(staff_morale), 2) AS avg_morale
FROM services_weekly
WHERE event IS NOT NULL
GROUP BY event
ORDER BY avg_refused DESC;


-- ============================================
-- Query 9: Staff Morale Categories
-- Categorizes services based on their average staff morale level
-- ============================================
SELECT 
    service,
    ROUND(AVG(staff_morale), 2) AS avg_morale,
    CASE
        WHEN AVG(staff_morale) >= 80 THEN 'High Morale'
        WHEN AVG(staff_morale) BETWEEN 50 AND 79 THEN 'Moderate Morale'
        ELSE 'Low Morale'
    END AS morale_category
FROM services_weekly
GROUP BY service
ORDER BY avg_morale DESC;
