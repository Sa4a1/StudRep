SELECT Surname as [�������], Name as [���], JobTitle[���������]
FROM Workers
INNER JOIN JobTitles ON Workers.JobID = JobTitles.ID
INNER JOIN Department ON Workers.WorkerID = Department.DepartmentHeadID
WHERE JobTitle like '��������� ������'
