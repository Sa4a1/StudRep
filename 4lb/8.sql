SELECT FACULTY.FACULTY_NAME,COUNT(PULPIT) AS COUNT_PULPIT
FROM PULPIT
JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
GROUP BY FACULTY_NAME
ORDER BY COUNT(PULPIT) DESC