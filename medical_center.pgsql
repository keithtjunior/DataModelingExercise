DROP DATABASE IF EXISTS medical_center WITH (FORCE);

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  primary_doctor_id INTEGER REFERENCES doctors
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
  doctor_id INTEGER REFERENCES doctors,
  date_time TIMESTAMP DEFAULT NOW()
);

CREATE TABLE doctor_patient_relationships (
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE illnesses (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE patient_diagnoses (
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
  illness_id INTEGER REFERENCES illnesses,
  diagnosed_by INTEGER REFERENCES doctors,
  diagnosis_date DATE DEFAULT NOW()
);

INSERT INTO doctors
  (first_name, last_name)
  VALUES
  ('Stephen', 'Strange'),
  ('Heinz', 'Doofenshmirtz'),
  ('Dana', 'Scully'),
  ('John', 'Dorian');

INSERT INTO patients
  (first_name, last_name, primary_doctor_id)
  VALUES
  ('John', 'Doe', 1),
  ('Jane', 'Doe', 3),
  ('Patient', 'Zero', 1),
  ('Patient', 'X', 3),
  ('Ann', 'Chovey', 4),
  ('Rio', 'Bacon', 2),
  ('Teri', 'Dactyl', 2),
  ('Frank', 'Furter', 4);

INSERT INTO visits
  (patient_id, doctor_id, date_time)
  VALUES
  (1, 1, '2023-1-1 9:00:00'),
  (3, 1, '2023-2-2 9:30:00'),
  (6, 2, '2023-3-3 10:00:00'),
  (7, 2, '2023-4-4 10:30:00'),
  (2, 3, '2023-5-5 11:00:00'),
  (4, 3, '2023-6-6 11:30:00'),
  (5, 4, '2023-7-7 12:00:00'),
  (8, 4, '2023-8-8 12:30:00'),
  (1, 1, '2023-9-9 1:00:00'),
  (6, 2, '2023-10-10 1:30:00'),
  (2, 3, '2023-11-11 2:00:00'),
  (5, 4, '2023-12-12 2:30:00');

INSERT INTO doctor_patient_relationships
  (doctor_id, patient_id)
  VALUES
  (1, 1),
  (1, 1),
  (1, 1),
  (1, 3),
  (2, 6),
  (2, 7),
  (3, 2),
  (3, 4),
  (4, 5),
  (4, 8);

INSERT INTO illnesses
  (name)
  VALUES
  ('Allergies'),
  ('Common Cold'),
  ('Flu'),
  ('Arthritis'),
  ('Sinus Infection'),
  ('Ear Infection');

INSERT INTO patient_diagnoses
  (patient_id, illness_id, diagnosed_by, diagnosis_date)
  VALUES
  (2, 2, 3, '2023-9-10'),
  (4, 5, 3, '2023-6-8'),
  (4, 6, 3, '2023-6-8'),
  (7, 1, 1,  '2023-4-4'),
  (8, 3, 4,  '2023-8-8');