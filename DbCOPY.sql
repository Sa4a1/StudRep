USE [master]
GO
/****** Object:  Database [DbIskhakov]    Script Date: 16.11.2023 4:54:06 ******/
CREATE DATABASE [DbIskhakov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbIskhakov', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\DbIskhakov.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [G1] 
( NAME = N'G1', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\G1.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [G2] 
( NAME = N'G2-1', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\G2-1.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
( NAME = N'G2-2', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\G2-2.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [G3] 
( NAME = N'G3-1', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\G3-1.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
( NAME = N'G3-2', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\G3-2.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
( NAME = N'G3-3', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\G3-3.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbIskhakov_log', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\DbIskhakov_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DbIskhakov] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbIskhakov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbIskhakov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbIskhakov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbIskhakov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbIskhakov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbIskhakov] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbIskhakov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbIskhakov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbIskhakov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbIskhakov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbIskhakov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbIskhakov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbIskhakov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbIskhakov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbIskhakov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbIskhakov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbIskhakov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbIskhakov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbIskhakov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbIskhakov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbIskhakov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbIskhakov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbIskhakov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbIskhakov] SET RECOVERY BULK_LOGGED 
GO
ALTER DATABASE [DbIskhakov] SET  MULTI_USER 
GO
ALTER DATABASE [DbIskhakov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbIskhakov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbIskhakov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbIskhakov] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbIskhakov] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DbIskhakov]
GO
/****** Object:  Table [dbo].[AUDITORIUM]    Script Date: 16.11.2023 4:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUDITORIUM](
	[AUDITORIUM] [nchar](20) NULL,
	[AUDITORIUM_NAME] [nchar](10) NOT NULL,
	[AUDITORIUM_CAPACITY] [int] NOT NULL,
	[AUDITORIUM_TYPE] [nvarchar](50) NULL
) ON [G1]
GO
/****** Object:  Table [dbo].[AUDITORIUM_TYPE]    Script Date: 16.11.2023 4:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUDITORIUM_TYPE](
	[AUDITORIUM_TYPE] [nvarchar](50) NOT NULL,
	[AUDITORIUM_TYPE-NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_AUDITORIUM_TYPE] PRIMARY KEY CLUSTERED 
(
	[AUDITORIUM_TYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [G1]
) ON [G1]
GO
/****** Object:  Table [dbo].[FACULTY]    Script Date: 16.11.2023 4:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACULTY](
	[FACULTY] [nchar](10) NOT NULL,
	[FACULTY_NAME] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FACULTY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [G2]
) ON [G2]
GO
/****** Object:  Table [dbo].[LK]    Script Date: 16.11.2023 4:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LK](
	[AUD] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROFESSION]    Script Date: 16.11.2023 4:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFESSION](
	[PROFESSION] [nchar](20) NOT NULL,
	[FACULTY] [nchar](10) NOT NULL,
	[PROFESSION_NAME] [nvarchar](100) NULL,
	[QUALIFICATION] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PROFESSION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [G2]
) ON [G2]
GO
/****** Object:  Table [dbo].[PULPIT]    Script Date: 16.11.2023 4:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PULPIT](
	[PULPIT] [nchar](20) NOT NULL,
	[PULPIT_NAME] [nvarchar](100) NULL,
	[FACULTY] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[PULPIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [G2]
) ON [G2]
GO
/****** Object:  Table [dbo].[SUBJECT]    Script Date: 16.11.2023 4:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBJECT](
	[SUBJECT] [nchar](10) NOT NULL,
	[SUBJECT_NAME] [nvarchar](100) NULL,
	[PULPIT] [nchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SUBJECT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [G3]
) ON [G3]
GO
/****** Object:  Table [dbo].[TECHER]    Script Date: 16.11.2023 4:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TECHER](
	[TECHER] [char](10) NOT NULL,
	[TECHER_NAME] [nvarchar](100) NULL,
	[PULPIT] [nchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TECHER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [G3]
) ON [G3]
GO
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'103-4               ', N'103-4     ', 80, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'105-4               ', N'105-4     ', 80, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'107-4               ', N'107-4     ', 80, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'110-4               ', N'110-4     ', 80, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'111-4               ', N'111-4     ', 50, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'114-4               ', N'114-4     ', 70, N'ЛК-К')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'131-4               ', N'131-4     ', 20, N'ЛБ-К')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'132-4               ', N'132-4     ', 80, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'137-4               ', N'13-4      ', 50, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'200-3а              ', N'200-3а    ', 140, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'229-4               ', N'229-4     ', 80, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'236-1               ', N'236-1     ', 80, N'ЛК-К')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'2Б-4                ', N'2Б-4      ', 100, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'301-1               ', N'301-1     ', 20, N'ЛБ-СК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'304-4               ', N'304-4     ', 20, N'ЛБ-К')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'305-4               ', N'305-4     ', 110, N'ЛБ-К')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'309-1               ', N'309-1     ', 22, N'ЛБ-СК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'310а-1              ', N'310а-1    ', 20, N'ЛБ-К')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'313-1               ', N'313-1     ', 85, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'314-4               ', N'314-4     ', 80, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'320-4               ', N'320-4     ', 80, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'324-1               ', N'324-1     ', 90, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'408-2               ', N'408-2     ', 80, N'ЛБК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'410-3а              ', N'410-3а    ', 20, N'ЛБ-Х')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'413-1               ', N'413-1     ', 20, N'ЛБ-К')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'415-1               ', N'322-3     ', 22, N'ЛБ-Х')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'423-1               ', N'423-1     ', 20, N'ЛБ-К')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'429-4               ', N'429-4     ', 80, N'ЛК')
INSERT [dbo].[AUDITORIUM] ([AUDITORIUM], [AUDITORIUM_NAME], [AUDITORIUM_CAPACITY], [AUDITORIUM_TYPE]) VALUES (N'5-1                 ', N'5-1       ', 60, N'ЛК')
GO
INSERT [dbo].[AUDITORIUM_TYPE] ([AUDITORIUM_TYPE], [AUDITORIUM_TYPE-NAME]) VALUES (N'ЛБ-К                ', N'Компьютерный класс')
INSERT [dbo].[AUDITORIUM_TYPE] ([AUDITORIUM_TYPE], [AUDITORIUM_TYPE-NAME]) VALUES (N'ЛБ-СК               ', N'Специализированный компьютерный класс')
INSERT [dbo].[AUDITORIUM_TYPE] ([AUDITORIUM_TYPE], [AUDITORIUM_TYPE-NAME]) VALUES (N'ЛБ-Х                ', N'Химическая лаборатория')
INSERT [dbo].[AUDITORIUM_TYPE] ([AUDITORIUM_TYPE], [AUDITORIUM_TYPE-NAME]) VALUES (N'ЛК                  ', N'Лекционная аудитория')
INSERT [dbo].[AUDITORIUM_TYPE] ([AUDITORIUM_TYPE], [AUDITORIUM_TYPE-NAME]) VALUES (N'ЛК-К                ', N'Лекционная аудитория с компьютерами')
GO
INSERT [dbo].[FACULTY] ([FACULTY], [FACULTY_NAME]) VALUES (N'1         ', N'Юридический факультет')
INSERT [dbo].[FACULTY] ([FACULTY], [FACULTY_NAME]) VALUES (N'2         ', N'Финансово-экономический факультет')
GO
INSERT [dbo].[LK] ([AUD]) VALUES (N'103-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'105-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'107-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'110-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'111-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'132-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'137-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'200-3а              ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'229-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'2Б-4                ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'313-1               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'314-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'320-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'324-1               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'429-4               ')
INSERT [dbo].[LK] ([AUD]) VALUES (N'5-1                 ')
GO
INSERT [dbo].[PROFESSION] ([PROFESSION], [FACULTY], [PROFESSION_NAME], [QUALIFICATION]) VALUES (N'1                   ', N'1         ', N' Юриспруденция', N'Бакалавриат')
INSERT [dbo].[PROFESSION] ([PROFESSION], [FACULTY], [PROFESSION_NAME], [QUALIFICATION]) VALUES (N'2                   ', N'1         ', N'Политология', N'Бакалавриат')
INSERT [dbo].[PROFESSION] ([PROFESSION], [FACULTY], [PROFESSION_NAME], [QUALIFICATION]) VALUES (N'3                   ', N'2         ', N'Экономика', N'Бакалавриат')
INSERT [dbo].[PROFESSION] ([PROFESSION], [FACULTY], [PROFESSION_NAME], [QUALIFICATION]) VALUES (N'4                   ', N'2         ', N' Менеджмент', N'Бакалавриат')
INSERT [dbo].[PROFESSION] ([PROFESSION], [FACULTY], [PROFESSION_NAME], [QUALIFICATION]) VALUES (N'5                   ', N'2         ', N'  Прикладная информатика', N'Бакалавриат')
INSERT [dbo].[PROFESSION] ([PROFESSION], [FACULTY], [PROFESSION_NAME], [QUALIFICATION]) VALUES (N'6                   ', N'2         ', N' Социально-культурная деятельность', N'Бакалавриат')
INSERT [dbo].[PROFESSION] ([PROFESSION], [FACULTY], [PROFESSION_NAME], [QUALIFICATION]) VALUES (N'7                   ', N'2         ', N'Кафедра не является выпускающей', N'Бакалавриат')
GO
INSERT [dbo].[PULPIT] ([PULPIT], [PULPIT_NAME], [FACULTY]) VALUES (N'1                   ', N'Кафедра уголовного права, процесса и цивилистики', N'1         ')
INSERT [dbo].[PULPIT] ([PULPIT], [PULPIT_NAME], [FACULTY]) VALUES (N'2                   ', N'Кафедра политологии, истории, теории государства и права', N'1         ')
INSERT [dbo].[PULPIT] ([PULPIT], [PULPIT_NAME], [FACULTY]) VALUES (N'3                   ', N'Кафедра экономики и информационных технологий', N'2         ')
INSERT [dbo].[PULPIT] ([PULPIT], [PULPIT_NAME], [FACULTY]) VALUES (N'4                   ', N'Кафедра гуманитарных дисциплин и профсоюзного движения', N'2         ')
GO
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'1         ', N'Адвокатура', N'1                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'10        ', N'История России ', N'2                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'11        ', N'Гражданский процесс', N'3                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'12        ', N'Государственные и муниципальные финансы', N'3                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'13        ', N'Дискретная математика', N'3                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'14        ', N'Информатика', N'3                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'15        ', N'Информатика и информационные технологии в профессиональной', N'3                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'16        ', N'Информатика и программирование', N'3                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'17        ', N'Безопасность жизнедеятельности', N'4                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'18        ', N'География', N'4                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'19        ', N'Деловой иностранный язык', N'4                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'2         ', N'Административное право', N'1                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'20        ', N'Договоры о труде в сфере действия трудового права', N'4                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'21        ', N'Основы безопасности жизнедеятельности', N'4                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'22        ', N'Основы профсоюзного движения', N'4                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'23        ', N'Правовые основы социального страхования', N'4                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'24        ', N'Конституционное право зарубежных стран ', N'2                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'3         ', N'Арбитражный процесс', N'1                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'4         ', N'Жилищное право', N'1                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'5         ', N'Гражданское право', N'1                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'6         ', N'История', N'2                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'7         ', N'История государства и права зарубежных стран', N'2                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'8         ', N'История государства и права России ', N'2                   ')
INSERT [dbo].[SUBJECT] ([SUBJECT], [SUBJECT_NAME], [PULPIT]) VALUES (N'9         ', N'История политических и правовых учений', N'2                   ')
GO
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'1         ', N'Ананичева Наталья Андреевна', N'1                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'10        ', N'Габдулхаков Рамзиль Борисович', N'2                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'11        ', N'Иксанов Радмир Аузагиевич', N'2                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'12        ', N'Нигматуллина Танзиля Алтафовна', N'2                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'13        ', N'Самситдинов Ильфат Закиевич', N'2                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'14        ', N'Тимербулатов Тагир Алифович', N'2                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'15        ', N'Аввакумов Алексей Алексеевич', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'16        ', N'Ахтямова Гульгина Раисовна', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'17        ', N'Быстров Александр Ильич', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'18        ', N'Ганиева Розалия Финатовна', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'19        ', N'Гильмутдинов Риф Забирович', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'2         ', N'Валеев Руслан Мунирович', N'1                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'20        ', N'Дидык Татьяна Геннадьевна', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'21        ', N'Исхаков Алмаз Раилевич', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'22        ', N'Миниярова Лилия Вансеттаевна', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'23        ', N'Низамова Алсу Илюсовна', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'24        ', N'Нигматуллин Ирек Газизович', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'25        ', N'Хасанов Зимфир Махмутович', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'26        ', N'Хасанова Наталья Владимировна', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'27        ', N'Шишков Иван Сергеевич', N'3                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'28        ', N'Аверьянов Владимир Васильевич', N'4                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'29        ', N'Валеев Руслан Мунирович', N'4                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'3         ', N'Зибаева Елена Георгиевна', N'1                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'30        ', N'Зубаирова Кадрия Хурматовна', N'4                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'31        ', N'Коптюх Альбина Галимулловна', N'4                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'32        ', N'Кудашева Алина Булатовна', N'4                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'33        ', N'Латыпова Элина Рустемовна', N'4                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'34        ', N'Марушина Наэля Мидхатовна', N'4                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'35        ', N'Нигматуллин Дамир Ирекович', N'4                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'36        ', N'Сафина Динара Амировна', N'4                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'37        ', N'Сираева Эльвина Рауфовна', N'4                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'4         ', N'Каюмова Гузель Ильфатовна', N'1                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'5         ', N'Латыпова Светлана Рифовна', N'1                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'6         ', N'Мухортов Анатолий Александрович', N'1                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'7         ', N'Пахомов Александр Николаевич', N'1                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'8         ', N'Филиппова Елена Вячиславовна', N'1                   ')
INSERT [dbo].[TECHER] ([TECHER], [TECHER_NAME], [PULPIT]) VALUES (N'9         ', N'Шишков Иван Сергеевич', N'1                   ')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SUBJECT__29B3CFA7D666CF7A]    Script Date: 16.11.2023 4:54:06 ******/
ALTER TABLE [dbo].[SUBJECT] ADD UNIQUE NONCLUSTERED 
(
	[SUBJECT_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [G3]
GO
ALTER TABLE [dbo].[AUDITORIUM] ADD  CONSTRAINT [DF_AUDITORIUM_AUDITORIUM_CAPACITY]  DEFAULT ((1)) FOR [AUDITORIUM_CAPACITY]
GO
ALTER TABLE [dbo].[FACULTY] ADD  DEFAULT ('???') FOR [FACULTY_NAME]
GO
ALTER TABLE [dbo].[PROFESSION]  WITH CHECK ADD FOREIGN KEY([FACULTY])
REFERENCES [dbo].[FACULTY] ([FACULTY])
GO
ALTER TABLE [dbo].[PULPIT]  WITH CHECK ADD FOREIGN KEY([FACULTY])
REFERENCES [dbo].[FACULTY] ([FACULTY])
GO
ALTER TABLE [dbo].[SUBJECT]  WITH CHECK ADD FOREIGN KEY([PULPIT])
REFERENCES [dbo].[PULPIT] ([PULPIT])
GO
ALTER TABLE [dbo].[TECHER]  WITH CHECK ADD FOREIGN KEY([PULPIT])
REFERENCES [dbo].[PULPIT] ([PULPIT])
GO
ALTER TABLE [dbo].[AUDITORIUM]  WITH CHECK ADD  CONSTRAINT [CK_CAPACITY] CHECK  (([AUDITORIUM_CAPACITY]>=(1) AND [AUDITORIUM_CAPACITY]<=(300)))
GO
ALTER TABLE [dbo].[AUDITORIUM] CHECK CONSTRAINT [CK_CAPACITY]
GO
USE [master]
GO
ALTER DATABASE [DbIskhakov] SET  READ_WRITE 
GO
