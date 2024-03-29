/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRes]') AND type in (N'U'))
ALTER TABLE [dbo].[UserRes] DROP CONSTRAINT IF EXISTS [FK_UserRes_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRes]') AND type in (N'U'))
ALTER TABLE [dbo].[UserRes] DROP CONSTRAINT IF EXISTS [FK_UserRes_Reservations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT IF EXISTS [FK_Reservations_Rooms]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT IF EXISTS [FK_Reservations_OwnerAssets]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT IF EXISTS [FK_Reservations_Locations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OwnerAssets]') AND type in (N'U'))
ALTER TABLE [dbo].[OwnerAssets] DROP CONSTRAINT IF EXISTS [FK_OwnerAssets_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OwnerAssets]') AND type in (N'U'))
ALTER TABLE [dbo].[OwnerAssets] DROP CONSTRAINT IF EXISTS [FK_OwnerAssets_ReservedStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserRes]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[UserRes]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[Rooms]
GO
/****** Object:  Table [dbo].[ReservedStatus]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[ReservedStatus]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[Reservations]
GO
/****** Object:  Table [dbo].[OwnerAssets]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[OwnerAssets]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[Locations]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/3/2019 11:27:40 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OwnerAssets]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OwnerAssets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OwnerAssets](
	[OwnerAssetID] [int] IDENTITY(1,1) NOT NULL,
	[AssetName] [varchar](50) NOT NULL,
	[OwnerID] [nvarchar](128) NOT NULL,
	[AssetPhoto] [varchar](50) NULL,
	[Description] [varchar](2000) NULL,
	[ReservedStatusID] [int] NOT NULL,
 CONSTRAINT [PK_OwnerAssets] PRIMARY KEY CLUSTERED 
(
	[OwnerAssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NOT NULL,
	[ReservationDate] [date] NOT NULL,
	[OwnerAssetID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ReservedStatus]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReservedStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReservedStatus](
	[ReservedStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[Description] [varchar](300) NOT NULL,
 CONSTRAINT [PK_ReservedStatus] PRIMARY KEY CLUSTERED 
(
	[ReservedStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rooms]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [varchar](50) NOT NULL,
	[RoomCapacity] [int] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserRes]    Script Date: 12/3/2019 11:27:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRes](
	[UserResID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ReservationID] [int] NOT NULL,
 CONSTRAINT [PK_UserRes] PRIMARY KEY CLUSTERED 
(
	[UserResID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201912022125188_InitialCreate', N'FSWDFinalProject.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C596FE436127E5F60FF83A0A7DD85D3F29119CC1ADD099CB67BD7C8F8C0B43DC9DB802DB1DBDA912845A21C1B417E591EF627ED5FD8A2445D3C7474AB0F07030C5A64F1AB62B148168B45FFEF8FFF8EBF7FF13DE31947B11B908979323A360D4CECC071C96A622674F9CD07F3FBEFFEFA97F195E3BF189F73BA3346072D493C319F280DCF2D2BB69FB08FE291EFDA5110074B3AB203DF424E609D1E1FFFD33A39B1304098806518E34F09A1AE8FD30FF89C06C4C6214D90771338D88B7939D4CC5354E316F9380E918D27E66CFED3E5CC25C8BB8F82FF609B8E1EAF47379FA7A3ACA5695C782E02A9E6D85B9A062224A08882CCE78F319ED32820AB790805C87B780D31D02D911763DE97F392BC6BB78E4F59B7ACB2610E6527310DFC9E8027675C4F96D87C2D6D9B851E419357A071FACA7A9D6A73625E3B382DFA1478A00091E1F9D48B18F1C4BC29585CC4E12DA6A3BCE128839C4500F76B107D1D55118F8CCEED8E0ABB3A1D1DB37F47C634F16812E109C1098D907764DC270BCFB57FC4AF0FC1574C2667278BE5D98777EF9173F6FE5B7CF6AEDA53E82BD0D50AA008AC25C411C8869745FF4DC3AAB7B3C48645B34A9B4C2B604B30454CE306BD7CC464459F60F29C7E308D99FB829DBC841BD72371614641231A25F0799B781E5A78B8A8B71A79B2FF1BB89EBE7B3F08D75BF4ECAED2A117F8C3C489605E7DC25E5A1B3FB96136BD6AE3FD8593CDA2C067DF75FBCA6ABFCC8324B25967022DC9038A5698D6A51B5BA5F17632690635BC59E7A8876FDA4C52D9BC95A4AC43EBCC849CC5AE67432EEF76F976B6B88B3084C14B4D8B69A4C9E09A37AE9180746468E84B933AE96A5204BAFA675E21AF7CE47A032C911DB880A7B274231F17BDFC21008344A4B7CCF7288E618570FE8DE2A706D1E1E700A2CFB19D4460B8738AFC70EBDCEE9F02826F137FC1E6C3EE780D36340FBF063364D320BA22ACD5C6781F03FB6B90D02BE25C228A1FA99D03B2CF07D7EF0E30883817B68DE37806C68C9D69008E780E784DE8D9696F38B658EDDB45997AC8F5D53E8AB0AC7EC9494B3F454D21F92A1A3295BFD224EAC760E5926EA2E6A47A51338A565139595F511958374939A55ED094A055CE8C6A300F301DA1E15DC014F6F07DC0CD366FDD5A5051E31C5648FC2F4C7004CB98738F28C5112947A0CBBAB10F67211D3EC674EB7B53CAE933F292A159AD351BD24560F8D990C21EFE6C48C584E267D7615E498783514E0CF09DE8D567AEF6392748B6EBE950EBE6AE99EF660DD04D978B380E6C379D058A90180F68D4E5071FCE688F6E64BD112324D0313074976D7950027D3345A3BA2397D8C3141B177616329CA2D8468EAC46E890D343B07C47550856464AEAC2FD43E209968E23D608B143500C33D525549E162EB1DD1079AD5A125A76DCC258DF0B1E62CD250E31610C5B35D185B93A30C20428F80883D2A6A1B155B1B86643D478ADBA316F7361CB7197E2153BB1C916DF596397DC7FDB8A61366B6C07C6D9AC922E0268837CFB30507E56E96A00E2C1E5D00C543831690C94BB543B31D0BAC6F660A07595BC3903CD8EA85DC75F38AF1E9A79D60FCABBDFD61BD5B507DBACE9E3C04C33F33DA10D85163892CDF372C12AF10B551CCE404E7E3E8BB9AB2B9A08039F635A0FD994FEAED20FB59A4144236A022C0DAD05945F0F4A40D284EA215C1ECB6B948E7B113D60F3B85B232C5FFB05D88A0DC8D8D56BD20AA1FE325534CE4EA78FA26785354846DEE9B050C1511884B878D53BDE4129BAB8ACAC982EBE701F6FB8D2313E180D0A6AF15C354ACA3B33B89672D36CD792CA21EBE3926DA425C17DD26829EFCCE05AE236DAAE248553D0C32DD84845F52D7CA0C996473A8ADDA6A81B5B5926152F185B9A94ABF10D0A4397AC2A2958BCC49867F957D36FE6FD9391FC0CC3B263454E52216DC18906115A61A1165883A433378AE925A26881589C67EAF81299726FD52CFF39CBEAF6290F62BE0FE4D4EC77D6A2E552BFB6EFCA8E09C79B416F7DE6DDA42175852DA89B1B2C3D0E79285244F1A78197F844EF6CE95B677779D5F659898C30B604F925674AD29CE4F2D687A1D320C913640B0356F835EB0F9A1E42A7FADC2BAD2A5FE7A9EA51F2C055154517CCDADB20EA1C9CB5074EF423FB8F5B2BC276E61B4F5EA902F0A29E1895FC0709AC52D71DB59EA252C5ACD7744714F250AA9042550F29ABD9263521AB156BE16934AAA6E8CE41CE2FA9A2CBB5DD91159926556845F51AD80A99C5BAEEA88A64942AB0A2BA3B769999222EA807BCA3694F37836C69D96178B33D4D83B19DD571982DB172E75F05AA14F7C4E2B7FA12182F3F48CBD29E0807B1AC2C1EB299656930F42B52EDE6BCBE20355EF7EB316BD7E1B545BF291D408FD7CF7EB76A25D2E1502429B8178744E13038E607B3F6473AD2492D23318D5C8DB0E1BFC614FB2346309AFFE24D3D17B3E53D27B841C45DE298662920E6E9F1C9A9F0B6E770DED95871EC788A83ADEEB14D7DCC7690CD459E51643FA148CEADD8E02D4A092A85ADAF89835F26E66F69ABF33402C27EA5C547C675FC48DC5F12A87888126CFC2EE78A0E939BDFE1354821E8EF6FE2994577955FFFFC256B7A64DC45309DCE8D6341D1EB0C7FFDF1452F69B2A61B48B3F6938CB73BDB6AEF1A94A8C26C59FF19C3C2A5833C61C8A5FC9B8F5EFEDE5734E533858D10154F1186C21B4485BAA706EB60699F1938F049D36706FD3AAB7E76B08E68DA27072EE90F263E38E8BE0CE52DF7B80F290E4FBB5892523DB7266C6F94BDB9EFBD49CAEBDE68A2CBB9DB3DE006CDCFDECC45796379CF836D9D8AB4E6C1B0F769F75BCF653E94F4E5D269DF6FD6F22E13951B2E9DFE54F9C9079051A7C810DA7F16F2AE6D4D170D3EF054CE7EB9C607666C7C9BDF7F46F1AE8D4D17203E7063EB95377C60B6B6AFFD73CF96D6790BDD7B16B09CD0A4B9D5514591DBB27CB3903B1CFF17011841E651668F33D569654D29B12D0C4B123D537D3E9BC8589A38125F89A2996DBFBEF20DBFB1B39CA699AD260BB489375FFF1B79739A66DE9ADCCA7DE4272BB31B5539E32DEB58538AD55BCA47AEF5A425FDBDCD676DBCA27F4BE9C78328A5367B34B7CB6F27DB7810950C39757A6417CB17C5B07756FEE623ECDFB1BB2A21D85F8024D8AEED9A05CD355906F9E62D48949308119A1B4C91035BEA4544DD25B22954B30074FABA3C0DEAB16B900576AEC95D42C3844297B1BFF06A012FE60434F14F53A8EB328FEF42F6150FD10510D36581FB3BF243E27A4E21F74C1113D24030EF82877BD9585216F65DBD1648B701E908C4D55738450FD80F3D008BEFC81C3DE3756403F3FB8857C87E2D23803A90F681A8AB7D7CE9A25584FC986394EDE1136CD8F15FBEFB3F14FAA9D5FA540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b9aaeb82-1c3d-4c0a-b29c-b83e937b0e27', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'bb4929de-407c-4ff1-8fe4-a1d6cfdae698', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'45465512-3e6a-4b83-a27a-b31b8f00ce40', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'31c87629-acb7-4e29-8628-0976e689a3c8', N'45465512-3e6a-4b83-a27a-b31b8f00ce40')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3a55ffbe-b908-465c-b504-972f051cbeaa', N'45465512-3e6a-4b83-a27a-b31b8f00ce40')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'78ac403e-e799-4955-945d-863648c5051c', N'b9aaeb82-1c3d-4c0a-b29c-b83e937b0e27')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'98aae1d5-406f-4d84-a7d9-9897826ef21b', N'bb4929de-407c-4ff1-8fe4-a1d6cfdae698')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'31c87629-acb7-4e29-8628-0976e689a3c8', N'user@finalproject.com', 0, N'APNTzTVcVT0kBYz41IPOem1qciCbdSXUCsMPUgj87c6RFLcR04vR/NTZAWyZAvTWew==', N'dd53426e-032c-4437-9e37-28feaa2e2cfd', NULL, 0, 0, NULL, 1, 0, N'user@finalproject.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3a55ffbe-b908-465c-b504-972f051cbeaa', N'testuser@finalproject.com', 0, N'AO9RH351Xr3p4mDCky/U7lrMrOS9HITWVwNNYx29OfntmvbKKBE9oa63uiUOTXaMgw==', N'fcbf8e4c-c846-4092-9c80-385b79f5cb1e', NULL, 0, 0, NULL, 1, 0, N'testuser@finalproject.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'78ac403e-e799-4955-945d-863648c5051c', N'admin@finalproject.com', 0, N'AGWIe2LkuSIDUIsvTJzpRGGsx15llGX5qtZ4zCbRnvTqATOckrrmL9t0f3Ti6O1oDA==', N'c73f252a-25d2-407c-b884-dbd54603305d', NULL, 0, 0, NULL, 1, 0, N'admin@finalproject.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'98aae1d5-406f-4d84-a7d9-9897826ef21b', N'employee@finalproject.com', 0, N'AMaBMagtQbue17Zwn5RopEagFstwD9QMsFFJD2xXiXmXRHiE+WERqMmYbkECl4YZbg==', N'4327022b-1fdc-4999-8858-1e5039b9a3d1', NULL, 0, 0, NULL, 1, 0, N'employee@finalproject.com')
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [LocationName], [Address], [City], [State], [ZipCode]) VALUES (1, N'Kansas City Convention Center', N'301 W 13th St #100', N'Kansas City', N'MO', N'64105')
INSERT [dbo].[Locations] ([LocationID], [LocationName], [Address], [City], [State], [ZipCode]) VALUES (2, N'Overland Park Convention Center', N'6000 College Blvd', N'Overland Park', N'KS', N'66211')
INSERT [dbo].[Locations] ([LocationID], [LocationName], [Address], [City], [State], [ZipCode]) VALUES (3, N'Convention Center', N'3240 Broadway Blvd', N'Kansas City', N'MO', N'64111')
INSERT [dbo].[Locations] ([LocationID], [LocationName], [Address], [City], [State], [ZipCode]) VALUES (4, N'KCI Expo Center', N'11730 N Ambassador Dr', N'Kansas City', N'MO', N'64153')
INSERT [dbo].[Locations] ([LocationID], [LocationName], [Address], [City], [State], [ZipCode]) VALUES (5, N'Baltimore Convention Center', N'1 W Pratt St', N'Baltimore', N'MD', N'21201')
INSERT [dbo].[Locations] ([LocationID], [LocationName], [Address], [City], [State], [ZipCode]) VALUES (6, N'Grand Hotel & Spa', N'2100 Baltimore Ave', N'Ocean City', N'MD', N'21842')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[OwnerAssets] ON 

INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [Description], [ReservedStatusID]) VALUES (1, N'Anime Expo 2020', N'31c87629-acb7-4e29-8628-0976e689a3c8', NULL, N'It''s an Anime Convention.', 3)
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [Description], [ReservedStatusID]) VALUES (4, N'BronyCon 2019', N'31c87629-acb7-4e29-8628-0976e689a3c8', NULL, NULL, 7)
INSERT [dbo].[OwnerAssets] ([OwnerAssetID], [AssetName], [OwnerID], [AssetPhoto], [Description], [ReservedStatusID]) VALUES (5, N'TED X', N'78ac403e-e799-4955-945d-863648c5051c', NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[OwnerAssets] OFF
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationID], [LocationID], [ReservationDate], [OwnerAssetID], [RoomID]) VALUES (1, 3, CAST(N'2019-12-03' AS Date), 1, 2)
INSERT [dbo].[Reservations] ([ReservationID], [LocationID], [ReservationDate], [OwnerAssetID], [RoomID]) VALUES (2, 2, CAST(N'2019-08-01' AS Date), 4, 3)
INSERT [dbo].[Reservations] ([ReservationID], [LocationID], [ReservationDate], [OwnerAssetID], [RoomID]) VALUES (3, 1, CAST(N'2019-12-15' AS Date), 5, 1)
SET IDENTITY_INSERT [dbo].[Reservations] OFF
SET IDENTITY_INSERT [dbo].[ReservedStatus] ON 

INSERT [dbo].[ReservedStatus] ([ReservedStatusID], [StatusName], [Description]) VALUES (2, N'Scheduled', N'The event has been scheduled, but it isn''t active or hasn''t started')
INSERT [dbo].[ReservedStatus] ([ReservedStatusID], [StatusName], [Description]) VALUES (3, N'Active', N'The event has started.')
INSERT [dbo].[ReservedStatus] ([ReservedStatusID], [StatusName], [Description]) VALUES (4, N'TBA', N'To be announced. The time is not available yet.')
INSERT [dbo].[ReservedStatus] ([ReservedStatusID], [StatusName], [Description]) VALUES (5, N'Cancelled', N'The event has been cancelled, it will not happen.')
INSERT [dbo].[ReservedStatus] ([ReservedStatusID], [StatusName], [Description]) VALUES (6, N'On Hold', N'The event is on hold, and will announce when it will be back at a later date.')
INSERT [dbo].[ReservedStatus] ([ReservedStatusID], [StatusName], [Description]) VALUES (7, N'Done', N'The event has passed, it''s done. No more.')
SET IDENTITY_INSERT [dbo].[ReservedStatus] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [RoomName], [RoomCapacity]) VALUES (1, N'Panel Room', 300)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [RoomCapacity]) VALUES (2, N'Ball Room', 1500)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [RoomCapacity]) VALUES (3, N'Conference Room', 500)
INSERT [dbo].[Rooms] ([RoomID], [RoomName], [RoomCapacity]) VALUES (4, N'Small Conference Room', 16)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'31c87629-acb7-4e29-8628-0976e689a3c8', N'Tristan', N'Muzzy')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'78ac403e-e799-4955-945d-863648c5051c', N'Tristan', N'Muzzy')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'98aae1d5-406f-4d84-a7d9-9897826ef21b', N'Tristan', N'Muzzy')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_ReservedStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets]  WITH CHECK ADD  CONSTRAINT [FK_OwnerAssets_ReservedStatus] FOREIGN KEY([ReservedStatusID])
REFERENCES [dbo].[ReservedStatus] ([ReservedStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_ReservedStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets] CHECK CONSTRAINT [FK_OwnerAssets_ReservedStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets]  WITH CHECK ADD  CONSTRAINT [FK_OwnerAssets_UserDetails] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OwnerAssets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[OwnerAssets]'))
ALTER TABLE [dbo].[OwnerAssets] CHECK CONSTRAINT [FK_OwnerAssets_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Locations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_OwnerAssets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_OwnerAssets] FOREIGN KEY([OwnerAssetID])
REFERENCES [dbo].[OwnerAssets] ([OwnerAssetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_OwnerAssets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_OwnerAssets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Rooms]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Rooms]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Rooms]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRes_Reservations]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRes]'))
ALTER TABLE [dbo].[UserRes]  WITH CHECK ADD  CONSTRAINT [FK_UserRes_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRes_Reservations]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRes]'))
ALTER TABLE [dbo].[UserRes] CHECK CONSTRAINT [FK_UserRes_Reservations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRes_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRes]'))
ALTER TABLE [dbo].[UserRes]  WITH CHECK ADD  CONSTRAINT [FK_UserRes_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRes_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRes]'))
ALTER TABLE [dbo].[UserRes] CHECK CONSTRAINT [FK_UserRes_UserDetails]
GO
