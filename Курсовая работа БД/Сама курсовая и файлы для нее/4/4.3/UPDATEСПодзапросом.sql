UPDATE Workers
SET Workers.Name ='Даша'
WHERE Workers.Surname in (SELECT Workers.Surname  FROM Workers WHERE Workers.Surname = 'Иванова')