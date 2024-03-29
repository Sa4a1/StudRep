SELECT Workers.Surname as Фамилия ,Workers.Name as Имя 
FROM Workers
WHERE Workers.GenderCode like 'ж' AND Workers.DepartmentID = 1 OR Workers.DepartmentID = 2;
