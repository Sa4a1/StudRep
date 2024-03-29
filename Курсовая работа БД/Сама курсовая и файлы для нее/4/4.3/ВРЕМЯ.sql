SELECT RegistrationDate as [Дата заключения сделаки], CONVERT(DATE, CURRENT_TIMESTAMP) as [Текущая дата]
FROM Deal;