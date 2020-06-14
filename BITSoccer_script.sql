USE master 
GO

CREATE DATABASE [BITSoccer]
Go

USE [BITSoccer]
GO
/****** Object:  Table [dbo].[About]    Script Date: 6/15/2020 3:20:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[AboutID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CoachDescription] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AboutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[About_Slide]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About_Slide](
	[AboutSlideID] [int] IDENTITY(1,1) NOT NULL,
	[AboutID] [int] NULL,
	[Image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AboutSlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Archive]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Total] [decimal](18, 0) NULL,
	[TotalPaid] [decimal](18, 0) NULL,
	[Status] [bit] NULL,
	[Discount] [float] NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[PayMethodID] [int] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[BillDetailID] [int] IDENTITY(1,1) NOT NULL,
	[BillID] [int] NULL,
	[ClassID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Class_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MetaTitle] [nvarchar](255) NULL,
	[Quanity] [int] NULL,
	[Prices] [decimal](18, 0) NULL,
	[PromoPrices] [decimal](18, 0) NULL,
	[Image] [nvarchar](255) NULL,
	[StartDay] [date] NULL,
	[EndDay] [date] NULL,
	[MinQuanity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[ViewCount] [int] NULL,
	[Coach_ID] [int] NOT NULL,
	[LevelStudentID] [int] NULL,
	[RangeAgeID] [int] NULL,
	[PartOfDayID] [int] NULL,
	[GenderID] [int] NULL,
	[RangeTimeID] [int] NULL,
	[StadiumID] [int] NULL,
	[Description] [nvarchar](250) NULL,
	[GeneralDescription] [nvarchar](max) NULL,
	[ShortDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassUsers]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassUsers](
	[ClassUsersID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ClassID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassUsersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coach]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coach](
	[Coach_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
	[Gender] [nvarchar](20) NULL,
	[Age] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [varchar](20) NULL,
	[Passport] [varchar](20) NULL,
	[Image] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
	[Insta] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Level] [int] NULL,
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
/****** Object:  Table [dbo].[Coach_Moment]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[DiscountCode]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[Footer]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[Gender]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Header]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[Home_Slide]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[HomePage_Content]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[LevelCoach]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LevelCoach](
	[LevelCoachID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelCoachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LevelStudent]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LevelStudent](
	[LevelStudentID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[News_Category]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[NewsTags]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsTags](
	[NewsTagsID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NULL,
	[TagsID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsTagsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartOfDay]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartOfDay](
	[PartOfDayID] [int] IDENTITY(1,1) NOT NULL,
	[PartOfDay] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[PartOfDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayMethod]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayMethod](
	[PayMethodID] [int] IDENTITY(1,1) NOT NULL,
	[PayMethodName] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[PayMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RangeAge]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RangeAge](
	[RangeAgeID] [int] IDENTITY(1,1) NOT NULL,
	[MinAge] [int] NULL,
	[MaxAge] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RangeAgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RangeTime]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RangeTime](
	[RangeTimeID] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RangeTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rating]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[Stadium]    Script Date: 6/15/2020 3:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadium](
	[Stadium_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Image] [nvarchar](250) NULL,
 CONSTRAINT [PK_Stadium] PRIMARY KEY CLUSTERED 
(
	[Stadium_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[Tourament]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 6/15/2020 3:20:24 AM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 6/15/2020 3:20:24 AM ******/
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
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([Bill_ID], [User_ID], [Total], [TotalPaid], [Status], [Discount], [CreateDate], [PayMethodID]) VALUES (1, 4, CAST(3420000 AS Decimal(18, 0)), CAST(3420000 AS Decimal(18, 0)), 1, 0, CAST(N'2020-06-15 03:03:12.307' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([BillDetailID], [BillID], [ClassID]) VALUES (1, 1, 26)
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Class_ID], [Name], [MetaTitle], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (26, N'Lớp sơ cấp dành cho nam và nữ từ 5-10 tuổi', NULL, 20, CAST(3800000 AS Decimal(18, 0)), CAST(3420000 AS Decimal(18, 0)), N'/Content/Images/Lop2.jpg', CAST(N'2020-06-11' AS Date), CAST(N'2020-07-30' AS Date), 15, NULL, NULL, NULL, NULL, 1, NULL, 17, 1, 1, 3, 3, 4, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [MetaTitle], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (29, N'Lớp sơ cấp dành cho nam từ 10-15 tuổi', NULL, 20, CAST(3800000 AS Decimal(18, 0)), CAST(3420000 AS Decimal(18, 0)), N'/Content/Images/Lop3.jpg', CAST(N'2020-06-18' AS Date), CAST(N'2020-08-05' AS Date), 15, NULL, NULL, NULL, NULL, 1, NULL, 18, 1, 2, 3, 1, 3, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [MetaTitle], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (37, N'Lớp sơ cấp dành cho nữ từ 10-15 tuổi', NULL, 20, CAST(3400000 AS Decimal(18, 0)), CAST(2850000 AS Decimal(18, 0)), N'/Content/Images/Lop3.jpg', CAST(N'2020-06-18' AS Date), CAST(N'2020-08-27' AS Date), 15, NULL, NULL, NULL, NULL, 1, NULL, 17, 1, 2, 2, 2, 2, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [MetaTitle], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (46, N'Lớp trung cấp dành cho nam và nữ từ 5-10 tuổi', NULL, 20, CAST(3500000 AS Decimal(18, 0)), CAST(3150000 AS Decimal(18, 0)), N'/Content/Images/Lop3.jpg', CAST(N'2020-06-17' AS Date), CAST(N'2020-08-25' AS Date), 15, NULL, NULL, NULL, NULL, 1, NULL, 19, 2, 1, 4, 3, 5, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [MetaTitle], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (51, N'Lớp trung cấp dành cho nam từ 10-15 tuổi', NULL, 25, CAST(3800000 AS Decimal(18, 0)), CAST(3550000 AS Decimal(18, 0)), N'/Content/Images/khoa2.jpg', CAST(N'2020-06-13' AS Date), CAST(N'2020-07-25' AS Date), 20, NULL, NULL, NULL, NULL, 1, NULL, 17, 2, 2, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [MetaTitle], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (56, N'Lớp trung cấp dành cho nữ từ 10-15 tuổi', NULL, 25, CAST(3500000 AS Decimal(18, 0)), CAST(3150000 AS Decimal(18, 0)), N'/Content/Images/Lop3 (2).jpg', CAST(N'2020-06-13' AS Date), CAST(N'2020-08-29' AS Date), 20, NULL, NULL, NULL, NULL, 1, NULL, 18, 2, 2, 3, 2, 4, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [MetaTitle], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (68, N'Chiến thuật cơ bản', NULL, 40, CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2020-06-11' AS Date), CAST(N'2020-07-08' AS Date), 25, CAST(N'2020-06-10 18:57:00.000' AS DateTime), N'admin', NULL, NULL, 1, NULL, 19, 1, 2, 3, 3, 2, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[ClassUsers] ON 

INSERT [dbo].[ClassUsers] ([ClassUsersID], [UserID], [ClassID]) VALUES (1, 4, 26)
SET IDENTITY_INSERT [dbo].[ClassUsers] OFF
SET IDENTITY_INSERT [dbo].[Coach] ON 

INSERT [dbo].[Coach] ([Coach_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [Gender], [Age], [Phone], [Email], [Passport], [Image], [Facebook], [Insta], [Twitter], [Level], [Description], [User_ID]) VALUES (17, N'Trương Việt Hoàng', CAST(N'2020-01-01 00:00:00.000' AS DateTime), N'Trần Thị Kim Thi', NULL, NULL, 1, N'Nam', 33, N'0896421412', N'vhoang5@gmail.com', NULL, N'/Content/Images/coach member.png', NULL, NULL, NULL, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur venenatis ultrices ullamcorper. Vivamus lobortis elit ut turpis efficitur porttitor. Integer aliquet elit sed est eleifend volutpat. Cras semper tempus velit, nec tempor nisl hendrerit quis. Sed vehicula in risus eu vulputate.', 5)
INSERT [dbo].[Coach] ([Coach_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [Gender], [Age], [Phone], [Email], [Passport], [Image], [Facebook], [Insta], [Twitter], [Level], [Description], [User_ID]) VALUES (18, N'Mai Đức Trung', CAST(N'2020-01-01 00:00:00.000' AS DateTime), N'Trần Thị Kim Thi', NULL, NULL, 1, N'Nam', 38, N'083-234-6024', N'chungduc82@gmail.com', N'123456678', N'/Content/Images/hlv_chung.jpg', NULL, NULL, NULL, 2, N'Được bầu chọn là huấn luyện viên tiêu biểu nhất Việt Nam năm 2005. Huấn luyện đội tuyển bóng đá nữ quốc gia Việt Nam', 6)
INSERT [dbo].[Coach] ([Coach_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [Gender], [Age], [Phone], [Email], [Passport], [Image], [Facebook], [Insta], [Twitter], [Level], [Description], [User_ID]) VALUES (19, N'Park Hang Seo', CAST(N'2020-01-01 00:00:00.000' AS DateTime), N'Trần Thị Kim Thi', NULL, NULL, 1, N'Nam', 62, N'0348096012', N'phseo15@gmail.com', NULL, N'/Content/Images/hlv_park_.jpg', NULL, NULL, NULL, 3, N'Được chọn làm người đại diện thanh thiếu niên lứa tuổi U20 tham dự giải bóng đá trẻ châu Á lần thứ 20. Huấn luyện viên trưởng tại U23 Việt Nam, Đội tuyển Việt Nam và đội tuyển U-22 Việt Nam. Được báo chí Hàn Quốc tôn vinh với giải thưởng Nhân vật của năm 2018.', 7)
INSERT [dbo].[Coach] ([Coach_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [Gender], [Age], [Phone], [Email], [Passport], [Image], [Facebook], [Insta], [Twitter], [Level], [Description], [User_ID]) VALUES (20, N'FABIO LOPEZ', NULL, N'admin', NULL, NULL, 1, N'Nam', 46, N'0934678491', N'flopez@gmail.com', NULL, N'/Content/Images/hlv_faio.jpg', NULL, NULL, NULL, 3, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur venenatis ultrices ullamcorper. Vivamus lobortis elit ut turpis efficitur porttitor. Integer aliquet elit sed est eleifend volutpat. Cras semper tempus velit, nec tempor nisl hendrerit quis. Sed vehicula in risus eu vulputate.', 5)
INSERT [dbo].[Coach] ([Coach_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [Gender], [Age], [Phone], [Email], [Passport], [Image], [Facebook], [Insta], [Twitter], [Level], [Description], [User_ID]) VALUES (21, N'Chu Đình Nghiêm', CAST(N'2020-06-10 12:01:00.000' AS DateTime), N'admin', NULL, NULL, 1, N'Nam', 48, N'123-456-678', NULL, N'12345676891', N'/Content/Images/hlv_chu.jpg', NULL, NULL, NULL, 2, N'Huấn luyện viên trưởng Đội bóng đá Hà Nội T&T ', 5)
SET IDENTITY_INSERT [dbo].[Coach] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([GenderID], [Gender]) VALUES (1, N'Nam')
INSERT [dbo].[Gender] ([GenderID], [Gender]) VALUES (2, N'Nữ')
INSERT [dbo].[Gender] ([GenderID], [Gender]) VALUES (3, N'Nam và Nữ')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[LevelCoach] ON 

INSERT [dbo].[LevelCoach] ([LevelCoachID], [LevelName]) VALUES (1, N'Chính Quy')
INSERT [dbo].[LevelCoach] ([LevelCoachID], [LevelName]) VALUES (2, N'Quốc Gia')
INSERT [dbo].[LevelCoach] ([LevelCoachID], [LevelName]) VALUES (3, N'Quốc Tế')
SET IDENTITY_INSERT [dbo].[LevelCoach] OFF
SET IDENTITY_INSERT [dbo].[LevelStudent] ON 

INSERT [dbo].[LevelStudent] ([LevelStudentID], [LevelName]) VALUES (1, N'Sơ cấp')
INSERT [dbo].[LevelStudent] ([LevelStudentID], [LevelName]) VALUES (2, N'Trung cấp')
INSERT [dbo].[LevelStudent] ([LevelStudentID], [LevelName]) VALUES (4, N'Chuyên nghiệp')
SET IDENTITY_INSERT [dbo].[LevelStudent] OFF
SET IDENTITY_INSERT [dbo].[PartOfDay] ON 

INSERT [dbo].[PartOfDay] ([PartOfDayID], [PartOfDay]) VALUES (1, N'Sáng')
INSERT [dbo].[PartOfDay] ([PartOfDayID], [PartOfDay]) VALUES (2, N'Trưa')
INSERT [dbo].[PartOfDay] ([PartOfDayID], [PartOfDay]) VALUES (3, N'Chiều')
INSERT [dbo].[PartOfDay] ([PartOfDayID], [PartOfDay]) VALUES (4, N'Tối')
SET IDENTITY_INSERT [dbo].[PartOfDay] OFF
SET IDENTITY_INSERT [dbo].[PayMethod] ON 

INSERT [dbo].[PayMethod] ([PayMethodID], [PayMethodName]) VALUES (1, N'Quốc tế')
INSERT [dbo].[PayMethod] ([PayMethodID], [PayMethodName]) VALUES (2, N'ATM nội địa')
INSERT [dbo].[PayMethod] ([PayMethodID], [PayMethodName]) VALUES (3, N'Ví MOMO')
SET IDENTITY_INSERT [dbo].[PayMethod] OFF
SET IDENTITY_INSERT [dbo].[RangeAge] ON 

INSERT [dbo].[RangeAge] ([RangeAgeID], [MinAge], [MaxAge]) VALUES (1, 5, 10)
INSERT [dbo].[RangeAge] ([RangeAgeID], [MinAge], [MaxAge]) VALUES (2, 10, 15)
SET IDENTITY_INSERT [dbo].[RangeAge] OFF
SET IDENTITY_INSERT [dbo].[RangeTime] ON 

INSERT [dbo].[RangeTime] ([RangeTimeID], [StartTime], [EndTime]) VALUES (1, N'7:00', N'9:00')
INSERT [dbo].[RangeTime] ([RangeTimeID], [StartTime], [EndTime]) VALUES (2, N'15:00', N'17:00')
INSERT [dbo].[RangeTime] ([RangeTimeID], [StartTime], [EndTime]) VALUES (3, N'17:00', N'19:00')
INSERT [dbo].[RangeTime] ([RangeTimeID], [StartTime], [EndTime]) VALUES (4, N'17:30', N'19:00')
INSERT [dbo].[RangeTime] ([RangeTimeID], [StartTime], [EndTime]) VALUES (5, N'19:00', N'20:30')
SET IDENTITY_INSERT [dbo].[RangeTime] OFF
SET IDENTITY_INSERT [dbo].[Stadium] ON 

INSERT [dbo].[Stadium] ([Stadium_ID], [Name], [Address], [Image]) VALUES (1, N'B.I.T Stadium A', N'274 Nguyễn Tri Phương, Q.10, TP.HCM', N'/Content/Images/SVD_B.png')
SET IDENTITY_INSERT [dbo].[Stadium] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (3, 1, N'admin', N'123456', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (4, 2, N'student1', N'123', N'nguyenvana@gmail.com', NULL, 1, N'Nguyễn Văn A', CAST(N'1999-02-10' AS Date), N'Nam', N'123456678', NULL)
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (5, 3, N'coach1', N'123', N'vhoang5@gmail.com', N'https://media1.nguoiduatin.vn/media/vu-thi-thuy-tien/2018/11/07/hlv-truong-vie-t-hoa-ng-do-i-tuye-n-vie-t-nam-dang-so-hu-u-lu-a-ca-u-thu-ma-nh-2.jpg', 1, N'Trương Việt Hoàng', CAST(N'1987-05-07' AS Date), N'Nam', N'0896421412', N'275 Phan Xích Long, Phường 7, Quận Phú Nhuận')
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (6, 3, N'coach2', N'123', N'chungduc82@gmail.com', N'https://media.hvtvzone.com/upload/News/huan-luyen-vien-mai-duc-chung-ti-so-bong-da-truc-tuyen-uesOEJ645.jpg', 1, N'Mai Đức Trung', CAST(N'1982-11-27' AS Date), N'Nam', N'0832346024', N'217 Nguyễn Văn Cừ, Phường 4, Quận 5')
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (7, 3, N'coach3', N'123', N'phseo15@gmail.com', N'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTgzELNGKintxK6Utbir1OMyEH0G_LPD1KgcaSo2IzS4kZV2wxf&usqp=CAU', 1, N'Park Hang Seo', CAST(N'1957-10-01' AS Date), N'Nam', N'0348096012', N'15 Nguyễn Thái Học, Phường Cầu Kho, Quận 1')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([UserType_ID], [UserTypeName]) VALUES (1, N'Admin')
INSERT [dbo].[UserType] ([UserType_ID], [UserTypeName]) VALUES (2, N'Student')
INSERT [dbo].[UserType] ([UserType_ID], [UserTypeName]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [dbo].[UserType] OFF
ALTER TABLE [dbo].[About] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[About_Slide]  WITH CHECK ADD FOREIGN KEY([AboutID])
REFERENCES [dbo].[About] ([AboutID])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_PayMethod] FOREIGN KEY([PayMethodID])
REFERENCES [dbo].[PayMethod] ([PayMethodID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_PayMethod]
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
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Coach] FOREIGN KEY([Coach_ID])
REFERENCES [dbo].[Coach] ([Coach_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Coach]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Gender]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_LevelStudent] FOREIGN KEY([LevelStudentID])
REFERENCES [dbo].[LevelStudent] ([LevelStudentID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_LevelStudent]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_PartOfDay] FOREIGN KEY([PartOfDayID])
REFERENCES [dbo].[PartOfDay] ([PartOfDayID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_PartOfDay]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_RangeAge] FOREIGN KEY([RangeAgeID])
REFERENCES [dbo].[RangeAge] ([RangeAgeID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_RangeAge]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_RangeOfTime] FOREIGN KEY([RangeTimeID])
REFERENCES [dbo].[RangeTime] ([RangeTimeID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_RangeOfTime]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Stadium] FOREIGN KEY([StadiumID])
REFERENCES [dbo].[Stadium] ([Stadium_ID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Stadium]
GO
ALTER TABLE [dbo].[ClassUsers]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([Class_ID])
GO
ALTER TABLE [dbo].[ClassUsers]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD  CONSTRAINT [FK_Coach_Level] FOREIGN KEY([Level])
REFERENCES [dbo].[LevelCoach] ([LevelCoachID])
GO
ALTER TABLE [dbo].[Coach] CHECK CONSTRAINT [FK_Coach_Level]
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
ALTER TABLE [dbo].[NewsTags]  WITH CHECK ADD FOREIGN KEY([NewsID])
REFERENCES [dbo].[News] ([News_ID])
GO
ALTER TABLE [dbo].[NewsTags]  WITH CHECK ADD FOREIGN KEY([TagsID])
REFERENCES [dbo].[Tags] ([Tag_ID])
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
