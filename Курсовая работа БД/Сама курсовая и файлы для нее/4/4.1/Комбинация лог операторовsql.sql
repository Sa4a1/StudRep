SELECT Workers.Surname as ������� ,Workers.Name as ��� 
FROM Workers
WHERE Workers.GenderCode like '�' AND Workers.DepartmentID = 1 OR Workers.DepartmentID = 2;
