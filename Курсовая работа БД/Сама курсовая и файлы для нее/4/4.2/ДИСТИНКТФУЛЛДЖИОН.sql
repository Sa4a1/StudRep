SELECT DISTINCT Surname as [�������], Name as [���], JobTitle[���������]
FROM Workers
FULL JOIN JobTitles ON Workers.JobID = JobTitles.ID;