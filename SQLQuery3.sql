-- Step 1: Create the Database
CREATE DATABASE SchoolManagementSystem;
GO

-- Step 2: Use the Database
USE SchoolManagementSystem;
GO

-- Step 3: Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    address NVARCHAR(255),
    Email NVARCHAR(255) -- Added as per requirement
);

-- Step 4: Create family_info Table
CREATE TABLE family_info (
    family_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT FOREIGN KEY REFERENCES Students(student_id),
    father_name NVARCHAR(100) NOT NULL,
    father_phone NVARCHAR(15),
    father_email NVARCHAR(255)
);

-- Step 5: Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(255),
    Resource NVARCHAR(255)
);

-- Step 6: Create Classes Table
CREATE TABLE Classes (
    class_id INT PRIMARY KEY IDENTITY(1,1),
    class_code NVARCHAR(50) NOT NULL,
    room_number NVARCHAR(20),
    schedule DATETIME,
    course_id INT FOREIGN KEY REFERENCES Courses(course_id),
    student_id INT FOREIGN KEY REFERENCES Students(student_id)
);

-- Step 7: Create Assignments Table
CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY IDENTITY(1,1),
    assignment_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(255),
    due_date DATE NOT NULL,
    State NVARCHAR(20) CHECK (State IN ('pass', 'failed')),
    student_id INT FOREIGN KEY REFERENCES Students(student_id)
);

-- Step 8: Create attendance Table
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT FOREIGN KEY REFERENCES Students(student_id),
    attendance_date DATE NOT NULL,
    Type_of_absence NVARCHAR(20) CHECK (Type_of_absence IN ('leaving', 'absence', 'late')),
    reason NVARCHAR(255)
);

-- Step 9: Insert Sample Data into Students Table
INSERT INTO Students (name, date_of_birth, address, Email)
VALUES 
('John Doe', '2005-05-15', '123 Main St', 'john.doe@example.com'),
('Jane Smith', '2006-08-20', '456 Elm St', 'jane.smith@example.com'),
('Alice Johnson', '2007-03-10', '789 Oak St', 'alice.johnson@example.com');

-- Step 10: Insert Sample Data into family_info Table
INSERT INTO family_info (student_id, father_name, father_phone, father_email)
VALUES 
(1, 'Michael Doe', '123-456-7890', 'michael.doe@example.com'),
(2, 'Robert Smith', '987-654-3210', 'robert.smith@example.com'),
(3, 'David Johnson', '555-555-5555', 'david.johnson@example.com');

-- Step 11: Insert Sample Data into Courses Table
INSERT INTO Courses (course_name, description, Resource)
VALUES 
('Math', 'Introduction to Algebra', 'Algebra Textbook'),
('Science', 'Basic Physics', 'Physics Lab Manual'),
('History', 'World History', 'History Textbook');

-- Step 12: Insert Sample Data into Classes Table
INSERT INTO Classes (class_code, room_number, schedule, course_id, student_id)
VALUES 
('MATH101', 'Room 101', '2024-01-10 09:00:00', 1, 1),
('SCI101', 'Room 102', '2024-01-10 10:00:00', 2, 2),
('HIST101', 'Room 103', '2024-01-10 11:00:00', 3, 3);

-- Step 13: Insert Sample Data into Assignments Table
INSERT INTO Assignments (assignment_name, description, due_date, State, student_id)
VALUES 
('SQL Assignment', 'Write SQL queries', '2024-01-15', 'pass', 1),
('Math Homework', 'Solve algebra problems', '2024-01-20', 'failed', 2),
('History Essay', 'Write an essay on World War II', '2024-01-25', 'pass', 3);

-- Step 14: Insert Sample Data into attendance Table
INSERT INTO attendance (student_id, attendance_date, Type_of_absence, reason)
VALUES 
(1, '2024-01-01', 'leaving', 'Doctor appointment'),
(2, '2024-01-02', 'absence', 'Family emergency'),
(3, '2024-01-03', 'late', 'Traffic jam');



-- 1

SELECT * 
FROM Students 
WHERE date_of_birth = 'YYYY-MM-DD';

-- 2
SELECT * 
FROM Courses 
WHERE course_name = 'Math';

-- 3
ALTER TABLE Students 
ADD Email VARCHAR(255);

-- 4
INSERT INTO Students (student_id, name, date_of_birth, address, Email)
VALUES (1, 'John Doe', '2005-05-15', '123 Main St', 'john.doe@example.com');

-- 5
SELECT s.* 
FROM Students s
JOIN family_info f ON s.student_id = f.student_id;

-- 6
SELECT s.* 
FROM Students s
JOIN Classes c ON s.student_id = c.student_id
JOIN Courses co ON c.course_id = co.course_id
WHERE co.course_name = 'Math';

-- 7
SELECT s.* 
FROM Students s
JOIN Assignments a ON s.student_id = a.student_id
WHERE a.assignment_name = 'SQL Assignment' AND a.State = 'pass';

--8
SELECT s.* 
FROM Students s
JOIN attendance a ON s.student_id = a.student_id
WHERE a.attendance_date BETWEEN '2024-01-01' AND '2024-01-05'
AND a.Type_of_absence = 'leaving';
