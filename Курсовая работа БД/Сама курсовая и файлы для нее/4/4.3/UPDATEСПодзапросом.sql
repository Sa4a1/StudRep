UPDATE Workers
SET Workers.Name ='����'
WHERE Workers.Surname in (SELECT Workers.Surname  FROM Workers WHERE Workers.Surname = '�������')