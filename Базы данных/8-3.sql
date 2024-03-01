CREATE PROCEDURE Age
     @BirthDate DATE
AS
BEGIN
	DECLARE @Age INT

SET @Age = DATEDIFF(YEAR, @BirthDate, GETDATE())

IF @Age >= 16
    PRINT 'Пользователю есть 16 лет'
ELSE
    PRINT 'Пользователю меньше 16 лет'
END