SELECT COUNT (SUBJECT.SUBJECT)AS ����������_���������_��_�������, PULPIT.PULPIT_NAME AS ���_�������
FROM SUBJECT
JOIN PULPIT ON SUBJECT.PULPIT = PULPIT.PULPIT
GROUP BY PULPIT_NAME
HAVING COUNT (SUBJECT.SUBJECT) <7
