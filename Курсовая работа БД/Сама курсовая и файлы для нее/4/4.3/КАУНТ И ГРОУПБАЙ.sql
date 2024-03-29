SELECT JobTitle as [Должность], COUNT(JobID) as [Количество сотрудников этой должности] 
FROM WOrkers
JOIN JobTitles ON Workers.JobID = JobTitles.ID
GROUP BY JobTitle