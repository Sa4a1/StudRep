 
CREATE TABLE DBIskhakov.dbo.FACULTY(
FACULTY nchar(10) PRIMARY KEY  NOT NULL,
FACULTY_NAME nvarchar(50) DEFAULT '???',
)
ON G2;

CREATE TABLE DBIskhakov.dbo.PROFESSION(
PROFESSION nchar(20) PRIMARY KEY NOT NULL,
FACULTY nchar(10) FOREIGN KEY (FACULTY)  REFERENCES FACULTY(FACULTY) NOT NULL,
PROFESSION_NAME nvarchar(100) NULL,
QUALIFICATION nvarchar(50) NULL
)
ON G2;

CREATE TABLE DBIskhakov.dbo.PULPIT(
PULPIT nchar(20) PRIMARY KEY NOT NULL,
PULPIT_NAME nvarchar(100) NULL,
FACULTY nchar(10) FOREIGN KEY (FACULTY) REFERENCES FACULTY(FACULTY) 
)
ON G2;

CREATE TABLE DBIskhakov.dbo.TECHER(
TECHER char(10) PRIMARY KEY NOT NULL,
TECHER_NAME nvarchar(100) NULL,
PULPIT nchar(20) FOREIGN KEY(PULPIT) REFERENCES PULPIT(PULPIT),
)
ON G3;

CREATE TABLE DBIskhakov.dbo.SUBJECT(
SUBJECT nchar(10) PRIMARY KEY NOT NULL,
SUBJECT_NAME nvarchar(100) UNIQUE NULL,
PULPIT nchar(20) FOREIGN KEY(PULPIT) REFERENCES PULPIT(PULPIT) NOT NULL
)
ON G3;


