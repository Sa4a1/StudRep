SELECT SUBJECT_NAME,FACULTY.FACULTY_NAME AS ����������
FROM SUBJECT
JOIN PULPIT ON SUBJECT.PULPIT = PULPIT.PULPIT
JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
WHERE FACULTY.FACULTY = 1
