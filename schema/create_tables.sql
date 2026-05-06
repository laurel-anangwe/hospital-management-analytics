-- ============================================
-- Hospital Management Data Analysis
-- Author: Laurel Anangwe
-- Tool: MySQL Workbench
-- Description: Table creation scripts
-- ============================================

-- Create patients table
CREATE TABLE patients (
    patient_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- Create admissions table
CREATE TABLE admissions (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id VARCHAR(20),
    service VARCHAR(100),
    arrival_date DATE,
    departure_date DATE,
    satisfaction INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Create staff table
CREATE TABLE staff (
    staff_id VARCHAR(20) PRIMARY KEY,
    staff_name VARCHAR(100),
    role VARCHAR(50),
    service VARCHAR(100)
);

-- Create staff_schedule table
-- Note: No foreign key constraint to allow full data import for analysis
CREATE TABLE staff_schedule (
    week INT,
    staff_id VARCHAR(20),
    staff_name VARCHAR(100),
    role VARCHAR(50),
    service VARCHAR(100),
    present INT
);

-- Create services_weekly table
CREATE TABLE services_weekly (
    week INT,
    month INT,
    service VARCHAR(100),
    available_beds INT,
    patients_request INT,
    patients_admitted INT,
    patients_refused INT,
    patient_satisfaction INT,
    staff_morale INT,
    event VARCHAR(100)
);
