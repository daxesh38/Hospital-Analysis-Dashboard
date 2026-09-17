# 🏥 Hospital Information & Analytics Dashboard (MySQL & Power BI)

**[🌐 View Live Power BI Report](https://app.powerbi.com/view?r=eyJrIjoiOWIwY2ZmNGUtYWZmZC00NTlhLWFmOWYtMjNlM2JlYWRjMzgxIiwidCI6IjY2ZGNhNGQyLTU0ZDktNDhiOC1hZDFhLTliOWUwNmRiMGQ5MCJ9)** | 📊 **[Download .pbix File](Hospital%20Dashboard.pbix)**

---

## 📌 Project Overview

This project is an end-to-end **Healthcare Analytics and Hospital Information Dashboard** built using **MySQL** for relational data storage and **Power BI** for interactive visualization. 

The goal of this project was to transform raw hospital datasets (patients, doctors, bills, surgeries, and medical stock) into a scalable relational data model and design a modern, website-style user interface. The dashboard allows hospital administrators and stakeholders to monitor clinical efficiency, patient demographics, doctor performance, bed allocation, and financial revenue streams seamlessly.

## 🗄️ Data Architecture & Modeling

A core focus of this project was establishing a robust relational star schema to manage complex healthcare metrics without performance degradation.

![Data Model](Images/Data%20Modeling%20Hospital%20Dashboard.png)

The backend utilizes:
* **Relational Database:** MySQL Workbench for schema creation, data cleaning, views, and queries.
* **Fact & Dimension Tables:** Connecting transactional tables (`Bills`, `appointment`, `patient_tests`, `medicine_patient`) with dimensional lookups (`patient_info`, `Department`, `staff`, `beds_info`, `Calendar`).
* **DAX Enhancements:** Advanced calculated columns and measures for dynamic ranking, week formatting (`W-15`), month-year sorting indexes, and conditional color formatting.

## 🌐 Website-Style Navigation

The dashboard uses a custom website-style navigation layout instead of standard Power BI tabs. Using custom icons and page navigation buttons, users can effortlessly transition between the Home hub and functional analytical sections.

![Home Page](Images/Home%20-%20Hospital%20Dashboard.png)

## 📊 Dashboard Pages & Features

### 1. Overview Dashboard
Acts as the executive summary, displaying high-level hospital KPIs including Total Patients, Bill Counts, Doctor Count, and Staff Count. It includes medicine tracking by month/day, patient discharge trends, and patient charge type breakdowns.
![Overview Page](Images/Overview%20-%20Hospital%20Dashboard.png)

### 2. Patient Analytics
Provides a deep dive into individual patient records, tracking admission/discharge timelines, room assignments, diagnoses, blood groups, and specific medical test results.
![Patient Page](Images/Patient%20-%20Hospital%20Dashboard.png)

### 3. Doctor Performance & Finance
Monitors doctor metrics including salaries, specializations, ratings, patient spend, and commission rates. Features interactive appointment lists and commission calculators.
![Doctor Page](Images/Doctor%20-%20Hospital%20Dashboard.png)

### 4. Hospital Operations & Beds
Focuses on hospital infrastructure, tracking bed availability status across General, ICU, and Private wards, alongside department-wise patient test outcomes and surgical appointments.
![Hospital Page](Images/Hospital%20-%20Hospital%20Dashboard.png)

### 5. Financial Insights
Analyzes hospital revenue, total bill amounts, doctor fees, and departmental earnings. Includes medicine stock status vs. sales volume comparisons.
![Finance Page](Images/Finance%20-%20Hospital%20Dashboard.png)

## 💡 Key Business Insights

1. **Patient Load & Discharge Efficiency:** Surgery and Room charges constitute the highest proportion of hospital billing, indicating high utilization of surgical suites and inpatient care units.
2. **Resource Allocation:** General and ICU wards experience peak occupancy during specific weekly cycles, requiring optimized staff scheduling during high-intake periods.
3. **Inventory & Medicine Tracking:** Stock levels for core medications (e.g., Amoxicillin, Metformin) maintain healthy buffers, though high-turnover items require automated reorder alerts.
4. **Doctor Performance:** Top-performing specialists drive significant patient spend and high satisfaction ratings, correlating with higher departmental profitability.

## 🛠️ Files Included
* **[Hospital Dashboard.pbix](Hospital%20Dashboard.pbix):** The complete Power BI project file containing the data model, DAX formulas, and UI layouts.
* **[MySQL Data Folder](MySQL%20Data/):** Contains raw SQL queries, views, and database creation scripts.
* **[Data Folder](Data/):** Contains source Excel spreadsheets (`Appointment.xlsx`, `Doctor.xlsx`, `Hospital Bills.xlsx`, etc.).

## 🎓 Credits & Learning Resources

This project was developed to advance enterprise-grade data modeling, SQL integration, and UI/UX design capabilities in Power BI.

Special thanks to the YouTube channel **"The Developer BI"** for design inspiration and structural workflow guidance:
* [The Developer BI Tutorial](https://www.youtube.com/watch?v=euBb9x7kom4&t=274s)
* [The Developer BI Channel](https://www.youtube.com/@The-Developer-BI/videos)

## 🗄️ MySQL Database Views: `patient_info`

Here is the core SQL view script used to combine patient, doctor, bed, department, satisfaction, and surgery data for the Power BI data model:

```sql
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `patient_info` AS
    SELECT 
        `p`.`patient_id` AS `patient_id`,
        `p`.`name` AS `patient_name`,
        `p`.`gender` AS `patient_gender`,
        `p`.`weight` AS `patient_weight`,
        `p`.`age` AS `patient_age`,
        `p`.`blood_group` AS `patient_blood_group`,
        `p`.`email` AS `patient_email`,
        `p`.`admission_date` AS `patient_admission_date`,
        `p`.`discharge_date` AS `patient_discharge_date`,
        `p`.`address` AS `patient_address`,
        `p`.`state` AS `patient_state`,
        `p`.`Img` AS `patient_Img`,
        `p`.`status` AS `patient_status`,
        `p`.`phone` AS `patient_phone`,
        (CASE
            WHEN (`b`.`bed_id` IS NULL) THEN 'Discharge'
            ELSE 'Admitted'
        END) AS `patient_admission_status`,
        `dr`.`doctor_id` AS `doctor_id`,
        `dr`.`name` AS `doctor_name`,
        `dr`.`salary` AS `doctor_salary`,
        `dr`.`specialization` AS `doctor_specialization`,
        `dr`.`department` AS `doctor_department`,
        `dr`.`availability` AS `doctor_availability`,
        `dr`.`joining_date` AS `doctor_joining_date`,
        `dr`.`qualification` AS `doctor_qualification`,
        `dr`.`experience_years` AS `doctor_experience_years`,
        `dr`.`email` AS `doctor_email`,
        `dr`.`phone` AS `doctor_phone`,
        `dr`.`Img` AS `doctor_Img`,
        `b`.`bed_id` AS `beds_bed_id`,
        `b`.`occupied_from` AS `beds_occupied_from`,
        `b`.`occupied_till` AS `beds_occupied_till`,
        `b`.`status` AS `beds_status`,
        `r`.`room_id` AS `room_room_id`,
        `r`.`floor` AS `room_floor`,
        `r`.`room_type` AS `room_room_type`,
        `r`.`capacity` AS `room_capacity`,
        `r`.`daily_charge` AS `room_daily_charge`,
        `r`.`avgmontlymaintenancecost` AS `room_avgmontlymaintenancecost`,
        `r`.`status` AS `room_status`,
        `dep`.`department_id` AS `department_id`,
        `dep`.`name` AS `department_name`,
        `dep`.`total_staff` AS `department_total_staff`,
        `s`.`satisfaction_id` AS `satisfaction_id`,
        `s`.`rating` AS `satisfaction_rating`,
        `s`.`feedback` AS `satisfaction_feedback`,
        `sur`.`appointment_id` AS `surgery_appointment_id`,
        `sur`.`appointment_date` AS `surgery_appointment_date`,
        `sur`.`appointment_time` AS `surgery_appointment_time`,
        `sur`.`status` AS `surgery_status`,
        `sur`.`reason` AS `surgery_reason`,
        `sur`.`notes` AS `surgery_notes`
    FROM
        (((((((`patient` `p`
        LEFT JOIN `satisfaction_score` `s` ON ((`p`.`patient_id` = `s`.`patient_id`)))
        LEFT JOIN `surgery` `sur` ON ((`sur`.`patient_id` = `p`.`patient_id`)))
        LEFT JOIN `beds` `b` ON ((`b`.`patient_id` = `p`.`patient_id`)))
        LEFT JOIN `rooms` `r` ON ((`r`.`room_id` = `b`.`room_id`)))
        LEFT JOIN `department` `dep` ON ((`dep`.`department_id` = `r`.`department_id`)))
        LEFT JOIN (SELECT DISTINCT
            `appointment`.`patient_id` AS `patient_id`,
                `appointment`.`doctor_id` AS `doctor_id`
        FROM
            `appointment`) `a` ON ((`a`.`patient_id` = `p`.`patient_id`)))
        LEFT JOIN `doctor` `dr` ON ((`dr`.`doctor_id` = `a`.`doctor_id`)))
