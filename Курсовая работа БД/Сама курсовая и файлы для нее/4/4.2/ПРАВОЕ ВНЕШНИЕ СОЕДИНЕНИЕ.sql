SELECT Surname as [�������], Name as [���], JobTitle[���������]
FROM Workers
RIGHT JOIN JobTitles ON Workers.JobID = JobTitles.ID;