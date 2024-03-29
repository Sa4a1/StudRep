SELECT Surname as [Фамилия], Name as [Имя], JobTitle[Должность]
FROM Workers
FULL JOIN JobTitles ON Workers.JobID = JobTitles.ID
FULL JOIN Department ON Workers.WorkerID = Department.DepartmentHeadID
WHERE JobTitle like 'начальник отдела'
