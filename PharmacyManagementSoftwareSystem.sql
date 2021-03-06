USE [master]
GO
/****** Object:  Database [Pharmacy]    Script Date: 6/20/2019 19:40:04 ******/
CREATE DATABASE [Pharmacy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pharmacy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.ADISDURGUTI\MSSQL\DATA\Pharmacy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pharmacy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.ADISDURGUTI\MSSQL\DATA\Pharmacy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Pharmacy] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pharmacy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pharmacy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pharmacy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pharmacy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pharmacy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pharmacy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pharmacy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pharmacy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pharmacy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pharmacy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pharmacy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pharmacy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pharmacy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pharmacy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pharmacy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pharmacy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pharmacy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pharmacy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pharmacy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pharmacy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pharmacy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pharmacy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pharmacy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pharmacy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pharmacy] SET  MULTI_USER 
GO
ALTER DATABASE [Pharmacy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pharmacy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pharmacy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pharmacy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Pharmacy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pharmacy] SET QUERY_STORE = OFF
GO
USE [Pharmacy]
GO
/****** Object:  Table [dbo].[BillIncome]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillIncome](
	[billIncomeID] [int] IDENTITY(1,1) NOT NULL,
	[perdoruesiID] [int] NOT NULL,
	[total] [decimal](19, 2) NOT NULL,
	[billIncomeDate] [date] NOT NULL,
	[billNumber] [varchar](150) NOT NULL,
 CONSTRAINT [PK_BillIncome] PRIMARY KEY CLUSTERED 
(
	[billIncomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillIncomeDetails]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillIncomeDetails](
	[billIncomeDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[billIncomeID] [int] NOT NULL,
	[productID] [int] NULL,
	[quantity] [int] NOT NULL,
	[subtotal] [decimal](19, 2) NOT NULL,
	[billIncomeDate] [date] NOT NULL,
	[billIncomeTime] [time](7) NOT NULL,
 CONSTRAINT [PK_BillIncomeDetails] PRIMARY KEY CLUSTERED 
(
	[billIncomeDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillOutCome]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillOutCome](
	[billOutComeID] [int] IDENTITY(1,1) NOT NULL,
	[perdoruesiID] [int] NOT NULL,
	[total] [decimal](19, 2) NOT NULL,
	[billDate] [date] NOT NULL,
	[billNumber] [varchar](150) NOT NULL,
 CONSTRAINT [PK_BillOutCome] PRIMARY KEY CLUSTERED 
(
	[billOutComeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillOutComeDetails]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillOutComeDetails](
	[billOutComeDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[billOutComeID] [int] NOT NULL,
	[productID] [int] NULL,
	[quantity] [int] NOT NULL,
	[subtotal] [decimal](19, 2) NOT NULL,
	[billDate] [date] NOT NULL,
	[billTime] [time](7) NOT NULL,
 CONSTRAINT [PK_BillOutComeDetails] PRIMARY KEY CLUSTERED 
(
	[billOutComeDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] NOT NULL,
	[categoryType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[companyID] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [varchar](50) NOT NULL,
	[companyBussinesNumber] [varchar](50) NULL,
	[companyEmail] [varchar](150) NOT NULL,
	[companyContactNumber] [varchar](50) NOT NULL,
	[companyCountry] [varchar](50) NOT NULL,
	[companyAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[companyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perdoruesi]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perdoruesi](
	[perdoruesiID] [int] IDENTITY(1,1) NOT NULL,
	[roleID] [int] NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Salary] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[perdoruesiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerdoruesiReport]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerdoruesiReport](
	[reportID] [int] IDENTITY(1,1) NOT NULL,
	[perdoruesiID] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[time] [time](7) NOT NULL,
 CONSTRAINT [PK_PerdoruesiReport] PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[companyID] [int] NOT NULL,
	[categoryID] [int] NOT NULL,
	[productBarcode] [varchar](50) NULL,
	[productSericNumber] [varchar](50) NULL,
	[productName] [varchar](100) NOT NULL,
	[productDosage] [varchar](50) NULL,
	[manufactoringDate] [date] NOT NULL,
	[expiringDate] [date] NOT NULL,
	[productSellPrice] [decimal](19, 2) NOT NULL,
	[productBuyPrice] [decimal](19, 2) NOT NULL,
	[isActive] [varchar](10) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] NOT NULL,
	[roleType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 6/20/2019 19:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[stockID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[stockName] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[stockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BillIncome] ON 

INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1, 1, CAST(8.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), N'phm2324')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (2, 1, CAST(3.54 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000002')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (3, 1, CAST(53.10 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000003')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (4, 1, CAST(10.62 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000004')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (5, 1, CAST(35.40 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000005')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (6, 1, CAST(17.70 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000006')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (7, 1, CAST(53.10 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000007')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (8, 1, CAST(53.10 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000008')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (9, 1, CAST(53.10 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000009')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (10, 1, CAST(53.10 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000010')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (11, 1, CAST(3.54 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000011')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (12, 1, CAST(212.40 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000012')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (13, 1, CAST(991.20 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000013')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (14, 1, CAST(53.10 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000014')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (15, 1, CAST(8.26 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000015')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1013, 1, CAST(3.54 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), N'PHMS1000016')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1014, 1, CAST(35.40 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), N'PHMS1000017')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1015, 1, CAST(88.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000018')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1016, 1, CAST(132.75 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000019')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1017, 1, CAST(165.20 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000020')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1018, 1, CAST(132.75 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000021')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1019, 1, CAST(35.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000022')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1020, 1, CAST(3.54 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000023')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1021, 1, CAST(3.54 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000024')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1022, 1, CAST(3.54 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), N'PHMS1000025')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1023, 1, CAST(3.54 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), N'PHMS1000026')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1024, 1, CAST(3.54 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), N'PHMS1000027')
INSERT [dbo].[BillIncome] ([billIncomeID], [perdoruesiID], [total], [billIncomeDate], [billNumber]) VALUES (1025, 1, CAST(12.39 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), N'PHMS1000028')
SET IDENTITY_INSERT [dbo].[BillIncome] OFF
SET IDENTITY_INSERT [dbo].[BillIncomeDetails] ON 

INSERT [dbo].[BillIncomeDetails] ([billIncomeDetailsID], [billIncomeID], [productID], [quantity], [subtotal], [billIncomeDate], [billIncomeTime]) VALUES (14, 1016, 11, 15, CAST(112.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'00:37:24.8080000' AS Time))
INSERT [dbo].[BillIncomeDetails] ([billIncomeDetailsID], [billIncomeID], [productID], [quantity], [subtotal], [billIncomeDate], [billIncomeTime]) VALUES (15, 1017, 3, 100, CAST(140.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'01:10:14.7630000' AS Time))
INSERT [dbo].[BillIncomeDetails] ([billIncomeDetailsID], [billIncomeID], [productID], [quantity], [subtotal], [billIncomeDate], [billIncomeTime]) VALUES (16, 1018, 11, 15, CAST(112.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'01:15:31.8380000' AS Time))
INSERT [dbo].[BillIncomeDetails] ([billIncomeDetailsID], [billIncomeID], [productID], [quantity], [subtotal], [billIncomeDate], [billIncomeTime]) VALUES (17, 1019, 5, 10, CAST(30.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'13:36:44.9200000' AS Time))
INSERT [dbo].[BillIncomeDetails] ([billIncomeDetailsID], [billIncomeID], [productID], [quantity], [subtotal], [billIncomeDate], [billIncomeTime]) VALUES (19, 1021, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'18:03:48.6800000' AS Time))
INSERT [dbo].[BillIncomeDetails] ([billIncomeDetailsID], [billIncomeID], [productID], [quantity], [subtotal], [billIncomeDate], [billIncomeTime]) VALUES (20, 1022, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-13' AS Date), CAST(N'16:11:16.1360000' AS Time))
INSERT [dbo].[BillIncomeDetails] ([billIncomeDetailsID], [billIncomeID], [productID], [quantity], [subtotal], [billIncomeDate], [billIncomeTime]) VALUES (21, 1023, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-05' AS Date), CAST(N'16:13:39.1340000' AS Time))
INSERT [dbo].[BillIncomeDetails] ([billIncomeDetailsID], [billIncomeID], [productID], [quantity], [subtotal], [billIncomeDate], [billIncomeTime]) VALUES (22, 1024, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:50:27.8590000' AS Time))
INSERT [dbo].[BillIncomeDetails] ([billIncomeDetailsID], [billIncomeID], [productID], [quantity], [subtotal], [billIncomeDate], [billIncomeTime]) VALUES (23, 1025, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-05' AS Date), CAST(N'18:22:43.7070000' AS Time))
INSERT [dbo].[BillIncomeDetails] ([billIncomeDetailsID], [billIncomeID], [productID], [quantity], [subtotal], [billIncomeDate], [billIncomeTime]) VALUES (24, 1025, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-05' AS Date), CAST(N'18:22:43.7070000' AS Time))
SET IDENTITY_INSERT [dbo].[BillIncomeDetails] OFF
SET IDENTITY_INSERT [dbo].[BillOutCome] ON 

INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (118, 1, CAST(8.40 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), N'PH32323')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (119, 1, CAST(8.40 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), N'PH32323')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (121, 1, CAST(12.80 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), N'PHMS1000003')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (122, 1, CAST(4.40 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), N'PHMS1000004')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (123, 1, CAST(4.40 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), N'PHMS1000005')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (124, 1, CAST(0.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), N'PHMS1000006')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1118, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), N'PHMS1000007')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1119, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), N'PHMS1000008')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1120, 4, CAST(21.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), N'PHMS1000009')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1121, 1, CAST(8.40 AS Decimal(19, 2)), CAST(N'2019-05-31' AS Date), N'PHMS1000010')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1122, 1, CAST(19.60 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), N'PHMS1000011')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1123, 1, CAST(17.40 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), N'PHMS1000012')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1124, 1, CAST(10.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), N'PHMS1000013')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1125, 1, CAST(29.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), N'PHMS1000014')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1126, 1, CAST(93.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), N'PHMS1000015')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1127, 1, CAST(53.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), N'PHMS1000016')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1128, 1, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000017')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1129, 1, CAST(61.20 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000018')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1130, 1, CAST(25.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000019')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1131, 1, CAST(31.80 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000020')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1132, 1, CAST(71.60 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000021')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1133, 1, CAST(36.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000022')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1134, 1, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000023')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1135, 1, CAST(36.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000024')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1136, 1, CAST(33.20 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000025')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1137, 1, CAST(70.80 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000026')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1138, 1, CAST(45.60 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000027')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1139, 1, CAST(40.60 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000028')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1140, 1, CAST(60.60 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000029')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1141, 1, CAST(90.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000030')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1142, 1, CAST(57.40 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000031')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1143, 1, CAST(97.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000032')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1144, 1, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000033')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1145, 1, CAST(60.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000034')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1146, 1, CAST(45.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000035')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1147, 1, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), N'PHMS1000036')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1148, 2, CAST(45.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000037')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1149, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000038')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1150, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000039')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1151, 1, CAST(12.60 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000040')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1152, 1, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000041')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1153, 1, CAST(160.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000042')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1154, 4, CAST(14.80 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000043')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1155, 4, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000044')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1156, 1, CAST(8.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000045')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1157, 1, CAST(7.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000046')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1158, 1, CAST(8.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000047')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1159, 1, CAST(8.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000048')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1160, 1, CAST(8.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000049')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1161, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000050')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1162, 1, CAST(5.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000051')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1163, 1, CAST(7.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000052')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1164, 2, CAST(8.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000053')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1165, 4, CAST(5.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), N'PHMS1000054')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1166, 1, CAST(10.00 AS Decimal(19, 2)), CAST(N'2019-06-05' AS Date), N'PHMS1000055')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1167, 1, CAST(18.00 AS Decimal(19, 2)), CAST(N'2019-06-05' AS Date), N'PHMS1000056')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1168, 1, CAST(4.40 AS Decimal(19, 2)), CAST(N'2019-06-05' AS Date), N'PHMS1000057')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1169, 1, CAST(150.00 AS Decimal(19, 2)), CAST(N'2019-06-15' AS Date), N'PHMS1000058')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1170, 1, CAST(13.80 AS Decimal(19, 2)), CAST(N'2019-06-15' AS Date), N'PHMS1000059')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1171, 1, CAST(31.50 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), N'PHMS1000060')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (1172, 1, CAST(24.30 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), N'PHMS1000061')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2171, 1, CAST(8.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000062')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2172, 1, CAST(7.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000063')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2173, 1, CAST(7.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000064')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2174, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000065')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2175, 1, CAST(18.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000066')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2176, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), N'PHMS1000067')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2177, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), N'PHMS1000068')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2178, 1, CAST(21.00 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), N'PHMS1000069')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2179, 1, CAST(11.20 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), N'PHMS1000070')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2180, 1, CAST(162.00 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), N'PHMS1000071')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2181, 1, CAST(30.00 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), N'PHMS1000072')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2182, 1, CAST(90.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000073')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2183, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000074')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2184, 1, CAST(16.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000075')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2185, 1, CAST(18.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000076')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2186, 1, CAST(20.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000077')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2187, 1, CAST(9.90 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000078')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2188, 1, CAST(12.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000079')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2189, 1, CAST(15.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000080')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2190, 1, CAST(11.90 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000081')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2191, 1, CAST(7.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000082')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2192, 1, CAST(13.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000083')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2193, 1, CAST(18.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000084')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2194, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000085')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2195, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000086')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2196, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000087')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2197, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000088')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2198, 1, CAST(22.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000089')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2199, 1, CAST(11.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000090')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2200, 1, CAST(17.90 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000091')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2201, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000092')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2202, 1, CAST(13.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000093')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2203, 1, CAST(7.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000094')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2204, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000095')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2205, 1, CAST(10.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000096')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2206, 1, CAST(10.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000097')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2207, 1, CAST(14.90 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000098')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2208, 1, CAST(6.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000099')
GO
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2209, 1, CAST(4.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000100')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2210, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000101')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2211, 1, CAST(12.90 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000102')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2212, 1, CAST(13.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000103')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2213, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000104')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2214, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000105')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2215, 1, CAST(2.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000106')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2216, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000107')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2217, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000108')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2218, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000109')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2219, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000110')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2220, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000111')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2221, 1, CAST(33.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000112')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2222, 1, CAST(5.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000113')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2223, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000114')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2224, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000115')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2225, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000116')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2226, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000117')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2227, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000118')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2228, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), N'PHMS1000119')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2229, 1, CAST(2.00 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), N'PHMS1000120')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2230, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), N'PHMS1000121')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2231, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), N'PHMS1000122')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2232, 1, CAST(6.40 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), N'PHMS1000123')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2233, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), N'PHMS1000124')
INSERT [dbo].[BillOutCome] ([billOutComeID], [perdoruesiID], [total], [billDate], [billNumber]) VALUES (2234, 1, CAST(6.40 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), N'PHMS1000125')
SET IDENTITY_INSERT [dbo].[BillOutCome] OFF
SET IDENTITY_INSERT [dbo].[BillOutComeDetails] ON 

INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1, 118, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'00:51:33.0590000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2, 118, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'00:51:33.0590000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (3, 118, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'00:51:33.0590000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (4, 118, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'00:51:33.0590000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (5, 119, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'00:53:20.6520000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (6, 119, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'00:53:20.6520000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (7, 119, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'00:53:20.6520000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (8, 119, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'00:53:20.6520000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (10, 121, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'02:14:35.9600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (11, 121, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'02:14:35.9600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (12, 121, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'02:14:35.9600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (13, 121, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'02:14:35.9600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (14, 121, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'02:14:35.9600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (15, 121, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'02:14:35.9600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (16, 122, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'02:15:33.4260000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (17, 122, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'02:15:33.4260000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (18, 123, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'02:15:52.9950000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (19, 123, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'02:15:52.9950000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1002, 1118, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'22:48:49.5910000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1003, 1119, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'22:49:06.6970000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1004, 1120, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'23:26:17.3010000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1005, 1120, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'23:26:17.3010000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1006, 1120, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'23:26:17.3010000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1007, 1120, 3, 10, CAST(14.00 AS Decimal(19, 2)), CAST(N'2019-05-30' AS Date), CAST(N'23:26:17.3010000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1008, 1121, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-31' AS Date), CAST(N'18:42:36.6780000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1009, 1121, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-05-31' AS Date), CAST(N'18:42:36.6780000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1010, 1121, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-05-31' AS Date), CAST(N'18:42:36.6780000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1011, 1121, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-05-31' AS Date), CAST(N'18:42:36.6780000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1012, 1122, 2, 5, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), CAST(N'01:22:55.0470000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1013, 1122, 1, 3, CAST(9.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), CAST(N'01:22:55.0470000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1014, 1122, 3, 4, CAST(5.60 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), CAST(N'01:22:55.0470000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1015, 1123, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), CAST(N'01:27:23.2170000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1016, 1123, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), CAST(N'01:27:23.2170000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1017, 1123, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), CAST(N'01:27:23.2170000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1018, 1123, 2, 10, CAST(10.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), CAST(N'01:27:23.2170000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1019, 1124, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), CAST(N'22:03:11.1510000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1020, 1125, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), CAST(N'22:09:35.9640000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1021, 1127, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-02' AS Date), CAST(N'22:19:20.6850000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1022, 1128, 2, 15, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'00:13:08.3490000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1023, 1129, 1, 15, CAST(45.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'00:25:33.3650000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1024, 1130, 3, 15, CAST(21.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'01:09:45.0730000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1025, 1131, 2, 15, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'01:19:50.9250000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1026, 1132, 1, 15, CAST(45.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'13:15:40.0510000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1027, 1133, 3, 15, CAST(21.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'13:18:53.3940000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1028, 1134, 2, 15, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'13:37:12.8340000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1029, 1136, 2, 15, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'13:53:27.1550000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1030, 1138, 2, 15, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'17:32:47.4550000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1031, 1139, 1, 5, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'17:38:32.2880000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1032, 1140, 1, 15, CAST(45.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'17:41:12.9690000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1033, 1140, 3, 9, CAST(12.60 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'17:41:12.9690000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1034, 1140, 2, 3, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'17:41:12.9690000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1035, 1141, 4, 30, CAST(90.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'19:16:58.1990000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1036, 1142, 3, 41, CAST(57.40 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'19:18:16.9010000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1037, 1143, 2, 97, CAST(97.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'19:24:10.5290000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1038, 1144, 1, 5, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'19:28:48.2210000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1039, 1145, 4, 20, CAST(60.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'19:30:13.2110000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1040, 1146, 1, 15, CAST(45.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'19:31:04.3040000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1041, 1147, 2, 15, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-03' AS Date), CAST(N'19:51:42.7940000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1042, 1148, 4, 15, CAST(45.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'01:57:31.0390000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1043, 1150, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'07:52:57.2860000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1044, 1151, 3, 9, CAST(12.60 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'07:55:40.8330000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1045, 1152, 1, 5, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'07:57:24.8720000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1046, 1153, 3, 50, CAST(70.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'14:58:06' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1047, 1153, 1, 30, CAST(90.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'14:58:06' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1048, 1154, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:06:53.3200000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1049, 1154, 2, 2, CAST(2.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:06:53.3200000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1050, 1154, 3, 3, CAST(4.20 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:06:53.3200000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1051, 1154, 3, 4, CAST(5.60 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:06:53.3200000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1052, 1155, 4, 5, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:07:21.3340000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1053, 1156, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:38:46.9930000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1054, 1156, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:38:46.9930000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1055, 1156, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:38:46.9930000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1056, 1156, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:38:46.9930000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1057, 1157, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:42:25.6950000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1058, 1157, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:42:25.6950000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1059, 1157, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:42:25.6950000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1060, 1158, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:52:58.6150000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1061, 1158, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:52:58.6150000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1062, 1158, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:52:58.6150000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1063, 1158, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:52:58.6150000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1064, 1159, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:54:40.4750000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1065, 1159, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:54:40.4750000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1066, 1159, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:54:40.4750000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1067, 1159, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:54:40.4750000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1068, 1160, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:56:15.0090000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1069, 1160, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:56:15.0090000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1070, 1160, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:56:15.0090000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1071, 1160, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:56:15.0090000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1072, 1161, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'17:57:25.0770000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1073, 1162, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:01:32.1890000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1074, 1162, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:01:32.1890000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1075, 1162, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:01:32.1890000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1076, 1163, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:06:49.4020000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1077, 1163, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:06:49.4020000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1078, 1163, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:06:49.4020000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1079, 1164, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:08:59.0600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1080, 1164, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:08:59.0600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1081, 1164, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:08:59.0600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1082, 1164, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:08:59.0600000' AS Time))
GO
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1083, 1165, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:10:31.6860000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1084, 1165, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:10:31.6860000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1085, 1165, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-04' AS Date), CAST(N'18:10:31.6860000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1086, 1166, 2, 10, CAST(10.00 AS Decimal(19, 2)), CAST(N'2019-06-05' AS Date), CAST(N'15:39:09.1680000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1087, 1167, 1, 6, CAST(18.00 AS Decimal(19, 2)), CAST(N'2019-06-05' AS Date), CAST(N'15:42:58.5030000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1088, 1168, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-05' AS Date), CAST(N'15:45:36.1870000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1089, 1168, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-05' AS Date), CAST(N'15:45:36.1870000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1090, 1169, 5, 5, CAST(150.00 AS Decimal(19, 2)), CAST(N'2019-06-15' AS Date), CAST(N'20:52:00.1240000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1091, 1170, 2, 3, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-15' AS Date), CAST(N'22:48:09.9420000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1092, 1170, 3, 2, CAST(2.80 AS Decimal(19, 2)), CAST(N'2019-06-15' AS Date), CAST(N'22:48:09.9420000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1093, 1170, 7, 1, CAST(4.50 AS Decimal(19, 2)), CAST(N'2019-06-15' AS Date), CAST(N'22:48:09.9420000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1094, 1170, 6, 2, CAST(3.50 AS Decimal(19, 2)), CAST(N'2019-06-15' AS Date), CAST(N'22:48:09.9420000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1095, 1171, 8, 3, CAST(15.00 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), CAST(N'15:00:32.1840000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1096, 1171, 9, 3, CAST(10.50 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), CAST(N'15:00:32.1840000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1097, 1171, 10, 3, CAST(6.00 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), CAST(N'15:00:32.1840000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1098, 1172, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), CAST(N'22:43:42.2310000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1099, 1172, NULL, 1, CAST(1.80 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), CAST(N'22:43:42.2310000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1100, 1172, 5, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), CAST(N'22:43:42.2310000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1101, 1172, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), CAST(N'22:43:42.2310000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1102, 1172, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), CAST(N'22:43:42.2310000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1103, 1172, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), CAST(N'22:43:42.2310000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (1104, 1172, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-16' AS Date), CAST(N'22:43:42.2310000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2095, 2171, 5, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'13:35:57.0930000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2096, 2171, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'13:35:57.0930000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2097, 2171, 10, 1, CAST(2.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'13:35:57.0930000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2098, 2172, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'13:39:37.9920000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2099, 2172, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'13:39:37.9920000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2100, 2172, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'13:39:37.9920000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2101, 2173, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'14:14:41.1220000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2102, 2173, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'14:14:41.1220000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2103, 2173, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'14:14:41.1220000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2104, 2174, NULL, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'20:37:07.6180000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2105, 2175, NULL, 10, CAST(18.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'21:54:55.5750000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2106, 2176, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-17' AS Date), CAST(N'22:07:18.1670000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2107, 2177, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), CAST(N'22:30:38.2490000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2108, 2178, 3, 15, CAST(21.00 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), CAST(N'22:38:49.3510000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2109, 2179, 3, 8, CAST(11.20 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), CAST(N'22:59:26.8260000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2110, 2180, NULL, 90, CAST(162.00 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), CAST(N'23:46:39.6000000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2111, 2181, NULL, 10, CAST(30.00 AS Decimal(19, 2)), CAST(N'2019-06-18' AS Date), CAST(N'23:50:25.4270000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2112, 2182, NULL, 30, CAST(90.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'01:48:42.4300000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2113, 2183, 5, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'13:37:12.5480000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2114, 2184, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:48:33.5670000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2115, 2184, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:48:33.5670000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2116, 2184, 7, 1, CAST(4.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:48:33.5670000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2117, 2184, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:48:33.5670000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2118, 2185, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:53:07.5230000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2119, 2185, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:53:07.5230000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2120, 2185, 7, 1, CAST(4.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:53:07.5230000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2121, 2185, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:53:07.5230000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2122, 2186, 5, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:56:18.9340000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2123, 2186, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:56:18.9340000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2124, 2186, 7, 1, CAST(4.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:56:18.9340000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2125, 2186, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:56:18.9340000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2126, 2187, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:58:18.1000000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2127, 2187, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:58:18.1000000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2128, 2187, 7, 1, CAST(4.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:58:18.1000000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2129, 2187, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'14:58:18.1000000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2130, 2188, 7, 1, CAST(4.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:06:29.0090000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2131, 2188, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:06:29.0090000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2132, 2188, 5, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:06:29.0090000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2133, 2189, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:07:26.1250000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2134, 2189, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:07:26.1250000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2135, 2189, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:07:26.1250000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2136, 2190, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:13:05.7250000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2137, 2190, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:13:05.7250000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2138, 2190, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:13:05.7250000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2139, 2191, 5, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:18:28.4280000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2140, 2191, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:18:28.4280000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2141, 2191, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:18:28.4280000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2142, 2192, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:21:54.1060000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2143, 2192, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:21:54.1060000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2144, 2192, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:21:54.1060000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2145, 2193, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:23:33.7710000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2146, 2193, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:23:33.7710000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2147, 2193, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:23:33.7710000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2148, 2193, 7, 1, CAST(4.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:23:33.7710000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2149, 2194, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:27:24.8710000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2150, 2195, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:30:39.8030000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2151, 2196, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:31:53.0100000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2152, 2197, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:33:21.7440000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2153, 2198, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:47:15.6570000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2154, 2198, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:47:15.6570000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2155, 2198, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:47:15.6570000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2156, 2198, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:47:15.6570000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2157, 2198, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:47:15.6570000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2158, 2198, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:47:15.6570000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2159, 2198, 10, 1, CAST(2.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:47:15.6570000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2160, 2199, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:51:27.9060000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2161, 2199, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:51:27.9060000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2162, 2199, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:51:27.9060000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2163, 2199, 10, 1, CAST(2.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:51:27.9060000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2164, 2200, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:54:05.2030000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2165, 2200, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:54:05.2030000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2166, 2200, 10, 1, CAST(2.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:54:05.2030000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2167, 2200, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:54:05.2030000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2168, 2200, 10, 1, CAST(2.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'15:54:05.2030000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2169, 2201, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:19:50.3400000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2170, 2202, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:25:04.4570000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2171, 2202, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:25:04.4570000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2172, 2202, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:25:04.4570000' AS Time))
GO
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2173, 2203, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:27:05.1870000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2174, 2203, 5, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:27:05.1870000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2175, 2203, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:27:05.1870000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2176, 2204, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:34:54.1200000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2177, 2205, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:44:29.6040000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2178, 2205, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:44:29.6040000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2179, 2206, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:47:40.3600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2180, 2206, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:47:40.3600000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2181, 2207, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:51:09.8680000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2182, 2207, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:51:09.8680000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2183, 2207, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:51:09.8680000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2184, 2207, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:51:09.8680000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2185, 2208, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:55:37.5930000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2186, 2208, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:55:37.5930000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2187, 2209, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:56:25.6850000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2188, 2209, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'16:56:25.6850000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2189, 2210, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:05:30.0810000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2190, 2211, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:22:32.8770000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2191, 2211, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:22:32.8770000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2192, 2211, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:22:32.8770000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2193, 2211, 5, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:22:32.8770000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2194, 2212, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:24:26.1940000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2195, 2212, 4, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:24:26.1940000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2196, 2212, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:24:26.1940000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2197, 2212, 5, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:24:26.1940000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2198, 2212, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:24:26.1940000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2199, 2213, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:28:28.1980000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2200, 2214, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:30:34.9890000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2201, 2215, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:33:17.1140000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2202, 2215, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:33:17.1140000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2203, 2216, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:36:55.8450000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2204, 2217, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:37:58.6950000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2205, 2220, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'17:50:50.3930000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2206, 2221, 1, 11, CAST(33.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'18:17:11.5900000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2207, 2222, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'19:36:01.9480000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2208, 2222, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'19:36:01.9480000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2209, 2222, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'19:36:01.9480000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2210, 2223, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'20:36:35.8070000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2211, 2224, 11, 1, CAST(7.50 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'20:37:52.7620000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2212, 2225, 2, 1, CAST(1.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'20:40:27.0420000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2213, 2226, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'23:09:49.8670000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2214, 2227, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'23:10:50.2340000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2215, 2228, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-19' AS Date), CAST(N'23:21:33.3160000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2216, 2229, 10, 1, CAST(2.00 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), CAST(N'01:14:52.2510000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2217, 2230, 8, 1, CAST(5.00 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), CAST(N'01:18:49.3540000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2218, 2231, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), CAST(N'02:08:15.2640000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2219, 2232, 1, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), CAST(N'16:38:22.2550000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2220, 2232, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), CAST(N'16:38:22.2550000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2221, 2232, 10, 1, CAST(2.00 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), CAST(N'16:38:22.2550000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2222, 2233, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), CAST(N'17:50:10.6270000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2223, 2234, 5, 1, CAST(3.00 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), CAST(N'18:22:13.6150000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2224, 2234, 3, 1, CAST(1.40 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), CAST(N'18:22:13.6150000' AS Time))
INSERT [dbo].[BillOutComeDetails] ([billOutComeDetailsID], [billOutComeID], [productID], [quantity], [subtotal], [billDate], [billTime]) VALUES (2225, 2234, 10, 1, CAST(2.00 AS Decimal(19, 2)), CAST(N'2019-06-20' AS Date), CAST(N'18:22:13.6150000' AS Time))
SET IDENTITY_INSERT [dbo].[BillOutComeDetails] OFF
INSERT [dbo].[Category] ([categoryID], [categoryType]) VALUES (1, N'Liquid')
INSERT [dbo].[Category] ([categoryID], [categoryType]) VALUES (2, N'Tablet')
INSERT [dbo].[Category] ([categoryID], [categoryType]) VALUES (3, N'Capsules')
INSERT [dbo].[Category] ([categoryID], [categoryType]) VALUES (4, N'Drops')
INSERT [dbo].[Category] ([categoryID], [categoryType]) VALUES (5, N'Suppositories')
INSERT [dbo].[Category] ([categoryID], [categoryType]) VALUES (6, N'Inhalers')
INSERT [dbo].[Category] ([categoryID], [categoryType]) VALUES (7, N'Injections')
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([companyID], [companyName], [companyBussinesNumber], [companyEmail], [companyContactNumber], [companyCountry], [companyAddress]) VALUES (1, N'Trepharm', N'123456789', N'trepharm@gmail.com', N'+123456789', N'Republika e Kosoves', N'Garibaldi')
INSERT [dbo].[Company] ([companyID], [companyName], [companyBussinesNumber], [companyEmail], [companyContactNumber], [companyCountry], [companyAddress]) VALUES (2, N'ImiFarma', N'987654321', N'imifarma@gmail.com', N'+987654321', N'Republika Shqiperise', N'Isuf Elezi , Pallati Colombo 2 ')
INSERT [dbo].[Company] ([companyID], [companyName], [companyBussinesNumber], [companyEmail], [companyContactNumber], [companyCountry], [companyAddress]) VALUES (3, N'ABCompany', N'357951456', N'abcompany@gmail.com', N'+38344123456', N'Kosovo', N'Rruga 123')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Perdoruesi] ON 

INSERT [dbo].[Perdoruesi] ([perdoruesiID], [roleID], [userName], [Password], [Name], [LastName], [Email], [Gender], [BirthDate], [Salary]) VALUES (1, 1, N'adisdurguti', N'durguti', N'Adis', N'Durguti', N'adisdurguti@gmail.com', N'M', CAST(N'1999-03-08' AS Date), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Perdoruesi] ([perdoruesiID], [roleID], [userName], [Password], [Name], [LastName], [Email], [Gender], [BirthDate], [Salary]) VALUES (2, 2, N'shkumbinsejdiu', N'shkumbin', N'Shkumbin', N'Sejdiu', N'shkumbinsejdiu@gmail.com', N'M', CAST(N'1999-07-14' AS Date), CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Perdoruesi] ([perdoruesiID], [roleID], [userName], [Password], [Name], [LastName], [Email], [Gender], [BirthDate], [Salary]) VALUES (4, 3, N'lumbeqiri', N'lumbeqiri', N'Lum', N'Beqiri', N'lumbeqiri@gmail.com', N'M', CAST(N'1998-11-27' AS Date), CAST(123456.00 AS Decimal(18, 2)))
INSERT [dbo].[Perdoruesi] ([perdoruesiID], [roleID], [userName], [Password], [Name], [LastName], [Email], [Gender], [BirthDate], [Salary]) VALUES (5, 3, N'fistekfilani', N'123456', N'Fistek', N'Filani', N'fistekfilani@gmail.com', N'M', CAST(N'1955-05-26' AS Date), CAST(123.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Perdoruesi] OFF
SET IDENTITY_INSERT [dbo].[PerdoruesiReport] ON 

INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'00:53:58' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'00:56:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (4, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'00:57:23' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (7, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'00:59:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (9, 1, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'00:59:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (10, 2, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'01:02:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (11, 2, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'01:02:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (12, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'01:15:23' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (13, 1, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'01:15:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (14, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'01:16:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (15, 1, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'01:17:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (16, 4, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'01:18:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (17, 4, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'01:18:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (18, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'01:19:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (19, 1, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'01:19:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (20, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'01:20:55' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (21, 1, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'01:21:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (22, 2, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'01:21:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (23, 2, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'01:22:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (24, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'01:23:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (25, 1, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'01:23:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (26, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'01:24:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (27, 1, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'01:25:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (28, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'01:26:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (29, 1, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'01:26:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (30, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'18:41:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (31, 1, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'18:43:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (32, 1, N'Loged IN', CAST(N'2019-05-31' AS Date), CAST(N'18:47:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (33, 1, N'Loged Out', CAST(N'2019-05-31' AS Date), CAST(N'18:48:23' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (34, 1, N'Loged IN', CAST(N'2019-06-02' AS Date), CAST(N'01:21:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (35, 1, N'Loged Out', CAST(N'2019-06-02' AS Date), CAST(N'01:24:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (36, 1, N'Loged IN', CAST(N'2019-06-02' AS Date), CAST(N'01:26:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (37, 1, N'Loged Out', CAST(N'2019-06-02' AS Date), CAST(N'01:26:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (38, 1, N'Loged IN', CAST(N'2019-06-02' AS Date), CAST(N'01:26:55' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (39, 1, N'Loged Out', CAST(N'2019-06-02' AS Date), CAST(N'01:27:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (40, 1, N'Loged IN', CAST(N'2019-06-02' AS Date), CAST(N'22:01:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (41, 1, N'Loged Out', CAST(N'2019-06-02' AS Date), CAST(N'22:03:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (42, 1, N'Loged IN', CAST(N'2019-06-02' AS Date), CAST(N'22:08:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (43, 1, N'Loged IN', CAST(N'2019-06-02' AS Date), CAST(N'22:11:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (44, 1, N'Loged Out', CAST(N'2019-06-02' AS Date), CAST(N'22:16:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (45, 1, N'Loged IN', CAST(N'2019-06-02' AS Date), CAST(N'22:17:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (46, 1, N'Loged Out', CAST(N'2019-06-02' AS Date), CAST(N'22:17:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (47, 1, N'Loged IN', CAST(N'2019-06-02' AS Date), CAST(N'22:18:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (48, 1, N'Loged Out', CAST(N'2019-06-02' AS Date), CAST(N'22:19:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (49, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'00:12:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (50, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'00:25:00' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (51, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'00:27:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (52, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'01:08:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (53, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'01:10:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (54, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'01:19:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (55, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'01:23:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (56, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'13:15:23' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (57, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'13:18:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (58, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'13:19:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (59, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'13:19:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (60, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'13:37:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (61, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'13:42:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (62, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'13:53:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (63, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'13:53:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (64, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'17:27:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (65, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'17:31:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (66, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'17:31:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (67, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'17:32:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (68, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'17:33:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (69, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'17:37:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (70, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'17:40:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (71, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'17:41:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (72, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:17:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (73, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:18:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (74, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:21:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (75, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:21:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (76, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:23:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (77, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:23:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (78, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:25:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (79, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:25:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (80, 2, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:25:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (81, 2, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:26:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (82, 2, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:27:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (83, 2, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:27:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (84, 2, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:27:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (85, 2, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:27:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (86, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:28:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (87, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:28:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (88, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:28:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (89, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:28:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (90, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:52:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (91, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:52:34' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (92, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:53:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (93, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:53:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (94, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:53:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (95, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:54:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (96, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'18:56:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (97, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'18:57:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (98, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:08:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (99, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:09:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (100, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:10:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (101, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:10:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (102, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:13:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (103, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:13:08' AS Time))
GO
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (104, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:14:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (105, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:15:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (106, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:16:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (107, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:17:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (108, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:17:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (109, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:17:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (110, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:18:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (111, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:18:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (112, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:22:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (113, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:22:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (114, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:23:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (115, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:24:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (116, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:28:34' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (117, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:28:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (118, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:30:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (119, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:30:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (120, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:30:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (121, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:31:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (122, 1, N'Loged IN', CAST(N'2019-06-03' AS Date), CAST(N'19:51:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (123, 1, N'Loged Out', CAST(N'2019-06-03' AS Date), CAST(N'19:54:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (124, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'01:44:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (125, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'01:45:11' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (126, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'01:46:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (127, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'01:47:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (128, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'01:48:11' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (129, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'01:48:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (130, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'01:49:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (131, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'01:50:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (132, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'01:50:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (133, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'01:51:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (134, 2, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'01:51:34' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (135, 2, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'01:57:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (136, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'01:58:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (137, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'02:09:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (138, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'07:49:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (139, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'07:52:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (140, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'07:54:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (141, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'07:55:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (142, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'07:56:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (143, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'07:57:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (144, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'07:57:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (145, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'14:55:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (146, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'15:25:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (147, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'15:27:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (148, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'15:28:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (149, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'15:56:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (150, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'15:56:57' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (151, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'15:57:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (152, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'15:59:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (153, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'16:41:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (154, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'16:41:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (155, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'16:47:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (156, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'16:48:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (157, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'16:51:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (158, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'16:52:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (159, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:03:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (160, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'17:04:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (161, 4, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:04:55' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (162, 4, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:06:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (163, 4, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'17:07:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (164, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:09:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (165, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'17:09:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (166, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:09:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (167, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'17:09:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (168, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:38:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (169, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'17:39:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (170, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:42:11' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (171, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'17:42:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (172, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:52:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (173, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'17:53:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (174, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:54:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (175, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'17:55:00' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (176, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:55:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (177, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'17:56:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (178, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'17:57:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (179, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'17:57:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (180, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'18:01:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (181, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'18:01:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (182, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'18:06:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (183, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'18:07:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (184, 2, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'18:08:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (185, 2, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'18:09:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (186, 4, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'18:10:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (187, 4, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'18:10:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (188, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'19:57:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (189, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'19:58:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (190, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'20:03:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (191, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'20:04:23' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (192, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'20:08:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (193, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'20:08:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (194, 1, N'Loged IN', CAST(N'2019-06-04' AS Date), CAST(N'20:09:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (195, 1, N'Loged Out', CAST(N'2019-06-04' AS Date), CAST(N'20:09:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (196, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'15:32:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (197, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'15:39:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (198, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'15:42:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (199, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'15:44:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (200, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'15:45:16' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (201, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'15:46:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (202, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'15:47:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (203, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'15:48:40' AS Time))
GO
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (204, 4, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'15:50:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (205, 4, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'15:50:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (206, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'15:51:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (207, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'15:52:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (208, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'16:50:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (209, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'16:51:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (210, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'17:50:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (211, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'17:51:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (212, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'17:59:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (213, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'17:59:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (214, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'18:47:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (215, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'18:50:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (216, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'18:52:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (217, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'18:53:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (218, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'19:11:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (219, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'19:11:33' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (220, 1, N'Loged IN', CAST(N'2019-06-05' AS Date), CAST(N'19:27:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (221, 1, N'Loged Out', CAST(N'2019-06-05' AS Date), CAST(N'19:28:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (222, 1, N'Loged IN', CAST(N'2019-06-06' AS Date), CAST(N'22:53:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (223, 1, N'Loged Out', CAST(N'2019-06-06' AS Date), CAST(N'22:54:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (224, 1, N'Loged IN', CAST(N'2019-06-06' AS Date), CAST(N'23:52:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (225, 1, N'Loged Out', CAST(N'2019-06-06' AS Date), CAST(N'23:52:33' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (226, 1, N'Loged IN', CAST(N'2019-06-06' AS Date), CAST(N'23:53:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (227, 1, N'Loged Out', CAST(N'2019-06-06' AS Date), CAST(N'23:53:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (228, 1, N'Loged IN', CAST(N'2019-06-06' AS Date), CAST(N'23:57:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (229, 1, N'Loged Out', CAST(N'2019-06-07' AS Date), CAST(N'00:00:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (230, 1, N'Loged IN', CAST(N'2019-06-07' AS Date), CAST(N'00:00:58' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (231, 1, N'Loged Out', CAST(N'2019-06-07' AS Date), CAST(N'00:05:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (232, 1, N'Loged IN', CAST(N'2019-06-07' AS Date), CAST(N'00:45:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (233, 1, N'Loged Out', CAST(N'2019-06-07' AS Date), CAST(N'00:46:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (234, 1, N'Loged IN', CAST(N'2019-06-07' AS Date), CAST(N'00:47:16' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (235, 1, N'Loged Out', CAST(N'2019-06-07' AS Date), CAST(N'00:47:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (236, 1, N'Loged IN', CAST(N'2019-06-08' AS Date), CAST(N'23:37:11' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (237, 1, N'Loged IN', CAST(N'2019-06-08' AS Date), CAST(N'23:39:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (238, 1, N'Loged Out', CAST(N'2019-06-08' AS Date), CAST(N'23:40:34' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (239, 1, N'Loged IN', CAST(N'2019-06-08' AS Date), CAST(N'23:44:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (240, 1, N'Loged Out', CAST(N'2019-06-08' AS Date), CAST(N'23:46:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (241, 4, N'Loged IN', CAST(N'2019-06-14' AS Date), CAST(N'21:40:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (242, 4, N'Loged Out', CAST(N'2019-06-14' AS Date), CAST(N'21:41:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (243, 1, N'Loged IN', CAST(N'2019-06-14' AS Date), CAST(N'21:41:23' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (244, 1, N'Loged Out', CAST(N'2019-06-14' AS Date), CAST(N'21:42:16' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (245, 2, N'Loged IN', CAST(N'2019-06-14' AS Date), CAST(N'21:44:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (246, 2, N'Loged Out', CAST(N'2019-06-14' AS Date), CAST(N'21:44:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (247, 1, N'Loged IN', CAST(N'2019-06-14' AS Date), CAST(N'21:45:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (248, 1, N'Loged Out', CAST(N'2019-06-14' AS Date), CAST(N'21:47:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (249, 2, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'02:02:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (250, 2, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'02:02:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (251, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'02:09:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (252, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'02:09:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (253, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'02:09:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (254, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'02:10:19' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1241, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'19:57:16' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1242, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'19:57:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1243, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'20:46:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1244, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'20:52:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1245, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'20:54:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1246, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'20:56:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1247, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'20:57:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1248, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'20:57:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1249, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'21:02:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1250, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'21:04:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1251, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'22:28:55' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1252, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'22:30:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1253, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'22:30:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1254, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'22:31:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1255, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'22:31:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1256, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'22:43:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1257, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'22:44:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1258, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'22:46:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1259, 1, N'Loged IN', CAST(N'2019-06-15' AS Date), CAST(N'22:46:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1260, 1, N'Loged Out', CAST(N'2019-06-15' AS Date), CAST(N'22:48:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1261, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'13:26:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1262, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'13:26:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1263, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'13:56:16' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1264, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'13:56:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1265, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'13:57:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1266, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'14:01:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1267, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'14:02:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1268, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'14:02:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1269, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'14:03:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1270, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'14:06:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1271, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'14:28:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1272, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'14:31:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1273, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'14:32:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1274, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'14:32:16' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1275, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'14:33:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1276, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'14:34:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1277, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'14:54:57' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1278, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'14:56:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1279, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'14:58:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1280, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'15:13:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1281, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'15:27:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1282, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'15:27:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1283, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'15:28:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1284, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'15:29:19' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1285, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'15:30:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1286, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'15:37:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1287, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'21:47:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1288, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'21:48:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1289, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'21:55:02' AS Time))
GO
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1290, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'21:55:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1291, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'22:25:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1292, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'22:39:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1293, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'22:40:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1294, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'22:43:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1295, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'22:46:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1296, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'22:47:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1297, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'22:47:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1298, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'22:48:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1299, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'22:49:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1300, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'22:49:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1301, 1, N'Loged IN', CAST(N'2019-06-16' AS Date), CAST(N'22:53:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (1302, 1, N'Loged Out', CAST(N'2019-06-16' AS Date), CAST(N'22:54:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2263, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'13:34:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2264, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'13:36:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2265, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'13:39:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2266, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'13:40:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2267, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'14:14:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2268, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'17:56:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2269, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'17:57:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2270, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:08:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2271, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'18:08:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2272, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:10:00' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2273, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'18:10:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2274, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:11:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2275, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'18:12:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2276, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:14:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2277, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'18:14:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2278, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:19:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2279, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:26:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2280, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'18:27:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2281, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:27:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2282, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:29:11' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2283, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'18:29:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2284, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'18:34:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2285, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:37:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2286, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'18:39:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2287, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:54:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2288, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'18:55:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2289, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'18:56:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2290, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'18:57:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2291, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'19:32:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2292, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'19:33:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2293, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'19:35:58' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2294, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'19:38:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2295, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'19:38:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2296, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'19:40:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2297, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'19:40:19' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2298, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'19:41:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2299, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'19:41:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2300, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'19:42:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2301, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'19:46:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2302, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'19:47:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2303, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'19:47:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2304, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'19:48:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2305, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'20:25:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2306, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'20:29:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2307, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'20:29:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2308, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'20:36:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2309, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'20:38:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2310, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'21:37:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2311, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'21:37:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2312, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'21:42:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2313, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'21:42:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2314, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'21:43:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2315, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'21:43:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2316, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'21:44:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2317, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'21:44:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2318, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'21:45:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2319, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'21:45:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2320, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'21:47:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2321, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'21:52:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2322, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'21:53:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2323, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'21:57:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2324, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:03:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2325, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:03:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2326, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:06:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2327, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:07:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2328, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:09:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2329, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:12:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2330, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:18:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2331, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:19:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2332, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:21:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2333, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:21:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2334, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:22:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2335, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:23:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2336, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:24:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2337, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:28:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2338, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:36:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2339, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:36:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2340, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:37:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2341, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:37:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2342, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:38:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2343, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:40:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2344, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:40:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2345, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:42:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2346, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:43:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2347, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:44:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2348, 1, N'Loged IN', CAST(N'2019-06-17' AS Date), CAST(N'22:47:19' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (2349, 1, N'Loged Out', CAST(N'2019-06-17' AS Date), CAST(N'22:48:29' AS Time))
GO
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3263, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'18:06:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3264, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'19:32:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3265, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'19:32:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3266, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'19:37:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3267, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'19:37:57' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3268, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'19:38:33' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3269, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'19:38:57' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3270, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'19:39:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3271, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'19:39:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3272, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'19:40:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3273, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'19:40:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3274, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'19:42:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3275, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'19:43:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3276, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'19:44:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3277, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'19:45:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3278, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'19:47:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3279, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'19:52:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3280, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'19:57:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3281, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'19:57:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3282, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'19:58:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3283, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:00:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3284, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:10:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3285, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:12:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3286, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:14:16' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3287, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:16:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3288, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:18:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3289, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:19:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3290, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:20:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3291, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:23:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3292, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:24:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3293, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:25:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3294, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:29:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3295, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:29:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3296, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:30:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3297, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:34:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3298, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:34:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3299, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:36:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3300, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:38:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3301, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:38:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3302, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:42:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3303, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:44:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3304, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:45:58' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3305, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:46:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3306, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:51:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3307, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:52:33' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3308, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:52:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3309, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:53:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3310, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:54:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3311, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'20:57:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3312, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'20:58:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3313, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'21:00:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3314, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'21:04:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3315, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'21:06:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3316, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'21:08:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3317, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'21:09:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3318, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'21:09:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3319, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'21:10:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3320, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'21:10:57' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3321, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'21:11:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3322, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'21:29:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3323, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'21:31:00' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3324, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'21:41:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3325, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'21:41:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3326, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'22:15:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3327, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'22:15:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3328, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'22:28:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3329, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'22:29:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3330, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'22:29:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3331, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'22:29:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3332, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'22:30:23' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3333, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'22:34:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3334, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'22:35:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3335, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'22:36:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3336, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'22:37:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3337, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'22:38:58' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3338, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'22:39:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3339, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'22:42:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3340, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'22:54:00' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3341, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'22:58:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3342, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'22:59:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3343, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'23:03:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3344, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'23:46:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3345, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'23:47:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3346, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'23:49:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3347, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'23:50:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3348, 1, N'Loged IN', CAST(N'2019-06-18' AS Date), CAST(N'23:54:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3349, 1, N'Loged Out', CAST(N'2019-06-18' AS Date), CAST(N'23:55:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3350, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'00:18:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3351, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'00:19:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3352, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'00:21:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3353, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'00:23:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3354, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'00:23:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3355, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'00:23:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3356, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'00:33:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3357, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'00:34:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3358, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'00:36:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3359, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'00:37:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3360, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'00:38:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3361, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'00:38:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3362, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'00:39:10' AS Time))
GO
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3363, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'00:40:11' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3364, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'00:40:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3365, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'00:42:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3366, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'00:46:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3367, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'01:11:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3368, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'01:14:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3369, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'01:16:58' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3370, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'01:26:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3371, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'01:29:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3372, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'01:30:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3373, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'01:31:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3374, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'01:33:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3375, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'01:43:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3376, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'01:46:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3377, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'01:47:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3378, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'01:47:55' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3379, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'01:52:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3380, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'01:52:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3381, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'01:53:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3382, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'13:36:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3383, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'13:37:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3384, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'13:37:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3385, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'13:38:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3386, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'14:47:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3387, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'14:49:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3388, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'14:52:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3389, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'14:53:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3390, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'14:55:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3391, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'14:58:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3392, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'14:59:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3393, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:06:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3394, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:07:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3395, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'15:07:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3396, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:12:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3397, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'15:16:00' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3398, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:18:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3399, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'15:19:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3400, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:21:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3401, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:23:16' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3402, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'15:23:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3403, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:25:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3404, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:27:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3405, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'15:27:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3406, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:30:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3407, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'15:30:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3408, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:30:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3409, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:31:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3410, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:33:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3411, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'15:44:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3412, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:46:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3413, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'15:47:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3414, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:51:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3415, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'15:53:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3416, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'15:55:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3417, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:14:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3418, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:15:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3419, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:16:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3420, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:16:19' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3421, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:16:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3422, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:17:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3423, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:17:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3424, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:17:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3425, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:19:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3426, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:20:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3427, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:24:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3428, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:26:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3429, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:33:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3430, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:34:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3431, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:35:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3432, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:44:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3433, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:44:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3434, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:47:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3435, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:48:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3436, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:50:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3437, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:51:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3438, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:55:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3439, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'16:56:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3440, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'16:57:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3441, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:05:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3442, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:05:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3443, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:22:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3444, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:22:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3445, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:24:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3446, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:27:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3447, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:28:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3448, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:28:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3449, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:30:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3450, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:30:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3451, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:33:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3452, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:33:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3453, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:36:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3454, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:37:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3455, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:37:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3456, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:41:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3457, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:41:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3458, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:42:11' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3459, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:43:33' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3460, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:44:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3461, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:50:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3462, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:51:06' AS Time))
GO
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3463, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'17:56:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3464, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'17:57:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3465, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:00:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3466, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:01:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3467, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:03:34' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3468, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:03:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3469, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:08:00' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3470, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:08:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3471, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:10:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3472, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:11:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3473, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:16:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3474, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:17:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3475, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:17:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3476, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:17:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3477, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:19:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3478, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:19:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3479, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:27:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3480, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:27:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3481, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:29:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3482, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:42:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3483, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:43:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3484, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:43:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3485, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:44:58' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3486, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:45:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3487, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:46:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3488, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:46:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3489, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:49:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3490, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:49:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3491, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'18:51:11' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3492, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'18:51:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3493, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'19:05:34' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3494, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'19:05:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3495, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'19:09:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3496, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'19:09:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3497, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'19:27:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3498, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'19:27:58' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3499, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'19:35:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3500, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'19:36:18' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3501, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'19:37:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3502, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'19:37:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3503, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'19:39:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3504, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'19:44:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3505, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'19:44:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3506, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'19:45:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3507, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'19:45:57' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3508, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'19:46:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3509, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'19:49:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3510, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'19:50:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3511, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'20:03:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3512, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'20:06:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3513, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'20:10:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3514, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'20:12:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3515, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'20:13:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3516, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'20:13:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3517, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'20:14:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3518, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'20:36:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3519, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'20:36:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3520, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'20:37:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3521, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'20:40:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3522, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'20:40:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3523, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'20:41:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3524, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'20:42:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3525, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:09:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3526, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:10:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3527, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:10:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3528, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:11:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3529, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:11:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3530, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:13:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3531, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:20:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3532, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:22:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3533, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:23:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3534, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:23:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3535, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:27:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3536, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:27:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3537, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:29:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3538, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:31:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3539, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:32:34' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3540, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:33:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3541, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:34:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3542, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:34:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3543, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:36:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3544, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:37:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3545, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:40:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3546, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:42:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3547, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:45:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3548, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:46:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3549, 1, N'Loged IN', CAST(N'2019-06-19' AS Date), CAST(N'23:52:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3550, 1, N'Loged Out', CAST(N'2019-06-19' AS Date), CAST(N'23:53:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3551, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'00:34:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3552, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'00:34:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3553, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'00:41:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3554, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'00:41:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3555, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'00:42:55' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3556, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'00:43:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3557, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'00:46:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3558, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'00:47:00' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3559, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'00:47:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3560, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'00:47:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3561, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'00:49:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3562, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'00:54:43' AS Time))
GO
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3563, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'00:55:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3564, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'01:08:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3565, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'01:32:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3566, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'01:53:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3567, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'01:53:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3568, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'01:59:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3569, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'01:59:57' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3570, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:00:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3571, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:01:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3572, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:01:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3573, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:02:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3574, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:05:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3575, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:06:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3576, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:07:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3577, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:07:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3578, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:07:57' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3579, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:08:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3580, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:11:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3581, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:12:33' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3582, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:13:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3583, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:14:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3584, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:15:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3585, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:16:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3586, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:21:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3587, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:22:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3588, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:23:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3589, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:24:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3590, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:24:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3591, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:25:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3592, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:34:19' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3593, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:34:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3594, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:58:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3595, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:58:34' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3596, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'02:59:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3597, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'02:59:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3598, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:01:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3599, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:01:28' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3600, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:04:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3601, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:04:24' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3602, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:05:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3603, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:05:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3604, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:10:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3605, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:11:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3606, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:15:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3607, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:15:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3608, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:16:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3609, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:16:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3610, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:21:30' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3611, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:21:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3612, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:24:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3613, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:24:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3614, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:27:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3615, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:27:14' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3616, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:28:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3617, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:28:33' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3618, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:29:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3619, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:29:47' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3620, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:33:06' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3621, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:33:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3622, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:39:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3623, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:39:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3624, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:44:23' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3625, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:44:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3626, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:47:34' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3627, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:47:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3628, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:48:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3629, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:48:16' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3630, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:49:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3631, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:49:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3632, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'03:50:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3633, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'03:50:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3634, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:03:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3635, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:03:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3636, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:04:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3637, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:05:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3638, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:05:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3639, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:06:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3640, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:06:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3641, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:07:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3642, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:07:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3643, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:07:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3644, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:08:02' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3645, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:08:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3646, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:08:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3647, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:08:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3648, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:13:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3649, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:13:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3650, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:22:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3651, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:23:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3652, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:23:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3653, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:24:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3654, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:25:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3655, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:26:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3656, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:27:39' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3657, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:27:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3658, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:28:31' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3659, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:28:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3660, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:36:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3661, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:37:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3662, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:37:58' AS Time))
GO
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3663, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:38:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3664, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:40:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3665, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:40:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3666, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:41:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3667, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:41:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3668, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:44:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3669, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:44:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3670, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'13:47:34' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3671, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'13:48:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3672, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'14:06:13' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3673, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'14:06:29' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3674, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'14:07:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3675, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'14:30:42' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3676, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'14:33:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3677, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'14:34:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3678, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'14:36:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3679, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'14:37:58' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3680, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'14:38:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3681, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'14:54:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3682, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'14:59:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3683, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'14:59:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3684, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:01:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3685, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'15:03:36' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3686, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:10:01' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3687, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:10:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3688, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'15:11:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3689, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:15:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3690, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'15:15:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3691, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:16:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3692, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:19:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3693, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:20:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3694, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'15:21:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3695, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:22:15' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3696, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'15:22:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3697, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:24:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3698, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'15:24:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3699, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:30:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3700, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'15:30:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3701, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'15:32:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3702, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'15:42:16' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3703, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'16:06:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3704, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'16:07:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3705, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'16:07:52' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3706, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'16:08:20' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3707, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'16:10:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3708, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'16:11:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3709, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'16:12:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3710, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'16:13:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3711, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'16:16:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3712, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'16:17:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3713, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'16:24:51' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3714, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'16:25:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3715, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'16:33:23' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3716, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'16:35:19' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3717, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'16:37:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3718, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'16:38:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3719, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'16:57:48' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3720, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'16:57:59' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3721, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:08:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3722, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'17:08:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3723, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:09:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3724, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'17:10:07' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3725, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:11:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3726, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'17:11:35' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3727, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:13:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3728, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:16:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3729, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'17:16:27' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3730, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:18:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3731, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'17:19:38' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3732, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:28:03' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3733, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'17:28:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3734, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:35:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3735, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:38:46' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3736, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'17:44:50' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3737, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:50:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3738, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'17:53:11' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3739, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'17:59:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3740, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'17:59:33' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3741, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'18:03:56' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3742, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'18:07:09' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3743, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'18:21:53' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3744, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'18:24:26' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3745, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'18:24:45' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3746, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'18:26:32' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3747, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'18:27:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3748, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'18:35:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3749, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'18:35:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3750, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'18:42:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3751, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'18:43:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3752, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'18:52:57' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3753, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'18:54:05' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3754, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'18:54:49' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3755, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'18:55:44' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3756, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'18:56:33' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3757, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'18:59:37' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3758, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'19:00:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3759, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'19:04:40' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3760, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'19:06:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3761, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'19:06:43' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3762, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'19:09:59' AS Time))
GO
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3763, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'19:10:54' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3764, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'19:11:08' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3765, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'19:12:10' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3766, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'19:12:22' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3767, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'19:13:17' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3768, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'19:13:41' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3769, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'19:17:25' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3770, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'19:21:12' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3771, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'19:21:21' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3772, 1, N'Loged IN', CAST(N'2019-06-20' AS Date), CAST(N'19:23:04' AS Time))
INSERT [dbo].[PerdoruesiReport] ([reportID], [perdoruesiID], [status], [date], [time]) VALUES (3773, 1, N'Loged Out', CAST(N'2019-06-20' AS Date), CAST(N'19:23:20' AS Time))
SET IDENTITY_INSERT [dbo].[PerdoruesiReport] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (1, 2, 2, N'123456789111', N'ASP123456', N'Aspirin', N'480mg', CAST(N'2019-05-13' AS Date), CAST(N'2019-06-29' AS Date), CAST(3.00 AS Decimal(19, 2)), CAST(1.50 AS Decimal(19, 2)), N'true')
INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (2, 1, 2, N'156516163568', N'PAR894555', N'Paracetamol', N'650mg', CAST(N'2019-05-20' AS Date), CAST(N'2018-05-12' AS Date), CAST(1.00 AS Decimal(19, 2)), CAST(0.50 AS Decimal(19, 2)), N'true')
INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (3, 2, 2, N'798451615465', N'DAF798513', N'Dafalgan', N'850mg', CAST(N'2019-05-20' AS Date), CAST(N'2020-05-20' AS Date), CAST(1.40 AS Decimal(19, 2)), CAST(0.70 AS Decimal(19, 2)), N'true')
INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (4, 2, 3, N'897651366456', N'DAF9785616', N'Dafalgan', N'450mg', CAST(N'2019-05-20' AS Date), CAST(N'2020-05-20' AS Date), CAST(3.00 AS Decimal(19, 2)), CAST(1.50 AS Decimal(19, 2)), N'false')
INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (5, 1, 2, N'845620311234', N'ANA78126', N'Analgin', N'360mg', CAST(N'2019-06-10' AS Date), CAST(N'2020-06-10' AS Date), CAST(3.00 AS Decimal(19, 2)), CAST(1.50 AS Decimal(19, 2)), N'true')
INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (6, 1, 4, N'976213948123', N'RHI751662', N'Rhinostop', N'400mg', CAST(N'2019-06-10' AS Date), CAST(N'2020-06-15' AS Date), CAST(1.75 AS Decimal(19, 2)), CAST(0.45 AS Decimal(19, 2)), N'false')
INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (7, 1, 1, N'331655616489', N'IPO1626498', N'Iboprufen', N'1300mg', CAST(N'2019-06-15' AS Date), CAST(N'2021-06-15' AS Date), CAST(4.50 AS Decimal(19, 2)), CAST(2.00 AS Decimal(19, 2)), N'true')
INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (8, 2, 2, N'897415665485', N'CET2611615', N'Cetirizin', N'1500mg', CAST(N'2019-06-10' AS Date), CAST(N'2022-06-16' AS Date), CAST(5.00 AS Decimal(19, 2)), CAST(2.50 AS Decimal(19, 2)), N'false')
INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (9, 1, 3, N'981561162123', N'OME2164951', N'Omeprazol', N'960mg', CAST(N'2019-06-14' AS Date), CAST(N'2020-06-19' AS Date), CAST(3.50 AS Decimal(19, 2)), CAST(2.50 AS Decimal(19, 2)), N'true')
INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (10, 1, 5, N'867453165178', N'SEF215468', N'Seftizon', N'850mg', CAST(N'2019-06-14' AS Date), CAST(N'2020-06-04' AS Date), CAST(2.00 AS Decimal(19, 2)), CAST(0.70 AS Decimal(19, 2)), N'true')
INSERT [dbo].[Product] ([productID], [companyID], [categoryID], [productBarcode], [productSericNumber], [productName], [productDosage], [manufactoringDate], [expiringDate], [productSellPrice], [productBuyPrice], [isActive]) VALUES (11, 3, 3, N'981319191695', N'PAN4561651', N'Pantoprazol', N'700mg', CAST(N'2019-06-10' AS Date), CAST(N'2021-09-12' AS Date), CAST(7.50 AS Decimal(19, 2)), CAST(3.00 AS Decimal(19, 2)), N'false')
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[Role] ([roleID], [roleType]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([roleID], [roleType]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([roleID], [roleType]) VALUES (3, N'Employee')
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (1, 1, N'Aspirin', 18)
INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (2, 2, N'Paracetamol', 42)
INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (3, 3, N'Dafalgan Tablet', 85)
INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (4, 4, N'Dafalgan Capsules', 58)
INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (5, 5, N'Analgin Tablet', 25)
INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (6, 6, N'Rhinostop Drops', 148)
INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (7, 7, N'Iboprufen Liquid', 73)
INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (8, 8, N'Cetirizin Tablet', 36)
INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (9, 9, N'Omeprazol Capsules', 62)
INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (10, 10, N'Seftizon Suppositories', 109)
INSERT [dbo].[Stock] ([stockID], [productID], [stockName], [quantity]) VALUES (2012, 11, N'Pantoprazol Capsules 700mg', 13)
SET IDENTITY_INSERT [dbo].[Stock] OFF
ALTER TABLE [dbo].[BillIncome]  WITH CHECK ADD  CONSTRAINT [FK_BillIncome_Perdoruesi] FOREIGN KEY([perdoruesiID])
REFERENCES [dbo].[Perdoruesi] ([perdoruesiID])
GO
ALTER TABLE [dbo].[BillIncome] CHECK CONSTRAINT [FK_BillIncome_Perdoruesi]
GO
ALTER TABLE [dbo].[BillIncomeDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillIncomeDetails_BillIncome] FOREIGN KEY([billIncomeID])
REFERENCES [dbo].[BillIncome] ([billIncomeID])
GO
ALTER TABLE [dbo].[BillIncomeDetails] CHECK CONSTRAINT [FK_BillIncomeDetails_BillIncome]
GO
ALTER TABLE [dbo].[BillIncomeDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillIncomeDetails_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[BillIncomeDetails] CHECK CONSTRAINT [FK_BillIncomeDetails_Product]
GO
ALTER TABLE [dbo].[BillOutCome]  WITH CHECK ADD  CONSTRAINT [FK_BillOutCome_Perdoruesi] FOREIGN KEY([perdoruesiID])
REFERENCES [dbo].[Perdoruesi] ([perdoruesiID])
GO
ALTER TABLE [dbo].[BillOutCome] CHECK CONSTRAINT [FK_BillOutCome_Perdoruesi]
GO
ALTER TABLE [dbo].[BillOutComeDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillOutComeDetails_BillOutComeDetails] FOREIGN KEY([billOutComeID])
REFERENCES [dbo].[BillOutCome] ([billOutComeID])
GO
ALTER TABLE [dbo].[BillOutComeDetails] CHECK CONSTRAINT [FK_BillOutComeDetails_BillOutComeDetails]
GO
ALTER TABLE [dbo].[BillOutComeDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillOutComeDetails_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[BillOutComeDetails] CHECK CONSTRAINT [FK_BillOutComeDetails_Product]
GO
ALTER TABLE [dbo].[Perdoruesi]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[Perdoruesi] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[PerdoruesiReport]  WITH CHECK ADD  CONSTRAINT [FK_PerdoruesiReport_Perdoruesi] FOREIGN KEY([perdoruesiID])
REFERENCES [dbo].[Perdoruesi] ([perdoruesiID])
GO
ALTER TABLE [dbo].[PerdoruesiReport] CHECK CONSTRAINT [FK_PerdoruesiReport_Perdoruesi]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([companyID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Product]
GO
USE [master]
GO
ALTER DATABASE [Pharmacy] SET  READ_WRITE 
GO
