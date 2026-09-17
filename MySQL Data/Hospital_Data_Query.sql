SELECT
-- Patient Columns 
p.patient_id AS patient_id,
p.name AS patient_name,
p.gender AS patient_gender,
p.weight AS patient_weight,
p.age AS patient_age,
p.blood_group AS patient_blood_group,
p.email AS patient_email,
p.admission_date AS patient_admission_date,
p.discharge_date AS patient_discharge_date,
p.address AS patient_address,
p.status AS patient_status,

CASE
	WHEN b.bed_id IS NULL THEN 'Discharge'
    ELSE 'Admitted'
END AS patient_admission_status,

-- Doctor Columns
dr.doctor_id AS doctor_id,
dr.name AS doctor_name,
dr.salary AS doctor_salary,
dr.specialization AS doctor_specialization,
dr.department AS doctor_department,
dr.availability AS doctor_availability,
dr.joining_date AS doctor_joining_date,
dr.qualification AS doctor_qualification,
dr.experience_years AS doctor_experience_years,
dr.email AS doctor_email,
dr.phone AS doctor_phone,

-- Beds Columns
b.bed_id AS beds_bed_id,
b.occupied_from AS beds_occupied_from,
b.occupied_till AS beds_occupied_till,
b.status AS beds_status,

-- Room Columns
r.room_id AS room_room_id,
r.floor AS room_floor,
r.room_type AS room_room_type,
r.capacity AS room_capacity,
r.daily_charge AS room_daily_charge,
r.avgmontlymaintenancecost AS room_avgmontlymaintenancecost,
r.status AS room_status,

-- Department Columns
dep.department_id AS department_id,
dep.name AS department_name,
dep.total_staff AS department_total_staff,

-- Satisfaction Score Columns
s.satisfaction_id AS satisfaction_id,
s.rating AS satisfaction_rating,
s.feedback AS satisfaction_feedback,

-- Surgery Columns
sur.appointment_id AS surgery_appointment_id,
sur.appointment_date AS surgery_appointment_date,
sur.appointment_time AS surgery_appointment_time,
sur.status AS surgery_status,
sur.reason AS surgery_reason,
sur.notes AS surgery_notes

FROM patient p
LEFT JOIN satisfaction_score s ON p.patient_id= s.patient_id
LEFT JOIN surgery sur ON sur.patient_id = p.patient_id
LEFT JOIN hospital_bills hb ON hb.patient_id = p.patient_id
LEFT JOIN beds b ON b.patient_id= p.patient_id
LEFT JOIN rooms r ON r.room_id = b.room_id
LEFT JOIN department dep ON dep.department_id = r.department_id
LEFT JOIN (
		SELECT DISTINCT patient_id, doctor_id
        FROM appointment
        ) a ON a.patient_id = p.patient_id
LEFT JOIN doctor dr ON dr.doctor_id= a.doctor_id;
