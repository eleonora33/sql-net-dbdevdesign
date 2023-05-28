USE
SEDCHome

CREATE PROCEDURE CreateGrade

(
	@StudentId INT,
	@CourseId INT,
	@TeacherId INT,
	@Grade SmallInt,
	@Comment NVARCHAR(MAX),
	@CreatedDate DATETIME,
	@GradesCount INT OUT,
	@GradesMaximum decimal(18,2) OUT
)
AS
BEGIN

SELECT @GradesCount = COUNT(*)
FROM Grade
WHERE StudentId = @StudentId;

SELECT @GradesMaximum = MAX(TotalGrades)
FROM Grade
WHERE StudentId = @StudentId AND TeacherId = @TeacherId;

INSERT INTO Grade(StudentId,CourseId,TeacherId,[Grade],CreatedDate)
VALUES(@StudentId,@CourseId,@TeacherId,@Grade,@CreatedDate);

END;

DECLARE @Count INT
DECLARE @Maximum INT

EXEC CreateGrade

@StudentId = 4,
@CourseId = 1,
@TeacherId = 2,
@Grade = 2,
@CreatedDate = '2023-05-20',
@GradesCount = @Count OUTPUT,
@GradesMaximum = @Maximum OUTPUT;

SELECT @Count,@Maximum;

CREATE PROCEDURE CreateGradeDetail
(
    @GradeId INT,
    @AchievementTypeId INT,
    @AchievementPoints DECIMAL(10, 2),
    @AchievementMaxPoints DECIMAL(10, 2),
    @AchievementDate DATE,
    @ParticipationRate DECIMAL(10, 2),
    @GradePointsSum DECIMAL(10, 2) OUTPUT
)
AS
BEGIN
    
    INSERT INTO GradeDetail (GradeId, AchievementTypeId, AchievementPoints, AchievementMaxPoints, AchievementDate)
    VALUES (@GradeId, @AchievementTypeId, @AchievementPoints, @AchievementMaxPoints, @AchievementDate);

    SELECT @GradePointsSum = SUM(AchievementPoints / AchievementMaxPoints * @ParticipationRate)
    FROM GradeDetails
    WHERE GradeId = @GradeId;

    SELECT @GradePointsSum AS GradePointsSum;
END;

DECLARE @GradePointsSum DECIMAL(10, 2);

EXEC CreateGradeDetails
    @GradeId = 1,
    @AchievementTypeId = 1,
    @AchievementPoints = 8,
    @AchievementMaxPoints = 10,
    @AchievementDate = '2023-05-28',
    @ParticipationRate = 0.8,
    @GradePointsSum = @GradePointsSum OUTPUT;

SELECT @GradePointsSum AS GradePointsSum;

