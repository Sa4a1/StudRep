SELECT Surname as [�������], Name as [���], JobTitle[���������]
FROM Workers
INNER JOIN JobTitles ON Workers.JobID = JobTitles.ID
WHERE JobTitle = '������';