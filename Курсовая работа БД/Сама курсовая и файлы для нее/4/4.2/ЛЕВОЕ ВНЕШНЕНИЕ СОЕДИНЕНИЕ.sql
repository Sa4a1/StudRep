SELECT Surname as [�������], Name as [���], JobTitle[���������]
FROM Workers
LEFT JOIN JobTitles ON Workers.JobID = JobTitles.ID;