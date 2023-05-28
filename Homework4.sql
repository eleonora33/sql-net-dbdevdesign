USE 
SEDCHome

 DECLARE @Firstname NVARCHAR(100)
 SET @Firstname = 'Antonio'

 SELECT *
 FROM Student
 WHERE FirstName = @Firstname
 GO

DECLARE @FemaleStudents TABLE
(StudentId INT, DateOfBirth DATE)

INSERT INTO @FemaleStudents 
SELECT Id, DateOfBirth
FROM Student
WHERE Gender = 'F'

SELECT *
FROM @FemaleStudents
GO

CREATE TABLE #MaleStudents
(LastName NVARCHAR(100), EnrolledDate DATE)

 INSERT INTO #MaleStudents
 SELECT LastName, EnrolledDate
 FROM Student
 WHERE FirstName LIKE 'A%' AND Gender = 'M'

 SELECT *
 FROM #MaleStudents
 WHERE LEN(LastName) = 7
 GO

 SELECT*
 FROM Teacher
 WHERE LEN(FirstName) < 5 
 AND LEFT(FirstName,3) = LEFT(LastName,3)
 GO

