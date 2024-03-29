SELECT Surname as [Фамилия], Name as [Имя], JobTitle[Должность]
FROM Workers
LEFT JOIN JobTitles ON Workers.JobID = JobTitles.ID;