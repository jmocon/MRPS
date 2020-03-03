USE [master]
GO
/****** Object:  Database [MRPS]    Script Date: 2/22/2020 8:40:52 AM ******/
CREATE DATABASE [MRPS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MRPS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MRPS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MRPS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MRPS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MRPS] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MRPS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MRPS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MRPS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MRPS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MRPS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MRPS] SET ARITHABORT OFF 
GO
ALTER DATABASE [MRPS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MRPS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MRPS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MRPS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MRPS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MRPS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MRPS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MRPS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MRPS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MRPS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MRPS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MRPS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MRPS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MRPS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MRPS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MRPS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MRPS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MRPS] SET RECOVERY FULL 
GO
ALTER DATABASE [MRPS] SET  MULTI_USER 
GO
ALTER DATABASE [MRPS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MRPS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MRPS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MRPS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MRPS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MRPS', N'ON'
GO
ALTER DATABASE [MRPS] SET QUERY_STORE = OFF
GO
USE [MRPS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MRPS]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/22/2020 8:40:52 AM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 2/22/2020 8:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](18, 2) NULL,
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
/****** Object:  Table [dbo].[Menu]    Script Date: 2/22/2020 8:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 2/22/2020 8:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Menu_Id] [int] NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NULL,
 CONSTRAINT [PK_MenuItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Production]    Script Date: 2/22/2020 8:40:52 AM ******/
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
	[X_User_Id] [int] NULL,
 CONSTRAINT [PK_Production] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 2/22/2020 8:40:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Supplier_Id] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[X_DateCreated] [datetime] NOT NULL,
	[X_User_Id] [int] NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2/22/2020 8:40:52 AM ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 2/22/2020 8:40:52 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/22/2020 8:40:52 AM ******/
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
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (1, N'Piece', N'pc', CAST(1.0000 AS Decimal(25, 4)), 0)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (2, N'Ounces', N'oz', CAST(1.0000 AS Decimal(25, 4)), 1)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (3, N'Pounds', N'lb', CAST(16.0000 AS Decimal(25, 4)), 1)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (4, N'Tons', N't', CAST(32000.0000 AS Decimal(25, 4)), 1)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (5, N'Teaspoons', N'tsp', CAST(4.9289 AS Decimal(25, 4)), 2)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (6, N'Tablespoons', N'tbsp', CAST(14.7868 AS Decimal(25, 4)), 2)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (7, N'Fluid ounces', N'fl oz', CAST(29.5735 AS Decimal(25, 4)), 2)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (8, N'Cups', N'c', CAST(236.5880 AS Decimal(25, 4)), 2)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (9, N'Pints', N'pt', CAST(473.1760 AS Decimal(25, 4)), 2)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (10, N'Quarts', N'qt', CAST(946.3530 AS Decimal(25, 4)), 2)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (11, N'Gallons', N'gal', CAST(3785.4100 AS Decimal(25, 4)), 2)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (12, N'Milligrams', N'ml', CAST(1.0000 AS Decimal(25, 4)), 1)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (13, N'Grams', N'g', CAST(1000.0000 AS Decimal(25, 4)), 1)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (14, N'Kilograms', N'kg', CAST(1000000.0000 AS Decimal(25, 4)), 1)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (15, N'Metric ton', N't', CAST(907184740.0000 AS Decimal(25, 4)), 1)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (16, N'Milliliters', N'ml', CAST(1.0000 AS Decimal(25, 4)), 2)
INSERT [dbo].[Unit] ([Id], [Name], [Abbr], [Conversion], [Type]) VALUES (17, N'Liters', N'l', CAST(1000.0000 AS Decimal(25, 4)), 2)
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
ALTER TABLE [dbo].[MenuItem] ADD  CONSTRAINT [DF_MenuItem_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Production] ADD  CONSTRAINT [DF_Production_X_DateCreated]  DEFAULT (getdate()) FOR [X_DateCreated]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_X_DateCreated]  DEFAULT (getdate()) FOR [X_DateCreated]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_Id_Conversion]  DEFAULT ((1)) FOR [Conversion]
GO
ALTER TABLE [dbo].[Unit] ADD  CONSTRAINT [DF_Unit_Id_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Usertype]  DEFAULT ((0)) FOR [Usertype]
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
ALTER TABLE [dbo].[Production]  WITH CHECK ADD  CONSTRAINT [FK_Production_User] FOREIGN KEY([X_User_Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Production] CHECK CONSTRAINT [FK_Production_User]
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
USE [master]
GO
ALTER DATABASE [MRPS] SET  READ_WRITE 
GO
