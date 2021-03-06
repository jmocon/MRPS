USE [MRPS]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/25/2020 5:41:54 PM ******/
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
/****** Object:  Table [dbo].[CriticalLevel]    Script Date: 4/25/2020 5:41:54 PM ******/
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
/****** Object:  Table [dbo].[Forecast]    Script Date: 4/25/2020 5:41:54 PM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 4/25/2020 5:41:54 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 4/25/2020 5:41:54 PM ******/
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
/****** Object:  Table [dbo].[MenuItem]    Script Date: 4/25/2020 5:41:54 PM ******/
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
/****** Object:  Table [dbo].[Production]    Script Date: 4/25/2020 5:41:54 PM ******/
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
	[ProductionCart_Id] [int] NULL,
	[Confirmed] [tinyint] NULL,
 CONSTRAINT [PK_Production] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionCart]    Script Date: 4/25/2020 5:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionCart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[X_DateCreated] [datetime] NULL,
	[Confirmed] [tinyint] NULL,
 CONSTRAINT [PK_ProductionCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 4/25/2020 5:41:54 PM ******/
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
	[Confirmed] [tinyint] NULL,
	[PurchaseCart_Id] [int] NULL,
	[R_Quantity] [decimal](18, 2) NULL,
	[R_Unit_Id] [int] NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseCart]    Script Date: 4/25/2020 5:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseCart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Confirmed] [tinyint] NOT NULL,
	[X_DateCreated] [nchar](10) NULL,
 CONSTRAINT [PK_PurchaseCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 4/25/2020 5:41:54 PM ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 4/25/2020 5:41:55 PM ******/
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

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Poultry')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Seasoning')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Vegetable')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Drinks')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Seafood')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Fruits')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (7, N'Dairy')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CriticalLevel] ON 

INSERT [dbo].[CriticalLevel] ([Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (37, 29, CAST(3.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[CriticalLevel] ([Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (38, 30, CAST(4.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[CriticalLevel] ([Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (48, 28, CAST(5.00 AS Decimal(18, 2)), 12)
SET IDENTITY_INSERT [dbo].[CriticalLevel] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (28, N'Coffee', CAST(10.00 AS Decimal(18, 2)), 4, 12, CAST(N'2020-04-25T12:31:35.113' AS DateTime), 0, 0)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (29, N'Sugar', CAST(20.00 AS Decimal(18, 2)), 2, 12, CAST(N'2020-04-25T12:32:13.810' AS DateTime), 0, 0)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Category_Id], [Unit_Id], [X_DateCreated], [X_Archived], [X_Deleted]) VALUES (30, N'Milk', CAST(30.00 AS Decimal(18, 2)), 7, 12, CAST(N'2020-04-25T12:32:44.740' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [Name], [Price], [Description], [Timer], [X_Deleted]) VALUES (13, N'milky coffee', CAST(60.00 AS Decimal(18, 2)), N'milk with coffee', CAST(3.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuItem] ON 

INSERT [dbo].[MenuItem] ([Id], [Menu_Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (1, 13, 28, CAST(5.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[MenuItem] ([Id], [Menu_Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (2, 13, 29, CAST(3.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[MenuItem] ([Id], [Menu_Id], [Item_Id], [Quantity], [Unit_Id]) VALUES (3, 13, 30, CAST(4.00 AS Decimal(18, 2)), 12)
SET IDENTITY_INSERT [dbo].[MenuItem] OFF
SET IDENTITY_INSERT [dbo].[Production] ON 

INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (1, 13, 1, 4, CAST(N'2020-04-25T12:50:14.057' AS DateTime), CAST(N'2020-04-25T13:00:15.623' AS DateTime), 26, 1)
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (2, 13, 1, 0, CAST(N'2020-04-25T12:55:02.223' AS DateTime), CAST(N'2020-04-25T12:55:02.223' AS DateTime), 31, 0)
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (6, 13, 2, 0, CAST(N'2020-04-25T14:25:14.680' AS DateTime), CAST(N'2020-04-25T14:25:14.680' AS DateTime), 35, 0)
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (9, 13, 2, 0, CAST(N'2020-04-25T14:26:35.963' AS DateTime), CAST(N'2020-04-25T14:26:35.963' AS DateTime), 36, 0)
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (10, 13, 2, 0, CAST(N'2020-04-25T14:26:40.770' AS DateTime), CAST(N'2020-04-25T14:26:40.770' AS DateTime), 37, 0)
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (11, 13, 2, 0, CAST(N'2020-04-25T14:27:42.783' AS DateTime), CAST(N'2020-04-25T14:27:42.783' AS DateTime), 38, 0)
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (12, 13, 2, 0, CAST(N'2020-04-25T14:28:02.860' AS DateTime), CAST(N'2020-04-25T14:28:02.860' AS DateTime), 39, 0)
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (13, 13, 2, 0, CAST(N'2020-04-25T14:29:00.467' AS DateTime), CAST(N'2020-04-25T14:29:00.467' AS DateTime), 40, 0)
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (14, 13, 2, 0, CAST(N'2020-04-25T14:29:23.007' AS DateTime), CAST(N'2020-04-25T14:29:23.007' AS DateTime), 41, 0)
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (16, 13, 2, 0, CAST(N'2020-04-25T14:53:43.687' AS DateTime), CAST(N'2020-04-25T14:53:43.687' AS DateTime), 43, 0)
INSERT [dbo].[Production] ([Id], [Menu_Id], [Quantity], [Status], [X_DateCreated], [X_Done], [ProductionCart_Id], [Confirmed]) VALUES (20, 13, 2, 0, CAST(N'2020-04-25T15:18:41.320' AS DateTime), CAST(N'2020-04-25T15:18:41.320' AS DateTime), 47, 1)
SET IDENTITY_INSERT [dbo].[Production] OFF
SET IDENTITY_INSERT [dbo].[ProductionCart] ON 

INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (26, CAST(N'2020-04-25T12:50:09.773' AS DateTime), 1)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (27, CAST(N'2020-04-25T12:50:17.130' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (28, CAST(N'2020-04-25T12:51:03.947' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (29, CAST(N'2020-04-25T12:51:10.050' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (30, CAST(N'2020-04-25T12:54:04.357' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (31, CAST(N'2020-04-25T12:54:57.660' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (32, CAST(N'2020-04-25T13:01:29.393' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (33, CAST(N'2020-04-25T14:23:42.593' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (34, CAST(N'2020-04-25T14:24:16.610' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (35, CAST(N'2020-04-25T14:25:10.180' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (36, CAST(N'2020-04-25T14:25:39.450' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (37, CAST(N'2020-04-25T14:26:38.467' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (38, CAST(N'2020-04-25T14:27:39.500' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (39, CAST(N'2020-04-25T14:28:00.180' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (40, CAST(N'2020-04-25T14:28:57.810' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (41, CAST(N'2020-04-25T14:29:20.500' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (42, CAST(N'2020-04-25T14:32:50.770' AS DateTime), 1)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (43, CAST(N'2020-04-25T14:53:40.293' AS DateTime), 0)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (44, CAST(N'2020-04-25T14:56:09.750' AS DateTime), 1)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (45, CAST(N'2020-04-25T15:01:29.720' AS DateTime), 1)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (46, CAST(N'2020-04-25T15:07:08.197' AS DateTime), 1)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (47, CAST(N'2020-04-25T15:18:38.060' AS DateTime), 1)
INSERT [dbo].[ProductionCart] ([Id], [X_DateCreated], [Confirmed]) VALUES (48, CAST(N'2020-04-25T15:18:48.633' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[ProductionCart] OFF
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (1, 28, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2020-04-25' AS Date), 0, CAST(N'2020-04-25T12:48:12.253' AS DateTime), NULL, 0, 0, 25, CAST(10.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (2, 29, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2020-04-25' AS Date), 0, CAST(N'2020-04-25T12:48:26.467' AS DateTime), NULL, 0, 0, 25, CAST(10.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (3, 30, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2020-04-25' AS Date), 0, CAST(N'2020-04-25T12:48:30.970' AS DateTime), NULL, 0, 0, 25, CAST(10.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (4, 28, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(9.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-24' AS Date), 0, CAST(N'2020-04-25T12:48:46.113' AS DateTime), NULL, 0, 1, 26, CAST(10.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (5, 29, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(8.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-24' AS Date), 0, CAST(N'2020-04-25T12:48:48.667' AS DateTime), NULL, 0, 1, 26, CAST(10.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (6, 30, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(6.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-24' AS Date), 0, CAST(N'2020-04-25T12:48:51.387' AS DateTime), NULL, 0, 1, 26, CAST(10.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (7, 28, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2020-04-25' AS Date), 0, CAST(N'2020-04-25T12:50:49.547' AS DateTime), NULL, 0, 0, 27, CAST(100.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (8, 29, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2020-04-25' AS Date), 0, CAST(N'2020-04-25T12:50:53.843' AS DateTime), NULL, 0, 0, 27, CAST(100.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (9, 30, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2020-04-25' AS Date), 0, CAST(N'2020-04-25T12:50:56.773' AS DateTime), NULL, 0, 0, 27, CAST(100.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (10, 28, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(10.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-25' AS Date), 0, CAST(N'2020-04-25T12:54:17.807' AS DateTime), NULL, 0, 1, 28, CAST(10.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (11, 29, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(10.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-25' AS Date), 0, CAST(N'2020-04-25T12:54:21.770' AS DateTime), NULL, 0, 1, 28, CAST(10.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Purchase] ([Id], [Item_Id], [Type], [Price], [Supplier_Id], [Quantity], [Unit_Id], [DatePurchased], [Forecast_Id], [X_DateCreated], [X_User_Id], [X_Deleted], [Confirmed], [PurchaseCart_Id], [R_Quantity], [R_Unit_Id]) VALUES (12, 30, 0, CAST(10.00 AS Decimal(18, 2)), 1, CAST(10.00 AS Decimal(18, 2)), 12, CAST(N'2020-04-25' AS Date), 0, CAST(N'2020-04-25T12:54:24.650' AS DateTime), NULL, 0, 1, 28, CAST(10.00 AS Decimal(18, 2)), 12)
SET IDENTITY_INSERT [dbo].[Purchase] OFF
SET IDENTITY_INSERT [dbo].[PurchaseCart] ON 

INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (20, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (21, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (22, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (23, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (24, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (25, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (26, 1, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (27, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (28, 1, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (29, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (30, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (31, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (32, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (33, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (34, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (35, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (36, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (37, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (38, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (39, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (40, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (41, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (42, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (43, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (44, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (45, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (46, 0, N'Apr 25 202')
INSERT [dbo].[PurchaseCart] ([Id], [Confirmed], [X_DateCreated]) VALUES (47, 0, N'Apr 25 202')
SET IDENTITY_INSERT [dbo].[PurchaseCart] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name], [PersonName], [Address], [MobileNumber], [Landline], [EmailAddress]) VALUES (1, N'SuperSupplier', N'Moscov', N'Las Pinas', N'091234567890', N'021234567', N'supplier@email.com')
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
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_Confirmed]  DEFAULT ((0)) FOR [Confirmed]
GO
ALTER TABLE [dbo].[ProductionCart] ADD  CONSTRAINT [DF_ProductionCart_X_DateCreated]  DEFAULT (getdate()) FOR [X_DateCreated]
GO
ALTER TABLE [dbo].[ProductionCart] ADD  CONSTRAINT [DF_ProductionCart_Confirmed]  DEFAULT ((0)) FOR [Confirmed]
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
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_Confirmed]  DEFAULT ((0)) FOR [Confirmed]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_PurchaseCart_Id]  DEFAULT ((0)) FOR [PurchaseCart_Id]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_R_Quantity]  DEFAULT ((0)) FOR [R_Quantity]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_R_Unit_Id]  DEFAULT ((0)) FOR [R_Unit_Id]
GO
ALTER TABLE [dbo].[PurchaseCart] ADD  CONSTRAINT [DF_PurchaseCart_Confirmed]  DEFAULT ((0)) FOR [Confirmed]
GO
ALTER TABLE [dbo].[PurchaseCart] ADD  CONSTRAINT [DF_PurchaseCart_X_DateCreated]  DEFAULT (getdate()) FOR [X_DateCreated]
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
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [FK_Production_ProductionCart] FOREIGN KEY([ProductionCart_Id])
REFERENCES [dbo].[ProductionCart] ([Id])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [FK_Production_ProductionCart]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Item] FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Item]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_PurchaseCart] FOREIGN KEY([PurchaseCart_Id])
REFERENCES [dbo].[PurchaseCart] ([Id])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_PurchaseCart]
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
/****** Object:  StoredProcedure [dbo].[Category_Get]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CriticalLevel_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CriticalLevel_Add]
	@Item_Id int,
	@Quantity decimal(18,2),
	@Unit_Id int
AS
BEGIN
	INSERT INTO [dbo].[CriticalLevel]
           ([Item_Id]
           ,[Quantity]
           ,[Unit_Id])
     VALUES (@Item_Id,
	 @Quantity,
	 @Unit_Id
	 )

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[CriticalLevel_Delete]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CriticalLevel_Delete]
	@Item_Id int
AS
BEGIN
	DELETE CriticalLevel
	WHERE Item_Id = @Item_Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[CriticalLevel_GetByItem_Id]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CriticalLevel_GetByItem_Id]
	@Item_Id int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT *
	FROM CriticalLevel
	WHERE Item_Id = @Item_Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Forecast_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Forecast_Delete]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Forecast_GetById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Forecast_GetForDatatable]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Forecast_GetViewById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_CountByItemNotId]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_CountByName]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_CountByNameNotId]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_Delete]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_Edit]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_GetById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_GetCurrentQuantity]    Script Date: 4/25/2020 5:41:55 PM ******/
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
	ISNULL((
		SELECT SUM(TOTAL) FROM 
		(
			SELECT
			SUM(Px.R_Quantity*Ux.Conversion) TOTAL
			FROM Item Ix
			INNER JOIN Purchase Px
			ON Ix.Id = Px.Item_Id
			INNER JOIN Unit Ux
			ON Px.Unit_Id = Ux.Id
			WHERE Ix.Id = I.Id
			AND (Px.Type = 0 OR Px.Type = 3)
			AND Px.Confirmed = 1

			UNION ALL

			SELECT
			(SUM(Px.R_Quantity*Ux.Conversion)*-1) TOTAL
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
			WHERE Ix.Id = I.Id AND Px.Confirmed = 1
		) v
	)/U.Conversion,0) R_Quantity,
	ISNULL((
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
			AND Px.Confirmed = 1

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
			WHERE Ix.Id = I.Id AND Px.Confirmed = 1
		) v
	)/U.Conversion,0) Quantity,

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
				WHERE My.Id = MIy.Menu_Id AND Py.Confirmed = 1
				GROUP BY Py.Menu_Id,My.Id) 'Needed'
				FROM MenuItem MIy
				INNER JOIN Unit Uy
				ON MIy.Unit_Id = Uy.Id
				INNER JOIN Item Iy
				ON MIy.Item_Id = Iy.Id
				INNER JOIN Unit UIy
				ON Iy.Unit_Id = UIy.Id
				WHERE Iy.Id = I.Id AND I.X_Deleted = 0
			) A
		)
		,0
	) 'Needs',
	ISNULL(((CL.Quantity*UCL.Conversion)/U.Conversion),0) 'Critical',
	U.Id 'Unit'
	FROM Item I
	LEFT JOIN Unit U
	ON  I.Unit_Id = U.Id
	LEFT JOIN Category C
	ON  I.Category_Id = C.Id
	LEFT JOIN CriticalLevel CL
	ON  I.Id = CL.Item_Id
	LEFT JOIN Unit UCL
	ON  CL.Unit_Id = UCL.Id
	WHERE I.X_Deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[Item_GetForDatatable]    Script Date: 4/25/2020 5:41:55 PM ******/
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
			WHERE Ix.Id = I.Id AND Px.Confirmed = 1
		) v
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
/****** Object:  StoredProcedure [dbo].[Item_GetForDropdown]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_GetUsageForDatatable]    Script Date: 4/25/2020 5:41:55 PM ******/
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
AND Px.Type = 3)/U.Conversion,'#.00'),0),' ', U.Abbr) 'Subsidized',

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
/****** Object:  StoredProcedure [dbo].[Item_GetViewById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
	I.X_DateCreated DateCreated,
	CASE WHEN CL.Quantity IS NULL THEN 0 ELSE CL.Quantity END Critical_Quantity,
	CASE WHEN Uc.Name IS NULL THEN U.Name ELSE Uc.Name END Critical_Unit
	FROM Item I
	LEFT JOIN Unit U
	ON  I.Unit_Id = U.Id
	LEFT JOIN Category C
	ON  I.Category_Id = C.Id
	LEFT JOIN CriticalLevel CL
	ON  I.Id = CL.Item_Id
	LEFT JOIN Unit Uc
	ON  CL.Unit_Id = Uc.Id
	WHERE I.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Menu_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_CountByName]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_CountByNameNotId]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_Delete]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_Edit]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_GetById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_GetForDatatable]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_GetForDropdown]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_GetViewById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_CountByItem]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_Delete]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_Edit]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_GetById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_GetForDatatable]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Produce_BestSeller]    Script Date: 4/25/2020 5:41:55 PM ******/
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
WHERE P.Confirmed = 1
GROUP BY P.Menu_Id
ORDER BY x_count DESC
) A
INNER JOIN Menu M
ON A.Menu_Id = M.Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Production_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Production_Add]
	@Menu_Id int,
	@Quantity int,
	@ProductionCart_Id int
AS
BEGIN
	INSERT INTO [dbo].[Production]
		([Menu_Id],[Quantity],[ProductionCart_Id])
	VALUES
		(@Menu_Id, @Quantity, @ProductionCart_Id)

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Production_Delete]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Production_Edit]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Production_Finish]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Production_Finish]
	@ProductionCart_Id int
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE [Production]
	SET Confirmed = 1
	WHERE ProductionCart_Id = @ProductionCart_Id;
	UPDATE [ProductionCart]
	SET Confirmed = 1
	WHERE Id = @ProductionCart_Id;
	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Production_GetById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Production_GetForDatatable]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Production_GetForDatatable]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	ISNULL(P.ProductionCart_Id,0) ProductionCart_Id,
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
	ON  P.Menu_Id = M.Id
	WHERE P.Confirmed = 1;

END
GO
/****** Object:  StoredProcedure [dbo].[Production_GetForDatatableByCartId]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Production_GetForDatatableByCartId]
	@ProductionCart_Id int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	P.Id,
	M.Name 'Menu',
	P.Quantity
	FROM [Production] P
	INNER JOIN [Menu] M
	ON  P.Menu_Id = M.Id
	WHERE P.ProductionCart_Id = @ProductionCart_Id;

END
GO
/****** Object:  StoredProcedure [dbo].[Production_GetLate]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Production_GetOverallStats]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Production_GetViewById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Production_IsPossible]    Script Date: 4/25/2020 5:41:55 PM ******/
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
	WHERE Ix.Id = I.Id
	AND Px.Confirmed = 1) v
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
/****** Object:  StoredProcedure [dbo].[Production_LastMonthStats]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Production_NotifForCritical]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Production_NotifForCritical]
	@Menu_Id int,
	@Quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
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
	WHERE Ix.Id = I.Id
	AND Px.Confirmed = 1) v
	)/U.Conversion) Quantity,
	(CL.Quantity*UCL.Conversion) Critical,
	I.Id Item_Id,
	I.Name Item
	FROM Item I
	LEFT JOIN CriticalLevel CL
	ON I.Id = CL.Item_Id
	LEFT JOIN Unit UCL
	ON  CL.Unit_Id = UCL.Id
	LEFT JOIN Unit U
	ON  I.Unit_Id = U.Id
	INNER JOIN MenuItem MI
	ON MI.Item_Id = I.Id
	INNER JOIN Menu M
	ON M.Id = MI.Menu_Id
	WHERE M.Id = @Menu_Id;
END
GO
/****** Object:  StoredProcedure [dbo].[ProductionCart_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductionCart_Add]
AS
BEGIN
	INSERT INTO [dbo].[ProductionCart] (Confirmed)
     VALUES (0)

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
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
	@DatePurchased date,
	@Confirmed tinyint,
	@PurchaseCart_Id int,
	@R_Quantity decimal,
	@R_Unit_Id int
AS
BEGIN
	INSERT INTO [dbo].[Purchase]
           ([Item_Id]
			,[Type]
			,[Price]
			,[Supplier_Id]
			,[Quantity]
			,[Unit_Id]
			,[DatePurchased],
			Confirmed,
			PurchaseCart_Id,
			R_Quantity,
			R_Unit_Id 
			)
     VALUES (@Item_Id,
			@Type,
			@Price,
			@Supplier_Id,
			@Quantity,
			@Unit_Id,
			@DatePurchased,
			@Confirmed,
			@PurchaseCart_Id,
			@R_Quantity,
			@R_Unit_Id)

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Buy_Count]    Script Date: 4/25/2020 5:41:55 PM ******/
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
	AND P.Confirmed = 1
	AND MONTH(P.DatePurchased) = MONTH(GETDATE()) 
	AND YEAR(P.DatePurchased) = YEAR(GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Delete]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_Delete]
	@Id int
AS
BEGIN
	
	--UPDATE Purchase
	--SET X_Deleted = 1
	--WHERE Id = @Id;
	DELETE FROM Purchase
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Edit]    Script Date: 4/25/2020 5:41:55 PM ******/
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
	@DatePurchased date,
	@R_Quantity decimal(18,2),
	@R_Unit_Id int
AS
DECLARE
	@Cart int
BEGIN
	SET @Cart = (SELECT PurchaseCart_Id FROM Purchase WHERE Id = @Id);
	
	UPDATE Purchase
	SET
		Item_Id = @Item_Id,
		Price = @Price,
		Quantity = @Quantity,
		Unit_Id = @Unit_Id,
		R_Quantity = @R_Quantity,
		R_Unit_Id = @R_Unit_Id
	WHERE Id = @Id;

	UPDATE Purchase
	SET
		Type = @Type,
		Supplier_Id = @Supplier_Id,
		DatePurchased = @DatePurchased
	WHERE PurchaseCart_Id = @Cart;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Finish]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Purchase_Finish]
	@PurchaseCart_Id int,
	@Type int,
	@DatePurchased date,
	@Supplier_Id int
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE [Purchase]
	SET Confirmed = 1,
	[Type] = @Type,
	[DatePurchased] = @DatePurchased,
	[Supplier_Id] = @Supplier_Id
	WHERE PurchaseCart_Id = @PurchaseCart_Id;
	UPDATE [PurchaseCart]
	SET Confirmed = 1
	WHERE Id = @PurchaseCart_Id;
	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_GetById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Purchase_GetForDatatable]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_GetForDatatable]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	P.PurchaseCart_Id,
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
	CONCAT(ISNULL(P.Quantity,0),' ',U.Abbr) Recieved,
	CONCAT(P.R_Quantity,' ',U1.Abbr) Purchased,
	CONVERT(varchar, P.DatePurchased, 107) DatePurchased
	FROM Purchase P
	INNER JOIN Item I
	ON P.Item_Id = I.Id
	LEFT JOIN Supplier S
	ON P.Supplier_Id = S.Id
	LEFT JOIN Unit U
	ON P.Unit_Id = U.Id
	LEFT JOIN Unit U1
	ON P.R_Unit_Id = U1.Id
	WHERE P.X_Deleted = 0 AND P.Confirmed = 1;

END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_GetForDatatableByCartId]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Purchase_GetForDatatableByCartId]
	@PurchaseCart_Id int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	P.Id,
	I.Name Item,
	P.Price,
	P.R_Quantity Quantity,
	U.Name Unit
	FROM Purchase P
	INNER JOIN Item I
	ON P.Item_Id = I.Id
	LEFT JOIN Supplier S
	ON P.Supplier_Id = S.Id
	LEFT JOIN Unit U
	ON P.R_Unit_Id = U.Id
	WHERE P.PurchaseCart_Id = @PurchaseCart_Id;

END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_GetViewById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Purchase_Sold_Count]    Script Date: 4/25/2020 5:41:55 PM ******/
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
	AND P.Confirmed = 1
	AND MONTH(P.DatePurchased) = MONTH(GETDATE()) 
	AND YEAR(P.DatePurchased) = YEAR(GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Spoiled_Count]    Script Date: 4/25/2020 5:41:55 PM ******/
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
	AND P.Confirmed = 1
	AND MONTH(P.DatePurchased) = MONTH(GETDATE()) 
	AND YEAR(P.DatePurchased) = YEAR(GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[Purchase_Subsidized_Count]    Script Date: 4/25/2020 5:41:55 PM ******/
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
	AND P.Confirmed = 1
	AND MONTH(P.DatePurchased) = MONTH(GETDATE()) 
	AND YEAR(P.DatePurchased) = YEAR(GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[PurchaseCart_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PurchaseCart_Add]
AS
BEGIN
	INSERT INTO [dbo].[PurchaseCart] (Confirmed)
     VALUES (0)

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Supplier_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Supplier_CountByName]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Supplier_CountByNameNotId]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Supplier_Delete]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Supplier_Edit]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Supplier_Edit] 
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
/****** Object:  StoredProcedure [dbo].[Supplier_GetById]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Supplier_GetForDatatable]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Supplier_GetForDropdown]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Unit_Get]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Unit_GetForDropdown]    Script Date: 4/25/2020 5:41:55 PM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Add]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Add]
	@Name varchar(50),
	@Username varchar(50),
	@Password varchar(200)
AS
BEGIN
	INSERT INTO [dbo].[User]
           ([Name]
           ,[Username]
           ,[Password])
     VALUES (@Name,
	 @Username,
	 @Password
	 )

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[User_CountByName]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[User_CountByName]
	@Username varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Count(*) FROM [User] I WHERE I.Username = @Username;
END
GO
/****** Object:  StoredProcedure [dbo].[User_CountByNameNotId]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[User_CountByNameNotId] 
	@Id int,
	@Username varchar(50)
AS
BEGIN
	SELECT COUNT(*) FROM [User] I WHERE I.Username = @Username AND Id != @Id
END
GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[User_Delete]
	@Id int
AS
BEGIN
	Delete [User]
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[User_Edit]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[User_Edit] 
	@Id int,
	@Name varchar(50),
	@Username varchar(50),
	@Password varchar(200)
AS
BEGIN
	UPDATE [User]
	SET
		Name = @Name,
		Username = @Username,
		Password = @Password
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[User_GetById]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[User_GetById]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [User] I WHERE I.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[User_GetForDatatable]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[User_GetForDatatable]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	Id,
	Name,
	Username
	FROM [User];

END
GO
/****** Object:  StoredProcedure [dbo].[User_GetForDropdown]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[User_GetForDropdown]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Id,Name
	FROM [User];

END
GO
/****** Object:  StoredProcedure [dbo].[User_Login]    Script Date: 4/25/2020 5:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_Login]
	-- Add the parameters for the stored procedure here
	@Username varchar(50),
	@Password varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [User] WHERE [Username] = @Username AND [Password] = @Password;
END
GO
