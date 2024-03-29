SELECT Workers.Surname as Фамилия ,Workers.Name as Имя 
FROM Workers
WHERE Workers.GenderCode like 'м' OR Workers.DepartmentID = 2;
