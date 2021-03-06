USE master
GO

CREATE DATABASE [BITSoccer]
GO

USE [BITSoccer]
GO
/****** Object:  Table [dbo].[About]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[About_Slide]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Archive]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
	[CreateDate] [datetime] NULL,
	[PayMethodID] [int] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 22-Jun-20 10:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Class_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
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
	[Description] [nvarchar](max) NULL,
	[GeneralDescription] [nvarchar](max) NULL,
	[ShortDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassUsers]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Coach]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Coach_Moment]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[DiscountCode]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Footer]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Gender]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Header]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Home_Slide]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[HomePage_Content]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[LevelCoach]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[LevelStudent]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 22-Jun-20 10:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[News_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[NewCate_ID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[ViewsCount] [int] NULL,
	[ShortDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[News_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News_Category]    Script Date: 22-Jun-20 10:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_Category](
	[NewCate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
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
/****** Object:  Table [dbo].[NewsTags]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[PartOfDay]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[PayMethod]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[RangeAge]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[RangeTime]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Rating]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Stadium]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[Tourament]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 22-Jun-20 10:20:32 PM ******/
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
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([AboutID], [Description], [CoachDescription], [Image], [CreateDate]) VALUES (1, N'asdasd', N'asdasd', N'/Content/Images/DN_HLV1.jpg', CAST(N'2020-06-22 16:22:50.353' AS DateTime))
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[About_Slide] ON 

INSERT [dbo].[About_Slide] ([AboutSlideID], [AboutID], [Image]) VALUES (1, 1, N'/Assets/img/no-photo.jpg')
INSERT [dbo].[About_Slide] ([AboutSlideID], [AboutID], [Image]) VALUES (3, 1, N'/Assets/img/no-photo.jpg')
INSERT [dbo].[About_Slide] ([AboutSlideID], [AboutID], [Image]) VALUES (4, 1, N'/Assets/img/no-photo.jpg')
INSERT [dbo].[About_Slide] ([AboutSlideID], [AboutID], [Image]) VALUES (5, 1, N'/Assets/img/no-photo.jpg')
INSERT [dbo].[About_Slide] ([AboutSlideID], [AboutID], [Image]) VALUES (6, 1, N'/Assets/img/no-photo.jpg')
SET IDENTITY_INSERT [dbo].[About_Slide] OFF
SET IDENTITY_INSERT [dbo].[Archive] ON 

INSERT [dbo].[Archive] ([Archive_ID], [Name], [Image], [Content]) VALUES (1, N'CÓ HƠN 1000 HỌC VIÊN
', NULL, NULL)
INSERT [dbo].[Archive] ([Archive_ID], [Name], [Image], [Content]) VALUES (2, N'100 HUẤN LUYỆN VIÊN XUẤT SẮC', N'/Content/Images/coach member.png', N'asdasdasdasdasdasd')
INSERT [dbo].[Archive] ([Archive_ID], [Name], [Image], [Content]) VALUES (3, N'TRUNG TÂM XUẤT SẮC
', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Archive] OFF
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([Bill_ID], [User_ID], [Total], [TotalPaid], [Status], [Discount], [CreateDate], [PayMethodID]) VALUES (1, 4, CAST(3420000 AS Decimal(18, 0)), CAST(3420000 AS Decimal(18, 0)), 1, 0, CAST(N'2020-06-15 03:03:12.307' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([BillDetailID], [BillID], [ClassID]) VALUES (1, 1, 26)
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Class_ID], [Name], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (26, N'Lớp sơ cấp dành cho nam và nữ từ 5-10 tuổi', 20, CAST(3800000 AS Decimal(18, 0)), CAST(3420000 AS Decimal(18, 0)), N'/Content/Images/Lop2.jpg', CAST(N'2020-06-11' AS Date), CAST(N'2020-07-30' AS Date), 15, NULL, NULL, NULL, NULL, 1, NULL, 17, 1, 1, 3, 3, 4, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (29, N'Lớp sơ cấp dành cho nam từ 10-15 tuổi', 20, CAST(3800000 AS Decimal(18, 0)), CAST(3420000 AS Decimal(18, 0)), N'/Content/Images/Lop3.jpg', CAST(N'2020-06-18' AS Date), CAST(N'2020-08-05' AS Date), 15, NULL, NULL, NULL, NULL, 1, NULL, 18, 1, 2, 3, 1, 3, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (37, N'Lớp sơ cấp dành cho nữ từ 10-15 tuổi', 20, CAST(3400000 AS Decimal(18, 0)), CAST(2850000 AS Decimal(18, 0)), N'/Content/Images/Lop3.jpg', CAST(N'2020-06-18' AS Date), CAST(N'2020-08-27' AS Date), 15, NULL, NULL, NULL, NULL, 1, NULL, 17, 1, 2, 2, 2, 2, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (46, N'Lớp trung cấp dành cho nam và nữ từ 5-10 tuổi', 20, CAST(3500000 AS Decimal(18, 0)), CAST(3150000 AS Decimal(18, 0)), N'/Content/Images/Lop3.jpg', CAST(N'2020-06-17' AS Date), CAST(N'2020-08-25' AS Date), 15, NULL, NULL, NULL, NULL, 1, NULL, 19, 2, 1, 4, 3, 5, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (51, N'Lớp trung cấp dành cho nam từ 10-15 tuổi', 25, CAST(3800000 AS Decimal(18, 0)), CAST(3550000 AS Decimal(18, 0)), N'/Content/Images/khoa2.jpg', CAST(N'2020-06-13' AS Date), CAST(N'2020-07-25' AS Date), 20, NULL, NULL, NULL, NULL, 1, NULL, 17, 2, 2, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (56, N'Lớp trung cấp dành cho nữ từ 10-15 tuổi', 25, CAST(3500000 AS Decimal(18, 0)), CAST(3150000 AS Decimal(18, 0)), N'/Content/Images/Lop3 (2).jpg', CAST(N'2020-06-13' AS Date), CAST(N'2020-08-29' AS Date), 20, NULL, NULL, NULL, NULL, 1, NULL, 18, 2, 2, 3, 2, 4, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (68, N'Chiến thuật cơ bản', 40, CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2020-06-11' AS Date), CAST(N'2020-07-08' AS Date), 25, CAST(N'2020-06-10 18:57:00.000' AS DateTime), N'admin', NULL, NULL, 1, NULL, 19, 1, 2, 3, 3, 2, 1, NULL, NULL, NULL)
INSERT [dbo].[Class] ([Class_ID], [Name], [Quanity], [Prices], [PromoPrices], [Image], [StartDay], [EndDay], [MinQuanity], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [ViewCount], [Coach_ID], [LevelStudentID], [RangeAgeID], [PartOfDayID], [GenderID], [RangeTimeID], [StadiumID], [Description], [GeneralDescription], [ShortDescription]) VALUES (69, N'Bóng đá trẻ em', 40, CAST(450000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), N'/Assets/img/no-photo.jpg', CAST(N'2020-06-24' AS Date), CAST(N'2020-08-20' AS Date), 20, CAST(N'2020-06-20 03:45:52.000' AS DateTime), N'admin', NULL, NULL, 1, NULL, 21, 1, 1, 3, 3, 3, 1, N'<h2 style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; line-height: 1; font-size: 28px; font-family: Lato; color: rgb(81, 81, 81); text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; color: rgb(0, 0, 255);"><strong style="margin: 0px; padding: 0px; outline: none;"><span style="margin: 0px; padding: 0px; outline: none; font-size: 14px; font-family: arial, helvetica, sans-serif;">1. Kỹ thuật 1: Học đá bóng cơ bản với kỹ thuật khởi động</span></strong></span><span class="ez-toc-section-end" style="margin: 0px; padding: 0px; outline: none;"></span></h2><p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; color: rgb(110, 109, 109); font-family: Arimo, sans-serif; font-size: 13px; text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;"><span style="margin: 0px; padding: 0px; outline: none; color: rgb(0, 0, 0);">Học bóng đá</span>&nbsp;cũng như học các môn thể thao khác, trước khi luyện tập hay thi đấu thì chúng ta đều cần phải khởi động thật kỹ và đúng kỹ thuật nhé. Một số kỹ thuật khởi động như:</span></p><p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; color: rgb(110, 109, 109); font-family: Arimo, sans-serif; font-size: 13px; text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;">– Kỹ thuật vận động các cơ</span></p><p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; color: rgb(110, 109, 109); font-family: Arimo, sans-serif; font-size: 13px; text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;">– Kỹ thuật khởi động không bóng</span></p><p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; color: rgb(110, 109, 109); font-family: Arimo, sans-serif; font-size: 13px; text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;">– Kỹ thuật khở động với bóng</span></p><p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; color: rgb(110, 109, 109); font-family: Arimo, sans-serif; font-size: 13px; text-align: center;"><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;"><img class="alignnone wp-image-261 size-full" title="10 Kỹ thuật học đá bóng Cơ Bản và Dễ Dàng cho người mới bắt đầu" src="https://hocbongdahanoi.vn/wp-content/uploads/2019/04/hoc-da-bong-co-ban-21.jpg" alt="10 Kỹ thuật học đá bóng Cơ Bản và Dễ Dàng cho người mới bắt đầu" width="700" height="466" srcset="https://hocbongdahanoi.vn/wp-content/uploads/2019/04/hoc-da-bong-co-ban-21.jpg 700w, https://hocbongdahanoi.vn/wp-content/uploads/2019/04/hoc-da-bong-co-ban-21-300x200.jpg 300w" sizes="(max-width: 700px) 100vw, 700px" style="margin: 0px; padding: 0px; outline: none; border-width: initial; border-color: initial; border-image: initial; max-width: 100%; height: auto;"></span></p><p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; color: rgb(110, 109, 109); font-family: Arimo, sans-serif; font-size: 13px; text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;">Ngoài các kỹ thuật trên, tại lớp học bóng đá cơ bản các em còn được tập những bài tập bổ trợ tăng chiều cao tự nhiên như bài tập đu xà đơn, bài tập nhảy cóc, … giúp trẻ không chỉ tăng cường thể lực mà còn phát triển chiều cao.</span></p><h2 style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; line-height: 1; font-size: 28px; font-family: Lato; color: rgb(81, 81, 81); text-align: justify;"><span class="ez-toc-section" id="2_Ky_thuat_2_Day_da_bong_co_ban_voi_ky_thuat_tang_bong" style="margin: 0px; padding: 0px; outline: none;"></span><span style="margin: 0px; padding: 0px; outline: none; color: rgb(0, 0, 255);"><strong style="margin: 0px; padding: 0px; outline: none;"><span style="margin: 0px; padding: 0px; outline: none; font-size: 14px; font-family: arial, helvetica, sans-serif;">2. Kỹ thuật 2: Dạy đá bóng cơ bản với kỹ thuật tâng bóng</span></strong></span><span class="ez-toc-section-end" style="margin: 0px; padding: 0px; outline: none;"></span></h2><p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; color: rgb(110, 109, 109); font-family: Arimo, sans-serif; font-size: 13px; text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;">Đây là kỹ thuật quan trọng khi học đá bóng căn bản. Tâng bóng nhiều và điêu liệu sẽ giúp chúng ta có cảm giác bóng tốt hơn, đỡ bóng chuẩn hơn, kiểm soát bóng theo ý mình. Hãy chăm chỉ tâng bóng mỗi khi rảnh các bạn nhé.</span></p><h2 style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; line-height: 1; font-size: 28px; font-family: Lato; color: rgb(81, 81, 81); text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; color: rgb(0, 0, 255);"><strong style="margin: 0px; padding: 0px; outline: none;"><span style="margin: 0px; padding: 0px; outline: none; font-size: 14px; font-family: arial, helvetica, sans-serif;">3. Kỹ thuật 3: Học đá bóng cơ bản với kỹ thuật đỡ bóng</span></strong></span><span class="ez-toc-section-end" style="margin: 0px; padding: 0px; outline: none;"></span></h2><p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; color: rgb(110, 109, 109); font-family: Arimo, sans-serif; font-size: 13px; text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;">Kỹ thuật đỡ bóng là kỹ thuật mà cầu thủ đá bóng nào cũng phải thực hiện được. Từ việc đỡ bóng sẽ giúp cầu thủ có những chuyền chuẩn, qua người khéo léo hay những cú sút chuẩn vào gôn. Ngoài ra, nếu cầu thủ đỡ bóng không tốt, bạn có thể mất bóng ngay và làm ảnh hưởng đến kết quả thi đấu của đội.</span></p><h2 style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; line-height: 1; font-size: 28px; font-family: Lato; color: rgb(81, 81, 81); text-align: justify;"><strong style="margin: 0px; padding: 0px; outline: none;"><span style="margin: 0px; padding: 0px; outline: none; font-size: 14px; color: rgb(0, 0, 255); font-family: arial, helvetica, sans-serif;">4. Kỹ thuật 4: Học đá bóng cơ bản với kỹ thuật dẫn bóng</span></strong><span class="ez-toc-section-end" style="margin: 0px; padding: 0px; outline: none;"></span></h2><p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; color: rgb(110, 109, 109); font-family: Arimo, sans-serif; font-size: 13px; text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;"></span></p><p style="margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; outline: none; color: rgb(110, 109, 109); font-family: Arimo, sans-serif; font-size: 13px; text-align: justify;"><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;">Khi học bóng đá cơ bản, các em sẽ được thầy cô trang bị cho bản lĩnh, sự tự tin với nhiều kiểu dẫn bóng khác nhau như chặt bóng, kéo dê bóng, hất bóng,…</span></p><div><span style="margin: 0px; padding: 0px; outline: none; font-family: arial, helvetica, sans-serif; font-size: 14px;"><br></span></div>', N'Bóng đá đang là môn thể thao Vua được nhiều người hâm mộ nhất trong các môn thể thao, nhưng để chơi tốt được bóng đá thì chúng ta cần học đá bóng cơ bản cho đến nâng cao.', N'Đối với trẻ em nếu được học đá bóng căn bản ngay từ nhỏ sẽ có được những kỹ năng, kỹ thuật bóng đá giỏi và có một nền tảng thể lực rất tốt, hệ cơ xương chắc chắn, đặc biệt là tự tin – sáng tạo – hoạt bát khi ra bên ngoài.  Để có được những điều này, các em cần tham gia vào các câu lạc bộ bóng đá, trung tâm dạy đá bóng cơ bản, lớp học bóng đá trẻ em. Tại đây các em sẽ được học đá bóng cơ bản qua giáo trình tiêu chuẩn quốc tế dành cho những người mới biết chơi đá bóng. Chúng ta cùng đi tìm hiểu các kỹ thuật bóng đá cơ bản được dạy tại lớp học bóng đá cơ bản qua bài viết dưới đây.')
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[ClassUsers] ON 

INSERT [dbo].[ClassUsers] ([ClassUsersID], [UserID], [ClassID]) VALUES (1, 4, 26)
SET IDENTITY_INSERT [dbo].[ClassUsers] OFF
SET IDENTITY_INSERT [dbo].[Coach] ON 

INSERT [dbo].[Coach] ([Coach_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [Gender], [Age], [Phone], [Email], [Passport], [Image], [Facebook], [Insta], [Twitter], [Level], [Description], [User_ID]) VALUES (17, N'Trương Việt Hoàng', CAST(N'2020-01-01 00:00:00.000' AS DateTime), N'Trần Thị Kim Thi', NULL, NULL, 1, N'Nam', 33, N'0896421412', N'vhoang5@gmail.com', NULL, N'/Content/Images/coach member.png', NULL, NULL, NULL, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur venenatis ultrices ullamcorper. Vivamus lobortis elit ut turpis efficitur porttitor. Integer aliquet elit sed est eleifend volutpat. Cras semper tempus velit, nec tempor nisl hendrerit quis. Sed vehicula in risus eu vulputate.', 5)
INSERT [dbo].[Coach] ([Coach_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [Gender], [Age], [Phone], [Email], [Passport], [Image], [Facebook], [Insta], [Twitter], [Level], [Description], [User_ID]) VALUES (18, N'Mai Đức Trung', CAST(N'2020-01-01 00:00:00.000' AS DateTime), N'Trần Thị Kim Thi', NULL, NULL, 1, N'Nam', 38, NULL, N'chungduc82@gmail.com', N'123456678', N'/Content/Images/hlv_chung.jpg', N'https://www.facebook.com/yoo.tran.16', NULL, NULL, 2, N'Được bầu chọn là huấn luyện viên tiêu biểu nhất Việt Nam năm 2005. Huấn luyện đội tuyển bóng đá nữ quốc gia Việt Nam', 6)
INSERT [dbo].[Coach] ([Coach_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [Gender], [Age], [Phone], [Email], [Passport], [Image], [Facebook], [Insta], [Twitter], [Level], [Description], [User_ID]) VALUES (19, N'Park Hang Seo', CAST(N'2020-01-01 00:00:00.000' AS DateTime), N'Trần Thị Kim Thi', NULL, NULL, 1, N'Nam', 62, N'0348096012', N'phseo15@gmail.com', NULL, N'/Content/Images/hlv_park_.jpg', NULL, NULL, NULL, 3, N'Được chọn làm người đại diện thanh thiếu niên lứa tuổi U20 tham dự giải bóng đá trẻ châu Á lần thứ 20. Huấn luyện viên trưởng tại U23 Việt Nam, Đội tuyển Việt Nam và đội tuyển U-22 Việt Nam. Được báo chí Hàn Quốc tôn vinh với giải thưởng Nhân vật của năm 2018.', 7)
INSERT [dbo].[Coach] ([Coach_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [Gender], [Age], [Phone], [Email], [Passport], [Image], [Facebook], [Insta], [Twitter], [Level], [Description], [User_ID]) VALUES (20, N'FABIO LOPEZ', NULL, N'admin', NULL, NULL, 1, N'Nam', 46, N'0934678491', N'flopez@gmail.com', NULL, N'/Content/Images/hlv_faio.jpg', NULL, NULL, NULL, 3, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur venenatis ultrices ullamcorper. Vivamus lobortis elit ut turpis efficitur porttitor. Integer aliquet elit sed est eleifend volutpat. Cras semper tempus velit, nec tempor nisl hendrerit quis. Sed vehicula in risus eu vulputate.', 5)
INSERT [dbo].[Coach] ([Coach_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [Gender], [Age], [Phone], [Email], [Passport], [Image], [Facebook], [Insta], [Twitter], [Level], [Description], [User_ID]) VALUES (21, N'Chu Đình Nghiêm', CAST(N'2020-06-10 12:01:00.000' AS DateTime), N'admin', NULL, NULL, 1, N'Nam', 48, N'123-456-678', NULL, N'12345676891', N'/Content/Images/hlv_chu.jpg', NULL, NULL, NULL, 2, N'Huấn luyện viên trưởng Đội bóng đá Hà Nội T&T ', NULL)
SET IDENTITY_INSERT [dbo].[Coach] OFF
SET IDENTITY_INSERT [dbo].[Coach_Moment] ON 

INSERT [dbo].[Coach_Moment] ([Coach_Moment_ID], [Image], [Description], [Link]) VALUES (1, N'/Assets/img/no-photo.jpg', NULL, NULL)
INSERT [dbo].[Coach_Moment] ([Coach_Moment_ID], [Image], [Description], [Link]) VALUES (2, N'/Assets/img/no-photo.jpg', NULL, NULL)
INSERT [dbo].[Coach_Moment] ([Coach_Moment_ID], [Image], [Description], [Link]) VALUES (3, N'/Assets/img/no-photo.jpg', NULL, NULL)
INSERT [dbo].[Coach_Moment] ([Coach_Moment_ID], [Image], [Description], [Link]) VALUES (4, N'/Assets/img/no-photo.jpg', NULL, NULL)
INSERT [dbo].[Coach_Moment] ([Coach_Moment_ID], [Image], [Description], [Link]) VALUES (5, N'/Assets/img/no-photo.jpg', NULL, NULL)
INSERT [dbo].[Coach_Moment] ([Coach_Moment_ID], [Image], [Description], [Link]) VALUES (6, N'/Assets/img/no-photo.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Coach_Moment] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (1, 4, 26, NULL, NULL, NULL, N'Happy New year', CAST(N'2020-06-18 19:29:19.607' AS DateTime))
INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (2, 4, 26, NULL, NULL, NULL, N'Happy', CAST(N'2020-06-18 19:30:19.607' AS DateTime))
INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (3, 8, 26, NULL, 1, 1, N'Tks', CAST(N'2020-06-18 19:30:42.727' AS DateTime))
INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (4, 4, 26, NULL, 1, 3, N'Welcome', CAST(N'2020-06-18 19:31:09.433' AS DateTime))
INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (5, 8, 26, NULL, 1, 4, N'OK', CAST(N'2020-06-18 19:31:35.390' AS DateTime))
INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (6, 4, 26, NULL, 1, 5, N'No prob', CAST(N'2020-06-19 03:00:43.563' AS DateTime))
INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (7, 8, 26, NULL, NULL, NULL, N'Good Class', CAST(N'2020-06-19 03:02:08.877' AS DateTime))
INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (8, 4, 29, NULL, NULL, NULL, NULL, CAST(N'2020-06-19 02:56:42.717' AS DateTime))
INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (10, 4, 26, NULL, 1, 4, N'OK ! TEst', CAST(N'2020-06-19 04:07:05.627' AS DateTime))
INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (11, 4, 26, NULL, 1, 1, N'ok Test2', CAST(N'2020-06-19 04:07:58.400' AS DateTime))
INSERT [dbo].[Comment] ([Comment_ID], [User_ID], [Class_ID], [New_ID], [RootCommentID], [ReplyToCommentID], [Content], [PostDate]) VALUES (12, 9, 69, NULL, NULL, NULL, N'Hay ', CAST(N'2020-06-21 05:33:06.653' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Footer] ON 

INSERT [dbo].[Footer] ([Footer_ID], [Name], [Address], [Phone], [Facebook], [Insta]) VALUES (1, N'BITSoccer', N'123 ', N'123 ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Footer] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([GenderID], [Gender]) VALUES (1, N'Nam')
INSERT [dbo].[Gender] ([GenderID], [Gender]) VALUES (2, N'Nữ')
INSERT [dbo].[Gender] ([GenderID], [Gender]) VALUES (3, N'Nam và Nữ')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Home_Slide] ON 

INSERT [dbo].[Home_Slide] ([HomeSlide_ID], [Image], [Description], [Link], [DisplayOrder], [CreatedDate], [ModifyDate], [IsActive]) VALUES (1, N'/Content/Images/promo2.jpg', NULL, NULL, 1, NULL, CAST(N'2020-06-22' AS Date), 1)
INSERT [dbo].[Home_Slide] ([HomeSlide_ID], [Image], [Description], [Link], [DisplayOrder], [CreatedDate], [ModifyDate], [IsActive]) VALUES (2, N'/Content/Images/promo3.jpg', NULL, NULL, 2, NULL, CAST(N'2020-06-22' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Home_Slide] OFF
SET IDENTITY_INSERT [dbo].[HomePage_Content] ON 

INSERT [dbo].[HomePage_Content] ([Home_Content_ID], [Coach_Content], [HotClass_Content], [Tour_Content], [Stadium_Content], [Archive_Content], [Quote1_Content], [Quote2_Content]) VALUES (1, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s , when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s , when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s , when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s , when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s , ', N'ONLY PASSIONS, GREAT PASSIONS CAN ELEVATE THE SOUL TO GREAT THINGS.', N'CHỈ ĐAM MÊ, NHỮNG ĐAM MÊ LỚN LAO MỚI NÂNG LINH HỒN TỚI NHỮNG ĐIỀU VĨ ĐẠI.')
SET IDENTITY_INSERT [dbo].[HomePage_Content] OFF
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
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([News_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [NewCate_ID], [Content], [Image], [ViewsCount], [ShortDescription]) VALUES (1, N'Hoạt động từ thiện', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, N'Với tinh thần tương thân tương ái, cảm thông và sẻ chia những khó khăn với cộng đồng, BITSoccer luôn dành một phần ngân sách cho các hoạt động từ thiện, hỗ trợ các trung tâm nuôi dưỡng trẻ em mồ côi khuyết tật, trẻ em đường phố có hoàn cảnh khó khăn cũng như thăm và tặng quà cho người già neo đơn. Đây là những hoạt động thường niên của trung tâm nhằm góp phần xây dựng mối quan hệ tốt đẹp với cộng đồng.')
INSERT [dbo].[News] ([News_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [NewCate_ID], [Content], [Image], [ViewsCount], [ShortDescription]) VALUES (3, N'Lế bế giảng cho các lớp học Bóng đá tốt nghiệp trong tháng 6', NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, N'Để tổng kết thành quả sau quá trình rèn luyện, BITSoccer đã tổ chức buổi lễ bế giảng cho các em học viên của 2 lớp cùng với sự tham gia trực tiếp của cả các phụ huynh và huấn luyện viên trực tiếp giảng dạy các em trong suốt khóa học.')
INSERT [dbo].[News] ([News_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [NewCate_ID], [Content], [Image], [ViewsCount], [ShortDescription]) VALUES (4, N'Khai giảng lớp học bóng đá cho lứa tuổi 16', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, N'Trung tâm dạy bóng đá chúng tôi hiện đang xây dựng khóa học bóng đá cho lứa tuổi 16, với mong muốn có thể giúp các học viên phát triển đam mê bóng đá, có thể tham gia theo học tiếp sau khóa học bóng đá nâng cao.  ')
INSERT [dbo].[News] ([News_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [NewCate_ID], [Content], [Image], [ViewsCount], [ShortDescription]) VALUES (6, N'Tạm hoãn việc học tập ở tất cả các lớp trong thời gian dịch COVID-19', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, N'Do tình hình dịch COVID-19 diễn biến phức tạp, Trung tâm tạm hoãn lịch học của các lớp đang học trong tháng 3 (20/3/2020 đến 20/4/2020).
Bắt đầu từ ngày 21/04/2020, học viên tiếp tục học bình thường theo lịch thông báo.
Trân trọng!')
INSERT [dbo].[News] ([News_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [NewCate_ID], [Content], [Image], [ViewsCount], [ShortDescription]) VALUES (8, N'Tại sao nên cho bé học bóng đá?', NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, N'Thường xuyên tiếp xúc với bóng đá, bé sẽ được vận động nhiều hơn. Nhờ đó, các hệ chức năng của cơ thể như: hô hấp, tim mạch, bài tiết… sẽ làm việc, hoạt động tốt hơn. Đây cũng là cách giúp cho trẻ tăng cường sức đề kháng, nâng cao thể chất, ngăn ngừa bệnh tật hiệu quả')
INSERT [dbo].[News] ([News_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [NewCate_ID], [Content], [Image], [ViewsCount], [ShortDescription]) VALUES (10, N'Cách chơi bóng đá giỏi', NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[News_Category] ON 

INSERT [dbo].[News_Category] ([NewCate_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [DisplayOrder]) VALUES (1, N'Khoá học', NULL, NULL, CAST(N'2020-06-21 00:00:00.000' AS DateTime), N'admin', 1, NULL)
INSERT [dbo].[News_Category] ([NewCate_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [DisplayOrder]) VALUES (2, N'Sự kiện', NULL, NULL, CAST(N'2020-06-21 00:00:00.000' AS DateTime), N'admin', 1, NULL)
INSERT [dbo].[News_Category] ([NewCate_ID], [Name], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy], [IsActive], [DisplayOrder]) VALUES (3, N'Chia sẻ', NULL, NULL, CAST(N'2020-06-21 00:00:00.000' AS DateTime), N'admin', 1, NULL)
SET IDENTITY_INSERT [dbo].[News_Category] OFF
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
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingID], [User_ID], [Class_ID], [NumberStar]) VALUES (1, 10, 69, 5)
INSERT [dbo].[Rating] ([RatingID], [User_ID], [Class_ID], [NumberStar]) VALUES (2, 9, 69, 2)
SET IDENTITY_INSERT [dbo].[Rating] OFF
SET IDENTITY_INSERT [dbo].[Stadium] ON 

INSERT [dbo].[Stadium] ([Stadium_ID], [Name], [Address], [Image]) VALUES (1, N'B.I.T Stadium A', N'274 Nguyễn Tri Phương, Q.10, TP.HCM', N'/Content/Images/SVD_B.png')
INSERT [dbo].[Stadium] ([Stadium_ID], [Name], [Address], [Image]) VALUES (2, N'B.I.T Stadium B', NULL, N'/Content/Images/football-stadium.jpg')
SET IDENTITY_INSERT [dbo].[Stadium] OFF
SET IDENTITY_INSERT [dbo].[Tourament] ON 

INSERT [dbo].[Tourament] ([Tour_ID], [Name], [MetaTitlte], [CreatedDate], [CreaedBy], [ModifyDate], [ModifyBy], [IsActive], [Team_A], [Team_B], [Team_A_Score], [Team_B_Score], [Time], [Stadium_ID], [Team_A_Player], [Team_B_Player], [TeamARedCard], [TeamAYellowCart], [TeamAFouls_Conceded], [TeamBRedCard], [TeamBYellowCart], [TeamBFouls_Conceded], [TeamAFormation], [TeamBFormation]) VALUES (2, N'Thi đấu giao hữu', NULL, NULL, NULL, NULL, NULL, 0, N'FC Sút!', N'FC Thánh', 3, 2, CAST(N'2020-06-15 00:00:00.000' AS DateTime), 1, N'Tuấn(32''), Hiếu(52''), Lộc(83'')', N'Đô(42''), Thạch(91'')', 0, 0, 11, 1, 0, 13, N'5-3-2', N'4-4-3')
INSERT [dbo].[Tourament] ([Tour_ID], [Name], [MetaTitlte], [CreatedDate], [CreaedBy], [ModifyDate], [ModifyBy], [IsActive], [Team_A], [Team_B], [Team_A_Score], [Team_B_Score], [Time], [Stadium_ID], [Team_A_Player], [Team_B_Player], [TeamARedCard], [TeamAYellowCart], [TeamAFouls_Conceded], [TeamBRedCard], [TeamBYellowCart], [TeamBFouls_Conceded], [TeamAFormation], [TeamBFormation]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'FC Banana', N'FC Orange', 0, 1, CAST(N'2020-06-06 00:00:00.000' AS DateTime), 2, NULL, N'Quốc (68'')', 0, 1, 11, 0, 0, 10, N'4-3-4', N'5-3-2')
INSERT [dbo].[Tourament] ([Tour_ID], [Name], [MetaTitlte], [CreatedDate], [CreaedBy], [ModifyDate], [ModifyBy], [IsActive], [Team_A], [Team_B], [Team_A_Score], [Team_B_Score], [Time], [Stadium_ID], [Team_A_Player], [Team_B_Player], [TeamARedCard], [TeamAYellowCart], [TeamAFouls_Conceded], [TeamBRedCard], [TeamBYellowCart], [TeamBFouls_Conceded], [TeamAFormation], [TeamBFormation]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'FC Pikachu', N'FC Nobita', NULL, NULL, CAST(N'2020-07-01 00:00:00.000' AS DateTime), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tourament] ([Tour_ID], [Name], [MetaTitlte], [CreatedDate], [CreaedBy], [ModifyDate], [ModifyBy], [IsActive], [Team_A], [Team_B], [Team_A_Score], [Team_B_Score], [Time], [Stadium_ID], [Team_A_Player], [Team_B_Player], [TeamARedCard], [TeamAYellowCart], [TeamAFouls_Conceded], [TeamBRedCard], [TeamBYellowCart], [TeamBFouls_Conceded], [TeamAFormation], [TeamBFormation]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'FC Dream Makers', N'FC Awesome Knights', NULL, NULL, CAST(N'2020-07-05 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tourament] ([Tour_ID], [Name], [MetaTitlte], [CreatedDate], [CreaedBy], [ModifyDate], [ModifyBy], [IsActive], [Team_A], [Team_B], [Team_A_Score], [Team_B_Score], [Time], [Stadium_ID], [Team_A_Player], [Team_B_Player], [TeamARedCard], [TeamAYellowCart], [TeamAFouls_Conceded], [TeamBRedCard], [TeamBYellowCart], [TeamBFouls_Conceded], [TeamAFormation], [TeamBFormation]) VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'FC Stars', N'FC FarCry', NULL, NULL, CAST(N'2020-07-12 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tourament] ([Tour_ID], [Name], [MetaTitlte], [CreatedDate], [CreaedBy], [ModifyDate], [ModifyBy], [IsActive], [Team_A], [Team_B], [Team_A_Score], [Team_B_Score], [Time], [Stadium_ID], [Team_A_Player], [Team_B_Player], [TeamARedCard], [TeamAYellowCart], [TeamAFouls_Conceded], [TeamBRedCard], [TeamBYellowCart], [TeamBFouls_Conceded], [TeamAFormation], [TeamBFormation]) VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'FC Bede', N'FC Sút!', NULL, NULL, CAST(N'2020-07-12 00:00:00.000' AS DateTime), 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tourament] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (3, 1, N'admin', N'123456', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (4, 2, N'student1', N'123', N'nguyenvana@gmail.com', NULL, 1, N'Nguyễn Văn B', CAST(N'1999-01-02' AS Date), N'Nam', N'123456678', NULL)
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (5, 3, N'coach1', N'123', N'vhoang5@gmail.com', N'https://media1.nguoiduatin.vn/media/vu-thi-thuy-tien/2018/11/07/hlv-truong-vie-t-hoa-ng-do-i-tuye-n-vie-t-nam-dang-so-hu-u-lu-a-ca-u-thu-ma-nh-2.jpg', 1, N'Trương Việt Hoàng', CAST(N'1987-05-07' AS Date), N'Nam', N'0896421412', N'275 Phan Xích Long, Phường 7, Quận Phú Nhuận')
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (6, 3, N'coach2', N'123', N'chungduc82@gmail.com', N'https://media.hvtvzone.com/upload/News/huan-luyen-vien-mai-duc-chung-ti-so-bong-da-truc-tuyen-uesOEJ645.jpg', 1, N'Mai Đức Trung', CAST(N'1982-11-27' AS Date), N'Nam', NULL, N'217 Nguyễn Văn Cừ, Phường 4, Quận 5')
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (7, 3, N'coach3', N'123', N'phseo15@gmail.com', N'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTgzELNGKintxK6Utbir1OMyEH0G_LPD1KgcaSo2IzS4kZV2wxf&usqp=CAU', 1, N'Park Hang Seo', CAST(N'1957-10-01' AS Date), N'Nam', N'0348096012', N'15 Nguyễn Thái Học, Phường Cầu Kho, Quận 1')
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (8, 2, N'kimthi', N'123', N'kimthi@gmail.com', NULL, 1, N'Nguyễn Thị Kim Thi', CAST(N'1999-10-20' AS Date), N'Nữ', N'123123123', NULL)
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (9, 2, N'hanhtien', N'123', N'hanhtien@gmail.com', N'/Content/Images/Avatar4.png', 1, N'hanh tiên', CAST(N'1999-06-20' AS Date), N'Nữ', N'123123123', NULL)
INSERT [dbo].[User] ([User_ID], [UserType_ID], [UserName], [Password], [Email], [Avatar], [IsActive], [CustomerName], [BirthDay], [Gender], [PhoneNumber], [Address]) VALUES (10, 2, N'thanhtuan', N'1', N'thanhtuan@gmail.com', N'/Content/Images/20180402_071817.jpg', 1, N'Nguyễn Thanh Tuấn', CAST(N'1995-05-19' AS Date), N'Nam', N'123123132123', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([UserType_ID], [UserTypeName]) VALUES (1, N'Admin')
INSERT [dbo].[UserType] ([UserType_ID], [UserTypeName]) VALUES (2, N'Student')
INSERT [dbo].[UserType] ([UserType_ID], [UserTypeName]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [dbo].[UserType] OFF
ALTER TABLE [dbo].[About] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [df_Time]  DEFAULT (getdate()) FOR [PostDate]
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
