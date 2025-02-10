create database  SchoolSystem;


CREATE TABLE Teachers (
    ID INT PRIMARY KEY , 
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE 
    
);


CREATE TABLE TeacherDetails (
    ID INT PRIMARY KEY ,
    Address NVARCHAR(255),
    PhoneNumber NVARCHAR(20),
    Qualification NVARCHAR(100),
	TeacherID INT NOT NULL,
    FOREIGN KEY  (TeacherID)  REFERENCES Teachers(ID) 
);


CREATE TABLE Courses (
    ID INT PRIMARY KEY ,
    CourseName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(ID)
);


CREATE TABLE Students (
	ID INT PRIMARY KEY ,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL
   
);


CREATE TABLE StudentCourses (
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
	FOREIGN KEY (StudentID)		references Students(ID),
	FOREIGN KEY (COURSEID) REFERENCES COURSES(ID)



);

INSERT INTO Teachers (ID, FirstName, LastName, Email) VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Robert', 'Brown', 'robert.brown@example.com'),
(4, 'Emily', 'Johnson', 'emily.johnson@example.com'),
(5, 'Michael', 'Williams', 'michael.williams@example.com');


INSERT INTO TeacherDetails (ID, Address, PhoneNumber, Qualification, TeacherID) VALUES
(1, '123 Maple St, Springfield', '123-456-7890', 'PhD in Mathematics', 1),
(2, '456 Oak St, Springfield', '234-567-8901', 'MSc in Physics', 2),
(3, '789 Pine St, Springfield', '345-678-9012', 'MA in Literature', 3),
(4, '321 Birch St, Springfield', '456-789-0123', 'PhD in Chemistry', 4),
(5, '654 Cedar St, Springfield', '567-890-1234', 'MEd in Education', 5);


INSERT INTO Courses (ID, CourseName, Description, TeacherID) VALUES
(101, 'Mathematics 101', 'Introduction to Algebra and Calculus', 1),
(102, 'Physics 201', 'Mechanics and Thermodynamics', 2),
(103, 'English Literature', 'Study of classic English literature', 3),
(104, 'Organic Chemistry', 'Fundamentals of organic reactions', 4),
(105, 'Educational Psychology', 'Understanding student learning processes', 5);


INSERT INTO Students (ID, FirstName, LastName, Email) VALUES
(1, 'Alice', 'Green', 'alice.green@studentmail.com'),
(2, 'Bob', 'White', 'bob.white@studentmail.com'),
(3, 'Charlie', 'Black', 'charlie.black@studentmail.com'),
(4, 'Diana', 'Blue', 'diana.blue@studentmail.com'),
(5, 'Edward', 'Grey', 'edward.grey@studentmail.com');


INSERT INTO StudentCourses (StudentID, CourseID) VALUES
(1, 101),  -- Alice enrolled in Mathematics 101
(1, 102),  -- Alice enrolled in Physics 201
(2, 101),  -- Bob enrolled in Mathematics 101
(2, 103),  -- Bob enrolled in English Literature
(3, 104),  -- Charlie enrolled in Organic Chemistry
(3, 105),  -- Charlie enrolled in Educational Psychology
(4, 102),  -- Diana enrolled in Physics 201
(4, 103),  -- Diana enrolled in English Literature
(5, 105),  -- Edward enrolled in Educational Psychology
(5, 101);  -- Edward enrolled in Mathematics 101


SELECT * FROM Teachers;
SELECT * FROM TeacherDetails;
SELECT * FROM Courses;
SELECT * FROM Students;
SELECT * FROM StudentCourses;

