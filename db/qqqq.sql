USE [master]
GO
/****** Object:  Database [DB_FenXiao]    Script Date: 07/02/2017 16:46:20 ******/
CREATE DATABASE [DB_FenXiao]
ALTER DATABASE [DB_FenXiao] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_FenXiao].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [DB_FenXiao] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DB_FenXiao] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DB_FenXiao] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DB_FenXiao] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DB_FenXiao] SET ARITHABORT OFF
GO
ALTER DATABASE [DB_FenXiao] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DB_FenXiao] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DB_FenXiao] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DB_FenXiao] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DB_FenXiao] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DB_FenXiao] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DB_FenXiao] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DB_FenXiao] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DB_FenXiao] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DB_FenXiao] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DB_FenXiao] SET  DISABLE_BROKER
GO
ALTER DATABASE [DB_FenXiao] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DB_FenXiao] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DB_FenXiao] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DB_FenXiao] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DB_FenXiao] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DB_FenXiao] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DB_FenXiao] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DB_FenXiao] SET  READ_WRITE
GO
ALTER DATABASE [DB_FenXiao] SET RECOVERY FULL
GO
ALTER DATABASE [DB_FenXiao] SET  MULTI_USER
GO
ALTER DATABASE [DB_FenXiao] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DB_FenXiao] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_FenXiao', N'ON'
GO
USE [DB_FenXiao]
GO
/****** Object:  Table [dbo].[ws_ZhuanList]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_ZhuanList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Zid] [int] NULL,
	[Pid] [int] NULL,
	[Num] [int] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ws_ZhuanList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_ZhuanList] ON
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (38, 17, 10, 1, CAST(2.32 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (39, 17, 9, 1, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (40, 18, 9, 1, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (41, 19, 9, 7, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (43, 20, 10, 1, CAST(2.32 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (44, 20, 9, 2, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (45, 21, 10, 1, CAST(2.32 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (46, 21, 9, 2, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (47, 22, 9, 1, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (48, 22, 10, 1, CAST(2.32 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (49, 23, 10, 1, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (50, 23, 9, 1, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (52, 24, 10, 2, CAST(2.32 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (53, 24, 9, 1, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (54, 25, 10, 1, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (55, 25, 9, 1, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (60, 29, 9, 30, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (68, 36, 9, 11, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (69, 37, 9, 9, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (70, 38, 9, 9, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (71, 39, 9, 10, CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (72, 40, 9, 10, CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (73, 41, 9, 11, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (74, 42, 9, 11, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (75, 43, 9, 8, CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (80, 45, 10, 1, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (81, 45, 9, 10, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (84, 47, 10, 2, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (85, 47, 9, 2, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (86, 48, 10, 1, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (87, 48, 9, 1, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (88, 49, 9, 5, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (89, 49, 10, 2, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (90, 50, 9, 1, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (91, 50, 10, 1, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (92, 51, 10, 1, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (93, 51, 9, 10, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[ws_ZhuanList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (94, 52, 9, 1, CAST(5.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ws_ZhuanList] OFF
/****** Object:  Table [dbo].[ws_ZhuanInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_ZhuanInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Zname] [nvarchar](50) NULL,
	[Sname] [nvarchar](50) NULL,
	[Znum] [int] NULL,
	[Zprice] [decimal](18, 2) NULL,
	[Remark] [nvarchar](50) NULL,
	[Lname] [nvarchar](50) NULL,
	[Lphone] [nvarchar](50) NULL,
	[Laddress] [nvarchar](max) NULL,
	[Lzuoyong] [nvarchar](50) NULL,
	[Ztype] [int] NULL,
	[ShenHe] [int] NULL,
	[ShTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_ZhuanInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转货人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_ZhuanInfo', @level2type=N'COLUMN',@level2name=N'Zname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_ZhuanInfo', @level2type=N'COLUMN',@level2name=N'Sname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是等级转货  2是零售转货' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_ZhuanInfo', @level2type=N'COLUMN',@level2name=N'Ztype'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是未审核  2是已审核' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_ZhuanInfo', @level2type=N'COLUMN',@level2name=N'ShenHe'
GO
SET IDENTITY_INSERT [dbo].[ws_ZhuanInfo] ON
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (17, N'admin', N'15020356014', 2, CAST(6.32 AS Decimal(18, 2)), N'1111', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A76100B29080 AS DateTime), CAST(0x0000A7600128A630 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (18, N'15020356014', N'15020359048', 1, CAST(5.00 AS Decimal(18, 2)), N'123', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A76100D5C564 AS DateTime), CAST(0x0000A76100D5654C AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (19, N'15020356014', N'15020359048', 7, CAST(35.00 AS Decimal(18, 2)), N'122222', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A76100EA4E6C AS DateTime), CAST(0x0000A76100E2782C AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (20, N'15020356014', N'15011111111', 3, CAST(10.32 AS Decimal(18, 2)), N'123', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A767009509E8 AS DateTime), CAST(0x0000A76700949E18 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (21, N'15020356014', N'15011111111', 3, CAST(10.32 AS Decimal(18, 2)), N'1111', NULL, NULL, NULL, NULL, 1, 1, NULL, CAST(0x0000A76700963E1C AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (22, N'15020356014', N'15011111111', 2, CAST(6.32 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 1, NULL, CAST(0x0000A76B010E9330 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (23, N'15020356014', N'18263926832', 2, CAST(8.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 1, NULL, CAST(0x0000A76F0101FEE0 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (24, N'admin', N'15020356014', 3, CAST(6.32 AS Decimal(18, 2)), N'1111', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A76100B29080 AS DateTime), CAST(0x0000A7600128A630 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (25, N'admin', N'15020356014', 2, CAST(18.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A77100D86738 AS DateTime), CAST(0x0000A77100D7BAF4 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (29, N'admin', N'15020356014', 30, CAST(150.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A77301228D40 AS DateTime), CAST(0x0000A77301227CD8 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (38, N'15020356014', N'18669676160', 9, CAST(54.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A779001650E4 AS DateTime), CAST(0x0000A7790016326C AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (39, N'admin', N'18669676160', 10, CAST(70.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A7790017BC2C AS DateTime), CAST(0x0000A7790017A96C AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (40, N'admin', N'18669676160', 10, CAST(70.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A77900188B98 AS DateTime), CAST(0x0000A77900182220 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (41, N'admin', N'18669676160', 11, CAST(88.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A779001A7ED0 AS DateTime), CAST(0x0000A779001A69B8 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (42, N'admin', N'18669676160', 11, CAST(88.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A779001B4284 AS DateTime), CAST(0x0000A779001B321C AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (43, N'15020356014', N'18669676160', 8, CAST(56.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A779010F4D84 AS DateTime), CAST(0x0000A779010E6324 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (45, N'admin', N'13355012856', 11, CAST(108.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A77B015A4D84 AS DateTime), CAST(0x0000A77B01587FCC AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (47, N'15020356014', N'18253150778', 4, CAST(16.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 1, NULL, CAST(0x0000A78101057020 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (48, N'admin', N'15020356014', 2, CAST(18.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A78101185924 AS DateTime), CAST(0x0000A7810117D83C AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (49, N'admin', N'15020356014', 7, CAST(66.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A7810118AB2C AS DateTime), CAST(0x0000A7810118A550 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (50, N'admin', N'18669676160', 2, CAST(18.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A78400BC2C44 AS DateTime), CAST(0x0000A78400BB4D9C AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (51, N'15020356014', N'18253150778', 11, CAST(53.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 1, NULL, CAST(0x0000A78500EF9A48 AS DateTime))
INSERT [dbo].[ws_ZhuanInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [Remark], [Lname], [Lphone], [Laddress], [Lzuoyong], [Ztype], [ShenHe], [ShTime], [AddTime]) VALUES (52, N'15020356014', N'18253150778', 1, CAST(5.00 AS Decimal(18, 2)), N'', NULL, NULL, NULL, NULL, 1, 2, CAST(0x0000A78500F16F08 AS DateTime), CAST(0x0000A78500F00F78 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_ZhuanInfo] OFF
/****** Object:  Table [dbo].[ws_ZhaoMuInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_ZhaoMuInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[ImgName] [nvarchar](50) NULL,
	[Desp] [nvarchar](max) NULL,
	[Dis] [nvarchar](50) NULL,
	[Jis] [nvarchar](50) NULL,
	[Fis] [nvarchar](50) NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_ZhaoMuInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ws_WebInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_WebInfo](
	[Id] [int] NOT NULL,
	[webName] [nvarchar](max) NULL,
	[webKey] [nvarchar](max) NULL,
	[webDep] [nvarchar](max) NULL,
	[Counts] [int] NULL,
	[webFoot] [nvarchar](max) NULL,
	[wapFoot] [nvarchar](max) NULL,
	[qyWebFoot] [nvarchar](max) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ws_WebInfo] ([Id], [webName], [webKey], [webDep], [Counts], [webFoot], [wapFoot], [qyWebFoot]) VALUES (1, N'优妆国际', N'优妆国际', N'优妆国际', 0, N'<p>Copyright &nbsp;2017.山东优妆日化用品有限公司 ICP 备案号：<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank">鲁ICP备17017246号-1</a></p>', N'聚全废旧物资回收 &copy;版权所有', N'<p>Copyright ? 2017.山东优妆日化用品有限公司 ICP 备案号：鲁QICP 12356789</p>')
/****** Object:  Table [dbo].[ws_WapJiaoDian]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_WapJiaoDian](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[ImgName] [nvarchar](50) NULL,
	[IsOr] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_WapJiaoDian] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_WapJiaoDian] ON
INSERT [dbo].[ws_WapJiaoDian] ([Id], [Title], [Address], [ImgName], [IsOr], [Orders], [AddTime]) VALUES (1, N'1', N'http://', N'i_20170410034715_3959.jpg', 1, 1, CAST(0x0000A75101042B84 AS DateTime))
INSERT [dbo].[ws_WapJiaoDian] ([Id], [Title], [Address], [ImgName], [IsOr], [Orders], [AddTime]) VALUES (2, N'2', N'http://', N'i_20170410034720_2522.jpg', 1, 2, CAST(0x0000A75101043160 AS DateTime))
INSERT [dbo].[ws_WapJiaoDian] ([Id], [Title], [Address], [ImgName], [IsOr], [Orders], [AddTime]) VALUES (3, N'2', N'http://', N'i_20170507084214_2119.jpg', 1, 99, CAST(0x0000A76C008F6F88 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_WapJiaoDian] OFF
/****** Object:  Table [dbo].[ws_VideoType]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_VideoType](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ws_VideoType] ([Id], [Title], [Description], [Orders], [AddTime]) VALUES (1, N'公司视频', N'', 1, CAST(0x0000A50700C0DB18 AS DateTime))
INSERT [dbo].[ws_VideoType] ([Id], [Title], [Description], [Orders], [AddTime]) VALUES (2, N'行业视频', N'', 2, CAST(0x0000A50700C0EA54 AS DateTime))
/****** Object:  Table [dbo].[ws_VideoInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_VideoInfo](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[Desp1] [nvarchar](max) NULL,
	[Desp] [nvarchar](max) NULL,
	[ImgName] [nvarchar](max) NULL,
	[VideoName] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[IsOr] [int] NULL,
	[AddTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ws_UserProList]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_UserProList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [int] NULL,
	[Pid] [int] NULL,
	[Num] [int] NULL,
 CONSTRAINT [PK_ws_UserProList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_UserProList] ON
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (5, 2, 9, 30)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (6, 2, 10, 8)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (7, 9, 9, 15)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (8, 12, 9, 2)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (9, 12, 10, 1)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (10, 23, 9, 252)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (11, 23, 10, 1)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (12, 32, 9, 20)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (13, 32, 10, 2)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (14, 35, 10, 2)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (15, 35, 9, 3)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (16, 36, 9, 2)
INSERT [dbo].[ws_UserProList] ([Id], [Uid], [Pid], [Num]) VALUES (17, 36, 10, 2)
SET IDENTITY_INSERT [dbo].[ws_UserProList] OFF
/****** Object:  Table [dbo].[ws_UpdateZdInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_UpdateZdInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uname] [nvarchar](50) NULL,
	[OldTuiJianRen] [nvarchar](50) NULL,
	[TuiJianRen] [nvarchar](50) NULL,
	[OldLevel] [int] NULL,
	[XianLevel] [int] NULL,
	[ShenHe] [int] NULL,
	[ShTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_UpdateZdInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是未审核  2是已审核' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_UpdateZdInfo', @level2type=N'COLUMN',@level2name=N'ShenHe'
GO
SET IDENTITY_INSERT [dbo].[ws_UpdateZdInfo] ON
INSERT [dbo].[ws_UpdateZdInfo] ([Id], [Uname], [OldTuiJianRen], [TuiJianRen], [OldLevel], [XianLevel], [ShenHe], [ShTime], [AddTime]) VALUES (1, N'18669676160', N'18354960311', N'18263926832', 5, 4, 1, NULL, CAST(0x0000A77B011A1674 AS DateTime))
INSERT [dbo].[ws_UpdateZdInfo] ([Id], [Uname], [OldTuiJianRen], [TuiJianRen], [OldLevel], [XianLevel], [ShenHe], [ShTime], [AddTime]) VALUES (4, N'13355012856', N'15020356014', N'admin', 5, 4, 2, CAST(0x0000A77B0147E1E4 AS DateTime), CAST(0x0000A77B01477BF0 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_UpdateZdInfo] OFF
/****** Object:  Table [dbo].[ws_UpdateInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_UpdateInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uname] [nvarchar](50) NULL,
	[OldTuiJianRen] [nvarchar](50) NULL,
	[TuiJianRen] [nvarchar](50) NULL,
	[OldLevel] [int] NULL,
	[XianLevel] [int] NULL,
	[LevelMoney] [decimal](24, 2) NULL,
	[Type] [int] NULL,
	[ShenHe] [int] NULL,
	[ShTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_UpdateInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是同级升级  2是跨级升级 3是普通升级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_UpdateInfo', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是审核  2是未审核 3是推荐人已审核' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_UpdateInfo', @level2type=N'COLUMN',@level2name=N'ShenHe'
GO
SET IDENTITY_INSERT [dbo].[ws_UpdateInfo] ON
INSERT [dbo].[ws_UpdateInfo] ([Id], [Uname], [OldTuiJianRen], [TuiJianRen], [OldLevel], [XianLevel], [LevelMoney], [Type], [ShenHe], [ShTime], [AddTime]) VALUES (44, N'13355012856', N'15020356014', N'admin', 4, 1, CAST(100.00 AS Decimal(24, 2)), 1, 1, CAST(0x0000A77B015354C0 AS DateTime), CAST(0x0000A77B0153225C AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_UpdateInfo] OFF
/****** Object:  Table [dbo].[ws_TiXianInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_TiXianInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uname] [nvarchar](50) NULL,
	[JinEr] [decimal](18, 2) NULL,
	[LiLv] [float] NULL,
	[HouMoney] [numeric](18, 2) NULL,
	[ShenHe] [int] NULL,
	[ShTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_TiXianInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是审核  2是未审核' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_TiXianInfo', @level2type=N'COLUMN',@level2name=N'ShenHe'
GO
SET IDENTITY_INSERT [dbo].[ws_TiXianInfo] ON
INSERT [dbo].[ws_TiXianInfo] ([Id], [Uname], [JinEr], [LiLv], [HouMoney], [ShenHe], [ShTime], [AddTime]) VALUES (6, N'15020356014', CAST(20.00 AS Decimal(18, 2)), 0.05, CAST(1.00 AS Numeric(18, 2)), 2, NULL, CAST(0x0000A74D00EBCFF8 AS DateTime))
INSERT [dbo].[ws_TiXianInfo] ([Id], [Uname], [JinEr], [LiLv], [HouMoney], [ShenHe], [ShTime], [AddTime]) VALUES (7, N'15020356014', CAST(10.00 AS Decimal(18, 2)), 0.05, CAST(0.50 AS Numeric(18, 2)), 2, NULL, CAST(0x0000A75801083774 AS DateTime))
INSERT [dbo].[ws_TiXianInfo] ([Id], [Uname], [JinEr], [LiLv], [HouMoney], [ShenHe], [ShTime], [AddTime]) VALUES (8, N'15020356014', CAST(100.00 AS Decimal(18, 2)), 0.05, CAST(5.00 AS Numeric(18, 2)), 1, CAST(0x0000A7A3014F6BF8 AS DateTime), CAST(0x0000A7A3014AE628 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_TiXianInfo] OFF
/****** Object:  Table [dbo].[ws_SingleType]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_SingleType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[IsXianShi] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_SingleType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_SingleType] ON
INSERT [dbo].[ws_SingleType] ([Id], [Title], [Orders], [IsXianShi], [AddTime]) VALUES (1, N'新手上路', 1, 1, CAST(0x0000A71300A32F00 AS DateTime))
INSERT [dbo].[ws_SingleType] ([Id], [Title], [Orders], [IsXianShi], [AddTime]) VALUES (2, N'手机常识', 2, 1, CAST(0x0000A71300A33BE4 AS DateTime))
INSERT [dbo].[ws_SingleType] ([Id], [Title], [Orders], [IsXianShi], [AddTime]) VALUES (3, N'配送支付', 3, 1, CAST(0x0000A71300A34544 AS DateTime))
INSERT [dbo].[ws_SingleType] ([Id], [Title], [Orders], [IsXianShi], [AddTime]) VALUES (4, N'关于我们', 4, 1, CAST(0x0000A71300A35354 AS DateTime))
INSERT [dbo].[ws_SingleType] ([Id], [Title], [Orders], [IsXianShi], [AddTime]) VALUES (5, N'服务保证', 5, 1, CAST(0x0000A71300A35CB4 AS DateTime))
INSERT [dbo].[ws_SingleType] ([Id], [Title], [Orders], [IsXianShi], [AddTime]) VALUES (6, N'联系我们', 6, 1, CAST(0x0000A71300A364E8 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_SingleType] OFF
/****** Object:  Table [dbo].[ws_SingleInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_SingleInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[Desp] [nvarchar](max) NULL,
	[IsXianShi] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_SingleInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_SingleInfo] ON
INSERT [dbo].[ws_SingleInfo] ([Id], [Title], [Type], [Desp], [IsXianShi], [Orders], [AddTime]) VALUES (1, N'售后流程', 1, N'<p>售后流程售后流程售后流程售后流程</p>', 1, 1, CAST(0x0000A71300A42518 AS DateTime))
INSERT [dbo].[ws_SingleInfo] ([Id], [Title], [Type], [Desp], [IsXianShi], [Orders], [AddTime]) VALUES (2, N'购物流程', 1, N'<p>购物流程购物流程购物流程</p>', 1, 2, CAST(0x0000A71300A44F48 AS DateTime))
INSERT [dbo].[ws_SingleInfo] ([Id], [Title], [Type], [Desp], [IsXianShi], [Orders], [AddTime]) VALUES (3, N'如何分辨原装电池', 2, N'<p>如何分辨原装电池如何分辨原装电池</p>', 1, 1, CAST(0x0000A71300A46A3C AS DateTime))
INSERT [dbo].[ws_SingleInfo] ([Id], [Title], [Type], [Desp], [IsXianShi], [Orders], [AddTime]) VALUES (4, N'货到付款区域', 3, N'<p>货到付款区域货到付款区域</p>', 1, 1, CAST(0x0000A71300A475F4 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_SingleInfo] OFF
/****** Object:  Table [dbo].[ws_RegisterInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_RegisterInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rname] [nvarchar](50) NULL,
	[Rpass] [nvarchar](50) NULL,
	[TxImg] [nvarchar](50) NULL,
	[UserType] [nvarchar](50) NULL,
	[Userlevel] [int] NULL,
	[ZhuCeRen] [nvarchar](50) NULL,
	[TuiJianRen] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NULL,
	[WeiXin] [nvarchar](50) NULL,
	[IdCard] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[County] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[KaHao] [nvarchar](50) NULL,
	[KaiHuHang] [nvarchar](max) NULL,
	[KaiHuRen] [nvarchar](max) NULL,
	[Jiangjin] [decimal](24, 2) NULL,
	[YuErMoney] [decimal](24, 2) NULL,
	[IsJiHuo] [int] NULL,
	[JiHuoDate] [datetime] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_RegisterInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ws_RegisterInfo] ON [dbo].[ws_RegisterInfo] 
(
	[Rname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_RegisterInfo', @level2type=N'COLUMN',@level2name=N'TxImg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是未激活 2是已激活' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_RegisterInfo', @level2type=N'COLUMN',@level2name=N'IsJiHuo'
GO
SET IDENTITY_INSERT [dbo].[ws_RegisterInfo] ON
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (1, N'admin', N'96E79218965EB72C92A549DD5A330112', NULL, N'公司账号', 0, NULL, NULL, N'闫建正', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 2, NULL, CAST(0x0000A6F0010BC984 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (2, N'15020356014', N'96E79218965EB72C92A549DD5A330112', N'ba4d59e7-8cf0-4e1a-91a9-072546de0d77.jpg', N'联合创始人', 1, N'admin', N'admin', N'妍妍1', N'wx123', N'123456789', N'山东省', N'济南市', N'历下区', N'', N'', N'', N'', CAST(200.00 AS Decimal(24, 2)), CAST(740.00 AS Decimal(24, 2)), 2, NULL, CAST(0x0000A6F200B416BC AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (3, N'15020356012', N'96E79218965EB72C92A549DD5A330112', NULL, NULL, 0, N'admin', N'admin', N'发生大幅', NULL, N'46546646465465', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 1, NULL, CAST(0x0000A6F200BDBE38 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (4, N'15020356016', N'96E79218965EB72C92A549DD5A330112', NULL, NULL, 0, N'admin', N'admin', N'发生大幅', NULL, N'46546646465465', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 1, NULL, CAST(0x0000A6F200BF5BE4 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (5, N'15020356036', N'96E79218965EB72C92A549DD5A330112', NULL, N'市级代理', 4, N'15020356014', N'15020356014', N'发生大', NULL, N'46546646465465', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 2, NULL, CAST(0x0000A6F200BF7B88 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (6, N'15020369999', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, N'15020356014', N'15020356036', N'送达的', NULL, N'423424234234234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 1, NULL, CAST(0x0000A71A00E179E0 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (7, N'15020360000', N'96E79218965EB72C92A549DD5A330112', NULL, NULL, 0, N'15020356014', N'15020356012', N'送达的', NULL, N'423424234234234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 1, NULL, CAST(0x0000A71A00E179E0 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (9, N'15020359048', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, N'15020356014', N'admin', N'发生的', N'15020356014', N'371312198312124903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 2, CAST(0x0000A76001094F88 AS DateTime), CAST(0x0000A72100E69484 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (10, N'15096353685', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, N'15020356014', N'15020356014', N'是否', N'15020356014', N'371312198312124903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 2, CAST(0x0000A768009D13B8 AS DateTime), CAST(0x0000A74600E084F4 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (11, N'1520359999', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'15096353685', N'馍馍馍', N'xweixn', N'371312198312124903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 1, NULL, CAST(0x0000A75B00BAE424 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (12, N'15011111111', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'15020356014', N'小王', N'96325', N'371312198312124903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 2, CAST(0x0000A76700946704 AS DateTime), CAST(0x0000A76700BAE424 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (13, N'18263926832', N'96E79218965EB72C92A549DD5A330112', NULL, N'联合创始人', 1, NULL, N'admin', N'是否', N'222', N'371312198312124903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 2, CAST(0x0000A76B0130CAF4 AS DateTime), CAST(0x0000A76900AF9EFC AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (15, N'18769903106', N'696326AACC62BD60E6C39E80B2BC5F7B', N'739550f5-1590-494e-8527-cbbe9b858a0a.png', N'特约代理', 5, NULL, N'18263926832', N'李慧敏', N'15613025440', N'130424199708090527', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 2, CAST(0x0000A7710134271C AS DateTime), CAST(0x0000A77100BA4CF8 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (18, N'15153923806', N'8AC2B54CACB72FD61C886DC3B2243EA4', NULL, N'联合创始人', 1, NULL, N'admin', N'15153923806', N'12313123', N'371312198312124903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 3, CAST(0x0000A77900A6D178 AS DateTime), CAST(0x0000A77100FAB540 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (20, N'15211111111', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'15020356036', N'4234234', N'4324', N'371312198312124903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 3, CAST(0x0000A779005B4AB4 AS DateTime), CAST(0x0000A77101297B78 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (21, N'18754156627', N'E10ADC3949BA59ABBE56E057F20F883E', NULL, N'特约代理', 5, NULL, N'15020356014', N'测试', N'测试', N'371312198312124903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 3, CAST(0x0000A7790059A72C AS DateTime), CAST(0x0000A773015508B0 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (22, N'18354960311', N'96E79218965EB72C92A549DD5A330112', NULL, N'市级代理', 4, NULL, N'18263926832', N'发生的', N'111111111', N'371326199008283968', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 2, CAST(0x0000A77400C46D28 AS DateTime), CAST(0x0000A77400955038 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (27, N'15011236586', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'18669676160', N'fsdf', N'33213', N'371326199008283734', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 1, NULL, CAST(0x0000A77B010C45BC AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (28, N'15011236587', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'18669676160', N'发生的', N'234234', N'444444444444444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 1, NULL, CAST(0x0000A77B010C8054 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (29, N'15011236580', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'18669676160', N'34432', N'4234234', N'444444444444444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(0.00 AS Decimal(24, 2)), 1, NULL, CAST(0x0000A77B010CA700 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (32, N'13355012856', N'96E79218965EB72C92A549DD5A330112', NULL, N'联合创始人', 1, NULL, N'admin', N'李玉珍', N'123456789', N'123456789123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(289.00 AS Decimal(24, 2)), 2, CAST(0x0000A77B00FF5E38 AS DateTime), CAST(0x0000A77B00FEA768 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (33, N'15020356019', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'15020356014', N'阿杰', N'15165151463', N'371326199008283698', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(297.00 AS Decimal(24, 2)), 2, CAST(0x0000A77B013B5F28 AS DateTime), CAST(0x0000A77B013B0D20 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (34, N'18769903106', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'15020356014', N'李慧敏', N'15613025440', N'130424199708090527', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(297.00 AS Decimal(24, 2)), 2, CAST(0x0000A77B013B56F4 AS DateTime), CAST(0x0000A77B013B1FE0 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (35, N'18253150778', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'15020356014', N'张敏', N'zm2649117901', N'513722199506115113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(495.00 AS Decimal(24, 2)), 2, CAST(0x0000A77B013B6630 AS DateTime), CAST(0x0000A77B013B5118 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (36, N'18669676160', N'96E79218965EB72C92A549DD5A330112', NULL, N'省级代理', 3, NULL, N'admin', N'王小天', N'Nihaoa', N'371324199303196787', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(361.00 AS Decimal(24, 2)), 2, CAST(0x0000A77B013D5710 AS DateTime), CAST(0x0000A77B013D1C78 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (37, N'15953978076', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'13355012856', N'赵剑锐', N'15953978076', N'371311198710253317', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(300.00 AS Decimal(24, 2)), 1, CAST(0x0000A77B01477BF0 AS DateTime), CAST(0x0000A77B013D2254 AS DateTime))
INSERT [dbo].[ws_RegisterInfo] ([Id], [Rname], [Rpass], [TxImg], [UserType], [Userlevel], [ZhuCeRen], [TuiJianRen], [Uname], [WeiXin], [IdCard], [Province], [City], [County], [Address], [KaHao], [KaiHuHang], [KaiHuRen], [Jiangjin], [YuErMoney], [IsJiHuo], [JiHuoDate], [AddTime]) VALUES (38, N'13345099633', N'96E79218965EB72C92A549DD5A330112', NULL, N'特约代理', 5, NULL, N'15020356014', N'111111', N'111111', N'371326199008283736', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(24, 2)), CAST(10.00 AS Decimal(24, 2)), 3, CAST(0x0000A78500FA7F58 AS DateTime), CAST(0x0000A7800124AD00 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_RegisterInfo] OFF
/****** Object:  Table [dbo].[ws_RateInstall]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_RateInstall](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YiJiBili] [decimal](18, 2) NULL,
	[ErJiBili] [decimal](18, 2) NULL,
	[SanJiBili] [decimal](18, 2) NULL,
	[TxBili] [float] NULL,
 CONSTRAINT [PK_ws_RateInstall] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_RateInstall] ON
INSERT [dbo].[ws_RateInstall] ([Id], [YiJiBili], [ErJiBili], [SanJiBili], [TxBili]) VALUES (1, CAST(5.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0.05)
SET IDENTITY_INSERT [dbo].[ws_RateInstall] OFF
/****** Object:  Table [dbo].[ws_QyWapJiaoDian]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_QyWapJiaoDian](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[ImgName] [nvarchar](50) NULL,
	[IsOr] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_QyWapJiaoDian] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_QyWapJiaoDian] ON
INSERT [dbo].[ws_QyWapJiaoDian] ([Id], [Title], [Address], [ImgName], [IsOr], [Orders], [AddTime]) VALUES (1, N'1', N'', N'i_20170515020246_2631.jpg', 1, 99, CAST(0x0000A77400E77908 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_QyWapJiaoDian] OFF
/****** Object:  Table [dbo].[ws_QyJiaoDian]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_QyJiaoDian](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[ImgName] [nvarchar](50) NULL,
	[IsOr] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_QyJiaoDian] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ws_QrCode]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_QrCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [int] NULL,
	[CodeName] [nvarchar](50) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_QrCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_QrCode] ON
INSERT [dbo].[ws_QrCode] ([Id], [Uid], [CodeName], [AddTime]) VALUES (12, 2, N'2.jpg', CAST(0x0000A76000EF81AC AS DateTime))
INSERT [dbo].[ws_QrCode] ([Id], [Uid], [CodeName], [AddTime]) VALUES (13, 9, N'9.jpg', CAST(0x0000A7610122B89C AS DateTime))
INSERT [dbo].[ws_QrCode] ([Id], [Uid], [CodeName], [AddTime]) VALUES (15, 11, N'11.jpg', CAST(0x0000A764010BB6C4 AS DateTime))
INSERT [dbo].[ws_QrCode] ([Id], [Uid], [CodeName], [AddTime]) VALUES (16, 15, N'15.jpg', CAST(0x0000A771012A3374 AS DateTime))
INSERT [dbo].[ws_QrCode] ([Id], [Uid], [CodeName], [AddTime]) VALUES (17, 36, N'36.jpg', CAST(0x0000A78500A9BD20 AS DateTime))
INSERT [dbo].[ws_QrCode] ([Id], [Uid], [CodeName], [AddTime]) VALUES (18, 35, N'35.jpg', CAST(0x0000A78500F06AE0 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_QrCode] OFF
/****** Object:  Table [dbo].[ws_ProType]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_ProType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[ImgName] [nvarchar](max) NULL,
	[IsXianShi] [int] NULL,
	[IsDaoHang] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_ProType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1显示  2不显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_ProType', @level2type=N'COLUMN',@level2name=N'IsXianShi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1显示  2不显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_ProType', @level2type=N'COLUMN',@level2name=N'IsDaoHang'
GO
SET IDENTITY_INSERT [dbo].[ws_ProType] ON
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (4, N'清洁洗化', 0, NULL, 1, 1, 1, CAST(0x0000A71300DC5CE4 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (29, N'护理美妆', 0, NULL, 1, 1, 2, CAST(0x0000A71300DC62C0 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (44, N'家居用品', 0, NULL, 2, 2, 3, CAST(0x0000A6EC011C5F38 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (45, N'家用电器', 0, NULL, 2, 2, 4, CAST(0x0000A6EC011C6898 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (46, N'手机数码', 0, N'', 2, 2, 5, CAST(0x0000A6EC011C70CC AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (47, N'服装鞋袜', 0, N'', 2, 2, 6, CAST(0x0000A6EC011C7A2C AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (48, N'酒水食品', 0, N'', 2, 2, 7, CAST(0x0000A6EC011C8A94 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (49, N'洗衣粉', 4, N'', 1, 2, 1, CAST(0x0000A6F000ABA248 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (50, N'洗衣液', 4, N'', 1, 2, 2, CAST(0x0000A6F000B0DA38 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (51, N'洗衣片', 4, N'', 1, 2, 3, CAST(0x0000A6F000B0DEE8 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (52, N'清洁剂', 4, N'', 2, 2, 4, CAST(0x0000A6EC011DA9B0 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (53, N'除臭剂', 4, N'', 2, 2, 5, CAST(0x0000A6EC011DB0B8 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (54, N'洗厕灵', 4, N'', 2, 2, 6, CAST(0x0000A6EC011DBFF4 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (55, N'化妆品', 29, N'', 1, 2, 1, CAST(0x0000A6F000B0EE24 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (56, N'护肤品', 29, N'', 1, 2, 2, CAST(0x0000A6F000B0F2D4 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (57, N'美妆', 29, N'', 2, 2, 3, CAST(0x0000A6EC011FD1A4 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (58, N'厨房卫浴', 44, N'', 2, 2, 1, CAST(0x0000A6EC011FDB04 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (59, N'灯饰', 44, N'', 2, 2, 2, CAST(0x0000A6EC011FE20C AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (60, N'装修用品', 44, N'', 2, 2, 3, CAST(0x0000A6EC011FEC98 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (61, N'电视', 45, N'', 2, 2, 1, CAST(0x0000A6EC012001B0 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (62, N'空调', 45, N'', 2, 2, 2, CAST(0x0000A6EC01200B10 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (63, N'洗衣机', 45, N'', 2, 2, 3, CAST(0x0000A6EC01201218 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (64, N'电脑', 46, N'', 2, 2, 1, CAST(0x0000A6EC01209300 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (65, N'手机', 46, N'', 2, 2, 2, CAST(0x0000A6EC0120D11C AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (66, N'手机配件', 46, N'', 2, 2, 3, CAST(0x0000A6EC0120DBA8 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (67, N'相机', 46, N'', 2, 2, 3, CAST(0x0000A6EC0120E3DC AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (68, N'男装', 47, N'', 2, 2, 1, CAST(0x0000A6EC01210380 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (69, N'女装', 47, N'', 2, 2, 2, CAST(0x0000A6EC0121095C AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (70, N'童装', 47, N'', 2, 2, 3, CAST(0x0000A6EC01211064 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (71, N'袜子', 47, N'', 2, 2, 4, CAST(0x0000A6EC012119C4 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (72, N'鞋', 47, N'', 2, 2, 5, CAST(0x0000A6EC01212450 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (73, N'白酒', 48, N'', 2, 2, 1, CAST(0x0000A6EC01213008 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (74, N'红酒', 48, N'', 2, 2, 2, CAST(0x0000A6EC0121383C AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (75, N'零食', 48, N'', 2, 2, 3, CAST(0x0000A6EC01213F44 AS DateTime))
INSERT [dbo].[ws_ProType] ([Id], [Title], [Type], [ImgName], [IsXianShi], [IsDaoHang], [Orders], [AddTime]) VALUES (76, N'茶叶', 48, N'', 2, 2, 4, CAST(0x0000A6EC01215330 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_ProType] OFF
/****** Object:  Table [dbo].[ws_ProductInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_ProductInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[BianHao] [nvarchar](50) NULL,
	[GuiGe] [nvarchar](50) NULL,
	[YPrice] [decimal](18, 2) NULL,
	[XPrice] [decimal](18, 2) NULL,
	[Znum] [int] NULL,
	[ImgName] [nvarchar](max) NULL,
	[Desp] [nvarchar](max) NULL,
	[JingPin] [nvarchar](max) NULL,
	[XinPin] [nvarchar](max) NULL,
	[ReXiao] [nvarchar](max) NULL,
	[ShangJia] [nvarchar](50) NULL,
	[IsZhanShi] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_ProductInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_ProductInfo', @level2type=N'COLUMN',@level2name=N'Znum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_ProductInfo', @level2type=N'COLUMN',@level2name=N'ShangJia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否在企业网站展示  1是不展示  2是展示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_ProductInfo', @level2type=N'COLUMN',@level2name=N'IsZhanShi'
GO
SET IDENTITY_INSERT [dbo].[ws_ProductInfo] ON
INSERT [dbo].[ws_ProductInfo] ([Id], [Title], [Type], [BianHao], [GuiGe], [YPrice], [XPrice], [Znum], [ImgName], [Desp], [JingPin], [XinPin], [ReXiao], [ShangJia], [IsZhanShi], [Orders], [AddTime]) VALUES (9, N'水润丝滑洗发露 450ML', 49, N'Aa123456789', N'箱', CAST(10.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 9808, N'20170107030410_8497.jpg', N'', N'精品', N'新品', N'热销', N'上架', 2, 1, CAST(0x0000A77D012DB9CC AS DateTime))
INSERT [dbo].[ws_ProductInfo] ([Id], [Title], [Type], [BianHao], [GuiGe], [YPrice], [XPrice], [Znum], [ImgName], [Desp], [JingPin], [XinPin], [ReXiao], [ShangJia], [IsZhanShi], [Orders], [AddTime]) VALUES (10, N'装新款女装宽松显瘦直筒裤破洞牛仔裤HH5296妠', 49, N'5345345345', N'箱', CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 990, N'20160910021508_5165.jpg', N'', N'精品', N'新品', N'热销', N'上架', 1, 2, CAST(0x0000A76900B211F0 AS DateTime))
INSERT [dbo].[ws_ProductInfo] ([Id], [Title], [Type], [BianHao], [GuiGe], [YPrice], [XPrice], [Znum], [ImgName], [Desp], [JingPin], [XinPin], [ReXiao], [ShangJia], [IsZhanShi], [Orders], [AddTime]) VALUES (11, N'黄铜', 50, NULL, NULL, CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'20160910021602_1706.jpg', N'', N'精品', N'新品', N'', N'上架', 1, 3, CAST(0x0000A6F000C46620 AS DateTime))
INSERT [dbo].[ws_ProductInfo] ([Id], [Title], [Type], [BianHao], [GuiGe], [YPrice], [XPrice], [Znum], [ImgName], [Desp], [JingPin], [XinPin], [ReXiao], [ShangJia], [IsZhanShi], [Orders], [AddTime]) VALUES (12, N'紫铜', 50, NULL, NULL, CAST(34.00 AS Decimal(18, 2)), CAST(32.00 AS Decimal(18, 2)), 0, N'20160910021637_1966.jpg', N'', N'', N'', N'', N'上架', 1, 4, CAST(0x0000A6F000C43164 AS DateTime))
INSERT [dbo].[ws_ProductInfo] ([Id], [Title], [Type], [BianHao], [GuiGe], [YPrice], [XPrice], [Znum], [ImgName], [Desp], [JingPin], [XinPin], [ReXiao], [ShangJia], [IsZhanShi], [Orders], [AddTime]) VALUES (13, N'紫铜', 51, NULL, NULL, CAST(2.30 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 0, N'20160910021702_9771.jpg', N'', N'精品', N'', N'', N'上架', 1, 5, CAST(0x0000A6F000C46F80 AS DateTime))
INSERT [dbo].[ws_ProductInfo] ([Id], [Title], [Type], [BianHao], [GuiGe], [YPrice], [XPrice], [Znum], [ImgName], [Desp], [JingPin], [XinPin], [ReXiao], [ShangJia], [IsZhanShi], [Orders], [AddTime]) VALUES (17, N'依依衣舍韩版2017春装新款女装宽松显瘦直筒裤破洞牛仔裤HH5296妠', 49, N'332323232323', N'', CAST(9.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), 0, N'i_20160910021838_7896.jpg', N'', N'精品', N'', N'热销', N'上架', 1, 99, CAST(0x0000A75200FF9678 AS DateTime))
INSERT [dbo].[ws_ProductInfo] ([Id], [Title], [Type], [BianHao], [GuiGe], [YPrice], [XPrice], [Znum], [ImgName], [Desp], [JingPin], [XinPin], [ReXiao], [ShangJia], [IsZhanShi], [Orders], [AddTime]) VALUES (18, N'废铝', 55, NULL, NULL, CAST(36.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)), 0, N'i_20160910021854_0144.jpg', N'', N'精品', N'', N'', N'上架', 1, 99, CAST(0x0000A6F000DECC54 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_ProductInfo] OFF
/****** Object:  Table [dbo].[ws_ProAdver]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_ProAdver](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[ImgName] [nvarchar](50) NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_ProAdver] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ws_OrderList]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_OrderList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rname] [nvarchar](50) NULL,
	[OrderId] [nvarchar](max) NULL,
	[Znum] [int] NULL,
	[Zjiage] [decimal](24, 2) NULL,
	[IsFaHuo] [int] NULL,
	[KdDanhao] [nvarchar](50) NULL,
	[KdGongsi] [nvarchar](50) NULL,
	[FaTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_OrderList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是已发货  2是未发货' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_OrderList', @level2type=N'COLUMN',@level2name=N'IsFaHuo'
GO
SET IDENTITY_INSERT [dbo].[ws_OrderList] ON
INSERT [dbo].[ws_OrderList] ([Id], [Rname], [OrderId], [Znum], [Zjiage], [IsFaHuo], [KdDanhao], [KdGongsi], [FaTime], [AddTime]) VALUES (3, N'15020356014', N'ZX20170401104730755', 0, CAST(28.00 AS Decimal(24, 2)), 2, NULL, NULL, NULL, CAST(0x0000A74800B1D758 AS DateTime))
INSERT [dbo].[ws_OrderList] ([Id], [Rname], [OrderId], [Znum], [Zjiage], [IsFaHuo], [KdDanhao], [KdGongsi], [FaTime], [AddTime]) VALUES (4, N'15020356036', N'ZX20170401104955568', 3, CAST(10.00 AS Decimal(24, 2)), 2, NULL, NULL, NULL, CAST(0x0000A74800B28144 AS DateTime))
INSERT [dbo].[ws_OrderList] ([Id], [Rname], [OrderId], [Znum], [Zjiage], [IsFaHuo], [KdDanhao], [KdGongsi], [FaTime], [AddTime]) VALUES (5, N'15020356036', N'ZX20170401115714138', 3, CAST(12.00 AS Decimal(24, 2)), 2, NULL, NULL, NULL, CAST(0x0000A74800C4FE78 AS DateTime))
INSERT [dbo].[ws_OrderList] ([Id], [Rname], [OrderId], [Znum], [Zjiage], [IsFaHuo], [KdDanhao], [KdGongsi], [FaTime], [AddTime]) VALUES (6, N'15020356036', N'ZX20170401134033459', 3, CAST(55.00 AS Decimal(24, 2)), 1, N'1111', N'而温柔', CAST(0x0000A74C011C595C AS DateTime), CAST(0x0000A74800E15EEC AS DateTime))
INSERT [dbo].[ws_OrderList] ([Id], [Rname], [OrderId], [Znum], [Zjiage], [IsFaHuo], [KdDanhao], [KdGongsi], [FaTime], [AddTime]) VALUES (7, N'15020356036', N'ZX20170401153252220', 4, CAST(40.00 AS Decimal(24, 2)), 1, N'12222', N'二厅', CAST(0x0000A74D01137468 AS DateTime), CAST(0x0000A74801003830 AS DateTime))
INSERT [dbo].[ws_OrderList] ([Id], [Rname], [OrderId], [Znum], [Zjiage], [IsFaHuo], [KdDanhao], [KdGongsi], [FaTime], [AddTime]) VALUES (8, N'15020356014', N'ZX20170413152711828', 0, CAST(14.00 AS Decimal(24, 2)), 1, N'各地各地方', N'孙发', CAST(0x0000A7A1015A6AD0 AS DateTime), CAST(0x0000A75400FEA894 AS DateTime))
INSERT [dbo].[ws_OrderList] ([Id], [Rname], [OrderId], [Znum], [Zjiage], [IsFaHuo], [KdDanhao], [KdGongsi], [FaTime], [AddTime]) VALUES (11, N'15020356014', N'ZX20170627195645158', 12, CAST(96.00 AS Decimal(24, 2)), 2, N'3', N'4', CAST(0x0000A7A10155E758 AS DateTime), CAST(0x0000A79F0148B27C AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_OrderList] OFF
/****** Object:  Table [dbo].[ws_NewsType]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_NewsType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_NewsType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_NewsType] ON
INSERT [dbo].[ws_NewsType] ([Id], [Title], [Orders], [AddTime]) VALUES (1, N'促销活动', 2, CAST(0x0000A6EF0125D1F8 AS DateTime))
INSERT [dbo].[ws_NewsType] ([Id], [Title], [Orders], [AddTime]) VALUES (5, N'公告信息', 1, CAST(0x0000A6EF0125C064 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_NewsType] OFF
/****** Object:  Table [dbo].[ws_NewsInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_NewsInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[ImgName] [nvarchar](max) NULL,
	[Laiyuan] [nvarchar](max) NULL,
	[Desp] [nvarchar](max) NULL,
	[Dis] [nvarchar](max) NULL,
	[Jis] [nvarchar](max) NULL,
	[Fis] [nvarchar](max) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_NewsInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_NewsInfo] ON
INSERT [dbo].[ws_NewsInfo] ([Id], [Title], [Type], [ImgName], [Laiyuan], [Desp], [Dis], [Jis], [Fis], [AddTime]) VALUES (1, N'废塑料合理再生利用的探讨', 1, N'20160910020004_4218.jpg', N'山东聚全', N'<p>
	1随着石化工业的发展和人民生活水平的提高，塑料在我国生产、生活领域的应用亦日渐广泛。由于废塑料的处理跟不上，其造成的环境污染已成为社会关心的焦点。
</p>
<p>
	目前除少量产业废塑料作为原料再生利用外，其他大多作填埋和焚烧处理，但填埋时由于长期不分解，易污染地下水源焚烧时又易产生二恶烷和呋喃等剧
毒物质。因此废塑料的再生利用是亟等解决的问题。我国在这方面目前还处于起步和探索阶段，为了在发展中少走弯路，本文介绍欧盟（主要是德国）和日本在这方
面的情况和经验，以供参考。
</p>
<p>
	2欧盟废塑料的再生利用简况欧盟各国废塑料的年发生量约1700万t 
，和美国相仿，为日本的2倍。由于重视环保，从上世纪90年代以来，德国为首等国家狠抓包装容器废塑料（占全部的1/2以上）的再生利用，但由于要求较
高，欧盟的推广和进展并不快，到1998年废塑料和再生利用率仅29 .4，尚低于日本的44 ，同时填埋处理的占67 .7，焚烧处理的占2 
.9.具体情况。
</p>
<p>
	项目全部废塑料万t包装容器部分万t废塑料合计填埋焚烧再生利用（1）原料利用（2）燃料利用（3）化学利用注：摘自日刊塑料时代2001年塑
料再生专集能源与环境由表1可以看出，废塑料总体和包装容器部分的再生利用率均有所提高，后者的提高幅度更大，尤其是在化学方面的再生利用（油化、气化和
高炉喷吹等）全部为德国的包装容器废塑料，都说明德国对包装容器废塑料的再生利用的管理起了重大作用。
</p>
<p>
	德国于1991年颁布的《垃圾减量法》中规定，居民大力减少废物的同时，必须对占生活垃圾容积1/2以上的包装容器废物，严格按金属罐壳、玻璃
瓶、废塑料和纸分类投放，然后由包装容器制造商合资成立的德国废物回收利用公司（DSD公司）负责进一步分类和委托再生利用，所需费用通过征收包装容器产
品绿点税来解决。
</p>
<p>
	在政府的支持下，巴斯夫化学公司等开发成功油化和气化技术，不莱梅钢铁厂开发成功向高炉喷吹废塑料代油技术（由于塑料在高炉中起还原剂作用，故
归入化学利用）。DSD公司从统筹废塑料的合理利用出发，既考虑补助费高低的经济因素（供原料利用的优质废塑料基本不补助，高炉喷吹补助150马克/t 
，油化补助240马克/t 
，填埋费约300马克/t），并考虑能源、环保因素，故主张不能作原料再生利用的废塑料优化供化学利用，基本上不作燃料利用（利用效率低和污染大气）。
</p>
<p>
	据此，高炉喷吹废塑料得到了推广，从1998年DSD公司回收的63万t废塑料的用途看，除供原料用的24万t外，高炉喷吹为16 
.3万t、气化为11万t ，油化为8 .7万t 
，其他3万t.但是这种分类回收再生利用方法过分繁琐（如其它同类品种玩具废塑料亦不可混入），大部为人工分选，造成劳动成本高，厂家负担重，以致未能在
欧盟其它国家推广，甚至德国专家亦对此怀疑，主张只把可供原料用的废塑料分类投放，其它废塑料则和一般垃圾一并送焚烧发电厂焚烧，反而有利于降低处理成
本，只要采用先进的垃圾焚烧炉同样可使烟气排放达标。这点经验很值得我们注意。
</p>
<p>
	3日本的废塑料再生利用情况日本学习德国经验，于1995年颁布了《包装容器再生法》，决定从1996年起先对再生技术成熟的PET瓶进行再生
利用，其它废塑料从2000年4月起进行分类回收和再生利用，具体由塑料处理促进协会组织并由各制造厂承担处理费用。几年来积极开展工作的PET瓶的再生
利用率已由年的33 .3（12万t/36万t）。总的废塑料的再生率亦由1995年的35 提高到50 ，。
</p>
<p>
	万t年度总量再生利用（1）原料利用（2）燃料利用（a）发电用（b）供热用（3）化学利用日本经产省计划到2010年将废塑料的再生利用率提高到90 ，并基本上不再焚烧减容（见年份原料利用燃料利用化学利用再生利用减容焚烧填埋注：表2、表3资料来源同表1.
</p>
<p>
	日本废塑料再生利用情况及其特点如下。
</p>
<p>
	（1）原料利用：主要是加工废品作为原料再生利用，如1999年共利用134万t ，此项占87万t ，占产业废塑料490万t的25 
.3，另有27万t为从产业用毕废品中回收的而从生活废品中回收的占10万t ，仅占全部生活废品486万t的2 
，主要是PET瓶类，主供纤维制品原料，现用来制PET瓶原料的技术已开发成功，今后将扩大。另外，汽车缓冲器、洗衣机的洗衣筐，电视机的壳体等作为原料
利用的技术亦试用成功此外还开发成功利用废塑料加木屑压制成超级板材的技术，这些都将促进原料利用比例的上升和提高再生利用效益的改善。
</p>
<p>
	（2）燃料利用主要有3种形式：利用垃圾焚烧炉发电和供热及RDF 
3种。后者即为将废塑料混合其它可燃垃圾并加入适量石灰压制成的垃圾固形燃料，发热量高达18840～20934kJ/kg 
，十分能源与环境能源工程有利于提高燃烧效率，用于发电时效率可比垃圾焚烧炉高1～2倍，用于烧水泥时其灰分亦可作为水泥的有机组成得到利用加上它便于贮
存和运输，又有利于提高垃圾发电站的规模，综合效果较好，其产量已由1995的4万t发展到2000年的19其它燃料利用方面，除少量利用废塑料混入煤中
烧水泥熟料和石灰外，主要是混入垃圾或单独焚烧发电和供热的。鉴于这种方式能效低且污染不易控制，日本在塑料分类回收基础上正着手大力发展专烧废塑料的小
型发电系统和烧煤掺烧废塑料的发电技术，前者如萨尼克斯公司已在北海道建成7 .4万kW发电机组，年可燃用废塑料20万t 最近又在下关市建设1 
.8万kW发电机组，将于2004年投产，可就近利用当地的废塑料5万t/a，今后还拟发展20万kW.在大型燃煤发电掺用废塑料方面，中部电力已受新能
源产业技术综合开发机构（NEDO）的委托进行试验。
</p>
<p>
	（3）废塑料化学利用是上世纪90年代后期发展起来的新技术。发展较早的是油化装置，新泻县的6000t/a装置已于1999年5月转入商业运
行。2000年4月札幌市塑料再生公司建成1 
.48万t/a装置，现已正式运行。三笠市道央油化中心亦于同期建成6000t/a装置并正式运行。另外三菱重工在茨城县建有5t/d工试装置，重点研究
油化工艺改进技术和降低成本。
</p>
<p>
	在塑料气化方面，环保设备大户荏原公司和化工大户宇部兴产公司于1999年建成1 
.5t/a废塑料气化试验装置，可用PVC等含氯废塑料气化后，对氯化盐酸回收后，所产气供作制氨原料，试成后于2001年又扩建了1 
.5万t/a.今后还拟在关东和关西地区再建10万t/a.新日铁和达依塞尔公司受NEDO和日本清洁中心委托投资4亿～5亿日元在富津市建5t/a废塑
料气化试验装置，于2001年下半年用含氯废塑料为原料，通过吹入氧和蒸汽使之局部氧化先回收盐酸，然后用合成气制甲醇和醋酸。川崎制铁和住友金属公司亦
引进国外气化熔渣炉技术，将含氯废塑料气化后供作化工原料。
</p>
<p>
	在高炉喷吹废塑料方面，日本钢管公司（NKK）学习德国技术于1996年在京浜厂4093m高炉试喷产业废塑料成功，以后在京浜厂建成3万
t/a造粒装置，1999年又在京浜厂和福山丁各建成4万t/a造粒装置，使2000年喷吹量达11万t/a，2001年又扩大到15万t/a，计划到
2010年达根据钢铁联盟1996年颁布的行业节能环保计划，钢铁企业2010年共利用废塑料100万t ，节能2 
的目标，新日铁公司在废塑料油化试验基础上，试验成功在炼焦煤中可掺入废塑料1 ，经过焦炉干馏，废塑料的40 变为焦炉煤气， 40 
变为化工副产品焦油和粗苯，20 变为焦炭，能量转化率高达90 
以上，远高于废塑料的高炉喷吹和油化、气化。2000年冬在君津丁和名古屋厂各建成4万t/a装置试用， 
2001年又在八幡厂和室兰厂又各建成2万t/a装置试用。
</p>
<p>
	日本政府在废塑料再生利用方面的措施基本上学习了德国依法促进居民分类投放和制造企业负担再生利用费用的原则，但在具体实施方面更多依靠市场机制，以充分发挥各方的积极性和主观能动性，故进展较快，主要经验有以下几点。
</p>
<p>
	（1）对废塑料的再生委托收费，充分考虑到再生利用的难易程度和经济效益，一般混合废塑料为2万～3万日元/t ，含氯废塑料为4万日元/ t ，可供原料利用的单种废塑料还可不收费，从而调动了各方的积极性。
</p>
<p>
	（2）在再生利用方向上，除大力支持节能效果好的原料利用，并大力支持开发分选技术外，还从塑料品种性能差别大的实际出发，并未像德国那样限制燃料利用而鼓励择优发展。
</p>
<p>
	在上述政策鼓励下，燃料利用的增长幅度仍大于原料利用，除发电外，现用于烧水泥熟料和石灰废塑料的已达10万t/a ，2005年将达25万～30万t.另外新日铁公司并未满足推广NKK已成功的高炉喷吹技术，而开发成功了效益更好的焦炉掺用法。
</p>
<p>
	4我国的现状和应采取的措施我国的废塑料数量和日本相仿，但在再生利用方面除原料利用较好外，其它均未形成规模。
</p>
<p>
	如前几年就有的数处油化生产厂因产品质量不合格等问题，已于去年被明令停产原海南科技实业公司用混合废塑料熔融挤压后生产包装箱效益很好，后因
故迁到淮阴市无大发展，亦未能推广天津中欣资源再生公司引进日本爱因公司的用废塑料和木屑制造超级板材的生产线，亦因资金问题未能投产。《中国冶金报》也
曾报道了首钢向生态型企业迈进，已组成焦煤配入废塑料5 
的攻关能源与环境组，以帮助北京市处理废塑料的消息。看来各种废塑料利用方式在我国都有一定进展，但均未形成产业。初步分析其主要原因，可概括如下。
</p>
<p>
	（1）缺乏相关法规的有效推动。从德、日等国的实践看，都是依法解决了分类投放、再生资金来源和考核目标等关键环节后，废塑料再生利用才顺利开
展起来。反观我国1996年颁布的《固体废物污染环境防治》中虽明确规定了变废为宝的原则，但由于实施条例和相关的再生利用法规迟迟未出台，对实际工作的
推动不大，较为突出的如垃圾分类投放这一工作就长期停留在试点阶段。
</p>
<p>
	（2）在废塑料再生利用产业化方面，政府在技术开发方面给予支持具有重要意义，如对油化企业产品质量不合格的本应组织科技攻关解决，而不应采取
关停措施。但更重要的是经济因素，日本企业处理每吨废塑料可回收2 
.5万日元，折合人民币1600元，而国内企业处理废塑料每吨却需付费700～1000元。相差如此之大，恐怕难以实现产业化。
</p>
<p>
	（3）由于各级政府和有关行业协会对废塑料再生利用缺乏长远规划和考核目标，从而得不到各方重视。
</p>
<p>
	鉴于我国废塑料的处理长期停留在不完善的焚烧（欧、美、日对焚烧炉均考核二恶烷浓度，而我国只对京、津、沪、粤4个地区考核）和简单填埋阶段，给环境带来隐患，且造成资源的重大浪费，背离了可持续发展方针。为此，笔者建议应尽快把再生利用工作抓起来。
</p>
<p>
	（1）尽快立法，推动废塑料再生利用中关键问题的解决。具体可考虑如推出《固体废物污染环境防治法》实施条例尽快出台或《资源再生法》等，以发挥法治在市场经济中的核心作用，具体条款可参照德、日法规中的先进部分。
</p>
<p>
	（2）根据我国实际，以分类收购代替西方的分类投放，并配套改革垃圾收费制度。在我国以往就有通过废品收购站分类收购废品的惯例，目前部分地区也有按质论价收购废塑料的实践，按质论价分类收购可说是利用居民闲散劳动力进行废塑料分类处理的最佳计划。
</p>
<p>
	为促进居民按类交售废塑料的积极性，除加强环保教育外，还应改革垃圾收费制度，即由目前的按人头交费改为按数量交费，使居民交售后得到更多回
报。在收费方式上还可采取出售有标志的塑料垃圾袋的办法，即以垃圾袋成本3倍的价格出售，多加的部分即作为垃圾收费，再从这部分中提取一定比例作为对废塑
料再生利用企业的补贴，再加上政府在税制等方面的优惠，以缩小经济上与国外的差距。以袋收费还可扩大再生制品的用途，有利于塑料的再生利用。
</p>
<p>
	（3）在废塑料的再生用途上，除抓好原料利用外，还应从我国的实际出发，抓好以下几点。
</p>
<p>
	鉴于我国禁伐自然林后木材进口量上升的情况，应抓好以废塑料替代木制品方面的工作。
</p>
<p>
	建议对淮阴和天津2个点应重点扶持示范，然后有计划地推广。
</p>
<p>
	我国石油开采长期依靠进口，为此应发展废塑料油化。建议选2～3个停产厂为示范点，组织科技力量进行攻关，在解决产品质量的同时，试验超临界水油化技术，以大幅降低成本。
</p>
<p>
	由于焦煤中配入废塑料时能量利用率最高，装置简单，效益较好，并考虑我国现有近1亿t机焦能力的实际，应作为重点对象发展，建议支持首钢的科技
攻关计划，若能达到配入焦煤的3 的水平，则吨焦可利用废塑料40kg，按全国推广半数计，则全国每年可利用废塑料200万t ，效果十分可观。
</p>
<p>
	鉴于水泥熟料回转窑掺用废塑料装置简单，适应性广，环保达标而节能效果好，同时我国水泥生产能力高达5亿～6亿t ，工厂分布地域广，适于就近掺烧废塑料，可作为燃料利用的重点发展对象，选2～3个示范点重点试用成后推广。
</p>
<br />', N'', N'推荐', N'发布', CAST(0x0000A5CE011BD61C AS DateTime))
INSERT [dbo].[ws_NewsInfo] ([Id], [Title], [Type], [ImgName], [Laiyuan], [Desp], [Dis], [Jis], [Fis], [AddTime]) VALUES (17, N'我国塑料回收行业现状', 1, N'20160910020522_4800.jpg', N'山东聚全', N'<div>
	我国塑料回收行业现状：2000年以来，中国进口废塑料的数量从200万吨开始逐年持续上升，2010年至2012年连续超过800万吨，这个海关统计数据已经足以说明，中国的塑料再生利用行业在全球具有最大的规模。
</div>
<div>
	业内人士都知道，中国的买家一再抬高了世界废塑料的行情，而且，废塑料在进口报关时，包括关税、增值税和各项检查费用在内，还要承担高达每吨240至
380美元的成本。要不是中国人以优良的技术对再生塑料的物性改良和用途开发作出了卓越的努力，如此高昂的成本是不可能得到消化的。当然，所有的动力来自
于坚挺的市场需求。有1500多家企业取得了废塑料的进口许可证，实际上持续地进口加工的企业约有500多家，其中有一些规模是并不小的。
</div>
<div>
	根据中国塑协的报告，近年来，中国国内回收利用的废塑料每年在1200万吨左右。当然，这不是一个统计数据，因为在中国根本不存在一个回收体系，我们在街市和社区随时可以看到很多运输未经减容的废塑料的车辆，它们来自何处？将被运往哪里？都是无法追溯的。
</div>
<div>
	政府正在倡导对废塑料加工实行圈区管理，这种做法谋求改变国内回收加工企业“脏乱差小”的现状。自然形成的塑料再生加工业的集聚地正在不断地被消灭，
“园区”多半建设在另外一些地方。我相信圈区管理是会有一些成效的，但是它并不能保证国内回收的废塑料被运往园区进行加工，回收体系依然没有建立起来。
</div>
<div>
	依凭巨大的行业规模和坚挺的市场需求，回收体系却迟迟建立不起来，实在是一种行政的失败。
</div>
<div>
	我国塑料回收行业政策：国内废塑料回收体系迟迟建立不起来，症结在于相关法规政策的缺失。
</div>
<div>
	把废塑料区分为“进口废塑料”和“国内废塑料”是一个奇特的中国现象，对于“进口废塑料”，在历经多年整治的基础上，已经形成了一个无以复加的管控体系，它是由三部法规构成的：
</div>
<div>
	1.固体废物进口管理办法
</div>
<div>
	2.进口废塑料环境保护管理规定
</div>
<div>
	3.进口可用作原料的固体废物环境保护控制标准—废塑料
</div>
<div>
	根据这些法规，进口加工企业必须办理国内收货人登记，并对照严格的标准，每年经过当地及省级环保部门的考核，才能取得国家环保部颁发的进口许可证。境
外出口企业也要办理供应商登记，取得这项登记的前提是必须通过ISO9001的认证，为什么不是ISO14001呢？这是一个中国式的幽默。
</div>
<div>
	商检总局在世界主要国家设立的CCIC检验机构，对废塑料实施装箱前的检验，虽然检验很难有一个明确的标准，但是它的效果非常明显。不过进口口岸的检验才是决定性的。
</div>
<div>
	海关对进口废塑料实施核价征税，核价总是高于实际交易的行情，因此进口企业的利润被压缩到极为可怜的地步。从来没有人设想过，如果税负不太重的话，会有怎样的正面效果。
</div>
<div>
	中国面临着严重的环境问题，很少有人探求其真正的症结所在，但是，进口废塑料可能造成的污染确实受到了政府和媒体的密切关注，偶发性的事件总是会引发对全行业“一刀切”的整治。今年3月份开始的“绿篱行动”，是至今为止最严厉的一次整治行动。
</div>
<div>
	我国塑料回收行业走向：最近出现了“后绿篱时代”的说法，它的意思是，这次整治行动会使中国的塑料再生利用行业发生剧烈的变化。
</div>
<div>
	其实，“绿篱行动”并没有出台任何新的更严厉的管理措施，它的特点是，根据既定的法规条例，以9个月的时间，对行业中的所有企业进行了一次执法审查。
</div>
<div>
	如果这意味着既定的法规条例在今后将被严格地执行，那么它的意义会是正面的。令人不安的是，既定的法规条例中存在的一些不合理因素无望得到及时的修订，于是也难免在今后的实施过程中继续“被变通”，何况这本来就是中国行政的症结。
</div>
<div>
	很多企业选择了向国外转移。现在具有规模的再生设备企业都订单爆满，他们正在为“走出去”的公司加班加点地制造装备。“走出去”的企业往往是比较有实
力的，他们为“走出去”花费的投资，本来是完全可以用于技术升级和加强环保投入的。“走出去”是有巨大风险的，选择“走出去”，一定是为了跳出“一紧一
松”的周期律。
</div>
<div>
	除了“走出去”，再一条生存之道便是“走进去”，进园区。只要再生塑料的市场需求依然坚挺，中国的这个行业就会继续发展，“走出去”和“走进去”的真正贡献在于，总有一天人们会发现，中国的环境污染，根源并不在再生行业，而再生行业，恰恰是“可持续发展”的先行者。
</div>
<div>
	塑料是没有毒的，废塑料的风险主要在于它是否受到化学品的污染或者来自于医疗废物，以及它会不会被用于生产食品包装物或者婴儿用品，这是必须由一个健
全的回收体系才能加以有效管控的。通常，废塑料在再生加工过程中产生的污染是非常有限的，而其对于节约资源，减少碳排放，促进“可持续发展”所做的贡献是
更有价值的。
</div>
<br />', N'置顶', N'推荐', N'发布', CAST(0x0000A5C40108306C AS DateTime))
INSERT [dbo].[ws_NewsInfo] ([Id], [Title], [Type], [ImgName], [Laiyuan], [Desp], [Dis], [Jis], [Fis], [AddTime]) VALUES (18, N'H&M回收和再生战略引领服装可持续发展', 1, N'20160910020436_5384.jpg', N'山东聚全', N'<div id="news_center">
	<div>
		针对生态可持续性，许多服装品牌都在服装的回收与再利用上下功夫。H&amp;M作为该领域的先行者，它以怎样的方式进行可持续发展的实践，它有哪些值得借鉴的商业模式和技术手段呢？
	</div>
	<div>
		H&amp;M环保系列
	</div>
	<div>
		Conscious 
Collection是H&amp;M特别开发的可持续性时装系列，2009年第一次面世，之后每年都会推出这一系列的产品，它完全由环保面料和其他可持
续物料制成。2013年H&amp;M又推出Conscious Exclusive 
Collection被称作H&amp;M环保系列限量款。这个系列设计款式以优雅礼服为主，完全能够胜任晚宴以及红毯着装需求。
	</div>
	<div>
		H&amp;amp；M回收和再生战略引领服装生态可持续发展0.jpg
	</div>
	<div>
		旧衣回收计划
	</div>
	<div>
		是全球范围内的大规模旧衣回收行动，顾客可以将自己长期闲置的或是不再穿的旧衣服放在H&amp;M门店的旧衣回收箱里，无论是T恤，牛仔，还是夹克衫，也不论服装品牌，并换回一张八五折的折价券，在店中购买任何东西使用。
	</div>
	<div>
		H&amp;amp；M回收和再生战略引领服装生态可持续发展1.jpg
	</div>
	<div>
		闭环生产和再生系列
	</div>
	<div>
		H&amp;M的可持续发展计划的梦想是最终真正实现闭环生产，旧衣回收行动将衣服回收起来做成新的，而非送到垃圾场，意味着零周期浪费。同时加大利用闭环纤维的规模也让H&amp;M离梦想更近一步。
	</div>
	<div>
		H&amp;amp；M回收和再生战略引领服装生态可持续发展2.jpg
	</div>
	<div>
		提升消费者环保意识和参与度
	</div>
	<div>
		品牌主打可持续，环保与再生的概念牌是出于对未来发展的战略性长远考虑，另一方面也是为了吸引更多的热衷于环保产品的消费者。如果品牌的环保概念足以
能够打动他们，那么买一件这样的时装就是一种潮流时尚。但是对于那些环保意识并不强烈，对可持续性时装存在疑问的消费者，倡导可持续性的服装品牌则一般从
提供切实优惠，提高消费者参与度入手提高她们的环保意识。
	</div>
</div>
<br />', N'', N'推荐', N'发布', CAST(0x0000A5C4010862D0 AS DateTime))
INSERT [dbo].[ws_NewsInfo] ([Id], [Title], [Type], [ImgName], [Laiyuan], [Desp], [Dis], [Jis], [Fis], [AddTime]) VALUES (19, N'废旧电池回收“道路坎坷”', 1, N'20160910020240_6088.jpg', N'山东聚全', N'<p>
	跟着社会的成长，手电筒、手机、电动车、电动玩具等家用电器遍及到了千家万户，种类也在不停增长，与之相伴的是，大量废旧电池随之孕育发生。比年
来，废旧电池对情况的影响已成为一个环保热点话题，引起了社会很大存眷，不少热爱环保的人士和集体开展或到场了接纳废旧电池的勾当。 <br/>中国废旧物资网资讯平台：太原市环卫部分从2002年起头，就测验考试举行废旧电池的接纳，至今已设立了1395个接纳点，但接纳环境和天下其他都会近
似，接纳率较低，绝大部门废旧电池在市平易近的不经意间，混在糊口垃圾中进入垃圾填埋场。废旧电池风险多氧化汞电池、镉镍电池、铅酸蓄电池，这是曾经和当
前社会糊口中利用比力遍及的电池，含有汞、镉、铅等重金属污染物，一旦取消，都属于伤害废料。在这些电池的利用历程中，有害物质被封存在电池壳内部，并不
会对情况和人体造成影响。但颠末恒久磨损和腐化等，内部的重金属和酸碱等有毒有害物质大概会走漏出来，进入泥土或水源，并经由过程各类路子进入人的食品
链。这些物质，进入人体后，恒久积储难以解除，大概会侵害神经体系、造血功效和骨骼等，紧张风险人体康健。</p><p>
	据相识，若接纳与平凡糊口垃圾不异的填埋处理方法，这些电池中的重金属大概会经由过程渗漏污染水体和泥土；若举行点火处理，在高温前提下，此中的腐
化性身分大概会腐化处理设置装备摆设，且某些重金属身分也会挥发到氛围中，造成大气污染。因为技能程度等身分的制约等，我省今朝尚无废旧电池无害化处理举
措措施，对接纳的废旧电池也只能是分类暂存。现有接纳点1395个2002年以来，太原市环卫部分连续在住平易近小区、企奇迹单元、大中专院校、大型企业
等职员麋集地区设立废旧电池接纳箱。目前，全市共设立各种接纳点1395个。长治路省工商局宿舍，一个透明的废旧电池接纳箱立在小区大门内便道上的夺目位
置。这个接纳箱有三个电池投放口，可分类投放纽扣电池、手机电池和充电电池。据长治路社区的工作职员李佳蓉先容，拥有2700余户住平易近的长治路社区，
从客岁6月份起头，在几个大的住平易近小区设置废旧电池接纳箱，至今一年多点的时候，已经网络了约300公斤、约6000枚各种废旧电池。该社区对在废旧
电池接纳中表示凸起的住平易近，还嘉奖充电手电筒、水杯、纸巾、烟灰缸等用品，不少住户的积极性被变更了起来，各人对这项工作非常共同。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
有的回收箱成了垃圾箱记者在走访中发现，有一部分原本专门用来回收存放废旧电池的回收箱，成了垃圾箱，被生活垃圾挤占了空间。新建南路59号院是一个居民
小区，在小区大门内20米路北侧的便道上，摆着一个旧式的废旧电池回收箱。掀开盖子，这个黄色圆柱形的塑料箱内，扔进了不少塑料袋、烧烤签、废纸、茶叶盒
等生活垃圾。箱身上标注的“举手之劳，促进环保”的红色字样显得分外尴尬。位于漪汾桥东的力鸿大厦一层大厅内的废旧电池回收箱也有同样的遭遇。环卫部门工
作人员说，经过多年的宣传，多数单位和市民对于废旧电池的回收是比较配合的，对回收设施也比较爱护，但仍有个别市民环保意识还有待提高，需要继续宣传和引
导。超30公斤可上门回收小区没有回收箱，电池往哪送？</p><p>
	&nbsp;</p><p>
	电池攒多了怎么处理？市环卫局工作人员说，凡是收集废旧电池达30公斤以上的，他们会上门回收，不足这个量的可到就近的废旧电池回收点进行投放，回
收热线电话为0351—2680270。环卫部门也会不定期对各个回收点进行循环检查、上门回收，对出现的破损及丢失的回收箱进行登记，并视情况进行修
补、补充、更新。此外，为方便市民就近投放，环卫部门还与唐久便利和美特好合作，在其各门店设立了分类回收箱。11年来已回收130吨2002年至今，太
原市环卫部门累计回收废旧电池130吨，分类存放在省物资回收公司大东关分公司仓库内。回收的普通一次性废旧干电池，在装入塑料袋后，置于容量为1立方
米、厚度为10厘米、呈正方形的钢筋混凝土箱内，箱内壁涂抹了防渗材料，装满后加盖抹灰密封，箱体上用蓝色油漆在醒目位置标明序号整齐堆放，且箱体上张贴
有“危险废物”标识。目前经这样无害化封存的废旧电池已达107箱。手机电池、纽扣电池等异型电池，则使用小塑料箱分类储存，并用3毫米的绝缘纸做了分层
防漏液处理，统一编号，标注类型，共计有63箱。市环卫局工作人员说，市政府每年都会拿出一定的专项资金用于废旧电池的回收与储存，每年的回收量也呈现增
长趋势，但太原市目前的回收率并不乐观。有关资料显示，作为国家环保模范城市的杭州市，其废旧电池的回收率也不足一成。回收体系有待完善市环保局工作人员
说，没有完善、规范的回收体系，是导致废旧电池回收率低的主要原因。废电缆</p><p>
	&nbsp;</p><p>
	目前，环保部门针对太原市目前保有量达到约70万辆、每年产生数以万计的铅酸蓄电池的电动车，正参照北京等城市的先进经验，拟出台适合太原市实际情
况的电动车电池产品登记目录管理制度，以建立与销售网络平行的回收网络，使生产厂家和销售商家强制履行回收义务。此外，环卫部门将继续逐步增加废旧电池回
收箱的投放设立，并有意设立废旧电池专项奖励基金，定期对回收较好的单位和个人予以表彰奖励，以调动广大市民的积极性。</p><p><br/></p>', N'', N'推荐', N'发布', CAST(0x0000A5C401087C98 AS DateTime))
INSERT [dbo].[ws_NewsInfo] ([Id], [Title], [Type], [ImgName], [Laiyuan], [Desp], [Dis], [Jis], [Fis], [AddTime]) VALUES (25, N'废塑料作矿石还原剂新技术', 1, N'20160910015711_3459.jpg', N'山东聚全', N'<p>
	<span style="text-indent:2em;">废塑料作矿石还原剂新技术日本N KK开发出利用废塑料代替焦炭作矿石还原剂的新技术。该技术先将废塑料造粒，再用专门鼓风装置吹入高炉。由于热风中O已被焦炭耗尽，废塑料和焦炭燃烧时产生的CO发生分解反应生成和2，成为矿石的还原剂。</span> 
</p>
<p>
	该技术的特点是：①由于过程中产生H参与还原反应，使CO发生量只有焦炭的2 
/3，可减少地球环境中CO②不会生成二恶英③废塑料产生的还原气体利用率约60 
，但过剩气体排出后可作为热风炉或发电设备的燃料再利用，废塑料有效再利用率高达80 
，可减少矿物燃料的使用④可大量合理地处理废塑料，年产300万t的享浜炼铁高炉就可利用废塑料60万t.
</p>
<p>
	废轮胎再资源化新技术日本环境商品开发商采用在高温高压反应器内使废轮胎局部爆炸引起分解的技术，成功开发出一种将废轮胎有效分离得到重油、活性炭和不锈钢的处理装置。
</p>
<p>
	处理过程是将废轮胎加入直径2 m、高5 
m的反应器中，下面用电炉加热至350～400℃，用压缩机对反应器加压，再通入冷气使废轮胎剧烈膨胀，局部发生爆炸，由爆炸产生的震动使废轮胎在短时间
内分解。爆炸后由于气体急速收缩，冲击可以得到缓和。处理能力为8h可处理30t.
</p>
<p>
	用高温高压水分解生活垃圾日本石川岛播磨重工业和新菱冷热工业共同开发用高温高压水将生活垃圾分解成CO和H O的装置。高温高压水具有使常温常压下无法分解的有机物分解的性质，这种过程称为水热反应。该装置就是采用水热反应技术来处理生活垃圾。
</p>
<p>
	处理方法是先将生活垃圾除去金属和塑料，然后与水在反应装置内混合，在压力10M 
Pa、温度300℃条件下使生活垃圾液化。减压后通入空气氧化，使生活垃圾分解成CO和H（以上由洪蔚供稿）二恶英类环境标准二恶英类不仅污染大气、水
质、土壤、河流、湖泊和食品等，而且污染的食品还会通过母体及母乳影响下一代。二恶英类通过胎盘和母乳转移给胎儿和婴儿，使其内分泌混乱，对发育成长十分
不利。二恶英类还具有致癌性、生殖毒性、免疫毒性和致畸形性等危害。此外，二恶英类不易分解，长期残留在环境中通过生物富集扩大污染范围，已成为全球性的
一大公害。
</p>
<p>
	为此，日本环境厅中央环境审议会对大气、水质和土壤中的二恶英类分别制订环境标准如下：大气中二恶英类质量浓度≤0. 6 pg /m水体中二恶英类质量浓度≤1 pg /L土壤中二恶英类质量分数≤250 pg /g.
</p>
<p>
	至于底质（河流、湖泊的沉积物）的环境标准，因资料积累不足，所以这次没有制订。
</p>
<br />', N'', N'推荐', N'发布', CAST(0x0000A6730124BE94 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_NewsInfo] OFF
/****** Object:  Table [dbo].[ws_MoreImgInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_MoreImgInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImgName] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_MoreImgInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_MoreImgInfo] ON
INSERT [dbo].[ws_MoreImgInfo] ([Id], [ImgName], [Type], [Orders], [AddTime]) VALUES (1, N'20170107030420_5202.jpg', 9, 1, CAST(0x0000A6F400F861F0 AS DateTime))
INSERT [dbo].[ws_MoreImgInfo] ([Id], [ImgName], [Type], [Orders], [AddTime]) VALUES (2, N'20170107030427_3676.jpg', 9, 99, CAST(0x0000A6F400F86A24 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_MoreImgInfo] OFF
/****** Object:  Table [dbo].[ws_MailInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_MailInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[Content] [nvarchar](max) NULL,
	[IsChaKan] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_MailInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ws_LinkInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_LinkInfo](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[IsXianShi] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ws_LinkInfo] ([Id], [Title], [Address], [IsXianShi], [Orders], [AddTime]) VALUES (1, N'临沂鲁锐蓬业', N'http://', 1, 1, CAST(0x0000A67300AA72C4 AS DateTime))
INSERT [dbo].[ws_LinkInfo] ([Id], [Title], [Address], [IsXianShi], [Orders], [AddTime]) VALUES (2, N'临沂网站建设', N'http://www.cn539.com', 1, 2, CAST(0x0000A5000100A400 AS DateTime))
/****** Object:  Table [dbo].[ws_JiaoDian]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_JiaoDian](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ImgName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[IsOr] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_JiaoDian] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_JiaoDian] ON
INSERT [dbo].[ws_JiaoDian] ([Id], [Title], [ImgName], [Address], [IsOr], [Orders], [AddTime]) VALUES (2, N'2', N'20160910023932_2703.jpg', N'', 1, 2, CAST(0x0000A67D00F19230 AS DateTime))
INSERT [dbo].[ws_JiaoDian] ([Id], [Title], [ImgName], [Address], [IsOr], [Orders], [AddTime]) VALUES (4, N'1', N'20170102112018_9484.png', N'', 1, 1, CAST(0x0000A6EF00BAD998 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_JiaoDian] OFF
/****** Object:  Table [dbo].[ws_JiangJinList]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_JiangJinList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rname] [nvarchar](50) NULL,
	[TuiJianRen] [nvarchar](50) NULL,
	[XinTjr] [nvarchar](50) NULL,
	[Money] [decimal](18, 2) NULL,
	[SjType] [int] NULL,
	[ShenHe] [int] NULL,
	[ShTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_JiangJinList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'升级的会员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_JiangJinList', @level2type=N'COLUMN',@level2name=N'Rname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'得到奖金的会员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_JiangJinList', @level2type=N'COLUMN',@level2name=N'TuiJianRen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扣除奖金的会员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_JiangJinList', @level2type=N'COLUMN',@level2name=N'XinTjr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是同级升级，2是跨级升级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_JiangJinList', @level2type=N'COLUMN',@level2name=N'SjType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是未付款  2是等待确认  3是已付款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_JiangJinList', @level2type=N'COLUMN',@level2name=N'ShenHe'
GO
SET IDENTITY_INSERT [dbo].[ws_JiangJinList] ON
INSERT [dbo].[ws_JiangJinList] ([Id], [Rname], [TuiJianRen], [XinTjr], [Money], [SjType], [ShenHe], [ShTime], [AddTime]) VALUES (1, N'15020359048', N'15020356014', N'admin', CAST(35.00 AS Decimal(18, 2)), 1, 1, NULL, CAST(0x0000A762009510F0 AS DateTime))
INSERT [dbo].[ws_JiangJinList] ([Id], [Rname], [TuiJianRen], [XinTjr], [Money], [SjType], [ShenHe], [ShTime], [AddTime]) VALUES (2, N'15020359048', N'15020356014', N'admin', CAST(35.00 AS Decimal(18, 2)), 1, 1, NULL, CAST(0x0000A76300A0968C AS DateTime))
INSERT [dbo].[ws_JiangJinList] ([Id], [Rname], [TuiJianRen], [XinTjr], [Money], [SjType], [ShenHe], [ShTime], [AddTime]) VALUES (3, N'15096353685', N'15020359048', N'15020356014', CAST(40.00 AS Decimal(18, 2)), 1, 3, CAST(0x0000A76A00DEBBEC AS DateTime), CAST(0x0000A76A00D7BD4C AS DateTime))
INSERT [dbo].[ws_JiangJinList] ([Id], [Rname], [TuiJianRen], [XinTjr], [Money], [SjType], [ShenHe], [ShTime], [AddTime]) VALUES (4, N'18354960311', N'13355012856', N'18263926832', CAST(1500.00 AS Decimal(18, 2)), 2, 1, NULL, CAST(0x0000A77400BE88F4 AS DateTime))
INSERT [dbo].[ws_JiangJinList] ([Id], [Rname], [TuiJianRen], [XinTjr], [Money], [SjType], [ShenHe], [ShTime], [AddTime]) VALUES (9, N'18669676160', N'15020356014', N'admin', CAST(50.00 AS Decimal(18, 2)), 1, 3, CAST(0x0000A77900195FB4 AS DateTime), CAST(0x0000A77900188B98 AS DateTime))
INSERT [dbo].[ws_JiangJinList] ([Id], [Rname], [TuiJianRen], [XinTjr], [Money], [SjType], [ShenHe], [ShTime], [AddTime]) VALUES (10, N'18669676160', N'15020356014', N'admin', CAST(55.00 AS Decimal(18, 2)), 1, 1, NULL, CAST(0x0000A779001A7ED0 AS DateTime))
INSERT [dbo].[ws_JiangJinList] ([Id], [Rname], [TuiJianRen], [XinTjr], [Money], [SjType], [ShenHe], [ShTime], [AddTime]) VALUES (11, N'18669676160', N'15020356014', N'admin', CAST(1.25 AS Decimal(18, 2)), 1, 1, NULL, CAST(0x0000A779001B4284 AS DateTime))
INSERT [dbo].[ws_JiangJinList] ([Id], [Rname], [TuiJianRen], [XinTjr], [Money], [SjType], [ShenHe], [ShTime], [AddTime]) VALUES (14, N'18253150778', N'13355012856', N'admin', CAST(5.00 AS Decimal(18, 2)), 1, 1, NULL, CAST(0x0000A78500F16F08 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_JiangJinList] OFF
/****** Object:  Table [dbo].[ws_FenXiaoList]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_FenXiaoList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uname] [nvarchar](50) NULL,
	[HjName] [nvarchar](50) NULL,
	[YiLiLv] [decimal](18, 2) NULL,
	[ErLiLv] [decimal](18, 2) NULL,
	[SanLiLv] [decimal](18, 2) NULL,
	[ZfIsOr] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_FenXiaoList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买会员名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_FenXiaoList', @level2type=N'COLUMN',@level2name=N'Uname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'获奖会员名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_FenXiaoList', @level2type=N'COLUMN',@level2name=N'HjName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是未支付  2是已支付' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_FenXiaoList', @level2type=N'COLUMN',@level2name=N'ZfIsOr'
GO
SET IDENTITY_INSERT [dbo].[ws_FenXiaoList] ON
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (1, N'15020356036', N'15020356014', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, CAST(0x0000A76900E6508C AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (2, N'15020356036', N'15020356014', CAST(0.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, CAST(0x0000A76900E65410 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (3, N'15020369999', N'15020356014', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 2, CAST(0x0000A76900E6634C AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (4, N'15020369999', N'15020356012', CAST(0.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A76900E6E308 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (5, N'15020356016', N'15020356014', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, CAST(0x0000A76900F10464 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (6, N'15020356014', N'admin', CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A77100D86738 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (7, N'15020356014', N'15020356048', CAST(0.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A77100D86738 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (8, N'15020356014', N'', CAST(0.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A779005E6D70 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (9, N'15020356014', N'admin', CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A779005E6D70 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (10, N'15020356014', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, CAST(0x0000A779005E6D70 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (11, N'15020356014', N'', CAST(0.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A77900612588 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (12, N'15020356014', N'admin', CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A77900612588 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (13, N'15020356014', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 1, CAST(0x0000A77900612588 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (14, N'15153923806', N'admin', CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A77900A6D178 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (15, N'13355012856', N'admin', CAST(55.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A77B015A4D84 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (16, N'18669676160', N'15153923806,15020356014', CAST(0.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A78400BB9194 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (17, N'18669676160', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1, CAST(0x0000A78400BB9194 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (18, N'18669676160', N'13355012856', CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A78400BB9194 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (19, N'18669676160', N'15153923806,18263926832', CAST(0.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A78400BC2C44 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (20, N'18669676160', N'', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1, CAST(0x0000A78400BC2C44 AS DateTime))
INSERT [dbo].[ws_FenXiaoList] ([Id], [Uname], [HjName], [YiLiLv], [ErLiLv], [SanLiLv], [ZfIsOr], [AddTime]) VALUES (21, N'18669676160', N'13355012856', CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x0000A78400BC2C44 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_FenXiaoList] OFF
/****** Object:  Table [dbo].[ws_FaHuoList]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_FaHuoList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Zid] [int] NULL,
	[Pid] [int] NULL,
	[Num] [int] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ws_FaHuoList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_FaHuoList] ON
INSERT [dbo].[ws_FaHuoList] ([Id], [Zid], [Pid], [Num], [Price]) VALUES (1, 1, 9, 1, CAST(4.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ws_FaHuoList] OFF
/****** Object:  Table [dbo].[ws_FaHuoInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_FaHuoInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Zname] [nvarchar](50) NULL,
	[Sname] [nvarchar](50) NULL,
	[Znum] [int] NULL,
	[Zprice] [decimal](18, 2) NULL,
	[DanHao] [nvarchar](max) NULL,
	[WuLiu] [nvarchar](50) NULL,
	[Remark] [nvarchar](50) NULL,
	[ShenHe] [int] NULL,
	[ShTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_FaHuoInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转货人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_FaHuoInfo', @level2type=N'COLUMN',@level2name=N'Zname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_FaHuoInfo', @level2type=N'COLUMN',@level2name=N'Sname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是未审核  2是已审核' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_FaHuoInfo', @level2type=N'COLUMN',@level2name=N'ShenHe'
GO
SET IDENTITY_INSERT [dbo].[ws_FaHuoInfo] ON
INSERT [dbo].[ws_FaHuoInfo] ([Id], [Zname], [Sname], [Znum], [Zprice], [DanHao], [WuLiu], [Remark], [ShenHe], [ShTime], [AddTime]) VALUES (1, N'15020356014', N'15020359048', 1, CAST(4.00 AS Decimal(18, 2)), N'danhao123', N'申通', N'111111', 2, CAST(0x0000A761011E5F54 AS DateTime), CAST(0x0000A7610115DDFC AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_FaHuoInfo] OFF
/****** Object:  Table [dbo].[ws_Contact]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Desp1] [nvarchar](max) NULL,
	[Desp] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_Contact] ON
INSERT [dbo].[ws_Contact] ([Id], [Title], [Desp1], [Desp], [Content], [AddTime]) VALUES (2, N'联系我们', N'<p>公司名称：山东优妆国际化妆品有限公司&nbsp;&nbsp; &nbsp;<br/>客服电话：0539—8077955&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/>咨询电话：18653938383&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br/>公司地址：山东省临沂市金七路与西外环路交汇处&nbsp;&nbsp; &nbsp;<br/>公司邮箱：18653938383@163.com&nbsp;&nbsp; &nbsp;<br/>公司网址：www.youzhuangguoji.com</p>', N'<table width="100%" border="0"><tbody><tr class="firstRow" align="left"><td width="40%">公司名称：山东优妆国际化妆品有限公司</td><td width="30%">咨询电话：400-888-888</td><td width="30%">座机电话：0539—8888888</td></tr><tr align="left"><td>公司地址：xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</td><td>邮箱：youzhuangguoji@163.com</td><td>网址：www.youzhuangguoji.com</td></tr></tbody></table>', N'<p>联系电话：18653938383 &nbsp;0539—8077955 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br/>康经理：18660560415 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/>赵经理：15953978076</p><p>李经理1：18769903106</p><p>李经理2：13355012856</p><p>高经理：18754156627<br/>电子邮箱：18653938383@163.com<br/></p><p>微信号：shengfulian888</p><p>公司网址：http://www.youzhuangguoji.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/>公司地址：山东省临沂市金七路与西外环路交汇处</p>', CAST(0x0000A77400EEC3D4 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_Contact] OFF
/****** Object:  Table [dbo].[ws_ChongZhiInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_ChongZhiInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rname] [nvarchar](50) NULL,
	[Money] [decimal](24, 0) NULL,
	[ShenHe] [int] NULL,
	[ShTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_ChongZhiInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1是未审核  2是已审核' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_ChongZhiInfo', @level2type=N'COLUMN',@level2name=N'ShenHe'
GO
SET IDENTITY_INSERT [dbo].[ws_ChongZhiInfo] ON
INSERT [dbo].[ws_ChongZhiInfo] ([Id], [Rname], [Money], [ShenHe], [ShTime], [AddTime]) VALUES (1, N'18669676160', CAST(200 AS Decimal(24, 0)), 2, NULL, CAST(0x0000A77900230604 AS DateTime))
INSERT [dbo].[ws_ChongZhiInfo] ([Id], [Rname], [Money], [ShenHe], [ShTime], [AddTime]) VALUES (2, N'15020356014', CAST(100 AS Decimal(24, 0)), 1, NULL, CAST(0x0000A785010DAC54 AS DateTime))
INSERT [dbo].[ws_ChongZhiInfo] ([Id], [Rname], [Money], [ShenHe], [ShTime], [AddTime]) VALUES (3, N'15953978076', CAST(125 AS Decimal(24, 0)), 1, NULL, CAST(0x0000A785010DAC54 AS DateTime))
INSERT [dbo].[ws_ChongZhiInfo] ([Id], [Rname], [Money], [ShenHe], [ShTime], [AddTime]) VALUES (4, N'13345099633', CAST(100 AS Decimal(24, 0)), 1, NULL, CAST(0x0000A785010DAC54 AS DateTime))
INSERT [dbo].[ws_ChongZhiInfo] ([Id], [Rname], [Money], [ShenHe], [ShTime], [AddTime]) VALUES (5, N'13345099633', CAST(200 AS Decimal(24, 0)), 1, NULL, CAST(0x0000A785010DAC54 AS DateTime))
INSERT [dbo].[ws_ChongZhiInfo] ([Id], [Rname], [Money], [ShenHe], [ShTime], [AddTime]) VALUES (6, N'15020356014', CAST(300 AS Decimal(24, 0)), 1, NULL, CAST(0x0000A785010DAC54 AS DateTime))
INSERT [dbo].[ws_ChongZhiInfo] ([Id], [Rname], [Money], [ShenHe], [ShTime], [AddTime]) VALUES (7, N'15020356014', CAST(10 AS Decimal(24, 0)), 2, CAST(0x0000A7A301499BB0 AS DateTime), CAST(0x0000A7A201531DAC AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_ChongZhiInfo] OFF
/****** Object:  Table [dbo].[ws_CaseType]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_CaseType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_CaseType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_CaseType] ON
INSERT [dbo].[ws_CaseType] ([Id], [Title], [Content], [Orders], [AddTime]) VALUES (1, N'回收案例', N'', 1, CAST(0x0000A67D00ED2628 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_CaseType] OFF
/****** Object:  Table [dbo].[ws_CaseInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_CaseInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ImgName] [nvarchar](max) NULL,
	[VideoName] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[Desp] [nvarchar](max) NULL,
	[Dis] [nvarchar](max) NULL,
	[Jis] [nvarchar](max) NULL,
	[Fis] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_CaseInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_CaseInfo] ON
INSERT [dbo].[ws_CaseInfo] ([Id], [Title], [ImgName], [VideoName], [Type], [Desp], [Dis], [Jis], [Fis], [Orders], [AddTime]) VALUES (6, N'回收案例展示', N'20170513095102_1594.jpg', N'20170513095033.flv', 1, N'', N'', N'推荐', N'发布', 1, CAST(0x0000A77200A25508 AS DateTime))
INSERT [dbo].[ws_CaseInfo] ([Id], [Title], [ImgName], [VideoName], [Type], [Desp], [Dis], [Jis], [Fis], [Orders], [AddTime]) VALUES (7, N'回收案例展示', N'', NULL, 1, N'', N'', N'推荐', N'发布', 2, CAST(0x0000A67D00EF3328 AS DateTime))
INSERT [dbo].[ws_CaseInfo] ([Id], [Title], [ImgName], [VideoName], [Type], [Desp], [Dis], [Jis], [Fis], [Orders], [AddTime]) VALUES (8, N'回收案例展示', N'', NULL, 1, N'', N'', N'推荐', N'发布', 3, CAST(0x0000A67D00EDAE18 AS DateTime))
INSERT [dbo].[ws_CaseInfo] ([Id], [Title], [ImgName], [VideoName], [Type], [Desp], [Dis], [Jis], [Fis], [Orders], [AddTime]) VALUES (9, N'回收案例展示', N'', NULL, 1, N'', N'', N'推荐', N'发布', 99, CAST(0x0000A67D00EDB8A4 AS DateTime))
INSERT [dbo].[ws_CaseInfo] ([Id], [Title], [ImgName], [VideoName], [Type], [Desp], [Dis], [Jis], [Fis], [Orders], [AddTime]) VALUES (10, N'回收案例展示', N'', NULL, 1, N'', N'', N'推荐', N'发布', 99, CAST(0x0000A67D00EF3904 AS DateTime))
INSERT [dbo].[ws_CaseInfo] ([Id], [Title], [ImgName], [VideoName], [Type], [Desp], [Dis], [Jis], [Fis], [Orders], [AddTime]) VALUES (11, N'回收案例展示', N'', NULL, 1, N'', N'', N'推荐', N'发布', 99, CAST(0x0000A67D00EDCC90 AS DateTime))
INSERT [dbo].[ws_CaseInfo] ([Id], [Title], [ImgName], [VideoName], [Type], [Desp], [Dis], [Jis], [Fis], [Orders], [AddTime]) VALUES (12, N'回收案例展示', N'', NULL, 1, N'', N'', N'推荐', N'发布', 99, CAST(0x0000A67D00EF4A98 AS DateTime))
INSERT [dbo].[ws_CaseInfo] ([Id], [Title], [ImgName], [VideoName], [Type], [Desp], [Dis], [Jis], [Fis], [Orders], [AddTime]) VALUES (13, N'回收案例展示', N'', NULL, 1, N'', N'', N'推荐', N'发布', 99, CAST(0x0000A67D00EF5650 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_CaseInfo] OFF
/****** Object:  Table [dbo].[ws_BuyProList]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_BuyProList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [nvarchar](50) NULL,
	[Rname] [nvarchar](50) NULL,
	[Pid] [int] NULL,
	[DanJia] [decimal](18, 2) NULL,
	[Num] [int] NULL,
	[IsOrder] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_BuyProList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1已购买  2未购买' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ws_BuyProList', @level2type=N'COLUMN',@level2name=N'IsOrder'
GO
SET IDENTITY_INSERT [dbo].[ws_BuyProList] ON
INSERT [dbo].[ws_BuyProList] ([Id], [OrderId], [Rname], [Pid], [DanJia], [Num], [IsOrder], [AddTime]) VALUES (4, N'ZX20170401104730755', N'15020356014', 10, CAST(2.00 AS Decimal(18, 2)), 2, 1, CAST(0x0000A74601196B5C AS DateTime))
INSERT [dbo].[ws_BuyProList] ([Id], [OrderId], [Rname], [Pid], [DanJia], [Num], [IsOrder], [AddTime]) VALUES (10, N'ZX20170401104730755', N'15020356014', 9, CAST(4.00 AS Decimal(18, 2)), 6, 1, CAST(0x0000A74601195C20 AS DateTime))
INSERT [dbo].[ws_BuyProList] ([Id], [OrderId], [Rname], [Pid], [DanJia], [Num], [IsOrder], [AddTime]) VALUES (11, N'ZX20170401104955568', N'15020356036', 10, CAST(2.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A74800B26D58 AS DateTime))
INSERT [dbo].[ws_BuyProList] ([Id], [OrderId], [Rname], [Pid], [DanJia], [Num], [IsOrder], [AddTime]) VALUES (12, N'ZX20170401104955568', N'15020356036', 9, CAST(4.00 AS Decimal(18, 2)), 2, 1, CAST(0x0000A74800B2758C AS DateTime))
INSERT [dbo].[ws_BuyProList] ([Id], [OrderId], [Rname], [Pid], [DanJia], [Num], [IsOrder], [AddTime]) VALUES (13, N'ZX20170401115714138', N'15020356036', 9, CAST(4.00 AS Decimal(18, 2)), 3, 1, CAST(0x0000A74800C2973C AS DateTime))
INSERT [dbo].[ws_BuyProList] ([Id], [OrderId], [Rname], [Pid], [DanJia], [Num], [IsOrder], [AddTime]) VALUES (14, N'ZX20170401134033459', N'15020356036', 9, CAST(4.00 AS Decimal(18, 2)), 3, 1, CAST(0x0000A74800E15910 AS DateTime))
INSERT [dbo].[ws_BuyProList] ([Id], [OrderId], [Rname], [Pid], [DanJia], [Num], [IsOrder], [AddTime]) VALUES (15, N'ZX20170401153252220', N'15020356036', 9, CAST(4.00 AS Decimal(18, 2)), 4, 1, CAST(0x0000A74800FA4E20 AS DateTime))
INSERT [dbo].[ws_BuyProList] ([Id], [OrderId], [Rname], [Pid], [DanJia], [Num], [IsOrder], [AddTime]) VALUES (17, N'ZX20170413152711828', N'15020356014', 10, CAST(2.00 AS Decimal(18, 2)), 3, 1, CAST(0x0000A75400B70CF0 AS DateTime))
INSERT [dbo].[ws_BuyProList] ([Id], [OrderId], [Rname], [Pid], [DanJia], [Num], [IsOrder], [AddTime]) VALUES (18, N'ZX20170413152711828', N'15020356014', 9, CAST(4.00 AS Decimal(18, 2)), 2, 1, CAST(0x0000A75400F44CA0 AS DateTime))
INSERT [dbo].[ws_BuyProList] ([Id], [OrderId], [Rname], [Pid], [DanJia], [Num], [IsOrder], [AddTime]) VALUES (19, N'ZX20170627195645158', N'15020356014', 9, CAST(8.00 AS Decimal(18, 2)), 12, 1, CAST(0x0000A79E01574CC4 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_BuyProList] OFF
/****** Object:  Table [dbo].[ws_BackUserRole]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_BackUserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[Remarks] [nvarchar](max) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_BackUserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_BackUserRole] ON
INSERT [dbo].[ws_BackUserRole] ([Id], [Title], [Orders], [Remarks], [AddTime]) VALUES (1, N'程序调试组', 1, N'', CAST(0x0000A4E400BA7AAC AS DateTime))
INSERT [dbo].[ws_BackUserRole] ([Id], [Title], [Orders], [Remarks], [AddTime]) VALUES (2, N'普通管理员', 2, N'普通管理员', CAST(0x0000A4E400BA840C AS DateTime))
INSERT [dbo].[ws_BackUserRole] ([Id], [Title], [Orders], [Remarks], [AddTime]) VALUES (3, N'网站总管理', 3, N'网站总管理', CAST(0x0000A4E400BA8D6C AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_BackUserRole] OFF
/****** Object:  Table [dbo].[ws_BackUserInfo]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_BackUserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Pwd] [nvarchar](50) NULL,
	[Remarks] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[Orders] [int] NULL,
	[LastTime] [datetime] NULL,
	[NowTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_BackUserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_BackUserInfo] ON
INSERT [dbo].[ws_BackUserInfo] ([Id], [UserName], [Pwd], [Remarks], [Type], [Orders], [LastTime], [NowTime], [AddTime]) VALUES (1, N'admin', N'Aa123456', N'网站总管理', 3, 2, NULL, CAST(0x0000A7A301537A40 AS DateTime), CAST(0x0000A4E400BF2F5C AS DateTime))
INSERT [dbo].[ws_BackUserInfo] ([Id], [UserName], [Pwd], [Remarks], [Type], [Orders], [LastTime], [NowTime], [AddTime]) VALUES (3, N'stmup', N'Stmup1688', N'程序调试', 1, 1, CAST(0x0000A7A301530D44 AS DateTime), CAST(0x0000A7A30153AB78 AS DateTime), CAST(0x0000A4E400C0A65C AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_BackUserInfo] OFF
/****** Object:  Table [dbo].[ws_BackUserCompetence]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_BackUserCompetence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[Url] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[Remarks] [nvarchar](max) NULL,
	[IsDingBu] [nvarchar](50) NULL,
	[ImgName] [nvarchar](50) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_BackUserCompetence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_BackUserCompetence] ON
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (3, N'系统设置', 0, N'', 2, N'', N'', NULL, CAST(0x0000A71900E08E54 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (5, N'会员列表', 0, N'', 4, N'', NULL, NULL, CAST(0x0000A6F300A4AE34 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (6, N'网站配置', 3, N'Website/Profiles.aspx', 1, N'', N'展示', N'20170213014848_7168.png', CAST(0x0000A71900E3A300 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (7, N'后台管理员', 0, N'', 1, N'', NULL, NULL, CAST(0x0000A4E400E5C068 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (8, N'用户管理', 7, N'ManagesUser/UserList.aspx', 1, N'', NULL, NULL, CAST(0x0000A4E400E5D904 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (9, N'角色管理', 7, N'ManagesUser/UserRole.aspx', 2, N'', NULL, NULL, CAST(0x0000A4E400E5E840 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (10, N'权限管理', 7, N'ManagesUser/UserCompe.aspx', 3, N'', NULL, NULL, CAST(0x0000A4E400E5F8A8 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (11, N'首页模块', 0, N'', 3, N'', NULL, NULL, CAST(0x0000A4E400E63340 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (12, N'焦点图', 11, N'JiaoDian/Info.aspx', 1, N'', NULL, NULL, CAST(0x0000A4E400E64858 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (17, N'会员列表', 5, N'FrontUser/UserList.aspx', 2, N'', NULL, NULL, CAST(0x0000A7150098A558 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (18, N'代理转货记录', 85, N'ZhuanHuo/Info.aspx', 3, N'', N'', NULL, CAST(0x0000A77B00D2D188 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (19, N'会员升级审核', 5, N'UpgradeList/Info.aspx', 3, N'', N'', NULL, CAST(0x0000A71B009C318C AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (20, N'新闻动态', 0, N'', 8, N'', NULL, NULL, CAST(0x0000A4E400E71B48 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (21, N'产品展示', 0, N'', 9, N'', NULL, NULL, CAST(0x0000A4E400E7237C AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (22, N'关于我们', 0, N'', 7, N'', N'', NULL, CAST(0x0000A76D00A0F6A4 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (24, N'单篇文章', 0, N'', 6, N'', NULL, NULL, CAST(0x0000A71300A17B10 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (25, N'留言反馈', 0, N'', 13, N'', NULL, NULL, CAST(0x0000A4E400E74A28 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (26, N'扩展功能', 0, N'', 14, N'', NULL, NULL, CAST(0x0000A4E400E755E0 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (27, N'新闻类别', 20, N'News/NewsType.aspx', 1, N'', NULL, NULL, CAST(0x0000A4E400E77B60 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (28, N'新闻列表', 20, N'News/NewsInfo.aspx', 2, N'', N'展示', N'20170213015029_3035.png', CAST(0x0000A71900E4195C AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (29, N'产品类别', 21, N'Product/ProType.aspx', 1, N'', NULL, NULL, CAST(0x0000A4E400E7A338 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (30, N'产品列表', 21, N'Product/ProductInfo.aspx', 2, N'', N'展示', N'20170213015047_4456.png', CAST(0x0000A71900E42E74 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (32, N'代理级别', 3, N'AgentLevel/Info.aspx', 2, N'', N'', NULL, CAST(0x0000A74500F8D978 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (34, N'文章类别', 24, N'SinglePage/Type.aspx', 1, N'', NULL, NULL, CAST(0x0000A71300A1A1BC AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (35, N'内页留言', 25, N'Message/MessageList.aspx', 1, N'', NULL, NULL, CAST(0x0000A4E400E81868 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (36, N'在线客服', 26, N'QqKeFu/AInfo.aspx', 1, N'', NULL, NULL, CAST(0x0000A4E400E83938 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (47, N'友情链接', 11, N'Links/Info.aspx', 3, N'', NULL, NULL, CAST(0x0000A5E1010CFC8C AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (51, N'视频分类', 11, N'Video/Type.aspx', 4, N'', NULL, NULL, CAST(0x0000A50700C0777C AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (52, N'视频中心', 11, N'Video/Info.aspx', 5, N'', NULL, NULL, CAST(0x0000A50700C09018 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (64, N'财务管理', 0, N'', 5, N'', NULL, NULL, CAST(0x0000A6F300F062AC AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (65, N'分类广告', 21, N'Product/ProAdver.aspx', 3, N'', NULL, NULL, CAST(0x0000A6EC00E29B54 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (66, N'分销记录', 64, N'FenXiao/FxInfo.aspx', 1, N'', N'', NULL, CAST(0x0000A79200937920 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (67, N'利率设置', 3, N'RateInstall/Install.aspx', 3, N'', N'', NULL, CAST(0x0000A74500F8E2D8 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (68, N'公司简介', 22, N'AboutUs/AInfo.aspx', 1, N'', N'', N'20170213015058_4682.png', CAST(0x0000A76D00A5D200 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (69, N'首页广告位', 11, N'Advertising/Info.aspx', 2, N'', NULL, NULL, CAST(0x0000A6EF011E32CC AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (71, N'单篇文章', 24, N'SinglePage/Info.aspx', 2, N'', N'展示', N'20170213015124_1827.png', CAST(0x0000A71900E459D0 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (78, N'公司账号', 5, N'Company/AInfo.aspx', 1, N'', NULL, NULL, CAST(0x0000A7150098EA7C AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (83, N'订单管理', 85, N'OrderList/Info.aspx', 1, N'', N'', N'', CAST(0x0000A79F014D6858 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (85, N'订单管理', 0, N'', 5, N'', N'', N'', CAST(0x0000A79F014D3F54 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (86, N'奖金记录', 64, N'JiangJin/Info.aspx', 6, N'', N'', N'', CAST(0x0000A7A3014CCED4 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (87, N'会员产品销量', 85, N'UserProSales/Info.aspx', 2, N'', N'', N'', CAST(0x0000A769011885AC AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (88, N'类别展示', 22, N'AboutUs/AboutUsType.aspx', 2, N'', N'', N'', CAST(0x0000A76D00A5E718 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (89, N'列表图片', 22, N'AboutUs/ImgInfo.aspx', 3, N'', N'', N'', CAST(0x0000A76D00A5F528 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (90, N'达人推荐', 0, N'', 10, N'', N'', N'', CAST(0x0000A76D01042A58 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (91, N'招商加盟', 0, N'', 11, N'', N'', N'', CAST(0x0000A76D0104742C AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (92, N'联系我们', 0, N'', 12, N'', N'', N'', CAST(0x0000A76D01047EB8 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (93, N'提现审核', 64, N'TiXian/TiXian.aspx', 4, N'', N'', N'', CAST(0x0000A7A3014D0CF0 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (94, N'达人推荐', 90, N'Case/Info.aspx', 2, N'', N'', N'', CAST(0x0000A76D0104FD48 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (95, N'招募合伙人', 91, N'Attract/Info.aspx', 1, N'', N'', N'', CAST(0x0000A76D01147890 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (96, N'联系我们', 92, N'Contact/ContactInfo.aspx', 1, N'', N'', N'', CAST(0x0000A76D0115BE58 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (97, N'零售转货记录', 85, N'ZhuanHuoLs/Info.aspx', 4, N'', N'', N'', CAST(0x0000A77B00D8CF84 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (98, N'会员自动升级', 5, N'UpdateZdInfo/Info.aspx', 4, N'', N'', N'', CAST(0x0000A77B01187B20 AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (99, N'充值记录', 64, N'ChongZhiList/CzList.aspx', 3, N'', N'', N'', CAST(0x0000A7A2015AE12C AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (100, N'充值审核', 64, N'ChongZhiList/ChongZhi.aspx', 2, N'', N'', N'', CAST(0x0000A7A2015BF5BC AS DateTime))
INSERT [dbo].[ws_BackUserCompetence] ([Id], [Title], [Type], [Url], [Orders], [Remarks], [IsDingBu], [ImgName], [AddTime]) VALUES (101, N'提现记录', 64, N'TiXian/TxList.aspx', 5, N'', N'', N'', CAST(0x0000A7A301503204 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_BackUserCompetence] OFF
/****** Object:  Table [dbo].[ws_BackLimitTable]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_BackLimitTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogId] [int] NULL,
	[FatherId] [nvarchar](max) NULL,
	[SonId] [nvarchar](max) NULL,
 CONSTRAINT [PK_ws_BackLimitTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_BackLimitTable] ON
INSERT [dbo].[ws_BackLimitTable] ([Id], [LogId], [FatherId], [SonId]) VALUES (1, 1, N'7,3,11,5,64,85,24,22,20,21,', N'8,9,10,6,67,12,69,47,78,17,100,99,93,101,83,34,71,68,27,28,29,30,65,')
INSERT [dbo].[ws_BackLimitTable] ([Id], [LogId], [FatherId], [SonId]) VALUES (2, 3, N'7,3,11,5,20,21,22,53,58,60,24,25,26,', N'8,9,10,6,12,47,51,52,17,18,19,27,28,29,30,62,32,54,57,59,63,61,34,35,36,')
SET IDENTITY_INSERT [dbo].[ws_BackLimitTable] OFF
/****** Object:  Table [dbo].[ws_AgentLevel]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_AgentLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Money] [decimal](24, 2) NULL,
	[Level] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_AgentLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ws_AgentLevel] ON [dbo].[ws_AgentLevel] 
(
	[Level] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_AgentLevel] ON
INSERT [dbo].[ws_AgentLevel] ([Id], [Title], [Money], [Level], [AddTime]) VALUES (1, N'联合创始人', CAST(100.00 AS Decimal(24, 2)), 1, CAST(0x0000A74500F7DFDC AS DateTime))
INSERT [dbo].[ws_AgentLevel] ([Id], [Title], [Money], [Level], [AddTime]) VALUES (2, N'总代理', CAST(80.00 AS Decimal(24, 2)), 2, CAST(0x0000A74500F7E6E4 AS DateTime))
INSERT [dbo].[ws_AgentLevel] ([Id], [Title], [Money], [Level], [AddTime]) VALUES (3, N'省级代理', CAST(60.00 AS Decimal(24, 2)), 3, CAST(0x0000A74500F7E93C AS DateTime))
INSERT [dbo].[ws_AgentLevel] ([Id], [Title], [Money], [Level], [AddTime]) VALUES (4, N'市级代理', CAST(50.00 AS Decimal(24, 2)), 4, CAST(0x0000A74500F7EB94 AS DateTime))
INSERT [dbo].[ws_AgentLevel] ([Id], [Title], [Money], [Level], [AddTime]) VALUES (5, N'特约代理', CAST(30.00 AS Decimal(24, 2)), 5, CAST(0x0000A74500F7ECC0 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_AgentLevel] OFF
/****** Object:  Table [dbo].[ws_Advertising]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_Advertising](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ImgName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[IsOr] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_Advertising] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_Advertising] ON
INSERT [dbo].[ws_Advertising] ([Id], [Title], [ImgName], [Address], [IsOr], [Orders], [AddTime]) VALUES (1, N'banner下方-右侧', N'20170102052534_8549.png', N'http://', 1, 1, CAST(0x0000A6EF011F2C68 AS DateTime))
INSERT [dbo].[ws_Advertising] ([Id], [Title], [ImgName], [Address], [IsOr], [Orders], [AddTime]) VALUES (2, N'banner下方-左侧', N'20170102052523_4192.png', N'http://', 1, 2, CAST(0x0000A6EF011F1F84 AS DateTime))
INSERT [dbo].[ws_Advertising] ([Id], [Title], [ImgName], [Address], [IsOr], [Orders], [AddTime]) VALUES (3, N'1F上方广告', N'20170102055034_1996.png', N'http://', 1, 3, CAST(0x0000A6EF01260A38 AS DateTime))
INSERT [dbo].[ws_Advertising] ([Id], [Title], [ImgName], [Address], [IsOr], [Orders], [AddTime]) VALUES (4, N'手机广告位', N'20170509103304_9339.jpg', N'http://', 1, 99, CAST(0x0000A76E00ADE080 AS DateTime))
INSERT [dbo].[ws_Advertising] ([Id], [Title], [ImgName], [Address], [IsOr], [Orders], [AddTime]) VALUES (5, N'手机广告位', N'20170509103314_0854.jpg', N'http://', 1, 99, CAST(0x0000A76E00ADEC38 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_Advertising] OFF
/****** Object:  Table [dbo].[ws_AboutUsType]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_AboutUsType](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Desp] [nvarchar](max) NULL,
	[GuiZe] [int] NULL,
	[IsOr] [int] NULL,
	[Orders] [int] NULL,
	[AddTime] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ws_AboutUsType] ([Id], [Title], [Desp], [GuiZe], [IsOr], [Orders], [AddTime]) VALUES (5, N'生产车间', N'<img src="/admin_/Images/proImg/image/20160408/20160408144108_7238.jpg" alt="" width="100%" />', 1, NULL, 1, CAST(0x0000A5E200F210C0 AS DateTime))
INSERT [dbo].[ws_AboutUsType] ([Id], [Title], [Desp], [GuiZe], [IsOr], [Orders], [AddTime]) VALUES (6, N'公司活动', N'', 2, NULL, 99, CAST(0x0000A76D00DE98C4 AS DateTime))
/****** Object:  Table [dbo].[ws_AboutUsImg]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_AboutUsImg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[ImgName] [nvarchar](max) NULL,
	[Desp] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[Dis] [nvarchar](50) NULL,
	[Jis] [nvarchar](50) NULL,
	[Fis] [nvarchar](50) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_AboutUsImg] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ws_About]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_About](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ImgName] [nvarchar](max) NULL,
	[Desp1] [nvarchar](max) NULL,
	[Desp] [nvarchar](max) NULL,
	[IsOr] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_ws_About] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ws_About] ON
INSERT [dbo].[ws_About] ([Id], [Title], [ImgName], [Desp1], [Desp], [IsOr], [AddTime]) VALUES (11, N'公司简介', N'', N'', N'<p>山东优妆国际日化用品有限公司，是由中华民族老品牌安安国际，20年日化用品市场精英临沂市瑞缇商贸有限公司，以及专注微商、大学生、企业培训多年的山东龙岸企业管理咨询有限公司合作的新一代公司。<br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 公司以微商的方法聚人；以优质产品服务人；以培训文化成就人。<br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 公司完美打造了线上与线下无缝结合的模式，真实有效的帮助实体企业开发线上渠道，加强客户亲密度，增加营业额。 帮助每一个有理想，有目标的勇士们开启财富梦想，走向人生财富巅峰！ 帮助每一个优妆家人将生命更好的绽放！<br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 企业情怀：真诚微商、幸福微商、智慧微商<br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 企业构成：安安国际+龙岸集团+瑞缇商贸<br/>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 民族老品牌生产 + 落地、全面的培训 + 20年日化用品市场经验</p>', 1, CAST(0x0000A76D00AA6964 AS DateTime))
SET IDENTITY_INSERT [dbo].[ws_About] OFF
/****** Object:  View [dbo].[ZhuanUserProView]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ZhuanUserProView]
AS
SELECT     a.Pid, a.Num AS Znum, b.Rname, c.Title
FROM         dbo.ws_UserProList AS a LEFT OUTER JOIN
                      dbo.ws_RegisterInfo AS b ON a.Uid = b.Id LEFT OUTER JOIN
                      dbo.ws_ProductInfo AS c ON a.Pid = c.Id
GROUP BY a.Pid, a.Num, b.Rname, c.Title
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 234
               Bottom = 125
               Right = 407
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 445
               Bottom = 125
               Right = 603
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ZhuanUserProView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ZhuanUserProView'
GO
/****** Object:  View [dbo].[UserProView]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserProView]
AS
SELECT     a.Uid, b.Rname, b.Uname, SUM(a.Num) AS snum
FROM         dbo.ws_UserProList AS a LEFT OUTER JOIN
                      dbo.ws_RegisterInfo AS b ON a.Uid = b.Id LEFT OUTER JOIN
                      dbo.ws_ProductInfo AS c ON a.Pid = c.Id
GROUP BY a.Uid, b.Rname, b.Uname
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 177
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 215
               Bottom = 125
               Right = 372
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 410
               Bottom = 125
               Right = 549
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserProView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserProView'
GO
/****** Object:  View [dbo].[ProNumView]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProNumView]
AS
SELECT     c.Title, a.Pid, a.Num, r.Rname, d.snum, e.znum
FROM         dbo.ws_UserProList AS a LEFT OUTER JOIN
                      dbo.ws_RegisterInfo AS r ON a.Uid = r.Id LEFT OUTER JOIN
                      dbo.ws_ProductInfo AS c ON a.Pid = c.Id LEFT OUTER JOIN
                          (SELECT     a.Sname, b.Pid, SUM(b.Num) AS snum
                            FROM          dbo.ws_ZhuanInfo AS a LEFT OUTER JOIN
                                                   dbo.ws_ZhuanList AS b ON a.Id = b.Zid
                            GROUP BY a.Sname, b.Pid) AS d ON d.Pid = a.Pid AND r.Rname = d.Sname LEFT OUTER JOIN
                          (SELECT     a.Zname, b.Pid, SUM(b.Num) AS znum
                            FROM          dbo.ws_ZhuanInfo AS a LEFT OUTER JOIN
                                                   dbo.ws_ZhuanList AS b ON a.Id = b.Zid
                            GROUP BY a.Zname, b.Pid) AS e ON e.Pid = a.Pid AND r.Rname = e.Zname
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 125
               Right = 375
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 413
               Bottom = 125
               Right = 555
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 593
               Bottom = 110
               Right = 735
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 773
               Bottom = 110
               Right = 915
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProNumView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProNumView'
GO
/****** Object:  View [dbo].[BuyListView]    Script Date: 07/02/2017 16:46:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BuyListView]
AS
SELECT     A.Rname, A.Num, A.OrderId, A.DanJia, B.Title, B.ImgName, B.XPrice, A.IsOrder, A.AddTime, A.Id, B.Id AS Pid, B.Type AS btype
FROM         dbo.ws_BuyProList AS A INNER JOIN
                      dbo.ws_ProductInfo AS B ON A.Pid = B.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 177
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 215
               Bottom = 125
               Right = 354
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BuyListView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BuyListView'
GO
/****** Object:  Default [DF_ws_ZhuanInfo_Ztype]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_ZhuanInfo] ADD  CONSTRAINT [DF_ws_ZhuanInfo_Ztype]  DEFAULT ((1)) FOR [Ztype]
GO
/****** Object:  Default [DF_ws_ZhuanInfo_ShenHe]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_ZhuanInfo] ADD  CONSTRAINT [DF_ws_ZhuanInfo_ShenHe]  DEFAULT ((1)) FOR [ShenHe]
GO
/****** Object:  Default [DF_ws_UserProList_Num]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_UserProList] ADD  CONSTRAINT [DF_ws_UserProList_Num]  DEFAULT ((0)) FOR [Num]
GO
/****** Object:  Default [DF_ws_UpdateZdInfo_ShenHe]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_UpdateZdInfo] ADD  CONSTRAINT [DF_ws_UpdateZdInfo_ShenHe]  DEFAULT ((1)) FOR [ShenHe]
GO
/****** Object:  Default [DF_ws_UpdateInfo_ShenHe]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_UpdateInfo] ADD  CONSTRAINT [DF_ws_UpdateInfo_ShenHe]  DEFAULT ((2)) FOR [ShenHe]
GO
/****** Object:  Default [DF_ws_RegisterInfo_Userlevel]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_RegisterInfo] ADD  CONSTRAINT [DF_ws_RegisterInfo_Userlevel]  DEFAULT ((0)) FOR [Userlevel]
GO
/****** Object:  Default [DF_ws_RegisterInfo_Jiangjin]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_RegisterInfo] ADD  CONSTRAINT [DF_ws_RegisterInfo_Jiangjin]  DEFAULT ((0)) FOR [Jiangjin]
GO
/****** Object:  Default [DF_ws_RegisterInfo_YuErMoney]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_RegisterInfo] ADD  CONSTRAINT [DF_ws_RegisterInfo_YuErMoney]  DEFAULT ((0)) FOR [YuErMoney]
GO
/****** Object:  Default [DF_ws_RegisterInfo_IsJiHuo]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_RegisterInfo] ADD  CONSTRAINT [DF_ws_RegisterInfo_IsJiHuo]  DEFAULT ((1)) FOR [IsJiHuo]
GO
/****** Object:  Default [DF_ws_RateInstall_YiJiBili]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_RateInstall] ADD  CONSTRAINT [DF_ws_RateInstall_YiJiBili]  DEFAULT ((0)) FOR [YiJiBili]
GO
/****** Object:  Default [DF_ws_RateInstall_ErJiBili]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_RateInstall] ADD  CONSTRAINT [DF_ws_RateInstall_ErJiBili]  DEFAULT ((0)) FOR [ErJiBili]
GO
/****** Object:  Default [DF_ws_RateInstall_SanJiBili]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_RateInstall] ADD  CONSTRAINT [DF_ws_RateInstall_SanJiBili]  DEFAULT ((0)) FOR [SanJiBili]
GO
/****** Object:  Default [DF_ws_RateInstall_TxBili]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_RateInstall] ADD  CONSTRAINT [DF_ws_RateInstall_TxBili]  DEFAULT ((0)) FOR [TxBili]
GO
/****** Object:  Default [DF_ws_ProType_IsXianShi]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_ProType] ADD  CONSTRAINT [DF_ws_ProType_IsXianShi]  DEFAULT ((1)) FOR [IsXianShi]
GO
/****** Object:  Default [DF_ws_ProType_IsDaoHang]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_ProType] ADD  CONSTRAINT [DF_ws_ProType_IsDaoHang]  DEFAULT ((1)) FOR [IsDaoHang]
GO
/****** Object:  Default [DF_ws_ProductInfo_Znum]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_ProductInfo] ADD  CONSTRAINT [DF_ws_ProductInfo_Znum]  DEFAULT ((0)) FOR [Znum]
GO
/****** Object:  Default [DF_ws_ProductInfo_ZhanShi]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_ProductInfo] ADD  CONSTRAINT [DF_ws_ProductInfo_ZhanShi]  DEFAULT ((1)) FOR [IsZhanShi]
GO
/****** Object:  Default [DF_ws_OrderList_Znum]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_OrderList] ADD  CONSTRAINT [DF_ws_OrderList_Znum]  DEFAULT ((0)) FOR [Znum]
GO
/****** Object:  Default [DF_ws_OrderList_IsFaHuo]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_OrderList] ADD  CONSTRAINT [DF_ws_OrderList_IsFaHuo]  DEFAULT ((2)) FOR [IsFaHuo]
GO
/****** Object:  Default [DF_ws_MoreImgInfo_Orders]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_MoreImgInfo] ADD  CONSTRAINT [DF_ws_MoreImgInfo_Orders]  DEFAULT ((99)) FOR [Orders]
GO
/****** Object:  Default [DF_ws_JiangJinList_ShenHe]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_JiangJinList] ADD  CONSTRAINT [DF_ws_JiangJinList_ShenHe]  DEFAULT ((1)) FOR [ShenHe]
GO
/****** Object:  Default [DF_ws_FenXiaoList_YiLiLv]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_FenXiaoList] ADD  CONSTRAINT [DF_ws_FenXiaoList_YiLiLv]  DEFAULT ((0)) FOR [YiLiLv]
GO
/****** Object:  Default [DF_ws_FenXiaoList_ErLiLv]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_FenXiaoList] ADD  CONSTRAINT [DF_ws_FenXiaoList_ErLiLv]  DEFAULT ((0)) FOR [ErLiLv]
GO
/****** Object:  Default [DF_ws_FenXiaoList_SanLiLv]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_FenXiaoList] ADD  CONSTRAINT [DF_ws_FenXiaoList_SanLiLv]  DEFAULT ((0)) FOR [SanLiLv]
GO
/****** Object:  Default [DF_ws_FenXiaoList_ZfIsOr]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_FenXiaoList] ADD  CONSTRAINT [DF_ws_FenXiaoList_ZfIsOr]  DEFAULT ((1)) FOR [ZfIsOr]
GO
/****** Object:  Default [DF_ws_FaHuoInfo_ShenHe]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_FaHuoInfo] ADD  CONSTRAINT [DF_ws_FaHuoInfo_ShenHe]  DEFAULT ((1)) FOR [ShenHe]
GO
/****** Object:  Default [DF_ws_BuyProList_DanJia]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_BuyProList] ADD  CONSTRAINT [DF_ws_BuyProList_DanJia]  DEFAULT ((0)) FOR [DanJia]
GO
/****** Object:  Default [DF_ws_BuyProList_IsOrder]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_BuyProList] ADD  CONSTRAINT [DF_ws_BuyProList_IsOrder]  DEFAULT ((2)) FOR [IsOrder]
GO
/****** Object:  Default [DF_ws_AgentLevel_Level]    Script Date: 07/02/2017 16:46:21 ******/
ALTER TABLE [dbo].[ws_AgentLevel] ADD  CONSTRAINT [DF_ws_AgentLevel_Level]  DEFAULT ((0)) FOR [Level]
GO
