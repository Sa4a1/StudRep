SELECT Факультет, COUNT(Преподователь) as [Количество преподоватлей]
FROM Techears
GROUP BY Факультет