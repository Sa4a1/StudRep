SELECT FACULTY.FACULTY_NAME , COUNT(TECHER)AS TEACH_COUNT
FROM TECHER
JOIN PULPIT ON TECHER.PULPIT =PULPIT.PULPIT
JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
GROUP BY FACULTY_NAME
ORDER BY COUNT(TECHER) DESC