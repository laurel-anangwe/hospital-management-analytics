# 🏥 Hospital Management Data Analysis — SQL Portfolio Project

**Author:** Laurel Anangwe  
**Tool:** MySQL Workbench  
**Data Source:** [Kaggle](https://www.kaggle.com)

---

## 📌 Project Overview

This project analyzes hospital operations data using SQL. The goal is to uncover insights across three key areas:

- **Patient admissions** — understanding admission rates, satisfaction, and service demand
- **Staff performance and scheduling** — analyzing attendance, morale, and staffing levels
- **Service capacity** — evaluating bed occupancy, patient refusals, and the impact of events

---

## 🗄️ Database Schema

The database consists of five tables:

### `patients`
Stores basic patient information.
| Column | Type |
|---|---|
| patient_id | VARCHAR(20) PK |
| name | TEXT |
| age | INT |

### `admissions`
Records each patient admission.
| Column | Type |
|---|---|
| admission_id | INT PK AUTO_INCREMENT |
| patient_id | VARCHAR(20) FK → patients |
| service | VARCHAR(100) |
| arrival_date | DATE |
| departure_date | DATE |
| satisfaction | INT |

### `staff`
Contains staff member details.
| Column | Type |
|---|---|
| staff_id | VARCHAR(20) PK |
| staff_name | TEXT |
| role | TEXT |
| service | TEXT |

### `staff_schedule`
Weekly attendance records for staff.
| Column | Type |
|---|---|
| week | INT |
| staff_id | TEXT |
| staff_name | TEXT |
| role | TEXT |
| service | TEXT |
| present | INT |

### `services_weekly`
Weekly performance metrics per service.
| Column | Type |
|---|---|
| week | INT |
| month | INT |
| service | TEXT |
| available_beds | INT |
| patients_request | INT |
| patients_admitted | INT |
| patients_refused | INT |
| patient_satisfaction | INT |
| staff_morale | INT |
| event | TEXT |

---

## 📊 Analyses Performed

| # | Analysis | Key Concept |
|---|---|---|
| 1 | Staff schedule overview | JOIN |
| 2 | Staff count per service | Aggregation |
| 3 | Active staff per service per week | JOIN + Filtering |
| 4 | Staff morale vs patient refusals | Multi-metric analysis |
| 5 | Patient admission rate per service | Derived metrics |
| 6 | Average patient satisfaction per service | Ranking |
| 7 | Weekly bed occupancy rate | Capacity analysis |
| 8 | Impact of events on patient refusals | Filtering |
| 9 | Staff morale categories | CASE statement |

---

## 🚀 How to Run

1. Clone this repository
2. Import the dataset into MySQL Workbench
3. Run `schema/create_tables.sql` to set up the tables
4. Run `queries/analysis_queries.sql` to execute the analyses

---

## 🛠️ Tools Used

- MySQL Workbench
- MySQL 8.0
