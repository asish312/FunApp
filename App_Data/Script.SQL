USE [master]
GO
/****** Object:  Database [DBQuiz]    Script Date: 2/6/2022 7:26:28 PM ******/
CREATE DATABASE [DBQuiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBQuiz', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBQuiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBQuiz_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBQuiz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBQuiz] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBQuiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBQuiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBQuiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBQuiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBQuiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBQuiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBQuiz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBQuiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBQuiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBQuiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBQuiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBQuiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBQuiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBQuiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBQuiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBQuiz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBQuiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBQuiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBQuiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBQuiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBQuiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBQuiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBQuiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBQuiz] SET RECOVERY FULL 
GO
ALTER DATABASE [DBQuiz] SET  MULTI_USER 
GO
ALTER DATABASE [DBQuiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBQuiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBQuiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBQuiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBQuiz] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBQuiz', N'ON'
GO
ALTER DATABASE [DBQuiz] SET QUERY_STORE = OFF
GO
USE [DBQuiz]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 2/6/2022 7:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[AnswerText] [varchar](max) NULL,
	[QuestionID] [int] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Choices]    Script Date: 2/6/2022 7:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choices](
	[ChoiceID] [int] IDENTITY(1,1) NOT NULL,
	[ChoiceText] [varchar](max) NULL,
	[QuestionID] [int] NULL,
 CONSTRAINT [PK_Choices] PRIMARY KEY CLUSTERED 
(
	[ChoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 2/6/2022 7:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[UserID] [int] NULL,
	[GroupName] [varchar](50) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2/6/2022 7:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [varchar](max) NULL,
	[QuizID] [int] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 2/6/2022 7:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[QuizName] [varchar](80) NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizUserAnswer]    Script Date: 2/6/2022 7:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizUserAnswer](
	[SubmissionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NULL,
	[AnswerID] [int] NULL,
	[IsRight] [bit] NULL,
	[AnswerTime] [datetime] NULL,
	[IsAnswered] [bit] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_QuizUserAnswer] PRIMARY KEY CLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 2/6/2022 7:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[UserID] [int] NULL,
	[GID] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/6/2022 7:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NULL,
	[ProfilImage] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [varchar](1) NULL,
	[Team] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Hobbies] [varchar](100) NULL,
	[Skillsets] [varchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answers] ON 

INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (1, N'Value types', 1)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (2, N'All of the above', 2)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (3, N'ToDouble', 3)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (4, N'is', 4)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (5, N'Private', 5)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (6, N'false', 6)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (7, N'View created with model class', 7)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (8, N'Reusable view', 8)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (9, N'Global.asax', 9)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (10, N'@', 10)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (11, N'TempData', 11)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (12, N'XMLResult', 12)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (13, N'SIX', 13)
INSERT [dbo].[Answers] ([AnswerID], [AnswerText], [QuestionID]) VALUES (1016, N'The match', 1016)
SET IDENTITY_INSERT [dbo].[Answers] OFF
GO
SET IDENTITY_INSERT [dbo].[Choices] ON 

INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (1, N'Value types', 1)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (2, N'Reference types', 1)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (3, N'Pointer types', 1)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (4, N'All of the above.', 1)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (5, N'The value types directly contain data.', 2)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (6, N' int, char, and float, which stores numbers, alphabets, and floating point numbers, respectively are value types.', 2)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (7, N'When you declare an int type, the system allocates memory to store the value.', 2)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (8, N'All of the above', 2)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (9, N'ToDecimal', 3)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (10, N'ToDouble', 3)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (11, N'ToInt16', 3)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (12, N'ToInt32', 3)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (13, N'?:', 4)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (14, N'is', 4)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (15, N'as', 4)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (16, N' *', 4)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (17, N'Public', 5)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (18, N'Private', 5)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (19, N'Protected', 5)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (20, N'Internal', 5)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (21, N'true', 6)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (22, N'false', 6)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (23, N'View created with model class', 7)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (24, N'View having same name as class', 7)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (25, N'View created with strong keyword', 7)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (26, N'View created with controller', 7)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (27, N'Its the resource file for a view', 8)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (28, N'View that has strongly-type models', 8)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (29, N'Same as MasterPage in asp.net', 8)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (30, N'Reusable view', 8)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (31, N'Controller', 9)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (32, N'Web.config', 9)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (33, N'Global.asax', 9)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (34, N'None of the Above', 9)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (35, N'!', 10)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (36, N'@', 10)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (37, N'<%:%>', 10)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (38, N')', 10)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (39, N'Session', 11)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (40, N'ViewData', 11)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (41, N'ViewBag', 11)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (42, N'TempData', 11)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (43, N'ViewResult', 12)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (44, N'JsonResult', 12)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (45, N'XMLResult', 12)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (46, N'EmptyResult', 12)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (47, N'SIX', 13)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (48, N'TWO', 13)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (1047, N'FOUR', 13)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (1048, N'THREE', 13)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (1051, N'A fire to warm you up', 1016)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (1052, N'The stove', 1016)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (1053, N'The match', 1016)
INSERT [dbo].[Choices] ([ChoiceID], [ChoiceText], [QuestionID]) VALUES (1054, N'None of the above', 1016)
SET IDENTITY_INSERT [dbo].[Choices] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (1, N'Which of the following variable types can be assigned a value directly in C#?', 1)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (2, N'Which of the following is correct about value type variables in C#?', 1)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (3, N'Which of the following converts a type to a double type in C#?', 1)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (4, N'Which of the following operator determines whether an object is of a certain type in C#?', 1)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (5, N'Which of the following access specifier in C# allows a class to hide its member variables and member functions from other functions and objects?', 1)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (6, N'C# supports multiple inheritance.', 1)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (7, N'What is strongly typed view in MVC', 2)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (8, N'What are partial views in MVC', 2)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (9, N'Where are routes registred in ASP.NET MVC Application', 2)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (10, N'Which of the following represents RAZOR syntax ?', 2)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (11, N'------------- dictionary is used to share data between controller actions', 2)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (12, N'Which is not a type of result in MVC', 2)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (13, N'If you have six fish and half of them die from drowning, how many do you have?', 3)
INSERT [dbo].[Questions] ([QuestionID], [QuestionText], [QuizID]) VALUES (1016, N'You''re sitting in a cabin in the dark and cold and you are hungry. You have only one match. What do you light first?', 3)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([QuizID], [QuizName]) VALUES (1, N'Programming C#')
INSERT [dbo].[Quiz] ([QuizID], [QuizName]) VALUES (2, N'Developing ASP.NET MVC')
INSERT [dbo].[Quiz] ([QuizID], [QuizName]) VALUES (3, N'Quiz Suits')
INSERT [dbo].[Quiz] ([QuizID], [QuizName]) VALUES (4, N'Test')
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[QuizUserAnswer] ON 

INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1146, 13, NULL, 0, CAST(N'2021-10-25T12:43:50.563' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1147, 13, NULL, 0, CAST(N'2021-10-25T12:54:16.300' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1148, 13, NULL, 1, CAST(N'2021-10-25T23:49:07.410' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1149, 13, NULL, 0, CAST(N'2021-10-26T03:02:59.107' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1150, 7, NULL, 1, CAST(N'2021-10-26T11:38:48.300' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1151, 8, NULL, 0, CAST(N'2021-10-26T11:38:48.667' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1152, 9, NULL, 0, CAST(N'2021-10-26T11:38:48.673' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1153, 10, NULL, 0, CAST(N'2021-10-26T11:38:48.683' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1154, 11, NULL, 0, CAST(N'2021-10-26T11:38:48.690' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1155, 12, NULL, 0, CAST(N'2021-10-26T11:38:48.697' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (1156, 13, NULL, 1, CAST(N'2021-10-26T11:43:39.067' AS DateTime), 1, 1016)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2148, 13, NULL, 0, CAST(N'2021-10-27T01:03:46.957' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2149, 13, NULL, 0, CAST(N'2021-10-27T01:07:37.367' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2150, 13, NULL, 0, CAST(N'2021-10-27T01:13:06.177' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2151, 13, NULL, 0, CAST(N'2021-10-27T01:14:47.517' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2152, 13, NULL, 0, CAST(N'2021-10-27T01:16:56.333' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2153, 13, NULL, 0, CAST(N'2021-10-27T01:22:48.147' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2154, 13, NULL, 0, CAST(N'2021-10-27T01:26:55.987' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2155, 1, NULL, 0, CAST(N'2021-10-27T01:30:32.367' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2156, 2, NULL, 0, CAST(N'2021-10-27T01:30:32.397' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2157, 3, NULL, 0, CAST(N'2021-10-27T01:30:32.417' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2158, 4, NULL, 0, CAST(N'2021-10-27T01:30:32.440' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2159, 5, NULL, 0, CAST(N'2021-10-27T01:30:32.457' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2160, 6, NULL, 0, CAST(N'2021-10-27T01:30:32.467' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2161, 1, NULL, 0, CAST(N'2021-10-27T01:34:23.790' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2162, 2, NULL, 0, CAST(N'2021-10-27T01:34:23.817' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2163, 3, NULL, 0, CAST(N'2021-10-27T01:34:23.837' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2164, 4, NULL, 0, CAST(N'2021-10-27T01:34:23.860' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2165, 5, NULL, 0, CAST(N'2021-10-27T01:34:23.880' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2166, 6, NULL, 0, CAST(N'2021-10-27T01:34:23.887' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2167, 1, NULL, 0, CAST(N'2021-10-27T01:37:31.627' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2168, 2, NULL, 0, CAST(N'2021-10-27T01:37:31.663' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2169, 3, NULL, 0, CAST(N'2021-10-27T01:37:31.687' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2170, 4, NULL, 0, CAST(N'2021-10-27T01:37:31.707' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2171, 5, NULL, 0, CAST(N'2021-10-27T01:37:31.717' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2172, 6, NULL, 0, CAST(N'2021-10-27T01:37:31.723' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2173, 1, NULL, 0, CAST(N'2021-10-27T01:45:06.640' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2174, 2, NULL, 0, CAST(N'2021-10-27T01:45:06.667' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2175, 3, NULL, 0, CAST(N'2021-10-27T01:45:06.680' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2176, 4, NULL, 0, CAST(N'2021-10-27T01:45:06.687' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2177, 5, NULL, 0, CAST(N'2021-10-27T01:45:06.693' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2178, 6, NULL, 0, CAST(N'2021-10-27T01:45:06.700' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2179, 1, NULL, 0, CAST(N'2021-10-27T01:45:17.443' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2180, 2, NULL, 0, CAST(N'2021-10-27T01:45:17.463' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2181, 3, NULL, 0, CAST(N'2021-10-27T01:45:17.483' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2182, 4, NULL, 0, CAST(N'2021-10-27T01:45:17.500' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2183, 5, NULL, 0, CAST(N'2021-10-27T01:45:17.520' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2184, 6, NULL, 0, CAST(N'2021-10-27T01:45:17.537' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2185, 1, NULL, 1, CAST(N'2021-10-27T01:46:46.073' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2186, 2, NULL, 0, CAST(N'2021-10-27T01:46:46.087' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2187, 3, NULL, 0, CAST(N'2021-10-27T01:46:46.093' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2188, 4, NULL, 0, CAST(N'2021-10-27T01:46:46.100' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2189, 5, NULL, 0, CAST(N'2021-10-27T01:46:46.107' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2190, 6, NULL, 0, CAST(N'2021-10-27T01:46:46.113' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2191, 13, NULL, 1, CAST(N'2021-10-27T01:51:37.047' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2192, 13, NULL, 1, CAST(N'2021-10-27T01:52:39.577' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2193, 13, NULL, 1, CAST(N'2021-10-27T01:52:59.527' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2194, 13, NULL, 0, CAST(N'2021-10-27T01:53:09.967' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2195, 13, NULL, 1, CAST(N'2021-10-27T01:57:30.927' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2196, 13, NULL, 1, CAST(N'2021-10-27T02:01:14.487' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2197, 13, NULL, 1, CAST(N'2021-10-27T02:01:38.323' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2198, 13, NULL, 1, CAST(N'2021-10-27T02:04:56.563' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2199, 13, NULL, 1, CAST(N'2021-10-27T02:05:15.960' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2200, 13, NULL, 1, CAST(N'2021-10-27T02:07:35.280' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2201, 13, NULL, 1, CAST(N'2021-10-27T02:08:13.243' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2202, 13, NULL, 1, CAST(N'2021-10-27T02:10:04.117' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2203, 13, NULL, 1, CAST(N'2021-10-27T02:13:40.223' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2204, 13, NULL, 1, CAST(N'2021-10-27T02:14:30.793' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2205, 13, NULL, 0, CAST(N'2021-10-27T02:20:14.870' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2206, 13, NULL, 0, CAST(N'2021-10-27T02:21:43.870' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2207, 13, NULL, 0, CAST(N'2021-10-27T02:22:06.693' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2208, 13, NULL, 0, CAST(N'2021-10-27T02:23:46.737' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2209, 13, NULL, 0, CAST(N'2021-10-27T02:25:47.707' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2210, 13, NULL, 0, CAST(N'2021-10-27T02:26:07.167' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2211, 13, NULL, 0, CAST(N'2021-10-27T02:26:41.367' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2212, 13, NULL, 0, CAST(N'2021-10-27T02:41:38.090' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2213, 1, NULL, 0, CAST(N'2021-10-27T02:44:23.400' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2214, 2, NULL, 0, CAST(N'2021-10-27T02:44:23.407' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2215, 3, NULL, 0, CAST(N'2021-10-27T02:44:23.410' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2216, 4, NULL, 0, CAST(N'2021-10-27T02:44:23.417' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2217, 5, NULL, 0, CAST(N'2021-10-27T02:44:23.420' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2218, 6, NULL, 0, CAST(N'2021-10-27T02:44:23.423' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2219, 1, NULL, 0, CAST(N'2021-10-27T02:48:20.210' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2220, 2, NULL, 0, CAST(N'2021-10-27T02:48:20.217' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2221, 3, NULL, 0, CAST(N'2021-10-27T02:48:20.220' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2222, 4, NULL, 0, CAST(N'2021-10-27T02:48:20.223' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2223, 5, NULL, 0, CAST(N'2021-10-27T02:48:20.230' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2224, 6, NULL, 0, CAST(N'2021-10-27T02:48:20.233' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2225, 13, NULL, 0, CAST(N'2021-10-27T02:50:19.987' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2226, 13, NULL, 0, CAST(N'2021-10-27T02:52:50.703' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2227, 1, NULL, 0, CAST(N'2021-10-27T02:55:22.763' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2228, 2, NULL, 0, CAST(N'2021-10-27T02:55:22.907' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2229, 3, NULL, 0, CAST(N'2021-10-27T02:55:22.913' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2230, 4, NULL, 0, CAST(N'2021-10-27T02:55:22.917' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2231, 5, NULL, 0, CAST(N'2021-10-27T02:55:22.920' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2232, 6, NULL, 0, CAST(N'2021-10-27T02:55:22.927' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2233, 13, NULL, 0, CAST(N'2021-10-27T03:00:38.237' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2234, 13, NULL, 0, CAST(N'2021-10-27T03:05:23.267' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2235, 13, NULL, 1, CAST(N'2021-10-27T10:34:02.743' AS DateTime), 1, 1015)
GO
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2236, 1016, NULL, 0, CAST(N'2021-10-27T10:34:03.160' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2237, 13, NULL, 0, CAST(N'2021-10-27T10:34:24.920' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2238, 1016, NULL, 1, CAST(N'2021-10-27T10:34:24.930' AS DateTime), 1, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2239, 13, NULL, 0, CAST(N'2021-10-27T11:08:41.367' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2240, 1016, NULL, 0, CAST(N'2021-10-27T11:08:41.383' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2241, 1, NULL, 0, CAST(N'2021-10-27T11:16:52.773' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2242, 2, NULL, 0, CAST(N'2021-10-27T11:16:53.277' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2243, 3, NULL, 0, CAST(N'2021-10-27T11:16:53.300' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2244, 4, NULL, 0, CAST(N'2021-10-27T11:16:53.317' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2245, 5, NULL, 0, CAST(N'2021-10-27T11:16:53.323' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2246, 6, NULL, 0, CAST(N'2021-10-27T11:16:53.330' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2247, 1, NULL, 0, CAST(N'2021-10-27T11:24:38.367' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2248, 2, NULL, 0, CAST(N'2021-10-27T11:24:38.673' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2249, 3, NULL, 0, CAST(N'2021-10-27T11:24:38.680' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2250, 4, NULL, 0, CAST(N'2021-10-27T11:24:38.687' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2251, 5, NULL, 0, CAST(N'2021-10-27T11:24:38.697' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2252, 6, NULL, 0, CAST(N'2021-10-27T11:24:38.703' AS DateTime), 0, 1015)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2253, 1016, NULL, 0, CAST(N'2021-12-12T23:56:04.023' AS DateTime), 1, 1017)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2254, 13, NULL, 1, CAST(N'2022-02-05T19:36:10.547' AS DateTime), 1, 1019)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2255, 13, NULL, 1, CAST(N'2022-02-06T12:00:15.357' AS DateTime), 1, 1019)
INSERT [dbo].[QuizUserAnswer] ([SubmissionID], [QuestionID], [AnswerID], [IsRight], [AnswerTime], [IsAnswered], [UserID]) VALUES (2256, 13, NULL, 0, CAST(N'2022-02-06T19:24:35.537' AS DateTime), 1, 1019)
SET IDENTITY_INSERT [dbo].[QuizUserAnswer] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FullName], [ProfilImage], [Email], [Gender], [Team], [Role], [Location], [Address], [Hobbies], [Skillsets]) VALUES (1015, N'rocky', N'mahdi.png', N'asishkumar.panda@fisglobal.com', N'M', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FullName], [ProfilImage], [Email], [Gender], [Team], [Role], [Location], [Address], [Hobbies], [Skillsets]) VALUES (1016, N'ashw', N'sara.png', N'ashw@gmail.com', N'F', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FullName], [ProfilImage], [Email], [Gender], [Team], [Role], [Location], [Address], [Hobbies], [Skillsets]) VALUES (1017, N'test', N'mahdi.png', N'test@gmail.com', N'M', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FullName], [ProfilImage], [Email], [Gender], [Team], [Role], [Location], [Address], [Hobbies], [Skillsets]) VALUES (1018, N'test', N'sara.png', N'test@gmail.com', N'F', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FullName], [ProfilImage], [Email], [Gender], [Team], [Role], [Location], [Address], [Hobbies], [Skillsets]) VALUES (1019, N'asish', N'mahdi.png', N'asish312@gmail.com', N'M', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[QuizUserAnswer] ADD  DEFAULT ((0)) FOR [IsRight]
GO
ALTER TABLE [dbo].[QuizUserAnswer] ADD  DEFAULT (getdate()) FOR [AnswerTime]
GO
ALTER TABLE [dbo].[QuizUserAnswer] ADD  CONSTRAINT [DF_QuizUserAnswer_IsAnswered]  DEFAULT ((0)) FOR [IsAnswered]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [dbo].[Choices]  WITH CHECK ADD  CONSTRAINT [FK_Choices_Questions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[Choices] CHECK CONSTRAINT [FK_Choices_Questions]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Quiz] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Quiz]
GO
USE [master]
GO
ALTER DATABASE [DBQuiz] SET  READ_WRITE 
GO
