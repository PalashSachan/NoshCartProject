/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [Shopping]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Shopping')
BEGIN
CREATE DATABASE [Shopping]
END
GO
ALTER DATABASE [Shopping] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopping] SET RECOVERY FULL 
GO
ALTER DATABASE [Shopping] SET  MULTI_USER 
GO
ALTER DATABASE [Shopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopping] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Shopping] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shopping', N'ON'
GO
ALTER DATABASE [Shopping] SET QUERY_STORE = OFF
GO
USE [Shopping]
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
/****** Object:  Login [PALASHPC\palas]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'PALASHPC\palas')
CREATE LOGIN [PALASHPC\palas] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\ReportServer]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\ReportServer')
CREATE LOGIN [NT SERVICE\ReportServer] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\NETWORK SERVICE]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\NETWORK SERVICE')
CREATE LOGIN [NT AUTHORITY\NETWORK SERVICE] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'Dc8gS4xgosnIO+RIhu/foWB6MOrqn8fgOcYYTn8taRQ=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'79WiRfWscCTK5ysVGVMqgYt0jcU/hJaeWgrLoai3vZY=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/****** Object:  Login [l_certSignSmDetach]    Script Date: 06-10-2017 22:56:46 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'l_certSignSmDetach')
CREATE LOGIN [l_certSignSmDetach] FROM CERTIFICATE [_##PDW_SmDetachSigningCertificate##]
GO
ALTER AUTHORIZATION ON DATABASE::[Shopping] TO [PALASHPC\palas]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [PALASHPC\palas]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [l_certSignSmDetach]
GO
USE [Shopping]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  Table [dbo].[category]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[category](
	[categoryid] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__category__23CDE5904986DB0B] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[category] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerDetails](
	[Id] [bigint] NOT NULL,
	[OrderID] [int] NOT NULL,
	[TotalProducts] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[OrderDateTime] [datetime] NOT NULL,
	[PaymentMethod] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[CustomerDetails] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[customerproducts]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customerproducts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[customerproducts](
	[CustomerId] [bigint] NOT NULL,
	[OrderID] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[totalproduct] [int] NOT NULL
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[customerproducts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Host] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Type] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Source] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Message] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[User] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[ELMAH_Error] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewOrderIDwithUserID]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NewOrderIDwithUserID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NewOrderIDwithUserID](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[OrderDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderID] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[NewOrderIDwithUserID] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[products]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[products](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[imageurl] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categoryid] [int] NULL,
	[productquantity] [int] NULL,
 CONSTRAINT [PK__products__2D172D320F62659D] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[products] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[UserLoginData]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserLoginData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserLoginData](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PhoneNumber] [numeric](10, 0) NOT NULL,
	[Address] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[City] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[State] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Gender] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK__UserLogi__3214EC072639443B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[UserLoginData] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[UserProfileImageData]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProfileImageData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserProfileImageData](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Size] [int] NOT NULL,
	[ImageURL] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_UserProfileImageData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[UserProfileImageData] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[UserResetPasswordRequest]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserResetPasswordRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserResetPasswordRequest](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ResetRequestDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK__UserRese__3214EC079F24AF7F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[UserResetPasswordRequest] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([categoryid], [categoryname]) VALUES (1, N'Veg Food')
INSERT [dbo].[category] ([categoryid], [categoryname]) VALUES (2, N'Drink')
INSERT [dbo].[category] ([categoryid], [categoryname]) VALUES (3, N'Non-Veg Food')
INSERT [dbo].[category] ([categoryid], [categoryname]) VALUES (4, N'Thali')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (1, N'Burger', N'Veg Burger', N'80', N'~/ProductImage/751e0ca1151adf16123ecfd32847c388.jpg', 1, 100)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (2, N'Hakka Noodles', N'Delicious Hakka Noodles', N'150', N'~/ProductImage/498c4308b861ced8b8465ecdb298230a.jpg', 1, 50)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (3, N'Paneer Seekh Kabab', N'Paneer Seekh Kabab', N'150', N'~/ProductImage/chicken_skewers-wallpaper-1366x768.jpg', 1, 60)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (4, N'Rolls', N'Bacon Rolls', N'180', N'~/ProductImage/bacon-rolls-1344842.jpg', 1, 200)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (5, N'Dosa', N'Paper Dosa', N'120', N'~/ProductImage/fbccc67b96427963bb5095bdbdd0b101.jpg', 1, 120)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (6, N'Mano Mastani', N'Mango Shake', N'80', N'~/ProductImage/b8ee17ef3f3d60fb44730f9b7262e456.jpg', 2, 200)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (7, N'Veg Roll', N'Veg Roll', N'60', N'~/ProductImage/homepage_img-1.png', 1, 160)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (8, N'Chicken Kabab', N'Chicken Kabab', N'220', N'~/ProductImage/chicken_skewers-wallpaper-1366x768.jpg', 3, 50)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (9, N'Bacon Rolls', N'Bacon Rolls', N'80', N'~/ProductImage/bacon-rolls-1344842.jpg', 1, 50)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (10, N'Idli', N'Idli Sambhar', N'70', N'~/ProductImage/fbff03ed5c4878dfc7044be453880830.jpg', 1, 60)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (11, N'Thali', N'Thali', N'110', N'~/ProductImage/eec52c3f108b814994247f909f76a4e7.jpg', 4, 40)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (12, N'Deluxe Thali', N'Deluxe Thali', N'180', N'~/ProductImage/ef4d2c60a6041b3ced6a768cd8ad9783.jpg', 4, 60)
INSERT [dbo].[products] ([productid], [name], [description], [price], [imageurl], [categoryid], [productquantity]) VALUES (13, N'Coke', N'Coca-Cola', N'35', N'~/ProductImage/COKE-500-ml.jpg', 2, 200)
SET IDENTITY_INSERT [dbo].[products] OFF
/****** Object:  Index [PK_ELMAH_Error]    Script Date: 06-10-2017 22:56:47 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND name = N'PK_ELMAH_Error')
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ELMAH_Error_App_Time_Seq]    Script Date: 06-10-2017 22:56:47 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND name = N'IX_ELMAH_Error_App_Time_Seq')
CREATE NONCLUSTERED INDEX [IX_ELMAH_Error_App_Time_Seq] ON [dbo].[ELMAH_Error]
(
	[Application] ASC,
	[TimeUtc] DESC,
	[Sequence] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CustomerD__Order__30F848ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerDetails] ADD  CONSTRAINT [DF__CustomerD__Order__30F848ED]  DEFAULT (getdate()) FOR [OrderDateTime]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ELMAH_Error_ErrorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[CustomerDetails_Id_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerDetails]'))
ALTER TABLE [dbo].[CustomerDetails]  WITH CHECK ADD  CONSTRAINT [CustomerDetails_Id_FK] FOREIGN KEY([Id])
REFERENCES [dbo].[UserLoginData] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[CustomerDetails_Id_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerDetails]'))
ALTER TABLE [dbo].[CustomerDetails] CHECK CONSTRAINT [CustomerDetails_Id_FK]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[customerproducts_Id_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[customerproducts]'))
ALTER TABLE [dbo].[customerproducts]  WITH CHECK ADD  CONSTRAINT [customerproducts_Id_FK] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[UserLoginData] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[customerproducts_Id_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[customerproducts]'))
ALTER TABLE [dbo].[customerproducts] CHECK CONSTRAINT [customerproducts_Id_FK]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[NewOrderIDwithUserID_UserID_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[NewOrderIDwithUserID]'))
ALTER TABLE [dbo].[NewOrderIDwithUserID]  WITH CHECK ADD  CONSTRAINT [NewOrderIDwithUserID_UserID_FK] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserLoginData] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[NewOrderIDwithUserID_UserID_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[NewOrderIDwithUserID]'))
ALTER TABLE [dbo].[NewOrderIDwithUserID] CHECK CONSTRAINT [NewOrderIDwithUserID_UserID_FK]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ImageData_Id_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProfileImageData]'))
ALTER TABLE [dbo].[UserProfileImageData]  WITH CHECK ADD  CONSTRAINT [ImageData_Id_FK] FOREIGN KEY([Id])
REFERENCES [dbo].[UserLoginData] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ImageData_Id_FK]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProfileImageData]'))
ALTER TABLE [dbo].[UserProfileImageData] CHECK CONSTRAINT [ImageData_Id_FK]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UserReset__UserI__36B12243]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserResetPasswordRequest]'))
ALTER TABLE [dbo].[UserResetPasswordRequest]  WITH CHECK ADD  CONSTRAINT [FK__UserReset__UserI__36B12243] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserLoginData] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UserReset__UserI__36B12243]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserResetPasswordRequest]'))
ALTER TABLE [dbo].[UserResetPasswordRequest] CHECK CONSTRAINT [FK__UserReset__UserI__36B12243]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UserReset__UserI__37A5467C]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserResetPasswordRequest]'))
ALTER TABLE [dbo].[UserResetPasswordRequest]  WITH CHECK ADD  CONSTRAINT [FK__UserReset__UserI__37A5467C] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserLoginData] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UserReset__UserI__37A5467C]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserResetPasswordRequest]'))
ALTER TABLE [dbo].[UserResetPasswordRequest] CHECK CONSTRAINT [FK__UserReset__UserI__37A5467C]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorsXml]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml] AS' 
END
GO
ALTER PROCEDURE [dbo].[ELMAH_GetErrorsXml]
	@Application [nvarchar](60),
	@PageIndex [int] = 0,
	@PageSize [int] = 15,
	@TotalCount [int] OUTPUT
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON

    DECLARE @FirstTimeUTC DATETIME
    DECLARE @FirstSequence INT
    DECLARE @StartRow INT
    DECLARE @StartRowIndex INT

    SELECT 
        @TotalCount = COUNT(1) 
    FROM 
        [ELMAH_Error]
    WHERE 
        [Application] = @Application

    -- Get the ID of the first error for the requested page

    SET @StartRowIndex = @PageIndex * @PageSize + 1

    IF @StartRowIndex <= @TotalCount
    BEGIN

        SET ROWCOUNT @StartRowIndex

        SELECT  
            @FirstTimeUTC = [TimeUtc],
            @FirstSequence = [Sequence]
        FROM 
            [ELMAH_Error]
        WHERE   
            [Application] = @Application
        ORDER BY 
            [TimeUtc] DESC, 
            [Sequence] DESC

    END
    ELSE
    BEGIN

        SET @PageSize = 0

    END

    -- Now set the row count to the requested page size and get
    -- all records below it for the pertaining application.

    SET ROWCOUNT @PageSize

    SELECT 
        errorId     = [ErrorId], 
        application = [Application],
        host        = [Host], 
        type        = [Type],
        source      = [Source],
        message     = [Message],
        [user]      = [User],
        statusCode  = [StatusCode], 
        time        = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'
    FROM 
        [ELMAH_Error] error
    WHERE
        [Application] = @Application
    AND
        [TimeUtc] <= @FirstTimeUTC
    AND 
        [Sequence] <= @FirstSequence
    ORDER BY
        [TimeUtc] DESC, 
        [Sequence] DESC
    FOR
        XML AUTO

GO
ALTER AUTHORIZATION ON [dbo].[ELMAH_GetErrorsXml] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[ELMAH_GetErrorsXml] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorXml]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml] AS' 
END
GO
ALTER PROCEDURE [dbo].[ELMAH_GetErrorXml]
	@Application [nvarchar](60),
	@ErrorId [uniqueidentifier]
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON

    SELECT 
        [AllXml]
    FROM 
        [ELMAH_Error]
    WHERE
        [ErrorId] = @ErrorId
    AND
        [Application] = @Application

GO
ALTER AUTHORIZATION ON [dbo].[ELMAH_GetErrorXml] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[ELMAH_GetErrorXml] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_LogError]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_LogError] AS' 
END
GO
ALTER PROCEDURE [dbo].[ELMAH_LogError]
	@ErrorId [uniqueidentifier],
	@Application [nvarchar](60),
	@Host [nvarchar](30),
	@Type [nvarchar](100),
	@Source [nvarchar](60),
	@Message [nvarchar](500),
	@User [nvarchar](50),
	@AllXml [ntext],
	@StatusCode [int],
	@TimeUtc [datetime]
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON

    INSERT
    INTO
        [ELMAH_Error]
        (
            [ErrorId],
            [Application],
            [Host],
            [Type],
            [Source],
            [Message],
            [User],
            [AllXml],
            [StatusCode],
            [TimeUtc]
        )
    VALUES
        (
            @ErrorId,
            @Application,
            @Host,
            @Type,
            @Source,
            @Message,
            @User,
            @AllXml,
            @StatusCode,
            @TimeUtc
        )

GO
ALTER AUTHORIZATION ON [dbo].[ELMAH_LogError] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[ELMAH_LogError] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_AddNewCategory]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_AddNewCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_AddNewCategory] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_AddNewCategory]
	@CategoryName [varchar](200)
WITH EXECUTE AS CALLER
AS
Begin
	begin try
		
			insert into category values(@CategoryName)
	End try

	Begin catch
		print ('Error Occured')
		End catch
end
GO
ALTER AUTHORIZATION ON [dbo].[SP_AddNewCategory] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_AddNewCategory] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_AddNewProduct]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_AddNewProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_AddNewProduct] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_AddNewProduct]
	@ProductName [varchar](200),
	@ProductPrice [int],
	@ProductDiscription [varchar](600),
	@ProductImage [varchar](500),
	@CategoryId [int],
	@ProductQuantity [int]
WITH EXECUTE AS CALLER
AS
BEGIN
			BEGIN TRY 
					insert into products values(
					@ProductName,
					@ProductDiscription,
					@ProductPrice,
					@ProductImage,
					@CategoryId,
					@ProductQuantity)
			END TRY
			BEGIN CATCH
				PRINT('ERROR OCCURED')
			END CATCH
	END
GO
ALTER AUTHORIZATION ON [dbo].[SP_AddNewProduct] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_AddNewProduct] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllCategories]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAllCategories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_GetAllCategories] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_GetAllCategories]
WITH EXECUTE AS CALLER
AS
begin
	BEGIN try
	select*from category
	END try
	Begin Catch
		Print('Error Occured')
	end catch
end
GO
ALTER AUTHORIZATION ON [dbo].[SP_GetAllCategories] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_GetAllCategories] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllProducts]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetAllProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_GetAllProducts] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_GetAllProducts]
	@CategoryId [int]
WITH EXECUTE AS CALLER
AS
begin
		begin try
			if(@CategoryId <> 0)
				begin
					select * 
					from (select			p.categoryid,											 
											 p.productid,
											p.name,
											p.price,
											p.imageurl,
											c.categoryname,
											p.productquantity,
											isnull(sum(CP.totalproduct),0)						 as productsold,
											(p.productquantity - isnull(sum(CP.totalproduct),0)) as availablestock
											from products p				 /* c and p are the alieas of product and customer database*/
											inner join category c 
												on c.categoryid =p.categoryid
												left join customerproducts CP
												on CP.productid=p.productid
												group by p.productid,
														p.name,
														p.price,
														p.imageurl,
														c.categoryname,
														p.productquantity,
														p.categoryid) stocktable  /* stock table is the name of entire code written in else part*/
														where availablestock >0
														and CategoryId= @CategoryId
																					end 
							else
							begin
							select *
							from (select p.categoryid,
											 p.productid,
											p.name,
											p.price,
											p.imageurl,
											c.categoryname,
											p.productquantity,
											isnull(sum(CP.totalproduct),0) as productsold,
											(p.productquantity - isnull(sum(CP.totalproduct),0)) as availablestock
											from products p				 /* c and p are the alieas of product and customer database*/
											inner join category c 
												on c.categoryid =p.categoryid
												left join customerproducts CP
												on CP.productid=p.productid
												group by p.productid,
														p.name,
														p.price,
														p.imageurl,
														c.categoryname,
														p.productquantity,
														p.categoryid) stocktable  /* stock table is the name of entire code written in else part*/
														where availablestock >0
														end
													end try
													
													begin catch
														print ('Error Occured')
													end catch
													end														 
											
GO
ALTER AUTHORIZATION ON [dbo].[SP_GetAllProducts] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_GetAllProducts] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetOrderID]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_GetOrderID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_GetOrderID] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_GetOrderID]
	@UserID [bigint]
WITH EXECUTE AS CALLER
AS
begin
	INSERT INTO NewOrderIDwithUserID VALUES (@UserID, GETDATE())
	SELECT TOP 1 OrderID FROM NewOrderIDwithUserID WHERE UserID = @UserID ORDER BY OrderID DESC
end
GO
ALTER AUTHORIZATION ON [dbo].[SP_GetOrderID] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_GetOrderID] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveCustomerDetails]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_SaveCustomerDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_SaveCustomerDetails] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_SaveCustomerDetails]
	@Id [bigint],
	@OrderID [int],
	@TotalProducts [int],
	@TotalPrice [int],
	@PaymentMethod [varchar](100)
WITH EXECUTE AS CALLER
AS
BEGIN
		BEGIN TRY

			insert into CustomerDetails(Id,OrderID,TotalProducts,TotalPrice,PaymentMethod)
			values(@Id,@OrderID,@TotalProducts,@TotalPrice,@PaymentMethod)

			Select OrderID from CustomerDetails where Id = @Id

		END TRY

		BEGIN CATCH

			PRINT('Error Occured')

		END CATCH
	END
GO
ALTER AUTHORIZATION ON [dbo].[SP_SaveCustomerDetails] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_SaveCustomerDetails] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveCustomerProducts]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_SaveCustomerProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_SaveCustomerProducts] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_SaveCustomerProducts]
	@Id [bigint],
	@OrderID [bigint],
	@ProductID [int],
	@TotalProducts [int]
WITH EXECUTE AS CALLER
AS
begin
		begin try
			insert into customerproducts values (@Id,@OrderID,@ProductID,@TotalProducts)
		end try

		begin catch
			print('Error Occured ')
		end catch
	end
GO
ALTER AUTHORIZATION ON [dbo].[SP_SaveCustomerProducts] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_SaveCustomerProducts] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_UserChangePassword]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UserChangePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_UserChangePassword] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_UserChangePassword]
	@GUID [uniqueidentifier],
	@Password [nvarchar](100)
WITH EXECUTE AS CALLER
AS
Begin
 Declare @UserId bigint
 
 Select @UserId = UserId 
 from UserResetPasswordRequest
 where Id= @GUID
 
 if(@UserId is null)
 Begin
  -- If UserId does not exist
  Select 0 as IsPasswordChanged
 End
 Else
 Begin
  -- If UserId exists, Update with new password
  Update UserLoginData set
  [Password] = @Password
  where Id = @UserId
  
  -- Delete the password reset request row 
  Delete from UserResetPasswordRequest
  where Id = @GUID
  
  Select 1 as IsPasswordChanged
 End
End
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserChangePassword] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserChangePassword] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_UserChangePasswordUsingCurrentPassword]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UserChangePasswordUsingCurrentPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_UserChangePasswordUsingCurrentPassword] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_UserChangePasswordUsingCurrentPassword]
	@UserName [nvarchar](100),
	@CurrentPassword [nvarchar](100),
	@NewPassword [nvarchar](100)
WITH EXECUTE AS CALLER
AS
Begin
 if(Exists(Select Id from UserLoginData 
     where Username = @UserName
     and [Password] = @CurrentPassword))
 Begin
  Update UserLoginData
  Set [Password] = @NewPassword
  where Username = @UserName
  
  Select 1 as IsPasswordChanged
 End
 Else
 Begin
  Select 0 as IsPasswordChanged
 End
End
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserChangePasswordUsingCurrentPassword] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserChangePasswordUsingCurrentPassword] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_UserData]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UserData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_UserData] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_UserData]
	@UserID [bigint],
	@CustomerUserName [nvarchar](50),
	@CustomerPassword [nvarchar](50),
	@CustomerEmailID [nvarchar](50),
	@CustomerAddress [nvarchar](200),
	@CustomerPhoneNumber [numeric](10, 0),
	@CustomerCity [nvarchar](50),
	@CustomerState [nvarchar](50),
	@Gender [nvarchar](6)
WITH EXECUTE AS CALLER
AS
BEGIN
		if exists(select * from UserLoginData where Username = @CustomerUserName and Id = @UserID)
		Begin
			Update UserLoginData SET Username = @CustomerUserName, Email = @CustomerEmailID, PhoneNumber = @CustomerPhoneNumber, Address = @CustomerAddress, City = @CustomerCity, State = @CustomerState, Gender = @Gender WHERE Id = @UserID and Username = @CustomerUserName
			Select 3 as ReturnValue
		End
		Else
		Begin
			Declare @CountForUserName int
			Declare @CountForEmail int
			Declare @ReturnCode int

			Set @ReturnCode = 0
			
			Select @CountForUserName = COUNT(Username)
			from UserLoginData where Username = @CustomerUserName
	
			Select @CountForEmail = COUNT(Email)
			from UserLoginData where Email = @CustomerEmailID
	
			if @CountForUserName = 1
			Begin
				Set @ReturnCode = -1
			End
	
			Else If @CountForEmail = 1
			Begin
				Set @ReturnCode = -2
			End
	
			Else
			Begin
				Set @ReturnCode = 1
				
				Insert into UserLoginData (Email,Username,Password,PhoneNumber,Address,City,State,Gender) values 
				(@CustomerEmailID,@CustomerUserName,@CustomerPassword,@CustomerPhoneNumber,@CustomerAddress,@CustomerCity,@CustomerState,@Gender)
	
			End
			Select @ReturnCode as ReturnValue
		End
	End
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserData] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserData] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_UserDataUpdate]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UserDataUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_UserDataUpdate] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_UserDataUpdate]
	@CustomerUserName [varchar](100),
	@CustomerEmailID [varchar](100),
	@CustomerAddress [nvarchar](max),
	@CustomerPhoneNumber [numeric](10, 0),
	@CustomerCity [varchar](50),
	@CustomerState [varchar](50),
	@Gender [varchar](20)
WITH EXECUTE AS CALLER
AS
BEGIN
	Update UserLoginData SET Email = @CustomerEmailID, PhoneNumber = @CustomerPhoneNumber, Address = @CustomerAddress, City = @CustomerCity, State = @CustomerState, Gender = @Gender WHERE Username = @CustomerUserName
	Select 1 as ReturnValue
END
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserDataUpdate] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserDataUpdate] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_UserLoginCheck]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UserLoginCheck]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_UserLoginCheck] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_UserLoginCheck]
	@CustomerUserName [varchar](100),
	@CustomerPassword [varchar](100)
WITH EXECUTE AS CALLER
AS
Begin
		Declare @Count int
		
		Select @Count = COUNT(Username) from UserLoginData where [Username] = @CustomerUserName COLLATE SQL_Latin1_General_CP1_CS_AS and [Password] = @CustomerPassword

		if(@Count = 1)
		Begin
			Select 1 as ReturnCode
		End
		Else
		Begin
			Select -1 as ReturnCode
		End
	End
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserLoginCheck] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserLoginCheck] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_UserPasswordResetLinkIsValid]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UserPasswordResetLinkIsValid]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_UserPasswordResetLinkIsValid] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_UserPasswordResetLinkIsValid]
	@GUID [uniqueidentifier]
WITH EXECUTE AS CALLER
AS
Begin
 Declare @UserId bigint
 
 If(Exists(Select UserId from UserResetPasswordRequest where Id = @GUID))
 Begin
  Select 1 as IsValidPasswordResetLink
 End
 Else
 Begin
  Select 0 as IsValidPasswordResetLink
 End
End
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserPasswordResetLinkIsValid] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserPasswordResetLinkIsValid] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_UserProfileImageInsertUpdate]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UserProfileImageInsertUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_UserProfileImageInsertUpdate] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_UserProfileImageInsertUpdate]
	@Id [bigint],
	@Name [nvarchar](50),
	@Size [int],
	@ImageURL [varchar](200)
WITH EXECUTE AS CALLER
AS
Begin
		Declare @flag int
		--Select ImageURL From UserProfileImageData where Id = @Id
		
		if exists(select * from UserProfileImageData where Id = @Id)
			Begin
				Update UserProfileImageData SET Name = @Name, Size = @Size, ImageURL = @ImageURL WHERE Id = @Id
				--Select 2 as ReturnCode
			End

			Else
		
			Begin
				Insert into UserProfileImageData values (@Id,@Name,@Size,@ImageURL)
				--Select 1 as ReturnCode
			End
			
		End
		Select ImageURL From UserProfileImageData where Id = @Id
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserProfileImageInsertUpdate] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserProfileImageInsertUpdate] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[SP_UserResetPassword]    Script Date: 06-10-2017 22:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UserResetPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_UserResetPassword] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_UserResetPassword]
	@UserName [nvarchar](100)
WITH EXECUTE AS CALLER
AS
Begin
	Declare @UserId bigint
	Declare @Email nvarchar(100)

	Select @UserId = Id, @Email = Email
	from UserLoginData
	where Username = @UserName

	if(@UserId IS NOT NULL)
	Begin
		--If username exists
		Declare @GUID UniqueIdentifier
		Set @GUID = NEWID()

		Insert into UserResetPasswordRequest
		Values (@GUID, @UserId, GETDATE())

		Select 1 as ReturnCode, @GUID as UniqueId, @Email as Email
	End
	Else
	Begin
		--If username does not exists
		Select 0 as ReturnCode, NULL as UniqueId, NULL as Email
	End
End
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserResetPassword] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[SP_UserResetPassword] TO  SCHEMA OWNER 
GO
USE [master]
GO
ALTER DATABASE [Shopping] SET  READ_WRITE 
GO
