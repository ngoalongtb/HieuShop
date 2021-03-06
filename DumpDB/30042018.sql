USE [master]
GO
/****** Object:  Database [HieuShop]    Script Date: 4/30/2018 3:32:56 PM ******/
CREATE DATABASE [HieuShop]
GO
USE [HieuShop]
GO
/****** Object:  Table [dbo].[About]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[advertisement]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertisement](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_advertisement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Answer]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [bigint] NULL,
	[Date] [date] NULL,
	[Detail] [nvarchar](500) NULL,
	[Title] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[CountView] [bigint] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
	[Language] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [nvarchar](50) NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [date] NULL,
	[ViewCount] [int] NULL,
	[Language] [nvarchar](50) NULL,
	[TagsId] [bigint] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] IDENTITY(1,1) NOT NULL,
	[TagID] [bigint] NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Credential]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Creidentail]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Creidentail](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Creidentail] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [date] NULL CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()),
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[Title] [nvarchar](50) NULL,
	[Type] [bigint] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupUser]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupUser](
	[ID] [varchar](20) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_GroupUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Images]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Mota] [nvarchar](100) NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [bigint] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [date] NULL CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()),
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[Payment] [datetime] NULL,
	[Ship] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[OrderID] [bigint] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[SumPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [nvarchar](500) NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludedVAT] [bit] NULL,
	[Quantity] [int] NOT NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [nvarchar](250) NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [date] NULL CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[ShowOnHome] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [date] NULL,
	[Vendor] [nvarchar](255) NULL,
	[VendorAddress] [nvarchar](255) NULL,
	[Payment] [datetime] NULL,
	[Ship] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrderDetail]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[Quantity] [int] NULL,
	[PurchaseOrderID] [bigint] NULL,
	[Price] [decimal](18, 0) NULL,
	[SumPrice] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slide]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL CONSTRAINT [DF_Table("Slide")_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table("Slide")] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeFooter]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeFooter](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_TypeFooter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](32) NULL,
	[GroupID] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[CreatedDate] [date] NULL CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[roleID] [bigint] NULL,
	[img] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([ID], [Name], [MetaTitle], [Description], [Image], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'Về chúng tôi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([ID], [Username], [Date], [Detail], [Title], [Status], [CountView]) VALUES (1, 1, CAST(N'2016-12-17' AS Date), N'đâsdasd', N'Tại sao', 1, 0)
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (4, N'Cây cảnh văn phòng', N'cay-canh-van-phong', NULL, NULL, N'cây cảnh văn phòng', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, N'VN')
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (5, N'Sen đá', N'sen-da', NULL, NULL, N'sen đá', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (6, N'Xương rồng', N'xuong-rong', NULL, NULL, N'xương rồng', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (7, N'Chậu cây cảnh', N'chau-cay-canh', NULL, NULL, N'chậu cây cảnh', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (8, N'Phụ kiện tiểu cảnh', N'phu-kien-tieu-canh', NULL, NULL, N'phụ kiện tiểu cảnh', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (1, N'Cây xinh Thảo Phương', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Language], [TagsId]) VALUES (2, N'Cách trồng sen đá', N'Cách trồng tốt', N'Sen đá là một loại cây dễ sống, dễ trồng và chăm sóc rất đơn giản, kỹ thuật trồng sen đá cũng không có gì cao siêu cả. Mời các bạn tham khảo bài viết dưới đây để có thêm kinh nghiệm trồng sen đá, tô điểm cho căn phòng của bạn thêm trẻ trung hơn.', N'/assets/Admin/images/hoa-sen-da.jpg', NULL, NULL, NULL, CAST(N'2018-04-20' AS Date), N'Thảo Phương', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (1, N'Dỗ Lai Tuấn', N'0987413992', N'tuantitqo@gmail.com', N'dsf', N'fffsdfsdfdsf', CAST(N'2016-11-20' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Footer] ON 

INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (1, N'Về chúng tôi', 1, N'Giới thiệu', 1)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (2, N'Quy định sử dụng', 1, NULL, 1)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (3, N'Dịch vụ cung cấp', 1, NULL, 1)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (4, N'Thông tin liên hệ', 1, NULL, 1)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (5, N'Hướng dẫn mua hàng', 1, NULL, 2)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (6, N'Chính sách giao hàng', 1, NULL, 2)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (7, N'Bảo hành sản phẩm', 1, NULL, 2)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (8, N'Bảo mật thông tin', 1, NULL, 2)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (9, N'Trực tuyến', 1, NULL, 3)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (10, N'Qua ngân hàng', 1, NULL, 3)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (11, N'Tin khuyến mại', 1, NULL, 4)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (12, N'Kinh nghiệm', 1, NULL, 4)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (13, N'Ảnh thực tế', 1, NULL, 4)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (14, N'Facebook', 1, NULL, 5)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (15, N'Google', 1, NULL, 5)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (16, N'Linkedin', 1, NULL, 5)
INSERT [dbo].[Footer] ([ID], [Content], [Status], [Title], [Type]) VALUES (17, N'Blog', 1, NULL, 5)
SET IDENTITY_INSERT [dbo].[Footer] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([ID], [Name], [Mota], [Title]) VALUES (12, N'14627686_716165015203485_857931775_n.jpg', N'hình ảnh test', N'test')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'../Home/Index', NULL, N'Home', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Kiến thức', N'../Content/Index', NULL, N'Tin-tuc', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Giới thiệu ', N'../About/Index', NULL, N'Gioi-thieu', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ', N'/Contact/Index', NULL, N'lien-he', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (9, N'test2', NULL, NULL, N'test2', NULL, NULL)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (10, N'test', NULL, NULL, N'test', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'TopMenu')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'MainMenu')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [Payment], [Ship]) VALUES (10002, CAST(N'2018-04-24' AS Date), NULL, N'a', N'0966784763', N'cổ loa đong anh', N'hchieu1995@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [Payment], [Ship]) VALUES (10003, CAST(N'2018-04-24' AS Date), NULL, N'123', N'123', N'123', N'123', NULL, NULL, CAST(N'2018-04-30 15:30:21.997' AS DateTime))
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [Payment], [Ship]) VALUES (10004, CAST(N'2018-04-25' AS Date), NULL, N'Hieutest', N'0941060311', N'coloatest', N'hchieu1995tesst@gmail.com', NULL, NULL, CAST(N'2018-04-30 15:31:02.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [SumPrice]) VALUES (1, 3, 9, 1, CAST(10 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [SumPrice]) VALUES (2, 1, 10, 2, CAST(10 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [SumPrice]) VALUES (3, 1, 11, 2, CAST(10 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [SumPrice]) VALUES (4, 1, 12, 2, CAST(10 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [SumPrice]) VALUES (10002, 10006, 10002, 1, CAST(10 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [SumPrice]) VALUES (10003, 10007, 10003, 1, CAST(10 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [SumPrice]) VALUES (10004, 10008, 10004, 1, CAST(10 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ID], [ProductID], [OrderID], [Quantity], [Price], [SumPrice]) VALUES (10005, 10007, 10004, 1, CAST(10 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (1, N'Cây bạnh mã hoàng tử', N'cay-bach-ma-hoang-tu', N'cây bạch mã hoàng tử', N'/assets/Admin/images/cay-bach-ma-hoang-tu.jpg', NULL, CAST(10 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), NULL, 28, 4, N'cay-bach-ma-hoang-tu', NULL, NULL, NULL, NULL, NULL, N'cay-bach-ma-hoang-tu', NULL, 1, CAST(N'2018-04-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (2, N'Cây cẩm nhung đỏ thắm', N'cay-cam-nhung-do-tham', N'cây cẩm nhung đỏ thắm', N'/assets/Admin/images/cay-cam-nhung-do-tham.jpg', NULL, CAST(10 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), NULL, 20, 4, N'cay-cam-nhung-do-tham', NULL, NULL, NULL, NULL, NULL, N'cay-cam-nhung-do-tham', NULL, 1, CAST(N'2018-04-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (3, N'Sen đá chuỗi ngọc bi', N'sen-da-chuoi-ngoc-bi', N'sen-da-chuoi-ngoc-bi', N'/assets/Admin/images/sen-da-chuoi-ngoc-bi.jpg', NULL, CAST(10 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), NULL, 1, 5, N'sen-da-chuoi-ngoc-bi', NULL, NULL, NULL, NULL, NULL, N'sen-da-chuoi-ngoc-bi', NULL, 1, CAST(N'2018-04-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (4, N'Sen đá phật bà', N'sen-da-phat-ba', N'sen đá phật bà', N'/assets/Admin/images/sen-da-phat-ba.jpg', NULL, CAST(10 AS Decimal(18, 0)), CAST(9 AS Decimal(18, 0)), NULL, 1, 5, N'sen-da-phat-ba', NULL, NULL, NULL, NULL, NULL, N'sen-da-phat-ba', NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (10005, N'Xương rồng bánh sinh nhật', N'xuong-rong-banh-sinh-nhat', N'xuong-rong-banh-sinh-nhat', N'/assets/Admin/images/xuong-rong-banh-sinh-nhat.jpg', NULL, CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), NULL, 10, 6, N'xuong-rong-banh-sinh-nhat', NULL, NULL, NULL, NULL, NULL, N'xuong-rong-banh-sinh-nhat', NULL, 1, CAST(N'2018-04-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (10006, N'Xương rồng trứng', N'xuong-rong-trung', N'xuong-rong-trung', N'/assets/Admin/images/xuong-rong-trung.jpg', NULL, CAST(10 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), NULL, 0, 6, N'xuong-rong-trung', NULL, NULL, NULL, NULL, NULL, N'xuong-rong-trung', NULL, 1, CAST(N'2018-04-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (10007, N'Chậu gốm nhật', N'chau-gom-nhat', N'chau-gom-nhat', N'/assets/Admin/images/chau-gom-nhat.jpg', NULL, CAST(10 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), NULL, 12, 7, N'chau-gom-nhat', NULL, NULL, NULL, NULL, NULL, N'chau-gom-nhat', NULL, 1, CAST(N'2018-04-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (10008, N'Giỏ nấm 02', N'gio-nam-02', N'gio-nam-02', N'/assets/Admin/images/gio-nam-02.jpg', NULL, CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), NULL, 11, 8, N'gio-nam-02', NULL, NULL, NULL, NULL, NULL, N'gio-nam-02', NULL, 1, CAST(N'2018-04-20 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (15, N'Sản phẩm khác', N'san-pham-khac', NULL, NULL, NULL, CAST(N'2018-04-20' AS Date), NULL, NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[PurchaseOrder] ON 

INSERT [dbo].[PurchaseOrder] ([ID], [CreatedDate], [Vendor], [VendorAddress], [Payment], [Ship]) VALUES (1, NULL, N'Nhà cung cấp 1', N'Nhổn', CAST(N'2018-04-30 15:11:52.500' AS DateTime), NULL)
INSERT [dbo].[PurchaseOrder] ([ID], [CreatedDate], [Vendor], [VendorAddress], [Payment], [Ship]) VALUES (2, CAST(N'2018-04-30' AS Date), N'Nhà cung cấp 2', N'Nhổn', NULL, CAST(N'2018-04-30 15:13:15.827' AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseOrder] OFF
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetail] ON 

INSERT [dbo].[PurchaseOrderDetail] ([ID], [ProductID], [Quantity], [PurchaseOrderID], [Price], [SumPrice]) VALUES (1, 1, 2, 1, CAST(10000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[PurchaseOrderDetail] ([ID], [ProductID], [Quantity], [PurchaseOrderID], [Price], [SumPrice]) VALUES (2, 1, 22, 2, NULL, NULL)
INSERT [dbo].[PurchaseOrderDetail] ([ID], [ProductID], [Quantity], [PurchaseOrderID], [Price], [SumPrice]) VALUES (3, 10008, 24, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PurchaseOrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'ADMIN')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Name]) VALUES (2, N'slide02.jpg', NULL, N'#', N'Chậu cây xinh xắn từ lọ thủy tinh', CAST(N'2018-04-22' AS Date), NULL, NULL, NULL, 1, N'Chậu cây xinh xắn từ vỏ đồ hộp và kẹp gỗ')
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Name]) VALUES (3, N'slide01.jpg', NULL, N'#', N'Lạ mắt và sang trọng', CAST(N'2018-04-22' AS Date), NULL, NULL, NULL, 1, N'Sen nước')
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [Name], [Title]) VALUES (1, N'Sen đá', N'sen-da')
SET IDENTITY_INSERT [dbo].[Tag] OFF
SET IDENTITY_INSERT [dbo].[TypeFooter] ON 

INSERT [dbo].[TypeFooter] ([ID], [Name], [Status]) VALUES (1, N'Giới thiệu', 1)
INSERT [dbo].[TypeFooter] ([ID], [Name], [Status]) VALUES (2, N'Hỗ trợ khách hàng', 1)
INSERT [dbo].[TypeFooter] ([ID], [Name], [Status]) VALUES (3, N'Thanh toán', 1)
INSERT [dbo].[TypeFooter] ([ID], [Name], [Status]) VALUES (4, N'Tin tức', 1)
INSERT [dbo].[TypeFooter] ([ID], [Name], [Status]) VALUES (5, N'Mạng xã hội', 1)
SET IDENTITY_INSERT [dbo].[TypeFooter] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [roleID], [img]) VALUES (1, N'Admin', N'202cb962ac59075b964b07152d234b70', N'1', N'Admin', N'Đông Anh', N'hieuhc1995@gmail.com', NULL, NULL, NULL, CAST(N'2018-04-20' AS Date), NULL, NULL, NULL, 1, 1, N'14627686_716165015203485_857931775_n.jpg')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  StoredProcedure [dbo].[DanhsachHD]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhsachHD]
AS
	select Order_ID as[Mã hoá đơn],Date as [Ngày bán],Name_Received as[Người nhận],
	Address_Received as[Địa chỉ],Phone_Received as [SĐT],
	Name_Pay as[Người thanh toán],Address_Pay as[Địa chỉ TT],
	Phone_Pay as [SĐT TT],SumMoney as[Tổng tiền]
	  from tbl_Order
	RETURN


GO
/****** Object:  StoredProcedure [dbo].[Sp_themorder]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_themorder]
(
@Order_ID int,
@Amount int,
@Price_Export float,
@Summoney int,
@Product_ID int,
@State nvarchar(50)
)
as
begin
insert into tbl_OrderDetial(Order_ID,Product_ID,Price_Export,Amount,Money,State) values(@Order_ID,@Product_ID,@Price_Export,@Amount,@Summoney,@State)
end

GO
/****** Object:  StoredProcedure [dbo].[Sua_Order]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sua_Order]
(
@id int,
@Status nvarchar(50)

)
as
begin
update tbl_Order set State=@Status where Order_ID=@id
end

GO
/****** Object:  StoredProcedure [dbo].[SuaHSX]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[SuaHSX]
(

@Producer_ID int,
@Producer_Name nvarchar(50)
)
as
begin
	update tbl_Producer set Producer_Name=@Producer_Name where Producer_ID=@Producer_ID
end

GO
/****** Object:  StoredProcedure [dbo].[SuaHTTT]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[SuaHTTT]
(
@Pay_ID int,
@Pay_Name nvarchar(50)
)
as
begin
update tbl_Payment set Pay_Name=@Pay_Name  where Pay_ID=@Pay_ID
end

GO
/****** Object:  StoredProcedure [dbo].[SuaHTVC]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[SuaHTVC]
(
@Transport_ID int,
@Transport_Name nvarchar(50)

)
as
begin
update tbl_Transport set Transport_Name=@Transport_Name where Transport_ID=@Transport_ID
end

GO
/****** Object:  StoredProcedure [dbo].[SuaNCC]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[SuaNCC]
(
@Supplier_ID int,
@Supplier_Name nvarchar(50),
@Address nvarchar(50),
@Phone int,
@Email nvarchar(50)
)
as
begin
update tbl_Supplier set Supplier_Name=@Supplier_Name,Address=@Address,Phone=@Phone,Email=@Email where Supplier_ID=@Supplier_ID
end

GO
/****** Object:  StoredProcedure [dbo].[SuaPC]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[SuaPC]
(
@Style_ID int,
@Style_Name nvarchar(50)

)
as
begin
update tbl_Style set Style_Name=@Style_Name where Style_ID=@Style_ID
end

GO
/****** Object:  StoredProcedure [dbo].[SuaSP]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[SuaSP]
(
@Product_ID int,
@Product_Name nvarchar(50),
@Style_ID int,
@Type_ID int,
@Producer_ID int,
@Supplier_ID int,
@Image nvarchar(50),
@Color nvarchar(50),
@Material nvarchar(50),
@Size   nchar(50),
@Price_Import float,
@Price_Export float,
@Amount int,
@Weight float
)
as
begin
update tbl_Product set Product_Name=@Product_Name,Style_ID=@Style_ID,Type_ID=@Type_ID,Producer_ID=@Producer_ID,Supplier_ID=@Supplier_ID,Image=@Image,Color=@Color,Material=@Material,Size=@Size,Price_Export=@Price_Export,Price_Import=@Price_Import,Amount=@Amount,Weight=@Weight where Product_ID=@Product_ID
end

GO
/****** Object:  StoredProcedure [dbo].[SuaType]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[SuaType]
(
@Type_ID int,
@Type_Name nvarchar(50)
)
as
begin
update tbl_Type set Type_Name=@Type_Name  where Type_ID=@Type_ID
end

GO
/****** Object:  StoredProcedure [dbo].[TkDoanhthutheonam]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TkDoanhthutheonam]
@nam int
AS
	select  od.Product_ID as[Mã sản phẩm],p.Price_Import as[Giá nhập],
	p.Price_Export as[Giá xuất],sum(od.Amount) as[Số lượng],
	((p.Price_Export - p.Price_Import)* sum( od.Amount))as[Thành tiền]
	from tbl_Order o,tbl_OrderDetial od,tbl_Product p
	where o.Order_ID = od.Order_ID and od.Product_ID = p.Product_ID and Year(o.Date)=@nam
	group by od.Product_ID,p.Price_Import,p.Price_Export
	RETURN

GO
/****** Object:  StoredProcedure [dbo].[TkDoanhthutheongay]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TkDoanhthutheongay]
@ngay datetime
AS
	select o.Date as[Ngày bán], od.Product_ID as[Mã sản phẩm],p.Price_Import as[Giá nhập],
	p.Price_Export as[Giá xuất],sum(od.Amount) as[Số lượng],
	((p.Price_Export - p.Price_Import)* sum( od.Amount))as[Thành tiền]
	from tbl_Order o,tbl_OrderDetial od,tbl_Product p
	where o.Order_ID = od.Order_ID and od.Product_ID = p.Product_ID and o.Date = @ngay
	group by od.Product_ID,p.Price_Import,p.Price_Export,o.Date 
	RETURN



GO
/****** Object:  StoredProcedure [dbo].[TkDoanhthutheoTG]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TkDoanhthutheoTG]
@tungay datetime,
@denngay datetime
AS
	select o.Date as[Ngày bán], od.Product_ID as[Mã sản phẩm],p.Price_Import as[Giá nhập],
	p.Price_Export as[Giá xuất],sum(od.Amount) as[Số lượng],
	((p.Price_Export - p.Price_Import)* sum( od.Amount))as[Thành tiền]
	from tbl_Order o,tbl_OrderDetial od,tbl_Product p
	where o.Order_ID = od.Order_ID and od.Product_ID = p.Product_ID and o.Date >= @tungay and o.Date <= @denngay
	group by od.Product_ID,p.Price_Import,p.Price_Export,o.Date 
	RETURN


GO
/****** Object:  StoredProcedure [dbo].[TKSPbanchaytheonam]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TKSPbanchaytheonam]
@nam int
AS
	
select od.Product_ID as[Mã sản phẩm],od.Price_Export as[Giá xuất],sum(od.Amount) as[Số lượng],sum(od.Money) as[Thành tiền]
	from tbl_Order o, tbl_OrderDetial od
	where o.Order_ID = od.Order_ID and Year(o.Date) = @nam
	group by od.Product_ID,od.Price_Export
	order by od.Product_ID,od.Price_Export
	
	RETURN


GO
/****** Object:  StoredProcedure [dbo].[TKSPbanchaytheongay]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TKSPbanchaytheongay]
@ngay datetime
AS
	select o.Date as[Ngày],od.Product_ID as[Mã sản phẩm],od.Price_Export as[Giá xuất],od.Amount as[Số lượng],od.Money as[Thành tiền]
	from tbl_Order o, tbl_OrderDetial od
	where o.Order_ID = od.Order_ID and o.Date = @ngay
	order by od.Amount desc
	RETURN



GO
/****** Object:  StoredProcedure [dbo].[TKSPbanchaytheoTG]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TKSPbanchaytheoTG]
@tungay datetime,@denngay datetime
AS
	select o.Date as[Ngày],od.Product_ID as[Mã sản phẩm],od.Price_Export as[Giá xuất],od.Amount as[Số lượng],od.Money as[Thành tiền]
	from tbl_Order o, tbl_OrderDetial od
	where o.Order_ID = od.Order_ID and o.Date >= @tungay and o.Date <= @denngay
	order by od.Amount desc
	RETURN


GO
/****** Object:  StoredProcedure [dbo].[TKHDNTheoNam]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TKHDNTheoNam]
@nam int
AS
       select i.Date as[Ngày nhập],im.Import_ID as[Mã sản phẩm],i.Supplier_ID as[Nhà cung cấp],sum(im.Money) as [Thành tiền]
       from tbl_Import i,tbl_ImportDetail im
       where i.Import_ID = im.Import_ID and Year(i.Date) = @nam
       group by  i.Date,im.Import_ID,i.Supplier_ID

	RETURN


GO
/****** Object:  StoredProcedure [dbo].[TKHDNTheoNgay]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TKHDNTheoNgay]
@ngay datetime
AS
       select i.Date as[Ngày nhập],im.Import_ID as[Mã sản phẩm],i.Supplier_ID as[Nhà cung cấp],sum(im.Money) as [Thành tiền]
       from tbl_Import i,tbl_ImportDetail im
       where i.Import_ID = im.Import_ID and i.Date = @ngay
       group by  i.Date,im.Import_ID,i.Supplier_ID

	RETURN


GO
/****** Object:  StoredProcedure [dbo].[TKHDNTheoTG]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TKHDNTheoTG]
@tungay datetime,
@denngay datetime
AS
       select i.Date as[Ngày nhập],im.Import_ID as[Mã sản phẩm],i.Supplier_ID as[Nhà cung cấp],sum(im.Money) as [Thành tiền]
       from tbl_Import i,tbl_ImportDetail im
       where i.Import_ID = im.Import_ID and i.Date >= @tungay and i.Date<=@denngay
       group by  i.Date,im.Import_ID,i.Supplier_ID

	RETURN



GO
/****** Object:  StoredProcedure [dbo].[tongSL]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tongSL]
	@loaisp int
AS
	select Product_ID as[Mã sản phẩm],Product_Name as[Tên sản phẩm],Type_Name as[Loại sản phẩm],
	Supplier_Name as[Nhà cung cấp],Price_Import as [Giá nhập],Price_Export as [Giá xuất] ,
	Amount as [Số lượng] from tbl_Product p,tbl_Type t,tbl_Supplier s 
	where Type_Name = @loaisp and p.Type_ID = t.Type_ID and p.Supplier_ID = s.Supplier_ID
	RETURN


GO
/****** Object:  StoredProcedure [dbo].[ThemHSX]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[ThemHSX]
(

@Producer_Name nvarchar(50)
)
as
begin
	insert into tbl_Producer(Producer_Name) values(@Producer_Name)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemHTTT]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[ThemHTTT]
(

@Pay_Name nvarchar(50)
)
as
begin
	insert into tbl_Payment(Pay_Name) values(@Pay_Name)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemHTVC]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[ThemHTVC]
(
@Transport_Name nvarchar(50)

)
as
begin
insert into tbl_Transport(Transport_Name) values(@Transport_Name)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemNCC]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[ThemNCC]
(

@Supplier_Name nvarchar(50),
@Address nvarchar(50),
@Phone int,
@Email nvarchar(50)
)
as
begin
insert into tbl_Supplier(Supplier_Name,Address,Phone,Email) values(@Supplier_Name,@Address,@Phone,@Email)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemOrder]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[ThemOrder]
(

@Transport_ID int,
@Account nvarchar(20),
@Pay_ID int,
@Name_Received nvarchar(50),
@Address_Received nvarchar(50), 
@Phone_Received int,
@Name_Pay nvarchar(20),
@Address_Pay nvarchar(50),
@Phone_Pay int,
@State nvarchar(50),
@Summoney int,
@SumWeight float,
@VAT_Gift float
)
as
begin
insert into tbl_Order(Date,Account,Pay_ID,Transport_ID,Name_Received,Address_Received,Phone_Received,Name_Pay,Address_Pay,Phone_Pay,State,VAT_Transport,SumWeight,VAT_Gift) values(GETDATE(),@Account,@Pay_ID,@Transport_ID,@Name_Received,@Address_Received,@Phone_Received,@Name_Pay,@Address_Pay,@Phone_Pay,@State,@Summoney,@SumWeight,@VAT_Gift)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemPC]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[ThemPC]
(

@Style_Name nvarchar(50)

)
as
begin
insert into tbl_Style(Style_Name) values(@Style_Name)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemSP]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[ThemSP]
(

@Product_Name nvarchar(50),
@Style_ID int,
@Type_ID int,
@Producer_ID int,
@Supplier_ID int,
@Image nvarchar(50),
@Color nvarchar(50),
@Material nvarchar(50),
@Size   nchar(50),
@Price_Import float,
@Price_Export float,
@Amount int,
@Weight float
)
as
begin
insert into tbl_Product(Product_Name,Style_ID,Type_ID,Producer_ID,Supplier_ID,Image,Color,Material,Size,Price_Export,Price_Import,Amount,Weight) values(@Product_Name,@Style_ID,@Type_ID,@Producer_ID,@Supplier_ID,@Image,@Color,@Material,@Size,@Price_Export,@Price_Import,@Amount,@Weight)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemType]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[ThemType]
(

@Type_Name nvarchar(50)
)
as
begin
insert into tbl_Type(Type_Name) values (@Type_Name)
end

GO
/****** Object:  StoredProcedure [dbo].[ThongkeSP]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThongkeSP]
	@maloai int
AS 
    select p.Product_ID, p.Product_Name, t.Type_Name, st.Style_Name, s.Supplier_Name, pro.Producer_Name, p.Price_Import, p.Price_Export, p.Amount 
    from tbl_Product p,tbl_Type t,tbl_Supplier s,tbl_Producer pro,tbl_Style st
    where p.Type_ID = t.Type_ID and p.Supplier_ID = s.Supplier_ID and p.Style_ID = st.Style_ID and p.Producer_ID = pro.Producer_ID and t.Type_ID = @maloai
	RETURN


GO
/****** Object:  StoredProcedure [dbo].[XoaHSX]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[XoaHSX]
(

@Producer_ID int
)
as
begin
	delete from tbl_Producer where Producer_ID=@Producer_ID
end

GO
/****** Object:  StoredProcedure [dbo].[XoaHTTT]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[XoaHTTT]
(
@Pay_ID int

)
as
begin
delete from tbl_Payment where Pay_ID=@Pay_ID
end


GO
/****** Object:  StoredProcedure [dbo].[XoaHTVC]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[XoaHTVC]
(
@Transport_ID int

)
as
begin
delete from tbl_Transport where Transport_ID=@Transport_ID
end


GO
/****** Object:  StoredProcedure [dbo].[XoaNCC]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[XoaNCC]
(

@Supplier_ID int

)
as
begin
delete from tbl_Supplier where Supplier_ID=@Supplier_ID
end


GO
/****** Object:  StoredProcedure [dbo].[XoaPC]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[XoaPC]
(

@Style_ID int

)
as
begin
delete from tbl_Style where Style_ID=@Style_ID
end


GO
/****** Object:  StoredProcedure [dbo].[XoaSP]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[XoaSP]
(
@Product_ID int

)
as
begin
delete from tbl_Product where Product_ID=@Product_ID
end

GO
/****** Object:  StoredProcedure [dbo].[XoaType]    Script Date: 4/30/2018 3:32:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[XoaType]
(

@Type_ID int
)
as
begin
delete from tbl_Type where Type_ID=@Type_ID
end

GO
USE [master]
GO
ALTER DATABASE [HieuShop] SET  READ_WRITE 
GO
