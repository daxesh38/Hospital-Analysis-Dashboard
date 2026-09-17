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
* [The Developer Tutorial](https://www.youtube.com/watch?v=euBb9x7kom4&t=274s)
* [The Developer Channel](https://www.youtube.com/@The-Developer-BI/videos)
