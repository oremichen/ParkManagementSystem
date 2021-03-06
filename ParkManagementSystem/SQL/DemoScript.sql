USE [master]
GO
/****** Object:  Database [DemoBankAppDb]    Script Date: 12/31/2021 2:09:01 PM ******/
CREATE DATABASE [DemoBankAppDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoBankAppDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DemoBankAppDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoBankAppDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DemoBankAppDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DemoBankAppDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoBankAppDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoBankAppDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoBankAppDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoBankAppDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoBankAppDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoBankAppDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoBankAppDb] SET  MULTI_USER 
GO
ALTER DATABASE [DemoBankAppDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoBankAppDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoBankAppDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoBankAppDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoBankAppDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoBankAppDb] SET QUERY_STORE = OFF
GO
USE [DemoBankAppDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/31/2021 2:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/31/2021 2:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Balance] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackingRules]    Script Date: 12/31/2021 2:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackingRules](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Hour] [int] NOT NULL,
	[Charge] [int] NOT NULL,
 CONSTRAINT [PK_PackingRules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackingTickets]    Script Date: 12/31/2021 2:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackingTickets](
	[TicketId] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeOfEntry] [datetime2](7) NULL,
	[TimeOfExist] [datetime2](7) NULL,
	[TotalCost] [int] NOT NULL,
 CONSTRAINT [PK_PackingTickets] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 12/31/2021 2:09:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Recepient] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211231202417_MysecondMigration', N'3.1.22')
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Balance]) VALUES (10, N'John Doe', CAST(90000.00 AS Decimal(18, 2)))
INSERT [dbo].[Customers] ([Id], [Name], [Balance]) VALUES (11, NULL, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Customers] ([Id], [Name], [Balance]) VALUES (12, NULL, CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[PackingRules] ON 

INSERT [dbo].[PackingRules] ([Id], [Hour], [Charge]) VALUES (1, 0, 2)
INSERT [dbo].[PackingRules] ([Id], [Hour], [Charge]) VALUES (2, 1, 3)
INSERT [dbo].[PackingRules] ([Id], [Hour], [Charge]) VALUES (3, 2, 4)
SET IDENTITY_INSERT [dbo].[PackingRules] OFF
GO
SET IDENTITY_INSERT [dbo].[PackingTickets] ON 

INSERT [dbo].[PackingTickets] ([TicketId], [TimeOfEntry], [TimeOfExist], [TotalCost]) VALUES (1, CAST(N'2021-12-31T10:20:00.0000000' AS DateTime2), CAST(N'2021-12-31T11:50:00.0000000' AS DateTime2), 5)
INSERT [dbo].[PackingTickets] ([TicketId], [TimeOfEntry], [TimeOfExist], [TotalCost]) VALUES (2, CAST(N'2021-12-31T09:20:00.0000000' AS DateTime2), CAST(N'2021-12-31T12:30:00.0000000' AS DateTime2), 17)
INSERT [dbo].[PackingTickets] ([TicketId], [TimeOfEntry], [TimeOfExist], [TotalCost]) VALUES (3, CAST(N'2021-12-31T10:00:00.0000000' AS DateTime2), CAST(N'2021-12-31T13:21:00.0000000' AS DateTime2), 17)
SET IDENTITY_INSERT [dbo].[PackingTickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([Id], [Recepient], [Description], [Amount], [DateCreated]) VALUES (4, N'michen', N'this is for school feels', CAST(30000.00 AS Decimal(18, 2)), CAST(N'2021-11-06T01:59:51.7350000' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [Recepient], [Description], [Amount], [DateCreated]) VALUES (5, N'sharon', N'eee', CAST(30000.00 AS Decimal(18, 2)), CAST(N'2021-11-06T02:01:24.8460000' AS DateTime2))
INSERT [dbo].[Transactions] ([Id], [Recepient], [Description], [Amount], [DateCreated]) VALUES (6, N'shanron', N'this is for school feels', CAST(30000.00 AS Decimal(18, 2)), CAST(N'2021-11-06T02:07:51.8360000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((0.0)) FOR [Balance]
GO
USE [master]
GO
ALTER DATABASE [DemoBankAppDb] SET  READ_WRITE 
GO
