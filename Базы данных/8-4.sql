CREATE PROCEDURE  check_email
    @email NVARCHAR(255)
	WITH ENCRYPTION
AS
BEGIN
    IF @email like '%@%.%'
	PRINT 'Строка является адресом электронной почти'
	ELSE 
	PRINT 'Строка не является адресом электронной почти'
END;