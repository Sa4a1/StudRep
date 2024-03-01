CREATE PROCEDURE Age
     @BirthDate DATE
AS
BEGIN
	DECLARE @Age INT

SET @Age = DATEDIFF(YEAR, @BirthDate, GETDATE())

IF @Age >= 16
    PRINT '������������ ���� 16 ���'
ELSE
    PRINT '������������ ������ 16 ���'
END