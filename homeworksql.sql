USE SEDCACADEMYDB

CREATE TABLE Student(
ID int NOT NULL,
FirstName nvarchar(20) NOT NULL,
LastName nvarchar(20) NOT NULL,
DateOfBirth date NOT NULL,
EnrolledDate date NOT NULL,
Gender nchar(1) NULL,
NationalIdNumber int NOT NULL,
StudentCardNumber int NOT NULL
)

ALTER TABLE Student
ADD ID INT IDENTITY(1,1)

CREATE TABLE Teacher(
ID int NOT NULL,
FirstName nvarchar(20) NOT NULL,
LastName nvarchar(20) NOT NULL,
DateofBirth date NOT NULL,
AcademicRank nvarchar(10) NOT NULL,
HireDate date NOT NULL
)

ALTER TABLE Teacher
ADD ID INT IDENTITY(1,1)

CREATE TABLE Grade(
ID int NOT NULL,
StudentId int NOT NULL,
CourseId int NOT NULL,
TeacherId int NOT NULL,
Grade int NOT NULL,
Comment nvarchar(MAX) NULL,
CreatedDate date NOT NULL
)

ALTER TABLE Grade
ADD ID INT IDENTITY(1,1)

CREATE TABLE Course(
ID int NOT NULL,
[Name] nvarchar(20) NOT NULL,
Credit int NOT NULL,
AcademicYear date NOT NULL,
Semester int NOT NULL
)

ALTER TABLE Course
ADD ID INT IDENTITY(1,1)

CREATE TABLE GradeDetails(
ID int NOT NULL,
GradeId int NOT NULL,
AchievementTypeId int NOT NULL,
AchievementMaxPoints int NOT NULL,
AchevementDate date NOT NULL
)

ALTER TABLE GradeDetails
ADD ID INT IDENTITY(1,1)

CREATE TABLE AchievementType(
Id int NOT NULL,
[Name] nvarchar(20) NOT NULL,
[Description] nvarchar(MAX) NOT NULL,
ParticipationRate nchar(1) NOT NULL
)