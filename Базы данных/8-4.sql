CREATE PROCEDURE  check_email
    @email NVARCHAR(255)
	WITH ENCRYPTION
AS
BEGIN
    IF @email like '%@%.%'
	PRINT '������ �������� ������� ����������� �����'
	ELSE 
	PRINT '������ �� �������� ������� ����������� �����'
END;