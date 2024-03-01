CREATE PROCEDURE Season
@input_date DATE
as
BEGIN 
SET DATEFORMAT dmy;
if MONTH(@input_date) IN (12,1,2) PRINT 'ЗИМА';
if MONTH(@input_date) IN (3,4,5) PRINT 'Весна';
if MONTH(@input_date) IN (6,7,8) PRINT 'Лето';
if MONTH(@input_date) IN (9,10,11) PRINT 'ОСЕНЬ';
END;