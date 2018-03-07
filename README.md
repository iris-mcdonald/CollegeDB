# CollegeDB
HW 14 Database Design
Objective: Create a SQL script for creating a database(DB) for tracking student courses and grades.

DB Name = College

Student: FName, LName, SSN(int), address, city, state, zip(int), phone# (int)
  Classes: Title(Algebra I), number(101), department (i.e. Math)
      Scores: Type(HW, quiz, exam, lab), Description, date assigned, date due, date submitted, 
points earned(int), points possible(int).

Populate all tables with minimum 3 records each using random data.

Naming Convention
•	Table names will be plural
•	Every table will have an “ID” field as a primary key (identity(1,1)) and clustered index
•	Use foreign keys to enforce referential integrity.  Also, please follow the format TableName_FieldName
•	Dates will be datetime type

Submission: 
1.	Due March 8, 2018 9:00 AM
2.	Create “CollegeDB” repository in GitHub where all project files will be stored.
3.	Email a publicly accessible GitHub link to samnasr@live.com with “CollegeDB” in the subject line.  
