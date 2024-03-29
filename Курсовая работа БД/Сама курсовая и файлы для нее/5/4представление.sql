CREATE VIEW FourthView
as
SELECT Cost as [Цена проектной работы], (Cost/7.7) as [Сумма полученная после оплаты налогов]
FROM Deal;
