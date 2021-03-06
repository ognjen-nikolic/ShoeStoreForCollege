USE [master]
GO
/****** Object:  Database [ShoeStore]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE DATABASE [ShoeStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoeStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ShoeStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoeStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ShoeStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShoeStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoeStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoeStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoeStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoeStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoeStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoeStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoeStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShoeStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoeStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoeStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoeStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoeStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoeStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoeStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoeStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoeStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoeStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoeStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoeStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoeStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoeStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoeStore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ShoeStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoeStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoeStore] SET  MULTI_USER 
GO
ALTER DATABASE [ShoeStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoeStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoeStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoeStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoeStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoeStore] SET QUERY_STORE = OFF
GO
USE [ShoeStore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 01-Jul-20 2:10:30 PM ******/
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
/****** Object:  Table [dbo].[Brands]    Script Date: 01-Jul-20 2:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 01-Jul-20 2:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 01-Jul-20 2:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01-Jul-20 2:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01-Jul-20 2:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ShoeTypeId] [int] NOT NULL,
	[GenderId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 01-Jul-20 2:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoeTypes]    Script Date: 01-Jul-20 2:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoeTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ShoeTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 01-Jul-20 2:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01-Jul-20 2:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUserCases]    Script Date: 01-Jul-20 2:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUserCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_UserUserCases] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630211332_database', N'3.1.3')
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-30T23:20:28.7736224' AS DateTime2), NULL, 0, 1, N'Addidas')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-30T23:20:50.9107488' AS DateTime2), NULL, 0, 1, N'Nike')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-30T23:21:00.1984250' AS DateTime2), NULL, 0, 1, N'Reebok')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (4, CAST(N'2020-06-30T23:21:08.0758528' AS DateTime2), NULL, 0, 1, N'Filla')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (5, CAST(N'2020-06-30T23:21:12.1836947' AS DateTime2), NULL, 0, 1, N'Guess')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (6, CAST(N'2020-06-30T23:21:20.1916298' AS DateTime2), CAST(N'2020-06-30T23:21:54.7489366' AS DateTime2), 0, 1, N'sergiotakanikatini')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (7, CAST(N'2020-07-01T13:11:47.5500763' AS DateTime2), NULL, 0, 1, N'New Balance')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (8, CAST(N'2020-07-01T13:11:55.5281938' AS DateTime2), NULL, 0, 1, N'Converse')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (9, CAST(N'2020-07-01T13:12:15.1757004' AS DateTime2), NULL, 0, 1, N'Asics')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (10, CAST(N'2020-07-01T13:12:29.0778108' AS DateTime2), NULL, 0, 1, N'Jordan')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (11, CAST(N'2020-07-01T13:12:39.9885207' AS DateTime2), NULL, 0, 1, N'Under Armour')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (12, CAST(N'2020-07-01T13:12:49.4753659' AS DateTime2), NULL, 0, 1, N'Puma')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (13, CAST(N'2020-07-01T13:13:03.2772498' AS DateTime2), NULL, 0, 1, N'Bata')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (14, CAST(N'2020-07-01T13:13:30.4490924' AS DateTime2), NULL, 0, 1, N'Diadora')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (15, CAST(N'2020-07-01T13:14:27.1306726' AS DateTime2), NULL, 0, 1, N'Giuseppe Zanotti')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (16, CAST(N'2020-07-01T13:14:59.0915450' AS DateTime2), NULL, 0, 1, N'Vans')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (17, CAST(N'2020-07-01T13:15:13.9375736' AS DateTime2), NULL, 0, 1, N'Calvin Klein')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (18, CAST(N'2020-07-01T13:15:44.6450537' AS DateTime2), NULL, 0, 1, N'Johnston and Murphy')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (19, CAST(N'2020-07-01T13:16:02.5027598' AS DateTime2), NULL, 0, 1, N'Bostonian')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (20, CAST(N'2020-07-01T13:16:12.7310790' AS DateTime2), NULL, 0, 1, N'LeBron')
INSERT [dbo].[Brands] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (21, CAST(N'2020-07-01T13:16:46.1029278' AS DateTime2), NULL, 0, 1, N'Tommy Hilfiger')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-30T23:22:19.0491495' AS DateTime2), NULL, 0, 1, N'Male')
INSERT [dbo].[Genders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-30T23:22:26.8629214' AS DateTime2), NULL, 0, 1, N'Female')
INSERT [dbo].[Genders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-30T23:22:30.7582466' AS DateTime2), NULL, 0, 1, N'Child')
SET IDENTITY_INSERT [dbo].[Genders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLines] ON 

INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (1, CAST(N'2020-06-30T23:55:46.9924759' AS DateTime2), NULL, 0, 1, N'Nike Merkurial', 5, 500, 1, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (2, CAST(N'2020-06-30T23:55:46.9924763' AS DateTime2), NULL, 0, 1, N'Nike flipflops', 5, 500, 1, 2)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (3, CAST(N'2020-06-30T23:56:00.4083262' AS DateTime2), NULL, 0, 1, N'addidas flipflops woman', 5, 500, 2, 4)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (4, CAST(N'2020-06-30T23:56:00.4083384' AS DateTime2), NULL, 0, 1, N'Nike flipflops', 5, 500, 2, 2)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (5, CAST(N'2020-07-01T13:41:58.3610920' AS DateTime2), NULL, 0, 1, N'Dual Sim Lipa', 1, 2013, 3, 12)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (6, CAST(N'2020-07-01T13:41:58.3610924' AS DateTime2), NULL, 0, 1, N'Jarastafaraj', 2, 52121, 3, 13)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (7, CAST(N'2020-07-01T13:41:58.3610929' AS DateTime2), NULL, 0, 1, N'Filla ', 5, 52121, 3, 14)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (8, CAST(N'2020-07-01T13:41:58.3610933' AS DateTime2), NULL, 0, 1, N'Filla sneakers  ', 3, 52121, 3, 15)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (9, CAST(N'2020-07-01T13:42:23.7764689' AS DateTime2), NULL, 0, 1, N'Nike Merkurial', 1, 500, 4, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (10, CAST(N'2020-07-01T13:42:23.7764699' AS DateTime2), NULL, 0, 1, N'Nike flipflops', 2, 500, 4, 2)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (11, CAST(N'2020-07-01T13:42:23.7764707' AS DateTime2), NULL, 0, 1, N'Nike flipflops woman', 5, 500, 4, 3)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (12, CAST(N'2020-07-01T13:42:23.7764716' AS DateTime2), NULL, 0, 1, N'addidas flipflops woman', 3, 500, 4, 4)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (13, CAST(N'2020-07-01T13:42:38.1573598' AS DateTime2), NULL, 0, 1, N'Nike flipflops woman', 1, 500, 5, 3)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (14, CAST(N'2020-07-01T13:42:38.1573604' AS DateTime2), NULL, 0, 1, N'addidas flipflops woman', 5, 500, 5, 4)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (15, CAST(N'2020-07-01T13:42:38.1573608' AS DateTime2), NULL, 0, 1, N'sdasddas', 5, 500, 5, 6)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (16, CAST(N'2020-07-01T13:42:38.1573612' AS DateTime2), NULL, 0, 1, N'esad', 3, 500, 5, 7)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (17, CAST(N'2020-07-01T13:42:38.8077574' AS DateTime2), NULL, 0, 1, N'Nike flipflops woman', 1, 500, 6, 3)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (18, CAST(N'2020-07-01T13:42:38.8077579' AS DateTime2), NULL, 0, 1, N'addidas flipflops woman', 5, 500, 6, 4)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (19, CAST(N'2020-07-01T13:42:38.8077584' AS DateTime2), NULL, 0, 1, N'sdasddas', 5, 500, 6, 6)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (20, CAST(N'2020-07-01T13:42:38.8077588' AS DateTime2), NULL, 0, 1, N'esad', 3, 500, 6, 7)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (21, CAST(N'2020-07-01T13:42:39.3517947' AS DateTime2), NULL, 0, 1, N'Nike flipflops woman', 1, 500, 7, 3)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (22, CAST(N'2020-07-01T13:42:39.3517951' AS DateTime2), NULL, 0, 1, N'addidas flipflops woman', 5, 500, 7, 4)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (23, CAST(N'2020-07-01T13:42:39.3517955' AS DateTime2), NULL, 0, 1, N'sdasddas', 5, 500, 7, 6)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (24, CAST(N'2020-07-01T13:42:39.3517959' AS DateTime2), NULL, 0, 1, N'esad', 3, 500, 7, 7)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (25, CAST(N'2020-07-01T13:44:55.4929723' AS DateTime2), NULL, 0, 1, N'sdasddas', 1, 500, 9, 6)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (26, CAST(N'2020-07-01T13:44:55.4929727' AS DateTime2), NULL, 0, 1, N'string', 5, 321412, 9, 8)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (27, CAST(N'2020-07-01T13:44:55.4929731' AS DateTime2), NULL, 0, 1, N'Venim Ultra Boost', 5, 11000, 9, 10)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (28, CAST(N'2020-07-01T13:44:55.4929735' AS DateTime2), NULL, 0, 1, N'Nike Merkurial', 3, 500, 9, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (29, CAST(N'2020-07-01T13:45:02.7791487' AS DateTime2), NULL, 0, 1, N'sdasddas', 1, 500, 10, 6)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (30, CAST(N'2020-07-01T13:45:02.7791490' AS DateTime2), NULL, 0, 1, N'string', 5, 321412, 10, 8)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (31, CAST(N'2020-07-01T13:45:02.7791494' AS DateTime2), NULL, 0, 1, N'Venim Ultra Boost', 5, 11000, 10, 10)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (32, CAST(N'2020-07-01T13:45:02.7791498' AS DateTime2), NULL, 0, 1, N'Nike Merkurial', 3, 500, 10, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (33, CAST(N'2020-07-01T13:54:03.5347618' AS DateTime2), NULL, 0, 1, N'string', 1, 321412, 11, 8)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (34, CAST(N'2020-07-01T13:54:08.9086414' AS DateTime2), NULL, 0, 1, N'sdasddas', 1, 500, 12, 6)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (35, CAST(N'2020-07-01T13:54:24.7948086' AS DateTime2), NULL, 0, 1, N'Buzz Kids', 11, 4122, 13, 17)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (36, CAST(N'2020-07-01T13:55:26.7733177' AS DateTime2), NULL, 0, 1, N'Rakim lego sad', 11, 5000, 14, 11)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (37, CAST(N'2020-07-01T13:55:26.7733182' AS DateTime2), NULL, 0, 1, N'Zanzibar bekenbauer', 2, 532, 14, 20)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (38, CAST(N'2020-07-01T13:55:34.5486320' AS DateTime2), NULL, 0, 1, N'sdasddas', 3, 500, 15, 6)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (39, CAST(N'2020-07-01T13:55:34.5486556' AS DateTime2), NULL, 0, 1, N'esad', 2, 500, 15, 7)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (40, CAST(N'2020-07-01T13:55:51.9211726' AS DateTime2), NULL, 0, 1, N'Nike Merkurial', 3, 500, 16, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (41, CAST(N'2020-07-01T13:55:51.9211952' AS DateTime2), NULL, 0, 1, N'Adidas Ultra Boost', 2, 11000, 16, 9)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (42, CAST(N'2020-07-01T13:55:54.7615602' AS DateTime2), NULL, 0, 1, N'Nike Merkurial', 3, 500, 17, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (43, CAST(N'2020-07-01T13:55:54.7615607' AS DateTime2), NULL, 0, 1, N'Adidas Ultra Boost', 2, 11000, 17, 9)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (44, CAST(N'2020-07-01T13:55:55.5138837' AS DateTime2), NULL, 0, 1, N'Nike Merkurial', 3, 500, 18, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (45, CAST(N'2020-07-01T13:55:55.5138841' AS DateTime2), NULL, 0, 1, N'Adidas Ultra Boost', 2, 11000, 18, 9)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (46, CAST(N'2020-07-01T13:55:56.0654820' AS DateTime2), NULL, 0, 1, N'Nike Merkurial', 3, 500, 19, 1)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (47, CAST(N'2020-07-01T13:55:56.0654837' AS DateTime2), NULL, 0, 1, N'Adidas Ultra Boost', 2, 11000, 19, 9)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (48, CAST(N'2020-07-01T13:56:11.2147412' AS DateTime2), NULL, 0, 1, N'Filla sneakers  ', 2, 52121, 20, 15)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (49, CAST(N'2020-07-01T13:56:11.2147416' AS DateTime2), NULL, 0, 1, N'Nike flipflops woman', 2, 500, 20, 3)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (50, CAST(N'2020-07-01T13:56:52.1516559' AS DateTime2), NULL, 0, 1, N'Rugby', 1, 532, 21, 19)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (51, CAST(N'2020-07-01T13:56:52.1516569' AS DateTime2), NULL, 0, 1, N'sdasddas', 2, 500, 21, 6)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (52, CAST(N'2020-07-01T13:56:52.9729844' AS DateTime2), NULL, 0, 1, N'Rugby', 1, 532, 22, 19)
INSERT [dbo].[OrderLines] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [ProductId]) VALUES (53, CAST(N'2020-07-01T13:56:52.9729884' AS DateTime2), NULL, 0, 1, N'sdasddas', 2, 500, 22, 6)
SET IDENTITY_INSERT [dbo].[OrderLines] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (1, CAST(N'2020-06-30T23:55:46.9924691' AS DateTime2), CAST(N'2020-07-01T00:15:50.8658534' AS DateTime2), 0, 1, CAST(N'2020-06-30T21:55:10.0160000' AS DateTime2), 1, 3, N'string')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (2, CAST(N'2020-06-30T23:56:00.4082908' AS DateTime2), NULL, 0, 1, CAST(N'2020-06-30T21:55:10.0160000' AS DateTime2), 1, 0, N'order 2 ')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (3, CAST(N'2020-07-01T13:41:58.3610879' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-03T00:00:00.0000000' AS DateTime2), 1, 0, N'Petra Perica 1')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (4, CAST(N'2020-07-01T13:42:23.7764651' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-03T00:00:00.0000000' AS DateTime2), 1, 0, N'Address 1')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (5, CAST(N'2020-07-01T13:42:38.1573184' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-03T00:00:00.0000000' AS DateTime2), 1, 0, N'Address 2')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (6, CAST(N'2020-07-01T13:42:38.8077484' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-03T00:00:00.0000000' AS DateTime2), 1, 0, N'Address 2')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (7, CAST(N'2020-07-01T13:42:39.3517848' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-03T00:00:00.0000000' AS DateTime2), 1, 0, N'Address 2')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (9, CAST(N'2020-07-01T13:44:55.4929694' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-05T00:00:00.0000000' AS DateTime2), 1, 0, N'Address 3')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (10, CAST(N'2020-07-01T13:45:02.7791457' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-05T00:00:00.0000000' AS DateTime2), 1, 0, N'Address 4')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (11, CAST(N'2020-07-01T13:54:03.5345070' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'Adress from god')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (12, CAST(N'2020-07-01T13:54:08.9086352' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'Adress from god')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (13, CAST(N'2020-07-01T13:54:24.7948039' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'Chiili vili ')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (14, CAST(N'2020-07-01T13:55:26.7733119' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'Chiili vili ')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (15, CAST(N'2020-07-01T13:55:34.5485422' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'Chiili vili ')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (16, CAST(N'2020-07-01T13:55:51.9211257' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'Rasdas vili ')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (17, CAST(N'2020-07-01T13:55:54.7615554' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'Rasdas vili ')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (18, CAST(N'2020-07-01T13:55:55.5138808' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'Rasdas vili ')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (19, CAST(N'2020-07-01T13:55:56.0654770' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'Rasdas vili ')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (20, CAST(N'2020-07-01T13:56:11.2147384' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'Rasdas vili ')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (21, CAST(N'2020-07-01T13:56:52.1516517' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'dsadfavili ')
INSERT [dbo].[Orders] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [OrderDate], [UserId], [OrderStatus], [Address]) VALUES (22, CAST(N'2020-07-01T13:56:52.9729795' AS DateTime2), NULL, 0, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), 1, 0, N'dsadfavili ')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (1, CAST(N'2020-06-30T23:51:03.4913323' AS DateTime2), CAST(N'2020-07-01T13:55:56.0654854' AS DateTime2), 0, 1, N'Nike Merkurial', N'string', 500, 6, 2, 1, 1)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (2, CAST(N'2020-06-30T23:51:20.9661096' AS DateTime2), CAST(N'2020-07-01T13:42:23.7764738' AS DateTime2), 0, 1, N'Nike flipflops', N'string', 500, 18, 4, 1, 1)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (3, CAST(N'2020-06-30T23:51:28.9301226' AS DateTime2), CAST(N'2020-07-01T13:56:11.2147656' AS DateTime2), 0, 1, N'Nike flipflops woman', N'string', 500, 15, 4, 1, 1)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (4, CAST(N'2020-06-30T23:51:39.4602266' AS DateTime2), CAST(N'2020-07-01T13:42:39.3517982' AS DateTime2), 0, 1, N'addidas flipflops woman', N'string', 500, 2, 4, 1, 2)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (5, CAST(N'2020-06-30T23:51:55.8285695' AS DateTime2), NULL, 0, 1, N'addidas flipflops ra', N'string', 500, 25, 4, 2, 2)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (6, CAST(N'2020-06-30T23:52:07.5637881' AS DateTime2), CAST(N'2020-07-01T13:56:52.9729896' AS DateTime2), 0, 1, N'sdasddas', N'string', 500, 0, 4, 2, 4)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (7, CAST(N'2020-06-30T23:52:12.8614874' AS DateTime2), CAST(N'2020-07-01T13:55:34.5487471' AS DateTime2), 0, 1, N'esad', N'string', 500, 14, 4, 2, 4)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (8, CAST(N'2020-06-30T23:52:24.9403425' AS DateTime2), CAST(N'2020-07-01T13:54:03.5347641' AS DateTime2), 0, 1, N'string', N'string', 321412, 0, 5, 2, 5)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (9, CAST(N'2020-07-01T13:28:17.1645052' AS DateTime2), CAST(N'2020-07-01T13:55:56.0654904' AS DateTime2), 0, 1, N'Adidas Ultra Boost', N'Ultra boots', 11000, 9, 1, 1, 1)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (10, CAST(N'2020-07-01T13:28:33.7066237' AS DateTime2), CAST(N'2020-07-01T13:45:02.7791513' AS DateTime2), 0, 1, N'Venim Ultra Boost', N'Ultra boots', 11000, 12, 1, 2, 6)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (11, CAST(N'2020-07-01T13:28:58.1325764' AS DateTime2), CAST(N'2020-07-01T13:55:26.7733188' AS DateTime2), 0, 1, N'Rakim lego sad', N'Ultra boots', 5000, 11, 7, 1, 4)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (12, CAST(N'2020-07-01T13:29:38.2978051' AS DateTime2), CAST(N'2020-07-01T13:41:58.3610938' AS DateTime2), 0, 1, N'Dual Sim Lipa', N'', 2013, 0, 5, 2, 11)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (13, CAST(N'2020-07-01T13:30:20.3760363' AS DateTime2), CAST(N'2020-07-01T13:41:58.3610944' AS DateTime2), 0, 1, N'Jarastafaraj', N'', 52121, 19, 19, 3, 16)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (14, CAST(N'2020-07-01T13:30:37.4938653' AS DateTime2), CAST(N'2020-07-01T13:41:58.3610948' AS DateTime2), 0, 1, N'Filla ', N'', 52121, 0, 2, 3, 3)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (15, CAST(N'2020-07-01T13:30:46.1068905' AS DateTime2), CAST(N'2020-07-01T13:56:11.2147421' AS DateTime2), 0, 1, N'Filla sneakers  ', N'', 52121, 0, 2, 3, 3)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (16, CAST(N'2020-07-01T13:30:56.7041390' AS DateTime2), NULL, 0, 1, N'Buzz cool', N'', 4122, 5, 2, 3, 3)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (17, CAST(N'2020-07-01T13:31:27.5228738' AS DateTime2), CAST(N'2020-07-01T13:54:24.7948091' AS DateTime2), 0, 1, N'Buzz Kids', N'', 4122, 7, 4, 3, 8)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (18, CAST(N'2020-07-01T13:36:53.2071780' AS DateTime2), NULL, 0, 1, N'Sweaat home alabama ', N'', 532, 2, 11, 3, 19)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (19, CAST(N'2020-07-01T13:37:20.8383406' AS DateTime2), CAST(N'2020-07-01T13:56:52.9729889' AS DateTime2), 0, 1, N'Rugby', N'', 532, 5, 9, 3, 14)
INSERT [dbo].[Products] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Description], [Price], [Quantity], [ShoeTypeId], [GenderId], [BrandId]) VALUES (20, CAST(N'2020-07-01T13:37:56.6014620' AS DateTime2), CAST(N'2020-07-01T13:55:26.7733208' AS DateTime2), 0, 1, N'Zanzibar bekenbauer', N'', 532, 5, 4, 2, 5)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-05-28T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'admin')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-05-28T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'user')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (3, CAST(N'2020-05-28T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-30T23:23:15.5602381' AS DateTime2), 0, 1, N'customized')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoeTypes] ON 

INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-30T23:30:14.1597446' AS DateTime2), NULL, 0, 1, N'Sneakers')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-30T23:30:18.5307559' AS DateTime2), NULL, 0, 1, N'Shoes')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (3, CAST(N'2020-06-30T23:30:29.1619037' AS DateTime2), NULL, 0, 1, N'Boots')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (4, CAST(N'2020-06-30T23:30:38.1404811' AS DateTime2), NULL, 0, 1, N'FlipFlops')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (5, CAST(N'2020-06-30T23:30:46.4600570' AS DateTime2), NULL, 0, 1, N'Heels')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (6, CAST(N'2020-07-01T13:19:52.5313207' AS DateTime2), NULL, 0, 1, N'army boots')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (7, CAST(N'2020-07-01T13:20:09.2474977' AS DateTime2), NULL, 0, 1, N'ballet shoes')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (8, CAST(N'2020-07-01T13:20:26.7272873' AS DateTime2), NULL, 0, 1, N'bowling')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (9, CAST(N'2020-07-01T13:20:45.2985927' AS DateTime2), NULL, 0, 1, N'cowboy boots')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (10, CAST(N'2020-07-01T13:20:54.2042897' AS DateTime2), NULL, 0, 1, N'dress shoes')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (11, CAST(N'2020-07-01T13:21:08.9571368' AS DateTime2), NULL, 0, 1, N'figure skates')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (12, CAST(N'2020-07-01T13:21:18.2745416' AS DateTime2), NULL, 0, 1, N'golf shoes')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (13, CAST(N'2020-07-01T13:21:38.5804051' AS DateTime2), NULL, 0, 1, N'ice skates')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (14, CAST(N'2020-07-01T13:21:47.4191821' AS DateTime2), NULL, 0, 1, N'moccasins')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (15, CAST(N'2020-07-01T13:22:07.1692206' AS DateTime2), NULL, 0, 1, N'Oxfords')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (16, CAST(N'2020-07-01T13:22:15.1455943' AS DateTime2), NULL, 0, 1, N'platform shoes')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (17, CAST(N'2020-07-01T13:22:26.3258879' AS DateTime2), NULL, 0, 1, N'roller skates')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (18, CAST(N'2020-07-01T13:24:17.4351589' AS DateTime2), NULL, 0, 1, N'tennis shoes')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (19, CAST(N'2020-07-01T13:24:31.0154963' AS DateTime2), NULL, 0, 1, N'work boots')
INSERT [dbo].[ShoeTypes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (20, CAST(N'2020-07-01T13:24:53.0751759' AS DateTime2), NULL, 0, 1, N'slippers')
SET IDENTITY_INSERT [dbo].[ShoeTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-06-30T21:20:28.4980754' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Addidas"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-06-30T21:20:33.3768174' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Addidas"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-06-30T21:20:50.9017341' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Nike"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2020-06-30T21:21:00.1809740' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Reebok"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2020-06-30T21:21:08.0310837' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Filla"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2020-06-30T21:21:12.1500219' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Guess"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2020-06-30T21:21:20.1791839' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"SergioTakini"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2020-06-30T21:21:30.1311037' AS DateTime2), N'Get Brands', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2020-06-30T21:21:34.7284661' AS DateTime2), N'Get Brands', N'{"Name":"ser","PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2020-06-30T21:21:54.7071159' AS DateTime2), N'Brand update', N'{"Id":6,"Name":"sergiotakanikatini"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2020-06-30T21:22:04.2788053' AS DateTime2), N'Get one Brand', N'6', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2020-06-30T21:22:19.0148625' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Male"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2020-06-30T21:22:26.8359821' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Female"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2020-06-30T21:22:30.7527862' AS DateTime2), N'Add gender', N'{"Id":0,"Name":"Child"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2020-06-30T21:22:49.9456271' AS DateTime2), N'Search Roles', N'{"Name":null}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2020-06-30T21:23:03.3171061' AS DateTime2), N'Update Role', N'{"Id":3,"Name":"admin"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2020-06-30T21:23:15.5095457' AS DateTime2), N'Update Role', N'{"Id":3,"Name":"customized"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2020-06-30T21:24:07.9744232' AS DateTime2), N'User Registration', N'{"Username":"user","FirstName":"user","LastName":"usernemovic","Password":"sifra1","Email":"nekanebeskasila@gmail.com"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2020-06-30T21:24:48.0942059' AS DateTime2), N'User Registration', N'{"Username":"dsadsa","FirstName":"user","LastName":"usernemovic","Password":"sifra1","Email":"nekanebeskasila@gmail.com"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2020-06-30T21:27:50.4934222' AS DateTime2), N'User Registration', N'{"Username":"user","FirstName":"probni","LastName":"probni","Password":"sifra1","Email":"nekanebeskasila@gmail.com"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2020-06-30T21:29:14.0109060' AS DateTime2), N'User Registration', N'{"Username":"user","FirstName":"probni","LastName":"probni","Password":"sifra1","Email":"nekanebeskasila@gmail.com"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2020-06-30T21:29:26.5316437' AS DateTime2), N'User Registration', N'{"Username":"user1","FirstName":"probni","LastName":"probni","Password":"sifra1","Email":"nekanebeskasila@gmail.com"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2020-06-30T21:30:14.1244677' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"Sneakers"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2020-06-30T21:30:18.5167198' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"Shoes"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2020-06-30T21:30:21.8283228' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"Shoes"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2020-06-30T21:30:29.1407498' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"Boots"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2020-06-30T21:30:38.1111615' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"FlipFlops"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2020-06-30T21:30:46.4488471' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"Heels"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2020-06-30T21:31:04.1643580' AS DateTime2), N'Search logs', N'{"FromDate":null,"ToDate":null,"UseCaseName":null,"Actor":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2020-06-30T21:38:20.1112287' AS DateTime2), N'Users search', N'{"Username":null,"FirstName":null,"LastName":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2020-06-30T21:40:00.2841841' AS DateTime2), N'Add User', N'{"Id":0,"Email":"string","Username":"user","FirstName":"string","LastName":"string","Password":"string","RoleId":2,"UseCases":[0]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2020-06-30T21:40:27.1584280' AS DateTime2), N'Add User', N'{"Id":0,"Email":"string","Username":"user","FirstName":"string","LastName":"string","Password":"string","RoleId":2,"UseCases":[]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2020-06-30T21:40:36.7224177' AS DateTime2), N'Add User', N'{"Id":0,"Email":"string","Username":"user1","FirstName":"string","LastName":"string","Password":"string","RoleId":2,"UseCases":[]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2020-06-30T21:41:24.1010741' AS DateTime2), N'Add User', N'{"Id":0,"Email":"string","Username":"user13","FirstName":"string","LastName":"string","Password":"string","RoleId":3,"UseCases":[]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2020-06-30T21:41:46.2638619' AS DateTime2), N'Add User', N'{"Id":0,"Email":"string@mail.com","Username":"UserWithNoRights","FirstName":"string","LastName":"string","Password":"string","RoleId":3,"UseCases":[]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2020-06-30T21:47:16.9052381' AS DateTime2), N'Add User', N'{"Id":0,"Email":"email@gmail.com","Username":"Usercase without rights","FirstName":"dsad","LastName":"dsadsa","Password":"dsadsadsa","RoleId":3,"UseCases":[0]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2020-06-30T21:47:37.4822353' AS DateTime2), N'Users search', N'{"Username":null,"FirstName":null,"LastName":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2020-06-30T21:47:47.2650634' AS DateTime2), N'Add User', N'{"Id":0,"Email":"email@gmail.com","Username":"Usercase without rights","FirstName":"dsad","LastName":"dsadsa","Password":"dsadsadsa","RoleId":3,"UseCases":[0]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2020-06-30T21:48:12.8598924' AS DateTime2), N'User Edit', N'{"Id":7,"Email":"string","Username":"ewqeqe","FirstName":"string","LastName":"string","Password":"string"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2020-06-30T21:48:55.0022318' AS DateTime2), N'User Edit', N'{"Id":7,"Email":"email@gmail.com","Username":"ewqeqe","FirstName":"string","LastName":"string","Password":"string"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2020-06-30T21:49:49.7638878' AS DateTime2), N'User Edit by Admin', N'{"Id":7,"Email":"email@changed","Username":"changedrightsusername","FirstName":"string","LastName":"string","Password":"stsdaring","RoleId":3,"UseCases":[1,3,5,7]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2020-06-30T21:50:01.7484085' AS DateTime2), N'User Edit by Admin', N'{"Id":7,"Email":"email@changed.com","Username":"changedrightsusername","FirstName":"string","LastName":"string","Password":"stsdaring","RoleId":3,"UseCases":[1,3,5,7]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2020-06-30T21:51:03.4113082' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Nike Merkurial","Description":"string","Price":500.0,"Quantity":25,"ShoeTypeId":2,"GenderId":1,"BrandId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2020-06-30T21:51:20.9475775' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Nike flipflops","Description":"string","Price":500.0,"Quantity":25,"ShoeTypeId":4,"GenderId":1,"BrandId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2020-06-30T21:51:28.9180999' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Nike flipflops woman","Description":"string","Price":500.0,"Quantity":25,"ShoeTypeId":4,"GenderId":1,"BrandId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2020-06-30T21:51:39.4457383' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"addidas flipflops woman","Description":"string","Price":500.0,"Quantity":25,"ShoeTypeId":4,"GenderId":1,"BrandId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2020-06-30T21:51:39.9283776' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"addidas flipflops woman","Description":"string","Price":500.0,"Quantity":25,"ShoeTypeId":4,"GenderId":1,"BrandId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2020-06-30T21:51:47.3577029' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"addidas flipflops woman","Description":"string","Price":500.0,"Quantity":25,"ShoeTypeId":4,"GenderId":2,"BrandId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2020-06-30T21:51:55.8139925' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"addidas flipflops ra","Description":"string","Price":500.0,"Quantity":25,"ShoeTypeId":4,"GenderId":2,"BrandId":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2020-06-30T21:52:07.5578886' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"sdasddas","Description":"string","Price":500.0,"Quantity":25,"ShoeTypeId":4,"GenderId":2,"BrandId":4}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2020-06-30T21:52:12.8533393' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"esad","Description":"string","Price":500.0,"Quantity":25,"ShoeTypeId":4,"GenderId":2,"BrandId":4}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2020-06-30T21:52:24.9300964' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Kids shoe","Description":"string","Price":500.0,"Quantity":25,"ShoeTypeId":3,"GenderId":3,"BrandId":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2020-06-30T21:52:36.4906638' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2020-06-30T21:52:44.9624714' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":5,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2020-06-30T21:52:49.5636556' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":3,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2020-06-30T21:52:57.9814374' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":null,"BrandId":1,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2020-06-30T21:53:20.4639465' AS DateTime2), N'Product update', N'{"Id":8,"Name":"string","Description":"string","Price":0.0,"Quantity":0,"ShoeTypeId":0,"GenderId":0,"BrandId":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2020-06-30T21:53:41.7262702' AS DateTime2), N'Product update', N'{"Id":8,"Name":"string","Description":"string","Price":321412.0,"Quantity":11,"ShoeTypeId":5,"GenderId":2,"BrandId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2020-06-30T21:54:00.4679221' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2020-06-30T21:55:46.8941004' AS DateTime2), N'Add order', N'{"OrderDate":"2020-06-30T21:55:10.016Z","Address":"string","Items":[{"ProductId":1,"Quantity":5},{"ProductId":2,"Quantity":5}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2020-06-30T21:56:00.3968272' AS DateTime2), N'Add order', N'{"OrderDate":"2020-06-30T21:55:10.016Z","Address":"order 2 ","Items":[{"ProductId":4,"Quantity":5},{"ProductId":2,"Quantity":5}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2020-06-30T21:56:08.6253151' AS DateTime2), N'Search orders', N'{"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2020-06-30T21:56:47.8490737' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'2020-06-30T21:57:13.1749785' AS DateTime2), N'Get Order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'2020-06-30T21:57:49.6118643' AS DateTime2), N'Get Order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'2020-06-30T21:57:53.6123129' AS DateTime2), N'Get Order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'2020-06-30T21:58:03.0237977' AS DateTime2), N'Get Order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'2020-06-30T21:58:03.9337182' AS DateTime2), N'Get Order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'2020-06-30T21:58:39.0226250' AS DateTime2), N'Get Order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'2020-06-30T21:59:10.6308825' AS DateTime2), N'Get Order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'2020-06-30T22:03:43.9826630' AS DateTime2), N'Search orders', N'{"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'2020-06-30T22:08:44.1075031' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'2020-06-30T22:08:58.1740829' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'2020-06-30T22:09:22.0867239' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'2020-06-30T22:09:46.6544516' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'2020-06-30T22:10:06.1349330' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":2}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'2020-06-30T22:10:12.7040809' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'2020-06-30T22:10:36.1486049' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (79, CAST(N'2020-06-30T22:10:52.6043871' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'2020-06-30T22:15:14.6593514' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":0}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'2020-06-30T22:15:40.2159692' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (82, CAST(N'2020-06-30T22:15:50.8258748' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (83, CAST(N'2020-06-30T22:15:58.9805122' AS DateTime2), N'Change order status command', N'{"OrderId":1,"Status":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (84, CAST(N'2020-06-30T22:16:32.9482889' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (85, CAST(N'2020-06-30T22:19:10.7223380' AS DateTime2), N'Get Brands', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (86, CAST(N'2020-07-01T11:02:43.3817823' AS DateTime2), N'Get Brands', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (87, CAST(N'2020-07-01T11:08:56.4400042' AS DateTime2), N'Get Brands', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymous')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (88, CAST(N'2020-07-01T11:11:47.4881872' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"New Balance"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (89, CAST(N'2020-07-01T11:11:55.5092062' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Converse"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (90, CAST(N'2020-07-01T11:12:15.1684111' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Asics"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (91, CAST(N'2020-07-01T11:12:29.0652739' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Jordan"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (92, CAST(N'2020-07-01T11:12:39.9719634' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Under Armour"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (93, CAST(N'2020-07-01T11:12:49.4666048' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Puma"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (94, CAST(N'2020-07-01T11:13:03.2643376' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Bata"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (95, CAST(N'2020-07-01T11:13:30.4285811' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Diadora"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (96, CAST(N'2020-07-01T11:13:33.8725561' AS DateTime2), N'Get Brands', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (97, CAST(N'2020-07-01T11:14:27.1211379' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Giuseppe Zanotti"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (98, CAST(N'2020-07-01T11:14:33.6056028' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"CK"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (99, CAST(N'2020-07-01T11:14:59.0508517' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Vans"}', N'admin')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (100, CAST(N'2020-07-01T11:15:04.7091320' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Vans"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (101, CAST(N'2020-07-01T11:15:13.9314020' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Calvin Klein"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (102, CAST(N'2020-07-01T11:15:18.3261030' AS DateTime2), N'Get Brands', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (103, CAST(N'2020-07-01T11:15:44.6342502' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Johnston and Murphy"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (104, CAST(N'2020-07-01T11:16:02.4993023' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Bostonian"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (105, CAST(N'2020-07-01T11:16:12.7261702' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"LeBron"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (106, CAST(N'2020-07-01T11:16:46.0954164' AS DateTime2), N'Brand Add', N'{"Id":0,"Name":"Tommy Hilfiger"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (107, CAST(N'2020-07-01T11:17:05.7553317' AS DateTime2), N'Get Brands', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (108, CAST(N'2020-07-01T11:18:11.1224269' AS DateTime2), N'Users search', N'{"Username":null,"FirstName":null,"LastName":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (109, CAST(N'2020-07-01T11:19:29.7788445' AS DateTime2), N'Get Shoe types', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (110, CAST(N'2020-07-01T11:19:52.5092554' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"army boots"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (111, CAST(N'2020-07-01T11:20:09.2415385' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"ballet shoes"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (112, CAST(N'2020-07-01T11:20:26.7177625' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"bowling"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (113, CAST(N'2020-07-01T11:20:45.2945806' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"cowboy boots"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (114, CAST(N'2020-07-01T11:20:54.2017963' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"dress shoes"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (115, CAST(N'2020-07-01T11:21:08.9501998' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"figure skates"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (116, CAST(N'2020-07-01T11:21:18.2689135' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"golf shoes"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (117, CAST(N'2020-07-01T11:21:38.5755983' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"ice skates"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (118, CAST(N'2020-07-01T11:21:47.4164041' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"moccasins"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (119, CAST(N'2020-07-01T11:22:07.1648439' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"Oxfords"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (120, CAST(N'2020-07-01T11:22:15.1381490' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"platform shoes"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (121, CAST(N'2020-07-01T11:22:26.3217749' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"roller skates"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (122, CAST(N'2020-07-01T11:23:52.0558078' AS DateTime2), N'Get Shoe types', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (123, CAST(N'2020-07-01T11:24:17.4293716' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"tennis shoes"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (124, CAST(N'2020-07-01T11:24:31.0090451' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"work boots"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (125, CAST(N'2020-07-01T11:24:53.0696975' AS DateTime2), N'Ad shoe type', N'{"Id":0,"Name":"slippers"}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (126, CAST(N'2020-07-01T11:24:56.5109824' AS DateTime2), N'Get Shoe types', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (127, CAST(N'2020-07-01T11:26:46.5229570' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (128, CAST(N'2020-07-01T11:28:02.5460296' AS DateTime2), N'Get Shoe types', N'{"Name":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (129, CAST(N'2020-07-01T11:28:17.1269857' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Adidas Ultra Boost","Description":"Ultra boots","Price":11000.0,"Quantity":17,"ShoeTypeId":1,"GenderId":1,"BrandId":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (130, CAST(N'2020-07-01T11:28:33.6972960' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Venim Ultra Boost","Description":"Ultra boots","Price":11000.0,"Quantity":22,"ShoeTypeId":1,"GenderId":2,"BrandId":6}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (131, CAST(N'2020-07-01T11:28:58.1218235' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Rakim lego sad","Description":"Ultra boots","Price":5000.0,"Quantity":22,"ShoeTypeId":7,"GenderId":1,"BrandId":4}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (132, CAST(N'2020-07-01T11:29:38.2928054' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Dual Sim Lipa","Description":"","Price":2013.0,"Quantity":1,"ShoeTypeId":5,"GenderId":2,"BrandId":11}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (133, CAST(N'2020-07-01T11:30:20.3635515' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Jarastafaraj","Description":"","Price":52121.0,"Quantity":21,"ShoeTypeId":19,"GenderId":3,"BrandId":16}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (134, CAST(N'2020-07-01T11:30:21.3356359' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Jarastafaraj","Description":"","Price":52121.0,"Quantity":21,"ShoeTypeId":19,"GenderId":3,"BrandId":16}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (135, CAST(N'2020-07-01T11:30:37.4885636' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Filla ","Description":"","Price":52121.0,"Quantity":5,"ShoeTypeId":2,"GenderId":3,"BrandId":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (136, CAST(N'2020-07-01T11:30:46.1018710' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Filla sneakers  ","Description":"","Price":52121.0,"Quantity":5,"ShoeTypeId":2,"GenderId":3,"BrandId":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (137, CAST(N'2020-07-01T11:30:56.6892638' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Buzz cool","Description":"","Price":4122.0,"Quantity":5,"ShoeTypeId":2,"GenderId":3,"BrandId":3}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (138, CAST(N'2020-07-01T11:31:12.8677957' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Buzz cool","Description":"","Price":4122.0,"Quantity":18,"ShoeTypeId":4,"GenderId":5,"BrandId":8}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (139, CAST(N'2020-07-01T11:31:27.5176984' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Buzz Kids","Description":"","Price":4122.0,"Quantity":18,"ShoeTypeId":4,"GenderId":3,"BrandId":8}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (140, CAST(N'2020-07-01T11:31:35.6509734' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (141, CAST(N'2020-07-01T11:36:53.1920847' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Sweaat home alabama ","Description":"","Price":532.0,"Quantity":2,"ShoeTypeId":11,"GenderId":3,"BrandId":19}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (142, CAST(N'2020-07-01T11:37:20.8334148' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Rugby","Description":"","Price":532.0,"Quantity":7,"ShoeTypeId":9,"GenderId":3,"BrandId":14}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (143, CAST(N'2020-07-01T11:37:27.7644698' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Rugby","Description":"","Price":532.0,"Quantity":7,"ShoeTypeId":9,"GenderId":3,"BrandId":14}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (144, CAST(N'2020-07-01T11:37:36.6119349' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (145, CAST(N'2020-07-01T11:37:56.5651751' AS DateTime2), N'Add Product', N'{"Id":0,"Name":"Zanzibar bekenbauer","Description":"","Price":532.0,"Quantity":7,"ShoeTypeId":4,"GenderId":2,"BrandId":5}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (146, CAST(N'2020-07-01T11:38:08.6424242' AS DateTime2), N'products search', N'{"Name":null,"MinPrice":null,"MaxPrice":null,"ShoeTypeId":null,"GenderId":null,"BrandId":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (147, CAST(N'2020-07-01T11:41:58.2623096' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"Petra Perica 1","Items":[{"ProductId":12,"Quantity":1},{"ProductId":13,"Quantity":2},{"ProductId":14,"Quantity":5},{"ProductId":15,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (148, CAST(N'2020-07-01T11:42:00.6342268' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"Petra Perica 1","Items":[{"ProductId":12,"Quantity":1},{"ProductId":13,"Quantity":2},{"ProductId":14,"Quantity":5},{"ProductId":15,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (149, CAST(N'2020-07-01T11:42:23.7640742' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"Address 1","Items":[{"ProductId":1,"Quantity":1},{"ProductId":2,"Quantity":2},{"ProductId":3,"Quantity":5},{"ProductId":4,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (150, CAST(N'2020-07-01T11:42:38.1431120' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"Address 2","Items":[{"ProductId":3,"Quantity":1},{"ProductId":4,"Quantity":5},{"ProductId":6,"Quantity":5},{"ProductId":7,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (151, CAST(N'2020-07-01T11:42:38.7903121' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"Address 2","Items":[{"ProductId":3,"Quantity":1},{"ProductId":4,"Quantity":5},{"ProductId":6,"Quantity":5},{"ProductId":7,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (152, CAST(N'2020-07-01T11:42:39.3337261' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-03T00:00:00","Address":"Address 2","Items":[{"ProductId":3,"Quantity":1},{"ProductId":4,"Quantity":5},{"ProductId":6,"Quantity":5},{"ProductId":7,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (153, CAST(N'2020-07-01T11:42:58.5122429' AS DateTime2), N'Get Order', N'1', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (154, CAST(N'2020-07-01T11:43:08.1326147' AS DateTime2), N'Search orders', N'{"MinOrderLines":null,"Status":3,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (155, CAST(N'2020-07-01T11:43:19.8253278' AS DateTime2), N'Search orders', N'{"MinOrderLines":null,"Status":3,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (156, CAST(N'2020-07-01T11:43:34.9927298' AS DateTime2), N'Search orders', N'{"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (157, CAST(N'2020-07-01T11:44:55.4721845' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-05T00:00:00","Address":"Address 3","Items":[{"ProductId":6,"Quantity":1},{"ProductId":8,"Quantity":5},{"ProductId":10,"Quantity":5},{"ProductId":1,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (158, CAST(N'2020-07-01T11:45:02.7687145' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-05T00:00:00","Address":"Address 4","Items":[{"ProductId":6,"Quantity":1},{"ProductId":8,"Quantity":5},{"ProductId":10,"Quantity":5},{"ProductId":1,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (159, CAST(N'2020-07-01T11:45:08.1790652' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-05T00:00:00","Address":"Address 5","Items":[{"ProductId":6,"Quantity":1},{"ProductId":8,"Quantity":5},{"ProductId":10,"Quantity":5},{"ProductId":1,"Quantity":3}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (160, CAST(N'2020-07-01T11:54:03.2028228' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Adress from god","Items":[{"ProductId":8,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (161, CAST(N'2020-07-01T11:54:08.8893926' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Adress from god","Items":[{"ProductId":6,"Quantity":1}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (162, CAST(N'2020-07-01T11:54:24.7794183' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Chiili vili ","Items":[{"ProductId":17,"Quantity":11}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (163, CAST(N'2020-07-01T11:54:40.6546584' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Chiili vili ","Items":[{"ProductId":17,"Quantity":11},{"ProductId":17,"Quantity":11}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (164, CAST(N'2020-07-01T11:54:59.8019413' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Chiili vili ","Items":[{"ProductId":17,"Quantity":11},{"ProductId":2,"Quantity":7}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (165, CAST(N'2020-07-01T11:55:08.2224657' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Chiili vili ","Items":[{"ProductId":17,"Quantity":11},{"ProductId":2,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (166, CAST(N'2020-07-01T11:55:16.0508053' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Chiili vili ","Items":[{"ProductId":17,"Quantity":11},{"ProductId":20,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (167, CAST(N'2020-07-01T11:55:21.9994226' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Chiili vili ","Items":[{"ProductId":14,"Quantity":11},{"ProductId":20,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (168, CAST(N'2020-07-01T11:55:26.7524116' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Chiili vili ","Items":[{"ProductId":11,"Quantity":11},{"ProductId":20,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (169, CAST(N'2020-07-01T11:55:34.5197125' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Chiili vili ","Items":[{"ProductId":6,"Quantity":3},{"ProductId":7,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (170, CAST(N'2020-07-01T11:55:43.9953643' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Rasdas vili ","Items":[{"ProductId":4,"Quantity":3},{"ProductId":8,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (171, CAST(N'2020-07-01T11:55:51.9049842' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Rasdas vili ","Items":[{"ProductId":1,"Quantity":3},{"ProductId":9,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (172, CAST(N'2020-07-01T11:55:54.7502209' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Rasdas vili ","Items":[{"ProductId":1,"Quantity":3},{"ProductId":9,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (173, CAST(N'2020-07-01T11:55:55.4944665' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Rasdas vili ","Items":[{"ProductId":1,"Quantity":3},{"ProductId":9,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (174, CAST(N'2020-07-01T11:55:56.0503459' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Rasdas vili ","Items":[{"ProductId":1,"Quantity":3},{"ProductId":9,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (175, CAST(N'2020-07-01T11:56:11.1960721' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"Rasdas vili ","Items":[{"ProductId":15,"Quantity":2},{"ProductId":3,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (176, CAST(N'2020-07-01T11:56:14.0801714' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"dsadfavili ","Items":[{"ProductId":15,"Quantity":2},{"ProductId":3,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (177, CAST(N'2020-07-01T11:56:20.2375384' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"dsadfavili ","Items":[{"ProductId":15,"Quantity":0},{"ProductId":3,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (178, CAST(N'2020-07-01T11:56:34.2238293' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"dsadfavili ","Items":[{"ProductId":12,"Quantity":1},{"ProductId":8,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (179, CAST(N'2020-07-01T11:56:52.1387918' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"dsadfavili ","Items":[{"ProductId":19,"Quantity":1},{"ProductId":6,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (180, CAST(N'2020-07-01T11:56:52.9580803' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"dsadfavili ","Items":[{"ProductId":19,"Quantity":1},{"ProductId":6,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (181, CAST(N'2020-07-01T11:56:53.9791534' AS DateTime2), N'Add order', N'{"OrderDate":"2020-07-09T00:00:00","Address":"dsadfavili ","Items":[{"ProductId":19,"Quantity":1},{"ProductId":6,"Quantity":2}]}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (182, CAST(N'2020-07-01T11:57:03.9666308' AS DateTime2), N'Search orders', N'{"UserId":null,"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (183, CAST(N'2020-07-01T11:57:05.4690939' AS DateTime2), N'Search orders', N'{"UserId":null,"MinOrderLines":null,"Status":null,"MinPrice":null,"PerPage":10,"Page":1}', N'admin')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [RoleId]) VALUES (1, CAST(N'2020-05-28T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'admin', N'Ognjen', N'Nikolic', N'mail', N'sifra1', 1)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [RoleId]) VALUES (4, CAST(N'2020-06-30T23:27:52.3570282' AS DateTime2), NULL, 0, 1, N'user', N'probni', N'probni', N'nekanebeskasila@gmail.com', N'sifra1', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [RoleId]) VALUES (5, CAST(N'2020-06-30T23:29:26.5545720' AS DateTime2), NULL, 0, 1, N'user1', N'probni', N'probni', N'nekanebeskasila@gmail.com', N'sifra1', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [RoleId]) VALUES (6, CAST(N'2020-06-30T23:41:46.3705735' AS DateTime2), NULL, 0, 1, N'UserWithNoRights', N'string', N'string', N'string@mail.com', N'string', 3)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Username], [FirstName], [LastName], [Email], [Password], [RoleId]) VALUES (7, CAST(N'2020-06-30T23:47:17.2092462' AS DateTime2), CAST(N'2020-06-30T23:50:06.5737011' AS DateTime2), 0, 1, N'changedrightsusername', N'string', N'string', N'email@changed.com', N'stsdaring', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUserCases] ON 

INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 1, 1)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 2, 2)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 3, 3)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 4, 4)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 5, 5)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 6, 6)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 7, 7)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 8, 8)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 9, 9)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 10, 10)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 11, 11)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 12, 12)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 13, 13)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 14, 14)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 15, 16)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 16, 19)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 17, 20)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 18, 21)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 19, 22)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 20, 23)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 21, 24)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 22, 25)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 23, 26)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 24, 27)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 25, 28)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 26, 29)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 27, 30)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 28, 31)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 29, 32)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 30, 33)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 31, 34)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 32, 35)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 33, 37)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 34, 38)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 35, 39)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 36, 40)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 37, 41)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (1, 38, 42)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 1, 43)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 2, 44)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 8, 45)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 9, 46)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 13, 47)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 14, 48)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 18, 49)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 19, 50)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 23, 51)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 24, 52)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 29, 53)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 30, 54)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 34, 55)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 35, 56)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (4, 36, 57)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 1, 58)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 2, 59)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 8, 60)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 9, 61)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 13, 62)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 14, 63)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 18, 64)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 19, 65)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 23, 66)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 24, 67)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 29, 68)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 30, 69)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 34, 70)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 35, 71)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (5, 36, 72)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (7, 1, 74)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (7, 3, 75)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (7, 5, 76)
INSERT [dbo].[UserUserCases] ([UserId], [UseCaseId], [Id]) VALUES (7, 7, 77)
SET IDENTITY_INSERT [dbo].[UserUserCases] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Brands_Name]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Brands_Name] ON [dbo].[Brands]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Genders_Name]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Genders_Name] ON [dbo].[Genders]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_OrderId]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_OrderId] ON [dbo].[OrderLines]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_ProductId]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_ProductId] ON [dbo].[OrderLines]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_GenderId]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_GenderId] ON [dbo].[Products]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Products_Name] ON [dbo].[Products]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ShoeTypeId]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_ShoeTypeId] ON [dbo].[Products]
(
	[ShoeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Roles_Name]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_Name] ON [dbo].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ShoeTypes_Name]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ShoeTypes_Name] ON [dbo].[ShoeTypes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 01-Jul-20 2:10:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [OrderStatus]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Genders_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Genders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Genders_GenderId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ShoeTypes_ShoeTypeId] FOREIGN KEY([ShoeTypeId])
REFERENCES [dbo].[ShoeTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ShoeTypes_ShoeTypeId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserUserCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUserCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUserCases] CHECK CONSTRAINT [FK_UserUserCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [ShoeStore] SET  READ_WRITE 
GO
