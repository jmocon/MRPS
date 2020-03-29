USE [MRPS]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/29/2020 7:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CriticalLevel]    Script Date: 3/29/2020 7:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CriticalLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Unit_Id] [int] NOT NULL,
 CONSTRAINT [PK_CriticalLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Forecast]    Script Date: 3/29/2020 7:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forecast](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Day] [int] NULL,
 CONSTRAINT [PK_Forecast] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 3/29/2020 7:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Unit_Id] [int] NOT NULL,
	[X_DateCreated] [datetime] NULL,
	[X_Archived] [tinyint] NOT NULL,
	[X_Deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[Description] [varchar](500) NULL,
	[Timer] [decimal](18, 2) NULL,
	[X_Deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Menu_Id] [int] NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Unit_Id] [int] NULL,
 CONSTRAINT [PK_MenuItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Production]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Production](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Menu_Id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[X_DateCreated] [datetime] NULL,
	[X_Done] [datetime] NULL,
 CONSTRAINT [PK_Production] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Supplier_Id] [int] NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Unit_Id] [int] NOT NULL,
	[DatePurchased] [date] NOT NULL,
	[Forecast_Id] [int] NULL,
	[X_DateCreated] [datetime] NOT NULL,
	[X_User_Id] [int] NULL,
	[X_Deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PersonName] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[MobileNumber] [varchar](50) NULL,
	[Landline] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Abbr] [varchar](10) NULL,
	[Conversion] [decimal](25, 4) NULL,
	[Type] [tinyint] NULL,
 CONSTRAINT [PK_Unit_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[Usertype] [tinyint] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Meat')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Seasoning')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Vegetable')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Forecast] ON 

INSERT [dbo].[Forecast] ([Id], [StartDate], [EndDate], [Item_Id], [Type], [Day]) VALUES (35, CAST(N'2020-03-25' AS Date), CAST(N'2021-03-25' AS Date), 1, 2, 17)
INSERT [dbo].[Forecast] ([Id], [StartDate], [EndDate], [Item_Id], [Type], [Day]) VALUES (37, CAST(N'2020-03-28' AS Date), CAST(N'2020-04-25' AS Date), 19, 1, 4)
INSERT [dbo].[Forecast] ([Id], [StartDate], [EndDate], [Item_Id], [Type], [Day]) VALUES (38, CAST(N'2020-03-26' AS Date), CAST(N'2020-04-02' AS Date), 16, 2, 8)
SET IDENTITY_INSERT [dbo].[Forecast] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (1, N'Onion', CAST(20.00 AS Decimal(18, 2)), 1, 13, CAST(N'2020-02-22T17:57:44.080' AS DateTime), 0, 0)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (2, N'Water', CAST(1.00 AS Decimal(18, 2)), 2, 12, CAST(N'2020-02-22T17:58:58.890' AS DateTime), 0, 0)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (3, N'Toyo', CAST(20.00 AS Decimal(18, 2)), 2, 12, CAST(N'2020-02-25T09:37:47.323' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (4, N'Toyo', CAST(20.00 AS Decimal(18, 2)), 2, 12, CAST(N'2020-02-25T10:13:44.447' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (5, N'hold1', CAST(20.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-02-25T10:14:58.837' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (6, N'hold', CAST(20.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-02-25T10:17:11.973' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (7, N'hold', CAST(20.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-02-25T10:17:51.217' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (8, N'hold12', CAST(200.00 AS Decimal(18, 2)), 2, 12, CAST(N'2020-02-25T10:21:04.650' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (9, N'hulidap', CAST(50.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-02-25T12:58:00.527' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (10, N'hulidapp', CAST(50.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-02-25T12:58:11.850' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (11, N'kalabasa', CAST(50.00 AS Decimal(18, 2)), 3, 13, CAST(N'2020-02-25T13:25:14.300' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (12, N'boi', CAST(12.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-02-25T13:26:11.087' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (13, N'opi', CAST(132.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-02-25T13:27:05.287' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (14, N'ads', CAST(12.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-02-25T13:28:12.173' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (15, N'pop', CAST(12.00 AS Decimal(18, 2)), 2, 12, CAST(N'2020-02-25T13:58:02.563' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (16, N'CarrotandPArr0tA$$', CAST(18.21 AS Decimal(18, 2)), 1, 12, CAST(N'2020-02-26T07:25:58.067' AS DateTime), 0, 0)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (17, N'Pork Belly', CAST(250.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-02-26T07:26:29.707' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (18, N'pork', CAST(50.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-03-05T20:13:10.830' AS DateTime), 0, 0)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (19, N'test 1234', CAST(123.00 AS Decimal(18, 2)), 1, 13, CAST(N'2020-03-14T01:55:28.250' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (20, N'Cocon0t@', CAST(5444.33 AS Decimal(18, 2)), 2, 14, CAST(N'2020-03-29T11:23:57.110' AS DateTime), 0, 1)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (21, N'Item 1', CAST(11.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-03-29T11:58:34.693' AS DateTime), 0, 0)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (22, N'Item 2', CAST(12.00 AS Decimal(18, 2)), 1, 12, CAST(N'2020-03-29T12:01:13.997' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [Name], [Price], [Description], [Timer], [X_Deleted]) VALUES (1, N'Menudo', CAST(100.00 AS Decimal(18, 2)), N'Mixed vegetable and pork', CAST(1.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Description], [Timer], [X_Deleted]) VALUES (2, N'Laingpo', CAST(400.00 AS Decimal(18, 2)), N'saved', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Description], [Timer], [X_Deleted]) VALUES (3, N'popopo', CAST(98.00 AS Decimal(18, 2)), N'pewpew', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Description], [Timer], [X_Deleted]) VALUES (4, N'Mechado', CAST(65.00 AS Decimal(18, 2)), N'Mechado Description', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Description], [Timer], [X_Deleted]) VALUES (5, N'Fried Chicker', CAST(100.00 AS Decimal(18, 2)), N'Chicken with different parts', CAST(5.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Description], [Timer], [X_Deleted]) VALUES (6, N'Salads', CAST(500.00 AS Decimal(18, 2)), N'sample', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Description], [Timer], [X_Deleted]) VALUES (7, N'menu pork', CAST(100.00 AS Decimal(18, 2)), N'pork only', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Description], [Timer], [X_Deleted]) VALUES (8, N'Ginataang Bata', CAST(500.00 AS Decimal(18, 2)), N'Dog style ang frog stlye', CAST(6900.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Menu] ([Id], [Name], [Price], [Description], [Timer], [X_Deleted]) VALUES (9, N'Jumariebog special space ultera', CAST(6909.00 AS Decimal(18, 2)), N'', CAST(22.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuItem] ON 

INSERT [dbo].[MenuItem] ([Id], [Menu_Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (1, 5, 1, CAST(100.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[MenuItem] ([Id], [Menu_Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (3, 6, 1, CAST(2.00 AS Decimal(18, 2)), 13)
INSERT [dbo].[MenuItem] ([Id], [Menu_Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (4, 6, 16, CAST(12.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[MenuItem] ([Id], [Menu_Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (7, 7, 18, CAST(2.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[MenuItem] ([Id], [Menu_Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (8, 7, 2, CAST(2.00 AS Decimal(18, 2)), 13)
INSERT [dbo].[MenuItem] ([Id], [Menu_Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (9, 1, 2, CAST(3.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[MenuItem] ([Id], [Menu_Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (10, 9, 18, CAST(3.00 AS Decimal(18, 2)), 15)
SET IDENTITY_INSERT [dbo].[MenuItem] OFF
SET IDENTITY_INSERT [dbo].[Production] ON 

INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done]) VALUES (2, 7, 1, 4, CAST(N'2020-03-11T22:42:50.490' AS DateTime), CAST(N'2020-03-29T12:08:06.660' AS DateTime))
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done]) VALUES (3, 7, 1, 2, CAST(N'2020-02-12T00:04:00.913' AS DateTime), CAST(N'2020-03-21T17:55:46.053' AS DateTime))
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done]) VALUES (6, 1, 5, 0, CAST(N'2020-02-14T12:29:39.563' AS DateTime), CAST(N'2020-03-21T17:55:46.053' AS DateTime))
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done]) VALUES (12, 1, 1, 4, CAST(N'2020-03-21T17:58:25.400' AS DateTime), CAST(N'2020-03-21T17:58:30.180' AS DateTime))
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done]) VALUES (13, 9, 1, 1, CAST(N'2020-03-29T11:33:18.840' AS DateTime), CAST(N'2020-03-29T11:33:18.840' AS DateTime))
SET IDENTITY_INSERT [dbo].[Production] OFF
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (2, 2, 0, CAST(33.00 AS Decimal(18, 2)), 1, CAST(12.00 AS Decimal(18, 2)), 14, CAST(N'2020-02-26' AS Date), 0, CAST(N'2020-02-22T18:03:35.237' AS DateTime), NULL, 1)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (3, 1, 1, CAST(60.00 AS Decimal(18, 2)), 1, CAST(8.00 AS Decimal(18, 2)), 13, CAST(N'2020-02-26' AS Date), 0, CAST(N'2020-02-22T18:06:13.683' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (4, 2, 1, CAST(100.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 11, CAST(N'2020-02-26' AS Date), 0, CAST(N'2020-02-22T18:30:41.187' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (5, 2, 1, CAST(150.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 9, CAST(N'2020-02-26' AS Date), 0, CAST(N'2020-02-22T18:31:02.580' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (8, 1, 0, CAST(99.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 1, CAST(N'2020-03-02' AS Date), 0, CAST(N'2020-03-03T22:53:08.120' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (9, 16, 0, CAST(1600.00 AS Decimal(18, 2)), 1, CAST(13.00 AS Decimal(18, 2)), 1, CAST(N'2020-03-03' AS Date), 0, CAST(N'2020-03-05T19:48:10.530' AS DateTime), NULL, 1)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (10, 16, 0, CAST(20.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 14, CAST(N'2020-03-11' AS Date), 0, CAST(N'2020-03-05T20:07:00.597' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (11, 18, 0, CAST(60.00 AS Decimal(18, 2)), 1, CAST(15.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-11' AS Date), 0, CAST(N'2020-03-05T20:17:04.130' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (12, 18, 2, CAST(10.00 AS Decimal(18, 2)), 1, CAST(10.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-03' AS Date), 0, CAST(N'2020-03-11T21:52:36.987' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (13, 18, 1, CAST(10.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-10' AS Date), 0, CAST(N'2020-03-11T21:53:10.283' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (14, 1, 2, CAST(12.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-04' AS Date), 0, CAST(N'2020-03-11T22:11:39.197' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (15, 18, 3, CAST(3.00 AS Decimal(18, 2)), 1, CAST(4.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-12' AS Date), 0, CAST(N'2020-03-11T22:11:54.600' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (23, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-29' AS Date), 0, CAST(N'2020-03-25T18:33:54.343' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (24, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-05' AS Date), 0, CAST(N'2020-03-25T18:33:54.353' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (25, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-12' AS Date), 0, CAST(N'2020-03-25T18:33:54.360' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (26, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-19' AS Date), 0, CAST(N'2020-03-25T18:33:54.380' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (27, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-26' AS Date), 0, CAST(N'2020-03-25T18:33:54.383' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (28, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-05-03' AS Date), 0, CAST(N'2020-03-25T18:33:54.383' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (29, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-05-10' AS Date), 0, CAST(N'2020-03-25T18:33:54.383' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (30, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-05-17' AS Date), 0, CAST(N'2020-03-25T18:33:54.383' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (31, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-05-24' AS Date), 0, CAST(N'2020-03-25T18:33:54.383' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (32, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-05-31' AS Date), 0, CAST(N'2020-03-25T18:33:54.387' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (33, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-06-07' AS Date), 0, CAST(N'2020-03-25T18:33:54.387' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (34, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-06-14' AS Date), 0, CAST(N'2020-03-25T18:33:54.387' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (35, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-26' AS Date), 0, CAST(N'2020-03-25T18:37:50.243' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (36, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-27' AS Date), 0, CAST(N'2020-03-25T18:37:50.243' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (37, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-26' AS Date), 0, CAST(N'2020-03-25T18:41:36.600' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (38, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-26' AS Date), 0, CAST(N'2020-03-25T18:41:56.277' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (39, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-26' AS Date), 0, CAST(N'2020-03-25T18:42:06.700' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (40, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-26' AS Date), 23, CAST(N'2020-03-25T18:42:46.830' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (41, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-26' AS Date), 24, CAST(N'2020-03-25T18:42:52.860' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (45, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-29' AS Date), 0, CAST(N'2020-03-25T18:48:08.950' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (46, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-05' AS Date), 0, CAST(N'2020-03-25T18:48:08.953' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (47, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-12' AS Date), 0, CAST(N'2020-03-25T18:48:08.953' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (48, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-19' AS Date), 0, CAST(N'2020-03-25T18:48:09.000' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (49, 1, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-26' AS Date), 0, CAST(N'2020-03-25T18:48:09.000' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (93, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.120' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (94, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2020-05-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.120' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (95, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2020-06-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.120' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (96, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2020-07-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.120' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (97, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2020-08-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.123' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (98, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2020-09-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.123' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (99, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2020-10-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.123' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (100, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2020-11-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.123' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (101, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2020-12-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.123' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (102, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2021-01-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.123' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (103, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2021-02-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.127' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (104, 1, 0, CAST(1.00 AS Decimal(18, 2)), 1, CAST(2.00 AS Decimal(18, 2)), 12, CAST(N'2021-03-17' AS Date), 35, CAST(N'2020-03-25T19:00:07.127' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (108, 19, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-01' AS Date), 37, CAST(N'2020-03-25T19:03:40.083' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (109, 19, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-08' AS Date), 37, CAST(N'2020-03-25T19:03:40.083' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (110, 19, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-15' AS Date), 37, CAST(N'2020-03-25T19:03:40.083' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (111, 19, 0, CAST(2.00 AS Decimal(18, 2)), 1, CAST(3.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-22' AS Date), 37, CAST(N'2020-03-25T19:03:40.087' AS DateTime), NULL, 0)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted]) VALUES (112, 1, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 12, CAST(N'2020-03-29' AS Date), 0, CAST(N'2020-03-29T11:07:55.603' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Purchase] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name], [PersonName], [Address], [MobileNumber], [Landline], [EmailAddress]) VALUES (1, N'SuperSupplier', N'Moscov', N'Las Pinas', N'091234567890', N'021234567', N'supplier@email.com')
INSERT [dbo].[Supplier] ([Id], [Name], [PersonName], [Address], [MobileNumber], [Landline], [EmailAddress]) VALUES (3, N'#42@~dfdf', N'Boss CJ', N'something', N'1', N'%%%%%fGE~', N'inNeverland@ggSupplier2.com')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (12, N'Milligrams', N'mg', CAST(1.0000 AS Decimal(25, 4)), 12)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (13, N'Grams', N'g', CAST(1000.0000 AS Decimal(25, 4)), 12)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (14, N'Kilograms', N'kg', CAST(1000000.0000 AS Decimal(25, 4)), 12)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (15, N'Metric ton', N't', CAST(907184740.0000 AS Decimal(25, 4)), 12)
SET IDENTITY_INSERT [dbo].[Unit] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Username], [Password], [Usertype]) VALUES (1, N'Admin', N'admin', N'admin', 0)
INSERT [dbo].[User] ([Id], [Name], [Username], [Password], [Usertype]) VALUES (2, N'Employee', N'employee', N'employee', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_X_DateCreated]  DEFAULT (getdate()) FOR [X_DateCreated]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_X_Archived]  DEFAULT ((0)) FOR [X_Archived]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_X_Deleted]  DEFAULT ((0)) FOR [X_Deleted]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Timer]  DEFAULT ((0)) FOR [Timer]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_X_Deleted]  DEFAULT ((0)) FOR [X_Deleted]
GO
ALTER TABLE [dbo].[MenuItem] ADD  CONSTRAINT [DF_MenuItem_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_X_DateCreated]  DEFAULT (getdate()) FOR [X_DateCreated]
GO
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_X_Done]  DEFAULT (getdate()) FOR [X_Done]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_Unit_Id]  DEFAULT ((1)) FOR [Unit_Id]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_DatePurchased]  DEFAULT (getdate()) FOR [DatePurchased]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_Forecast_Id]  DEFAULT ((0)) FOR [Forecast_Id]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_X_DateCreated]  DEFAULT (getdate()) FOR [X_DateCreated]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_X_Deleted]  DEFAULT ((0)) FOR [X_Deleted]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_Id_Conversion]  DEFAULT ((1)) FOR [Conversion]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_Id_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Usertype]  DEFAULT ((0)) FOR [Usertype]
GO
ALTER TABLE [dbo].[CriticalLevel]  WITH CHECK ADD  CONSTRAINT [FK_CriticalLevel_Item] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[CriticalLevel] CHECK CONSTRAINT [FK_CriticalLevel_Item]
GO
ALTER TABLE [dbo].[CriticalLevel]  WITH CHECK ADD  CONSTRAINT [FK_CriticalLevel_Unit] FOREIGN KEY([Unit_Id])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[CriticalLevel] CHECK CONSTRAINT [FK_CriticalLevel_Unit]
GO
ALTER TABLE [dbo].[Forecast]  WITH CHECK ADD  CONSTRAINT [FK_Forecast_Item] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Forecast] CHECK CONSTRAINT [FK_Forecast_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Unit_Id] FOREIGN KEY([Unit_Id])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Unit_Id]
GO
ALTER TABLE [dbo].[MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_MenuItem_Item] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[MenuItem] CHECK CONSTRAINT [FK_MenuItem_Item]
GO
ALTER TABLE [dbo].[MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_MenuItem_Menu] FOREIGN KEY([Menu_Id])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[MenuItem] CHECK CONSTRAINT [FK_MenuItem_Menu]
GO
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [FK_Production_Menu] FOREIGN KEY([Menu_Id])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [FK_Production_Menu]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Item] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Item]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Supplier] FOREIGN KEY([Supplier_Id])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Supplier]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_User] FOREIGN KEY([X_User_Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_User]
GO
/****** Object:  StoredProcedure [dbo].[Category_Get]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Get]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Category;
END
GO
/****** Object:  StoredProcedure [dbo].[Forecast_Add]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Forecast_Add]
	@StartDate date,
	@EndDate date,
	@Item_Id int,
	@Type int,
	@Day int,

	@P_Price decimal(18,2),
	@P_Supplier_Id int,
	@P_Quantity decimal(18,2),
	@P_Unit_Id int

AS
BEGIN
	DECLARE @DHold as date;
	DECLARE @WHold as date;
	DECLARE @Forecast_Id as int;
	SET @DHold = @StartDate;
	INSERT INTO [dbo].[Forecast]
	(StartDate,EndDate,Item_Id,[Type],[Day])
	VALUES (@StartDate,@EndDate,@Item_Id,@Type,@Day);
	
	SELECT SCOPE_IDENTITY();
	SET @Forecast_Id = SCOPE_IDENTITY();

	IF @Type = 0
	BEGIN
		WHILE @DHold <= @EndDate
		BEGIN
			INSERT INTO [dbo].[Purchase]
				([Item_Id]
				,[Type]
				,[Price]
				,[Supplier_Id]
				,[Quantity]
				,[Unit_Id]
				,[DatePurchased]
				,[Forecast_Id])
			VALUES (@Item_Id,
				'0',
				@P_Price,
				@P_Supplier_Id,
				@P_Quantity,
				@P_Unit_Id,
				@DHold,
				@Forecast_Id);
			SET @DHold = DATEADD(day,1,@DHold);
		END
	END
	ELSE IF @Type = 1
	BEGIN
		WHILE @Day != (SELECT DATEPART(DW,@DHold))
		BEGIN
			SET @DHold = DATEADD(DAY,1,@DHold);
		END
		WHILE @DHold <= @EndDate
		BEGIN
			INSERT INTO [dbo].[Purchase]
				([Item_Id]
				,[Type]
				,[Price]
				,[Supplier_Id]
				,[Quantity]
				,[Unit_Id]
				,[DatePurchased]
				,[Forecast_Id])
			VALUES (@Item_Id,
				'0',
				@P_Price,
				@P_Supplier_Id,
				@P_Quantity,
				@P_Unit_Id,
				@DHold,
				@Forecast_Id);
			SET @DHold = DATEADD(DAY,7,@DHold);
		END
	END
	ELSE
	BEGIN
	SELECT @DHold 'HOLD';
	SELECT @EndDate 'ENDDATE';
		WHILE @Day != (SELECT DAY(@DHold))
		BEGIN
			SET @DHold = DATEADD(DAY,1,@DHold);
		END
		WHILE @DHold <= @EndDate
		BEGIN
			INSERT INTO [dbo].[Purchase]
				([Item_Id]
				,[Type]
				,[Price]
				,[Supplier_Id]
				,[Quantity]
				,[Unit_Id]
				,[DatePurchased]
				,[Forecast_Id])
			VALUES (@Item_Id,
				'0',
				@P_Price,
				@P_Supplier_Id,
				@P_Quantity,
				@P_Unit_Id,
				@DHold,
				@Forecast_Id);
			SET @DHold = DATEADD(MONTH,1,@DHold);
		END
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[Forecast_Delete]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Forecast_Delete]
	@Id int
AS
BEGIN
	DELETE Forecast
	WHERE Id = @Id;
	SELECT @@ROWCOUNT;
	DELETE Purchase
	WHERE Forecast_Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Forecast_GetById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Forecast_GetById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Forecast I WHERE I.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Forecast_GetForDatatable]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Forecast_GetForDatatable]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT F.Id,StartDate,EndDate,I.Name 'Item',
	(CASE F.[Type]
		WHEN 0 THEN 'Daily'
		WHEN 1 THEN 'Weekly'
		WHEN 2 THEN 'Monthly'
	END) 'Type',
	F.[Day]
	FROM Forecast F
	INNER JOIN Item I
	ON F.Item_Id = I.Id;

END
GO
/****** Object:  StoredProcedure [dbo].[Forecast_GetViewById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Forecast_GetViewById]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT F.Id,StartDate,EndDate,Item_Id,
	(CASE F.[Type]
		WHEN 0 THEN 'Daily'
		WHEN 1 THEN 'Weekly'
		WHEN 2 THEN 'Monthly'
	END) 'Type',
	F.[Day]
	FROM Forecast F
	INNER JOIN Item I
	ON F.Item_Id = I.Id
	WHERE F.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Item_Add]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_Add]
	@Name varchar(50),
	@Price decimal(18,2),
	@Category_Id int,
	@Unit_Id int
AS
BEGIN
	INSERT INTO [dbo].[Item]
           ([Name]
           ,[Price]
           ,[Category_Id]
           ,[Unit_Id])
     VALUES (@Name,
	 @Price,
	 @Category_Id,
	 @Unit_Id
	 )

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Item_CountByItemNotId]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_CountByItemNotId] 
	@Id int,
	@Menu_Id int,
	@Item_Id int
AS
BEGIN
	SELECT COUNT(*) FROM MenuItem WHERE Item_Id = @Item_Id AND Menu_Id = @Menu_Id AND Id != @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Item_CountByName]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_CountByName]
	@Name varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Count(*) FROM Item I WHERE I.Name = @Name;
END
GO
/****** Object:  StoredProcedure [dbo].[Item_CountByNameNotId]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_CountByNameNotId] 
	@Id int,
	@Name varchar(50)
AS
BEGIN
	SELECT COUNT(*) FROM Item I WHERE I.Name = @Name AND Id != @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Item_Delete]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_Delete]
	@Id int
AS
BEGIN
	UPDATE Item
	SET X_Deleted = 1
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Item_Edit]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_Edit] 
	@Id int,
	@Name varchar(50),
	@Price decimal(18,2),
	@Category_Id int,
	@Unit_Id int
AS
BEGIN
	UPDATE Item
	SET
		Name = @Name,
		Price = @Price,
		Category_Id = @Category_Id,
		Unit_Id = @Unit_Id
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Item_GetById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_GetById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Item I WHERE I.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Item_GetCurrentQuantity]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Item_GetCurrentQuantity]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
	I.Id,
	I.Name,
	(
		SELECT SUM(TOTAL) FROM 
		(
			SELECT
			SUM(Px.Quantity*Ux.Conversion) TOTAL
			FROM Item Ix
			INNER JOIN Purchase Px
			ON Ix.Id = Px.Item_Id
			INNER JOIN Unit Ux
			ON Px.Unit_Id = Ux.Id
			WHERE Ix.Id = I.Id
			AND (Px.Type = 0 OR Px.Type = 3)

			UNION ALL

			SELECT
			(SUM(Px.Quantity*Ux.Conversion)*-1) TOTAL
			FROM Item Ix
			INNER JOIN Purchase Px
			ON Ix.Id = Px.Item_Id
			INNER JOIN Unit Ux
			ON Px.Unit_Id = Ux.Id
			WHERE Ix.Id = I.Id
			AND (Px.Type = 1 OR Px.Type = 2)

			UNION ALL

			SELECT ((MIx.Quantity*U1x.Conversion*Px.Quantity)*-1) TOTAL
			FROM Item Ix
			INNER JOIN MenuItem MIx
			ON Ix.Id = MIx.Item_Id
			INNER JOIN Menu Mx
			ON MIx.Menu_Id = Mx.Id
			INNER JOIN Production Px
			ON Mx.Id = Px.Menu_Id
			INNER JOIN Unit U1x
			ON MIx.Unit_Id = U1x.Id
			WHERE Ix.Id = I.Id
		) v
	)/U.Conversion Quantity,

	ISNULL
	(
		(
			SELECT SUM(A.Needed)
			FROM
			(
				SELECT
				MIy.Item_Id,
				((MIy.Quantity*Uy.Conversion)/UIy.Conversion)*
				(SELECT 
				AVG(Py.Quantity) 'AVG'
				FROM Production Py
				INNER JOIN Menu My
				ON Py.Menu_Id = My.Id
				WHERE My.Id = MIy.Menu_Id
				GROUP BY Py.Menu_Id,My.Id) 'Needed'
				FROM MenuItem MIy
				INNER JOIN Unit Uy
				ON MIy.Unit_Id = Uy.Id
				INNER JOIN Item Iy
				ON MIy.Item_Id = Iy.Id
				INNER JOIN Unit UIy
				ON Iy.Unit_Id = UIy.Id
				WHERE Iy.Id = I.Id
			) A
		)
		,0
	) 'Needs'
	FROM Item I
	LEFT JOIN Unit U
	ON  I.Unit_Id = U.Id
	LEFT JOIN Category C
	ON  I.Category_Id = C.Id
	WHERE I.X_Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[Item_GetForDatatable]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_GetForDatatable]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	I.Id,
	I.Name,
	I.Price,
	C.Name Category,
	(
	

SELECT SUM(TOTAL) FROM (
SELECT
	SUM(Px.Quantity*Ux.Conversion) TOTAL
FROM Item Ix
INNER JOIN Purchase Px
ON Ix.Id = Px.Item_Id
INNER JOIN Unit Ux
ON Px.Unit_Id = Ux.Id
WHERE Ix.Id = I.Id
AND (Px.Type = 0 OR Px.Type = 3)

UNION ALL

SELECT
	(SUM(Px.Quantity*Ux.Conversion)*-1) TOTAL
FROM Item Ix
INNER JOIN Purchase Px
ON Ix.Id = Px.Item_Id
INNER JOIN Unit Ux
ON Px.Unit_Id = Ux.Id
WHERE Ix.Id = I.Id
AND (Px.Type = 1 OR Px.Type = 2)

UNION ALL

SELECT ((MIx.Quantity*U1x.Conversion*Px.Quantity)*-1) TOTAL
FROM Item Ix
INNER JOIN MenuItem MIx
ON Ix.Id = MIx.Item_Id
INNER JOIN Menu Mx
ON MIx.Menu_Id = Mx.Id
INNER JOIN Production Px
ON Mx.Id = Px.Menu_Id
INNER JOIN Unit U1x
ON MIx.Unit_Id = U1x.Id
WHERE Ix.Id = I.Id) v
	)/U.Conversion Quantity,
	U.Name Unit
	FROM Item I
	LEFT JOIN Unit U
	ON  I.Unit_Id = U.Id
	LEFT JOIN Category C
	ON  I.Category_Id = C.Id
	WHERE I.X_Deleted = 0;

END
GO
/****** Object:  StoredProcedure [dbo].[Item_GetForDropdown]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_GetForDropdown]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	I.Id,
	I.Name
	FROM Item I
	WHERE I.X_Deleted = 0;

END
GO
/****** Object:  StoredProcedure [dbo].[Item_GetUsageForDatatable]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_GetUsageForDatatable]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
I.Id,
I.Name,
CONCAT(ISNULL(FORMAT((SELECT
	ROUND(SUM(Px.Quantity*Ux.Conversion),2) TOTAL
FROM Item Ix
INNER JOIN Purchase Px
ON Ix.Id = Px.Item_Id
INNER JOIN Unit Ux
ON Px.Unit_Id = Ux.Id
WHERE Ix.Id = I.Id
AND Px.Type = 0)/U.Conversion,'#.00'),0),' ', U.Abbr) 'Buy',

CONCAT(ISNULL(FORMAT((SELECT
	ROUND(SUM(Px.Quantity*Ux.Conversion),2) TOTAL
FROM Item Ix
INNER JOIN Purchase Px
ON Ix.Id = Px.Item_Id
INNER JOIN Unit Ux
ON Px.Unit_Id = Ux.Id
WHERE Ix.Id = I.Id
AND Px.Type = 1),'#.00'),0),' ', U.Abbr) 'Sold',

CONCAT(ISNULL(FORMAT((SELECT
	ROUND(SUM(Px.Quantity*Ux.Conversion),2) TOTAL
FROM Item Ix
INNER JOIN Purchase Px
ON Ix.Id = Px.Item_Id
INNER JOIN Unit Ux
ON Px.Unit_Id = Ux.Id
WHERE Ix.Id = I.Id
AND Px.Type = 2),'#.00'),0),' ', U.Abbr) 'Spoiled',

CONCAT(ISNULL(FORMAT((SELECT
	SUM(Px.Quantity*Ux.Conversion) TOTAL
FROM Item Ix
INNER JOIN Purchase Px
ON Ix.Id = Px.Item_Id
INNER JOIN Unit Ux
ON Px.Unit_Id = Ux.Id
WHERE Ix.Id = I.Id
AND Px.Type = 0)/U.Conversion,'#.00'),0),' ', U.Abbr) 'Subsidized',

CONCAT(ISNULL(FORMAT(
(
SELECT SUM((MIx.Quantity*U1x.Conversion*Px.Quantity)) TOTAL
	FROM Item Ix
	INNER JOIN MenuItem MIx
	ON Ix.Id = MIx.Item_Id
	INNER JOIN Menu Mx
	ON MIx.Menu_Id = Mx.Id
	INNER JOIN Production Px
	ON Mx.Id = Px.Menu_Id
	INNER JOIN Unit U1x
	ON MIx.Unit_Id = U1x.Id
	WHERE Ix.Id = I.Id
)
,'#.00'),0),' ', U.Abbr) 'Produced'

FROM Item I
LEFT JOIN Unit U
ON  I.Unit_Id = U.Id
WHERE I.X_Deleted = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Item_GetViewById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Item_GetViewById]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
	I.Id,
	I.Name,
	I.Price,
	C.Name Category,
	(
	SELECT
	CASE WHEN SUM(P.Quantity*U.Conversion) IS NULL THEN 0 ELSE SUM(P.Quantity*U.Conversion) END
	FROM Item I2 
	LEFT JOIN Purchase P
	ON I2.Id = P.Item_Id
	LEFT JOIN Unit U
	ON P.Unit_Id = U.Id
	LEFT JOIN Unit U2
	ON I2.Unit_Id = U2.Id
	WHERE P.Item_Id = I.Id
	)/U.Conversion Quantity,
	U.Name Unit,
	I.X_DateCreated DateCreated
	FROM Item I
	LEFT JOIN Unit U
	ON  I.Unit_Id = U.Id
	LEFT JOIN Category C
	ON  I.Category_Id = C.Id
	WHERE I.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Menu_Add]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Menu_Add]
	@Name varchar(50),
	@Price decimal(18,2),
	@Timer decimal(18,2),
	@Description varchar(500)
AS
BEGIN
	INSERT INTO [dbo].[Menu]
           ([Name]
           ,[Price]
           ,[Timer]
           ,[Description])
     VALUES (@Name,
	 @Price,
	 @Timer,
	 @Description
	 )

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Menu_CountByName]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Menu_CountByName]
	@Name varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Count(*) FROM Menu I WHERE I.Name = @Name;
END
GO
/****** Object:  StoredProcedure [dbo].[Menu_CountByNameNotId]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Menu_CountByNameNotId] 
	@Id int,
	@Name varchar(50)
AS
BEGIN
	SELECT COUNT(*) FROM Menu I WHERE I.Name = @Name AND Id != @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Menu_Delete]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Menu_Delete]
	@Id int
AS
BEGIN
	UPDATE Menu
	SET X_Deleted = 1
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Menu_Edit]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Menu_Edit] 
	@Id int,
	@Name varchar(50),
	@Price decimal(18,2),
	@Timer decimal(18,2),
	@Description varchar(500)
AS
BEGIN
	UPDATE Menu
	SET
		Name = @Name,
		Price = @Price,
		Timer = @Timer,
		Description = @Description
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Menu_GetById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Menu_GetById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Menu I WHERE I.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Menu_GetForDatatable]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Menu_GetForDatatable]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	Id,
	Name,
	Price
	FROM Menu
	WHERE X_Deleted = 0;

END
GO
/****** Object:  StoredProcedure [dbo].[Menu_GetForDropdown]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Menu_GetForDropdown]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	I.Id,
	I.Name
	FROM Menu I
	WHERE I.X_Deleted = 0;

END
GO
/****** Object:  StoredProcedure [dbo].[Menu_GetViewById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Menu_GetViewById]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT *
	FROM Menu
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[MenuItem_Add]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MenuItem_Add]
	@Menu_Id int,
	@Item_Id int,
	@Quantity decimal(18,2),
	@Unit_Id int
AS
BEGIN
	INSERT INTO [dbo].[MenuItem]
           ([Menu_Id]
           ,[Item_Id]
           ,[Quantity]
           ,[Unit_Id])
     VALUES (@Menu_Id,
	 @Item_Id,
	 @Quantity,
	 @Unit_Id
	 )

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[MenuItem_CountByItem]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MenuItem_CountByItem]
	@Item_Id int,
	@Menu_Id int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Count(*) FROM MenuItem M WHERE M.Item_Id = @Item_Id AND M.Menu_Id = @Menu_Id;
END
GO
/****** Object:  StoredProcedure [dbo].[MenuItem_Delete]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MenuItem_Delete]
	@Id int
AS
BEGIN
	DELETE MenuItem
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[MenuItem_Edit]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MenuItem_Edit] 
	@Id int,
	@Item_Id int,
	@Quantity decimal(18,2),
	@Unit_Id int
AS
BEGIN
	UPDATE MenuItem
	SET
		Item_Id = @Item_Id,
		Quantity = @Quantity,
		Unit_Id = @Unit_Id
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[MenuItem_GetById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MenuItem_GetById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM MenuItem I WHERE I.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[MenuItem_GetForDatatable]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MenuItem_GetForDatatable]
	@Menu_Id int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	MI.Id,
	I.Name Item,
	MI.Quantity,
	U.Name Unit
	FROM MenuItem MI
	LEFT JOIN Item I
	ON  MI.Item_Id = I.Id
	LEFT JOIN Unit U
	ON  MI.Unit_Id = U.Id
	WHERE MI.Menu_Id = @Menu_Id;

END
GO
/****** Object:  StoredProcedure [dbo].[Produce_BestSeller]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Produce_BestSeller]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SET NOCOUNT ON;

	SELECT M.Name, x_count 'Count'
FROM (
SELECT TOP 5 P.Menu_Id,SUM(P.Quantity) x_count
FROM Production P
GROUP BY P.Menu_Id
ORDER BY x_count DESC
) A
INNER JOIN Menu M
ON A.Menu_Id = M.Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Production_Add]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Production_Add]
	@Menu_Id int,
	@Quantity int,
	@Status int
AS
BEGIN
	INSERT INTO [dbo].[Production]
           ([Menu_Id]
           ,[Quantity]
           ,[Status])
     VALUES (@Menu_Id,
	 @Quantity,
	 @Status
	 )

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Production_Delete]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Production_Delete]
	@Id int
AS
BEGIN
	Delete Production
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Production_Edit]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Production_Edit] 
	@Id int,
	@Menu_Id int,
	@Quantity int,
	@Status int
AS
BEGIN
	UPDATE Production
	SET
		[Menu_Id] = @Menu_Id,
		[Quantity] = @Quantity,
		[Status] = @Status
	WHERE Id = @Id;
	SELECT @@ROWCOUNT;
	IF @Status = 4 
	BEGIN
		UPDATE Production
	SET
		[X_Done] = (getdate())
	WHERE Id = @Id;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[Production_GetById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Production_GetById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Production I WHERE I.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Production_GetForDatatable]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Production_GetForDatatable]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	P.Id,
	M.Name 'Menu',
	P.Quantity,
	(CASE WHEN DATEADD(MINUTE,M.Timer,P.X_DateCreated)>GETDATE() OR DATEADD(MINUTE,M.Timer,P.X_DateCreated)>P.X_Done THEN 
		(CASE P.Status
			WHEN 0 THEN 'Pending'
			WHEN 1 THEN 'Started'
			WHEN 2 THEN 'Near Completion'
			WHEN 3 THEN 'Overdue'
			WHEN 4 THEN 'Done' END)
		ELSE 'Overdue' END) Status
	FROM [Production] P
	INNER JOIN [Menu] M
	ON  P.Menu_Id = M.Id;

END
GO
/****** Object:  StoredProcedure [dbo].[Production_GetLate]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Production_GetLate] 
	-- Add the parameters for the stored procedure here
	@Month int,
	@Year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
	COUNT(*) 'COUNT'
	FROM [Production] P
	LEFT JOIN [Menu] M
	ON  P.Menu_Id = M.Id
	WHERE DATEADD(MINUTE,M.Timer,P.X_DateCreated)<GETDATE() AND DATEADD(MINUTE,M.Timer,P.X_DateCreated)<P.X_Done
	AND MONTH(P.X_DateCreated) = @Month
	AND YEAR(P.X_DateCreated) = @Year;
END
GO
/****** Object:  StoredProcedure [dbo].[Production_GetOverallStats]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Production_GetOverallStats]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	M.Name,
	MIN(P.Quantity) 'MIN',
	AVG(P.Quantity) 'AVG', 
	MAX(P.Quantity) 'MAX'
	FROM Production P
	INNER JOIN Menu M
	ON P.Menu_Id = M.Id
	GROUP BY P.Menu_Id,M.Name
	ORDER BY M.Name
END
GO
/****** Object:  StoredProcedure [dbo].[Production_GetViewById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Production_GetViewById]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
	P.Id,
	M.Name 'Menu',
	P.Quantity,
	(CASE WHEN DATEADD(MINUTE,M.Timer,P.X_DateCreated)>GETDATE() OR DATEADD(MINUTE,M.Timer,P.X_DateCreated)>P.X_Done THEN 
		(CASE P.Status
			WHEN 0 THEN 'Pending'
			WHEN 1 THEN 'Started'
			WHEN 2 THEN 'Near Completion'
			WHEN 3 THEN 'Overdue'
			WHEN 4 THEN 'Done' END)
		ELSE 'Overdue' END) Status
	
	FROM [Production] P
	LEFT JOIN [Menu] M
	ON  P.Menu_Id = M.Id
	WHERE P.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Production_IsPossible]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Production_IsPossible]
	@Menu_Id int,
	@Quantity int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	((
	SELECT SUM(TOTAL) FROM (
	SELECT
		SUM(Px.Quantity*Ux.Conversion) TOTAL
	FROM Item Ix
	INNER JOIN Purchase Px
	ON Ix.Id = Px.Item_Id
	INNER JOIN Unit Ux
	ON Px.Unit_Id = Ux.Id
	WHERE Ix.Id = I.Id
	AND (Px.Type = 0 OR Px.Type = 3)

	UNION ALL

	SELECT
		(SUM(Px.Quantity*Ux.Conversion)*-1) TOTAL
	FROM Item Ix
	INNER JOIN Purchase Px
	ON Ix.Id = Px.Item_Id
	INNER JOIN Unit Ux
	ON Px.Unit_Id = Ux.Id
	WHERE Ix.Id = I.Id
	AND (Px.Type = 1 OR Px.Type = 2)

	UNION ALL

	SELECT ((MIx.Quantity*U1x.Conversion*(Px.Quantity+@Quantity))*-1) TOTAL
	FROM Item Ix
	INNER JOIN MenuItem MIx
	ON Ix.Id = MIx.Item_Id
	INNER JOIN Menu Mx
	ON MIx.Menu_Id = Mx.Id
	INNER JOIN Production Px
	ON Mx.Id = Px.Menu_Id
	INNER JOIN Unit U1x
	ON MIx.Unit_Id = U1x.Id
	WHERE Ix.Id = I.Id) v
	)/U.Conversion) Quantity
	FROM Item I
	LEFT JOIN Unit U
	ON  I.Unit_Id = U.Id
	INNER JOIN MenuItem MI
	ON MI.Item_Id = I.Id
	INNER JOIN Menu M
	ON M.Id = MI.Menu_Id
	WHERE M.Id = @Menu_Id;

END
GO
/****** Object:  StoredProcedure [dbo].[Production_LastMonthStats]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Production_LastMonthStats]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	M.Name,
	MIN(P.Quantity) 'MIN',
	AVG(P.Quantity) 'AVG', 
	MAX(P.Quantity) 'MAX'
	FROM Production P
	INNER JOIN Menu M
	ON P.Menu_Id = M.Id
	WHERE MONTH(P.X_DateCreated) = MONTH(DATEADD(MONTH,-1,GETDATE()))
	AND YEAR(P.X_DateCreated) = YEAR(DATEADD(MONTH,-1,GETDATE()))
	GROUP BY P.Menu_Id,M.Name
	ORDER BY M.Name
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Add]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_Add]
	@Item_Id int,
	@Type tinyint,
	@Price decimal(18,2),
	@Supplier_Id int,
	@Quantity decimal(18,2),
	@Unit_Id int,
	@DatePurchased date
AS
BEGIN
	INSERT INTO [dbo].[Purchase]
           ([Item_Id]
			,[Type]
			,[Price]
			,[Supplier_Id]
			,[Quantity]
			,[Unit_Id]
			,[DatePurchased])
     VALUES (@Item_Id,
			@Type,
			@Price,
			@Supplier_Id,
			@Quantity,
			@Unit_Id,
			@DatePurchased)

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Buy_Count]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_Buy_Count]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT COUNT(*) 'Count' 
	FROM Purchase P 
	WHERE P.Type = 0 
	AND MONTH(P.DatePurchased) = MONTH(GETDATE()) 
	AND YEAR(P.DatePurchased) = YEAR(GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Delete]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_Delete]
	@Id int
AS
BEGIN
	
	UPDATE Purchase
	SET X_Deleted = 1
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Edit]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_Edit] 
	@Id int,
	@Item_Id int,
	@Type tinyint,
	@Price decimal(18,2),
	@Supplier_Id int,
	@Quantity decimal(18,2),
	@Unit_Id int,
	@DatePurchased date
AS
BEGIN
	UPDATE Purchase
	SET
		Item_Id = @Item_Id,
		Type = @Type,
		Price = @Price,
		Supplier_Id = @Supplier_Id,
		Quantity = @Quantity,
		Unit_Id = @Unit_Id,
		DatePurchased = @DatePurchased
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_GetById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_GetById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Purchase P WHERE P.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_GetForDatatable]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_GetForDatatable]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	P.Id,
	I.Name Item,
	(
	CASE P.Type 
		WHEN 0 THEN 'BUY'
		WHEN 1 THEN 'SOLD'
		WHEN 2 THEN 'SPOILED'
		WHEN 3 THEN 'SUBSIDIZED'
		ELSE 'UNDEFINED'
	END
	) Type,
	P.Price,
	S.Name Supplier,
	P.Quantity,
	U.Name Unit,
	CONVERT(varchar, P.DatePurchased, 107) DatePurchased
	FROM Purchase P
	INNER JOIN Item I
	ON P.Item_Id = I.Id
	LEFT JOIN Supplier S
	ON P.Supplier_Id = S.Id
	LEFT JOIN Unit U
	ON P.Unit_Id = U.Id
	WHERE P.X_Deleted = 0;

END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_GetViewById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_GetViewById]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
	P.Id,
	I.Name Item,
	(
	CASE P.Type 
		WHEN 0 THEN 'BUY'
		WHEN 1 THEN 'SOLD'
		WHEN 2 THEN 'SPOILED'
		WHEN 3 THEN 'SUBSIDIZED'
		ELSE 'UNDEFINED'
	END
	) Type,
	P.Price,
	S.Name Supplier,
	P.Quantity,
	U.Name Unit,
	P.DatePurchased
	FROM Purchase P
	LEFT JOIN Item I
	ON P.Item_Id = I.Id
	LEFT JOIN Supplier S
	ON P.Supplier_Id = S.Id
	LEFT JOIN Unit U
	ON P.Unit_Id = U.Id
	WHERE P.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Sold_Count]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_Sold_Count]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT COUNT(*) 'Count' 
	FROM Purchase P 
	WHERE P.Type = 1
	AND MONTH(P.DatePurchased) = MONTH(GETDATE()) 
	AND YEAR(P.DatePurchased) = YEAR(GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Spoiled_Count]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_Spoiled_Count]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT COUNT(*) 'Count' 
	FROM Purchase P 
	WHERE P.Type = 2
	AND MONTH(P.DatePurchased) = MONTH(GETDATE()) 
	AND YEAR(P.DatePurchased) = YEAR(GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Subsidized_Count]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_Subsidized_Count]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT COUNT(*) 'Count' 
	FROM Purchase P 
	WHERE P.Type = 3
	AND MONTH(P.DatePurchased) = MONTH(GETDATE()) 
	AND YEAR(P.DatePurchased) = YEAR(GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[Supplier_Add]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Supplier_Add]
	@Name varchar(50),
	@PersonName varchar(50),
	@Address varchar(200),
	@MobileNumber varchar(50),
	@Landline varchar(50),
	@EmailAddress varchar(50)
AS
BEGIN
	INSERT INTO [dbo].[Supplier]
           ([Name]
           ,[PersonName]
           ,[Address]
           ,[MobileNumber]
           ,[Landline]
           ,[EmailAddress])
     VALUES (@Name,
	 @PersonName,
	 @Address,
	 @MobileNumber,
	 @Landline,
	 @EmailAddress
	 )

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Supplier_CountByName]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Supplier_CountByName]
	@Name varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Count(*) FROM Supplier I WHERE I.Name = @Name;
END
GO
/****** Object:  StoredProcedure [dbo].[Supplier_CountByNameNotId]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Supplier_CountByNameNotId] 
	@Id int,
	@Name varchar(50)
AS
BEGIN
	SELECT COUNT(*) FROM Supplier I WHERE I.Name = @Name AND Id != @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Supplier_Delete]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Supplier_Delete]
	@Id int
AS
BEGIN
	Delete Supplier
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Supplier_Edit]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Supplier_Edit] 
	@Id int,
	@Name varchar(50),
	@PersonName varchar(50),
	@Address varchar(200),
	@MobileNumber varchar(50),
	@Landline varchar(50),
	@EmailAddress varchar(50)
AS
BEGIN
	UPDATE Supplier
	SET
		Name = @Name,
		PersonName = @PersonName,
		Address = @Address,
		MobileNumber = @MobileNumber,
		Landline = @Landline,
		EmailAddress = @EmailAddress
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Supplier_GetById]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Supplier_GetById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Supplier I WHERE I.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Supplier_GetForDatatable]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Supplier_GetForDatatable]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	Id,
	Name,
	PersonName,
	MobileNumber,
	Landline,
	EmailAddress
	FROM Supplier;

END
GO
/****** Object:  StoredProcedure [dbo].[Supplier_GetForDropdown]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Supplier_GetForDropdown]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Id,Name
	FROM Supplier;

END
GO
/****** Object:  StoredProcedure [dbo].[Unit_Get]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Unit_Get]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Unit;
END
GO
/****** Object:  StoredProcedure [dbo].[Unit_GetForDropdown]    Script Date: 3/29/2020 7:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Unit_GetForDropdown]
AS
BEGIN	
	SET NOCOUNT ON;

	SELECT Id,Name
	FROM Unit;

END
GO
