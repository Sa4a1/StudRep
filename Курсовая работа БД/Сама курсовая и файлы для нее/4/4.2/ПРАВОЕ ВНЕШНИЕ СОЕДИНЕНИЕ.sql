SELECT Surname as [Фамилия], Name as [Имя], JobTitle[Должность]
FROM Workers
RIGHT JOIN JobTitles ON Workers.JobID = JobTitles.ID;