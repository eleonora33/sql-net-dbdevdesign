USE 
SEDCHome

--Calculate the count of all grades per Teacher in the system

SELECT*
FROM Teacher
GO

SELECT*
FROM Grade
GO

SELECT t.[FirstName], COUNT(g.Grade) AS TotalGrade
FROM Grade g
INNER JOIN Teacher t ON t.Id = g.TeacherId
GROUP BY t.[FirstName];
GO

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT t.FirstName,LastName, COUNT (g.Grade) AS Total,g.StudentId
FROM Grade g
INNER JOIN Teacher t
ON t.ID = g.TeacherID
WHERE StudentID < 100
GROUP BY t.FirstName,LastName,g.StudentID

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT s.FirstName,LastName, MAX(g.Grade) AS MaximalGrade,AVG(g.Grade) AS AverageGrade
FROM Grade g
INNER JOIN Student s
ON s.Id = g.StudentId
GROUP BY s.FirstName,LastName
GO

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then
--200

SELECT t.FirstName,LastName,COUNT(g.Grade) AS TotalGrade
FROM Teacher T
INNER JOIN Grade g
ON g.TeacherID = t.ID
GROUP BY t.FirstName,LastName
HAVING COUNT(g.Grade) > 200
GO

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the
--system. Filter only records where Maximal Grade is equal to Average Grade

SELECT s.FirstName,LastName,COUNT(g.Grade) AS TotalGrade,MAX(g.Grade) AS MaximalGrade,AVG(g.Grade) AS AverageGrade
FROM Grade g
INNER JOIN Student s
ON s.ID = g.StudentID
GROUP BY s.FirstName,LastName
HAVING MAX(g.Grade) = AVG(g.Grade)

--List Student First Name and Last Name next to the other details from previous query

SELECT s.FirstName, s.LastName, COUNT(g.Grade) AS TotalGrade, MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade
FROM Grade g
INNER JOIN Student s ON s.ID = g.StudentID
GROUP BY s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade);

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

CREATE VIEW vv_StudentGrade
AS
SELECT StudentId,COUNT(g.Grade) AS TotalGrade
FROM Grade g
GROUP BY StudentID
GO

SELECT *
FROM vv_StudentGrade
GO

--Change the view to show Student First and Last Names instead of StudentID

ALTER VIEW vv_StudentGrade
AS
SELECT s.FirstName,LastName,COUNT(g.Grade) AS TotalGrade
FROM Grade g
INNER jOIN Student s
ON g.StudentID = s.ID
GROUP BY s.FirstName,LastName
GO

SELECT *
FROM vv_StudentGrade
GO

--List all rows from view ordered by biggest Grade Coun

SELECT *
FROM vv_StudentGrade
ORDER BY TotalGrade ASC
GO

























