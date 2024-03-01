CREATE PROCEDURE  check_email
    @email NVARCHAR(255)
	WITH ENCRYPTION
AS
BEGIN
DECLARE @Value BIT
	if ((SELECT  LEN(@email) - LEN(REPLACE(@email,'@',''))) > 1)
	SET @Value = 0
	else if ((SELECT  LEN(@email) - LEN(REPLACE(@email,'.',''))) > 2) AND (CHARINDEX ('.',@email) = 0)	SET @Value = 0
	else if (CHARINDEX('@',@email) = 0) SET @Value = 0
	else if (CHARINDEX('.',@email) = 0) SET @Value = 0
	else if (CHARINDEX('@',@email,(CHARINDEX('.',@email))+1) = 0)
END