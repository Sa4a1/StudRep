SELECT Surname as [Фамилия], Name as [Имя], JobTitle[Должность]
FROM Workers
INNER JOIN JobTitles ON Workers.JobID = JobTitles.ID
WHERE JobTitle = 'техник';