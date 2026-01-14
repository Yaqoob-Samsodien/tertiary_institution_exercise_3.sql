CREATE DATABASE `tertiary_institution_v3`;
USE `tertiary_institution_v3`;

CREATE TABLE student (
student_id INT PRIMARY KEY,
name VARCHAR(100),
major VARCHAR(100),
year_of_study INT
);

INSERT INTO student  (student_id,name,major,year_of_study)VALUES 
(1,'Alice Johnson','Computer Science',2),
(2,'Bob Smith','Mechanical Engineering',3),
(3,'Charlie Brown','Business Asdministartion',1);

CREATE TABLE courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
department VARCHAR(100),
credits INT
);

INSERT INTO courses (course_id,course_name,department,credits) VALUES
(101, 'Introduction to Programming', 'Computer Science', 3),
(102, 'Thermodynamics', 'Mechanical Engineering', 4),
(103, 'Marketing 101', 'Business Administration', 3);

CREATE TABLE enrollments (
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY (student_id) REFERENCES student(student_id),
FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (enrollment_id,student_id,course_id,enrollment_date) VALUES
(1,1,101,'2023-09-01'),
(2,2,102,'2023-09-01'),
(3,3,103,'2023-09-01'),
(4,1,103,'2023-09-02');

SELECT * 
FROM student s
INNER JOIN enrollments e
ON s.student_id = e.student_id
INNER JOIN courses c
ON c.course_id = e.course_id;

SELECT 
s.name,
e.enrollment_date,
c.course_name
FROM student s
INNER JOIN enrollments e
ON s.student_id = e.student_id
INNER JOIN courses c
ON c.course_id = e.course_id;

SELECT 
s.name,
c.course_name,
e.enrollment_date
FROM student s
INNER JOIN enrollments e
ON s.student_id = e.student_id
INNER JOIN courses c
ON c.course_id = e.course_id
ORDER BY enrollment_date DESC;

SELECT * 
FROM student s
INNER JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON c.course_id = e.course_id;



