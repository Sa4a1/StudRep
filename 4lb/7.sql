SELECT TECHER.TECHER_NAME , FACULTY.FACULTY_NAME
FROM TECHER
JOIN PULPIT ON TECHER.PULPIT = PULPIT.PULPIT
JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
ORDER BY TECHER_NAME