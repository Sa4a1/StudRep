SELECT JobTitle as [���������], COUNT(JobID) as [���������� ����������� ���� ���������] 
FROM WOrkers
JOIN JobTitles ON Workers.JobID = JobTitles.ID
GROUP BY JobTitle