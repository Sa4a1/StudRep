SELECT Surname as [�������], Name as [���], JobTitle[���������]
FROM Workers
FULL JOIN JobTitles ON Workers.JobID = JobTitles.ID
FULL JOIN Department ON Workers.WorkerID = Department.DepartmentHeadID
WHERE JobTitle like '��������� ������'
