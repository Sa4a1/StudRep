USE [master]
GO
/****** Object:  Database [ProjectOrganization]    Script Date: 29.03.2024 12:44:28 ******/
CREATE DATABASE [ProjectOrganization]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectOrganization', FILENAME = N'D:\Documents\СТУДЕНТЫ\ПИ-32\Урманов\Сопровождение\ProjectOrganization.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectOrganization_log', FILENAME = N'D:\Documents\СТУДЕНТЫ\ПИ-32\Урманов\Сопровождение\ProjectOrganization_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectOrganization].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectOrganization] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectOrganization] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectOrganization] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectOrganization] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectOrganization] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectOrganization] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectOrganization] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectOrganization] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectOrganization] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectOrganization] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectOrganization] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectOrganization] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectOrganization] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectOrganization] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectOrganization] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectOrganization] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectOrganization] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectOrganization] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectOrganization] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectOrganization] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectOrganization] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectOrganization] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectOrganization] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectOrganization] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectOrganization] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectOrganization] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectOrganization] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectOrganization] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectOrganization] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProjectOrganization]
GO
/****** Object:  Table [dbo].[Deals]    Script Date: 29.03.2024 12:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deals](
	[DealID] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[Costs] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Deals] PRIMARY KEY CLUSTERED 
(
	[DealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 29.03.2024 12:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](255) NOT NULL,
	[Floor] [int] NULL,
	[Phone] [varchar](11) NOT NULL,
	[DerpartmentHeadID] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignWorks]    Script Date: 29.03.2024 12:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignWorks](
	[DesignWorkID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[dealID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_DesignWorks] PRIMARY KEY CLUSTERED 
(
	[DesignWorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 29.03.2024 12:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderCode] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitles]    Script Date: 29.03.2024 12:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
 CONSTRAINT [PK_JobTitles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organiztaions]    Script Date: 29.03.2024 12:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organiztaions](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ActivityType] [varchar](255) NOT NULL,
	[Country] [varchar](255) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Street] [varchar](60) NOT NULL,
	[House] [varchar](60) NOT NULL,
	[DirectorName] [varchar](30) NOT NULL,
	[DirectorSurname] [varchar](30) NOT NULL,
	[DirectorPatronymic] [varchar](30) NULL,
 CONSTRAINT [PK_Organiztaions] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 29.03.2024 12:44:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[WorkerID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Patronymic] [varchar](255) NULL,
	[JobID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[GenderCode] [int] NOT NULL,
	[Adress] [varchar](255) NOT NULL,
	[BirthdayDate] [varchar](255) NOT NULL,
	[Phone] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[WorkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Deals]  WITH CHECK ADD  CONSTRAINT [FK_Deals_Organiztaions] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organiztaions] ([OrganizationID])
GO
ALTER TABLE [dbo].[Deals] CHECK CONSTRAINT [FK_Deals_Organiztaions]
GO
ALTER TABLE [dbo].[Deals]  WITH CHECK ADD  CONSTRAINT [FK_Deals_Organiztaions1] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organiztaions] ([OrganizationID])
GO
ALTER TABLE [dbo].[Deals] CHECK CONSTRAINT [FK_Deals_Organiztaions1]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Workers] FOREIGN KEY([DerpartmentHeadID])
REFERENCES [dbo].[Workers] ([WorkerID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Workers]
GO
ALTER TABLE [dbo].[DesignWorks]  WITH CHECK ADD  CONSTRAINT [FK_DesignWorks_Deals] FOREIGN KEY([dealID])
REFERENCES [dbo].[Deals] ([DealID])
GO
ALTER TABLE [dbo].[DesignWorks] CHECK CONSTRAINT [FK_DesignWorks_Deals]
GO
ALTER TABLE [dbo].[DesignWorks]  WITH CHECK ADD  CONSTRAINT [FK_DesignWorks_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[DesignWorks] CHECK CONSTRAINT [FK_DesignWorks_Department]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Department2] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Department2]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([GenderCode])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Gender]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_JobTitles] FOREIGN KEY([JobID])
REFERENCES [dbo].[JobTitles] ([ID])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_JobTitles]
GO
USE [master]
GO
ALTER DATABASE [ProjectOrganization] SET  READ_WRITE 
GO
