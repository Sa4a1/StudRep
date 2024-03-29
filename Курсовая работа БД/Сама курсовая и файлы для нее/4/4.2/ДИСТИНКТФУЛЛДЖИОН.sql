SELECT DISTINCT Surname as [Фамилия], Name as [Имя], JobTitle[Должность]
FROM Workers
FULL JOIN JobTitles ON Workers.JobID = JobTitles.ID;