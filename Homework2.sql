USE SEDCHome
GO

SELECT *
FROM Student
WHERE FirstName = 'Antonio'
GO

SELECT *
FROM Student 
WHERE LastName LIKE 'J%' AND EnrolledDate >= '1998-01-01' AND EnrolledDate <= '1998-01-31'
GO

SELECT *
FROM Student
WHERE DateOfBirth >= '1999-01-01'
GO

SELECT *
FROM Student
ORDER BY FirstName
GO

SELECT DISTINCT t.[LastName] AS TeacherLastName, s.[LastName] AS StudentLastName
FROM Teacher t
CROSS JOIN Student s
GO

ALTER TABLE Grade
ADD CONSTRAINT FK_GradeDetails
FOREIGN KEY (GradeDetails_Id)
REFERENCES GradeDetails(gradeDetails_id)

SELECT *
FROM Course
ORDER BY [Name]
GO

SELECT *
FROM AchievementType
GO

SELECT *
FROM Student
GO

SELECT c.[Name] AS CourseName,a.[Name] AS AchievementTypeName
FROM Course c
CROSS JOIN AchievementType a
ORDER BY c.Name
GO

SELECT * 
FROM Teacher
LEFT OUTER JOIN Grade 
ON Grade.TeacherID = Teacher.ID
WHERE Grade.TeacherID IS NULL

SELECT *
FROM Teacher
GO

SELECT *
FROM Grade
GO









