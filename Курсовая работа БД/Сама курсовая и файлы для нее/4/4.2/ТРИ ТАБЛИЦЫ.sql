SELECT Surname as [Фамилия], Name as [Имя], JobTitle[Должность]
FROM Workers
INNER JOIN JobTitles ON Workers.JobID = JobTitles.ID
INNER JOIN Department ON Workers.WorkerID = Department.DepartmentHeadID
WHERE JobTitle like 'начальник отдела'
