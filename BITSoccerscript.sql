USE [master]
GO
/****** Object:  Database [BITSoccer]    Script Date: 6/8/2020 10:16:50 AM ******/
CREATE DATABASE [BITSoccer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BITSoccer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BITSoccer.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BITSoccer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BITSoccer_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BITSoccer] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BITSoccer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BITSoccer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BITSoccer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BITSoccer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BITSoccer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BITSoccer] SET ARITHABORT OFF 
GO
ALTER DATABASE [BITSoccer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BITSoccer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BITSoccer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BITSoccer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BITSoccer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BITSoccer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BITSoccer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BITSoccer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BITSoccer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BITSoccer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BITSoccer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BITSoccer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BITSoccer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BITSoccer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BITSoccer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BITSoccer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BITSoccer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BITSoccer] SET RECOVERY FULL 
GO
ALTER DATABASE [BITSoccer] SET  MULTI_USER 
GO
ALTER DATABASE [BITSoccer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BITSoccer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BITSoccer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BITSoccer] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BITSoccer] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BITSoccer', N'ON'
GO
USE [BITSoccer]
GO
/****** Object:  Table [dbo].[About]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[About_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MetaTitle] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[About_Image] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[About_Slide_ID] [int] NOT NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[About_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[About_Slide]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About_Slide](
	[About_Slide_ID] [int] IDENTITY(1,1) NOT NULL,
	[Image_1] [nvarchar](255) NULL,
	[Image_2] [nvarchar](255) NULL,
	[Image_3] [nvarchar](255) NULL,
	[Image_4] [nvarchar](255) NULL,
	[Image_5] [nvarchar](255) NULL,
	[Image_6] [nvarchar](255) NULL,
 CONSTRAINT [PK_About_Slide] PRIMARY KEY CLUSTERED 
(
	[About_Slide_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Archive]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Archive](
	[Archive_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Archive] PRIMARY KEY CLUSTERED 
(
	[Archive_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[DatePay] [date] NULL,
	[Total] [decimal](18, 0) NULL,
	[TotalPaid] [decimal](18, 0) NULL,
	[Status] [bit] NULL,
	[Discount] [float] NULL,
	[VISAPay] [bit] NULL,
	[ATMPay] [bit] NULL,
	[MoMoPay] [bit] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[BillDetailID] [int] IDENTITY(1,1) NOT NULL,
	[BillID] [int] NULL,
	[ClassID] [int] NULL,
	[DateSignIN] [date] NULL,
	[DateExpierd] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Class_ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassCate_ID] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MetaTitle] [nvarchar](255) NULL,
	[Quanity] [int] NULL,
	[Prices] [decimal](18, 0) NULL,
	[PromoPrices] [decimal](18, 0) NULL,
	[Image] [nvarchar](255) NULL,
	[StartDay] [datetime] NULL,
	[EndDay] [datetime] NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](20) NULL,
	[TimeDuratuin] [nvarchar](255) NULL,
	[PartOfDay] [nvarchar](255) NULL,
	[MinQuanity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[ViewCount] [int] NULL,
	[Class_Detail_ID] [int] NOT NULL,
	[Coach_ID] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class_Category]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Category](
	[ClassCate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MetaTitle] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NOT NULL,
	[ModifyBy] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Class_Category] PRIMARY KEY CLUSTERED 
(
	[ClassCate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class_Detail]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Detail](
	[ClassDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[MetaTitle] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Class_Detail] PRIMARY KEY CLUSTERED 
(
	[ClassDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassUser]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassUser](
	[Class_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_ClassUser] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC,
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coach]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coach](
	[Coach_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MetaTilte] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[Gender] [nvarchar](20) NULL,
	[Age] [int] NULL,
	[Phone] [varchar](11) NULL,
	[Email] [varchar](20) NULL,
	[Passport] [varchar](20) NULL,
	[Image] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
	[Insta] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Level] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[User_ID] [int] NULL,
 CONSTRAINT [PK_Coach] PRIMARY KEY CLUSTERED 
(
	[Coach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Coach_Moment]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coach_Moment](
	[Coach_Moment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_Coach_Moment] PRIMARY KEY CLUSTERED 
(
	[Coach_Moment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Comment_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Class_ID] [int] NULL,
	[New_ID] [int] NULL,
	[RootCommentID] [int] NULL,
	[ReplyToCommentID] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[PostDate] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Comment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountCode]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountCode](
	[DiscountCodeID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountCode] [nvarchar](250) NULL,
	[Discount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Footer](
	[Footer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](11) NULL,
	[Facebook] [nvarchar](max) NULL,
	[Insta] [nvarchar](max) NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[Footer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Header]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Header](
	[Header_ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_Header] PRIMARY KEY CLUSTERED 
(
	[Header_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Home_Slide]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home_Slide](
	[HomeSlide_ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifyDate] [date] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Home_Slide] PRIMARY KEY CLUSTERED 
(
	[HomeSlide_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HomePage_Content]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomePage_Content](
	[Home_Content_ID] [int] IDENTITY(1,1) NOT NULL,
	[Coach_Content] [nvarchar](max) NULL,
	[HotClass_Content] [nvarchar](max) NULL,
	[Tour_Content] [nvarchar](max) NULL,
	[Stadium_Content] [nvarchar](max) NULL,
	[Archive_Content] [nvarchar](max) NULL,
	[Quote1_Content] [nvarchar](max) NULL,
	[Quote2_Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_HomePage_Content] PRIMARY KEY CLUSTERED 
(
	[Home_Content_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[News_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[NewCate_ID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[ViewsCount] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[News_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News_Category]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_Category](
	[NewCate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MetaTitle] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_News_Category] PRIMARY KEY CLUSTERED 
(
	[NewCate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsTags]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsTags](
	[Tag_ID] [int] NOT NULL,
	[News_ID] [int] NOT NULL,
 CONSTRAINT [PK_NewsTags] PRIMARY KEY CLUSTERED 
(
	[Tag_ID] ASC,
	[News_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rating]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Class_ID] [int] NULL,
	[NumberStar] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stadium]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadium](
	[Stadium_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Stadium] PRIMARY KEY CLUSTERED 
(
	[Stadium_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Tag_ID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Tag_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tourament]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tourament](
	[Tour_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MetaTitlte] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[CreaedBy] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[Team_A] [nvarchar](255) NULL,
	[Team_B] [nvarchar](255) NULL,
	[Team_A_Score] [int] NULL,
	[Team_B_Score] [int] NULL,
	[Time] [datetime] NULL,
	[Stadium_ID] [int] NOT NULL,
	[Team_A_Player] [nvarchar](max) NULL,
	[Team_B_Player] [nvarchar](max) NULL,
	[TeamARedCard] [int] NULL,
	[TeamAYellowCart] [int] NULL,
	[TeamAFouls_Conceded] [int] NULL,
	[TeamBRedCard] [int] NULL,
	[TeamBYellowCart] [int] NULL,
	[TeamBFouls_Conceded] [int] NULL,
	[TeamAFormation] [nvarchar](50) NULL,
	[TeamBFormation] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tourament] PRIMARY KEY CLUSTERED 
(
	[Tour_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserType_ID] [int] NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Avatar] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CustomerName] [nvarchar](250) NULL,
	[BirthDay] [date] NULL,
	[Gender] [nvarchar](250) NULL,
	[PhoneNumber] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserType_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [nvarchar](255) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (3, 1, N'admin', N'123456', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([UserType_ID], [UserTypeName]) VALUES (1, N'Admin')
INSERT [dbo].[UserType] ([UserType_ID], [UserTypeName]) VALUES (2, N'Student')
INSERT [dbo].[UserType] ([UserType_ID], [UserTypeName]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [dbo].[UserType] OFF
ALTER TABLE [dbo].[BillDetail] ADD  DEFAULT (getdate()) FOR [DateSignIN]
GO
ALTER TABLE [dbo].[About]  WITH CHECK ADD  CONSTRAINT [FK_About_About_Slide] FOREIGN KEY([About_Slide_ID])
REFERENCES [dbo].[About_Slide] ([About_Slide_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[About] CHECK CONSTRAINT [FK_About_About_Slide]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_User]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([Bill_ID])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([Class_ID])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Class_Category] FOREIGN KEY([ClassCate_ID])
REFERENCES [dbo].[Class_Category] ([ClassCate_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Class_Category]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Class_Detail] FOREIGN KEY([Class_Detail_ID])
REFERENCES [dbo].[Class_Detail] ([ClassDetail_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Class_Detail]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Coach] FOREIGN KEY([Coach_ID])
REFERENCES [dbo].[Coach] ([Coach_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Coach]
GO
ALTER TABLE [dbo].[ClassUser]  WITH CHECK ADD  CONSTRAINT [FK_ClassUser_Class] FOREIGN KEY([Class_ID])
REFERENCES [dbo].[Class] ([Class_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassUser] CHECK CONSTRAINT [FK_ClassUser_Class]
GO
ALTER TABLE [dbo].[ClassUser]  WITH CHECK ADD  CONSTRAINT [FK_ClassUser_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ClassUser] CHECK CONSTRAINT [FK_ClassUser_User]
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD  CONSTRAINT [FK_Coach_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Coach] CHECK CONSTRAINT [FK_Coach_User]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Class] FOREIGN KEY([Class_ID])
REFERENCES [dbo].[Class] ([Class_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Class]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_News] FOREIGN KEY([New_ID])
REFERENCES [dbo].[News] ([News_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_News]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_ReplyToCommentID] FOREIGN KEY([ReplyToCommentID])
REFERENCES [dbo].[Comment] ([Comment_ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_ReplyToCommentID]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_RootCommentID] FOREIGN KEY([RootCommentID])
REFERENCES [dbo].[Comment] ([Comment_ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_RootCommentID]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_News_Category] FOREIGN KEY([NewCate_ID])
REFERENCES [dbo].[News_Category] ([NewCate_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_News_Category]
GO
ALTER TABLE [dbo].[NewsTags]  WITH CHECK ADD  CONSTRAINT [FK_NewsTags_News] FOREIGN KEY([News_ID])
REFERENCES [dbo].[News] ([News_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NewsTags] CHECK CONSTRAINT [FK_NewsTags_News]
GO
ALTER TABLE [dbo].[NewsTags]  WITH CHECK ADD  CONSTRAINT [FK_NewsTags_Tags] FOREIGN KEY([Tag_ID])
REFERENCES [dbo].[Tags] ([Tag_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NewsTags] CHECK CONSTRAINT [FK_NewsTags_Tags]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([Class_ID])
REFERENCES [dbo].[Class] ([Class_ID])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Tourament]  WITH CHECK ADD  CONSTRAINT [FK_Tourament_Stadium] FOREIGN KEY([Stadium_ID])
REFERENCES [dbo].[Stadium] ([Stadium_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tourament] CHECK CONSTRAINT [FK_Tourament_Stadium]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserType_ID])
REFERENCES [dbo].[UserType] ([UserType_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
ALTER TABLE [dbo].[DiscountCode]  WITH CHECK ADD  CONSTRAINT [chk_discount] CHECK  (([Discount]>=(0.1) AND [Discount]<=(1)))
GO
ALTER TABLE [dbo].[DiscountCode] CHECK CONSTRAINT [chk_discount]
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_InsertBillInfo]
@bill_id INT , @quantity int, @services_id NVARCHAR(20)
AS	
BEGIN
	DECLARE @IsExistBillInfo INT
	DECLARE @servquantity int =1 

	SELECT @IsExistBillInfo = a.Bill_detail_ID , @servquantity = a.Quantity_Services
	FROM dbo.Bill_Detail a
	WHERE a.Bill_ID = @bill_id AND a.Services_ID = @services_id
	IF (@IsExistBillInfo > 0)
		BEGIN
			DECLARE @NewServQuantity INT = @servquantity + @quantity
			IF (@NewServQuantity >0)
				UPDATE dbo.Bill_Detail SET Quantity_Services = @quantity + @servquantity
				WHERE  Services_ID = @services_id 
			ELSE 
				DELETE dbo.Bill_Detail WHERE Bill_ID = @bill_id AND Services_ID = @services_id
		END
	ELSE
	BEGIN
		INSERT dbo.Bill_Detail (Quantity_Services , Services_ID , Bill_ID )
		VALUES  (  @quantity , @services_id ,@bill_id )
		DECLARE @ConfirmQuantity INT = @quantity 
		IF (@ConfirmQuantity <0)
			BEGIN
				DELETE dbo.Bill_Detail WHERE Bill_ID = @bill_id AND Services_ID = @services_id
			END
	END 
END

GO
/****** Object:  StoredProcedure [dbo].[USP_LoadRoomList]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tạo Proce lấy RoomList--
CREATE PROC [dbo].[USP_LoadRoomList]
AS SELECT Room_number, Room_Type_Name , Room_stat_ID , Room_ID
FROM dbo.Room JOIN dbo.Room_Type ON Room_Type.Room_Type_ID = Room.Room_Type_ID

EXECUTE dbo.USP_LoadRoomList

GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 6/8/2020 10:16:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Tạo Proce Login cho chức năng đăng nhập--
CREATE PROC	[dbo].[USP_Login]
@userName nvarchar (100) , @passWord nvarchar (100) 
AS 
BEGIN
	SELECT * FROM dbo.Account WHERE	UserName = @userName AND password = @passWord
END

EXECUTE dbo.USP_Login @userName = N'admin', @passWord = N'1'

GO
USE [master]
GO
ALTER DATABASE [BITSoccer] SET  READ_WRITE 
GO
