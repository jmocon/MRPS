USE [MRPS]
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
