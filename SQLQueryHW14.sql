IF EXISTS (SELECT * FROM sys.databases WHERE name = 'College')
	DROP DATABASE College
	GO
	
CREATE DATABASE College
GO

USE COLLEGE
GO

CREATE TABLE Student(
Student_ID int not null IDENTITY(1,1) CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED,
Student_FName varchar(50) not null,
Student_LName varchar(50) not null,
Student_SSN int not null,
Student_Address varchar(100) null,
Student_City varchar(50) null,
Student_State varchar(20) null,
Student_Zip int,
Student_Phone# varchar(12),
) 

CREATE TABLE Classes (
Classes_ID int not null IDENTITY(1,1) CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED,
Classes_Title varchar(50),
Classes_Number int not null,
Classes_Department varchar(50) not null,
Student_ID int not null CONSTRAINT FK_Classes_Student FOREIGN KEY (Student_ID)
	REFERENCES dbo.Student
)

CREATE TABLE Scores (
Scores_ID int not null IDENTITY(1,1) CONSTRAINT [PK_Scores] PRIMARY KEY CLUSTERED,
Scores_Type varchar(20) not null,
Scores_Description varchar(50) null,
Scores_DateAssigned datetime null,
Scores_DateDue datetime null,
Scores_DateSubmitted datetime null,
Scores_PointsEarned int,
Scores_PointsPossible int,
Classes_ID int not null CONSTRAINT FK_Scores_Classes FOREIGN KEY(Classes_ID) 
	REFERENCES dbo.Classes,
Student_ID int not null CONSTRAINT FK_Scores_Student FOREIGN KEY (Student_ID)
	REFERENCES dbo.Student
)

INSERT INTO Student
Values ('Susie','Studies', 252331234,'326 Smart Street','Clevelend','Ohio',40223,'216-330-4124'),
		('Bob','BrownNoser',445368232,'30315 Elm Street','Pittsburgh','Pennsylvania',88325,'216-123-5679'),
		('Albert','AlwaysLate',567352887,'43 Peach Tree Lane','Richfield','Ohio',77345,'216-568-2231');

INSERT INTO Classes
Values ('Calculus I',201,'Mathematics',1),
		('T-SQL',251,'Computer Science',1),
		('European History',151,'History',1),
		('Beginning French',100,'Language',2),
		('Physics I',150,'Physics',2),
		('CodeAcademy',100,'Workforce',3);

INSERT INTO Scores
Values ('HW','Homework1',
			'01/03/18','01/12/18','01/05/18',100,100,1,1),
		('Quiz','Quiz 1',
			'02/01/18','02/01/18','02/03/18',99,100,1,1),
		('HW','Homework1',
			'02/15/18','02/21/18','02/28/18',95,100,2,2),
		('Exam','Final Exam',
			'03/01/18','03/01/18','03/01/18',75,100,4,3);

SELECT *
FROM Student
LEFT JOIN Classes
ON Student.Student_ID = Classes.Student_ID
LEFT JOIN Scores
ON Scores.Classes_ID = Classes.Classes_ID
--WHERE Student.Student_ID = 1 
ORDER BY Student.Student_ID,Classes.Classes_Title,Scores.Scores_Type;


