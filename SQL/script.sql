USE [master]
GO
/****** Object:  Database [MRPS]    Script Date: 3/9/2020 7:28:04 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/9/2020 7:28:04 PM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 3/9/2020 7:28:04 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 3/9/2020 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[Description] [varchar](500) NULL,
	[X_Deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 3/9/2020 7:28:04 PM ******/
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
/****** Object:  Table [dbo].[Production]    Script Date: 3/9/2020 7:28:04 PM ******/
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
 CONSTRAINT [PK_Production] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 3/9/2020 7:28:04 PM ******/
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
	[X_DateCreated] [datetime] NOT NULL,
	[X_User_Id] [int] NULL,
	[X_Deleted] [tinyint] NOT NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Category_Get]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_Add]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_CountByItemNotId]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_CountByName]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_CountByNameNotId]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_Delete]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_Edit]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_GetById]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_GetForDatatable]    Script Date: 3/9/2020 7:28:05 PM ******/
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
	SELECT
	SUM(P.Quantity*U.Conversion) tomili
	FROM Item I2 
	LEFT JOIN Purchase P
	ON I2.Id = P.Item_Id
	LEFT JOIN Unit U
	ON P.Unit_Id = U.Id
	LEFT JOIN Unit U2
	ON I2.Unit_Id = U2.Id
	WHERE P.Item_Id = I.Id
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
/****** Object:  StoredProcedure [dbo].[Item_GetForDropdown]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Item_GetViewById]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_Add]    Script Date: 3/9/2020 7:28:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Menu_Add]
	@Name varchar(50),
	@Price decimal(18,2),
	@Description varchar(500)
AS
BEGIN
	INSERT INTO [dbo].[Menu]
           ([Name]
           ,[Price]
           ,[Description])
     VALUES (@Name,
	 @Price,
	 @Description
	 )

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Menu_CountByName]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_CountByNameNotId]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_Delete]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_Edit]    Script Date: 3/9/2020 7:28:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Menu_Edit] 
	@Id int,
	@Name varchar(50),
	@Price decimal(18,2),
	@Description varchar(500)
AS
BEGIN
	UPDATE Menu
	SET
		Name = @Name,
		Price = @Price,
		Description = @Description
	WHERE Id = @Id;

	SELECT @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[Menu_GetById]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_GetForDatatable]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_GetForDropdown]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Menu_GetViewById]    Script Date: 3/9/2020 7:28:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Menu_GetViewById]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
	Id,
	Name,
	Price,
	Description
	FROM Menu
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[MenuItem_Add]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_CountByItem]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_Delete]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_Edit]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_GetById]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MenuItem_GetForDatatable]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Purchase_Add]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Purchase_Delete]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Purchase_Edit]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Purchase_GetById]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Purchase_GetForDatatable]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Purchase_GetViewById]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Supplier_GetForDropdown]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Unit_Get]    Script Date: 3/9/2020 7:28:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Unit_GetForDropdown]    Script Date: 3/9/2020 7:28:05 PM ******/
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
USE [master]
GO
ALTER DATABASE [MRPS] SET  READ_WRITE 
GO
