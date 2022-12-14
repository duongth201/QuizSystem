USE [master]
GO
/****** Object:  Database [OnlineQuizSystem]    Script Date: 7/31/2022 2:58:29 PM ******/
CREATE DATABASE [OnlineQuizSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineQuizSystem', FILENAME = N'D:\Program Files (x86) from C\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OnlineQuizSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineQuizSystem_log', FILENAME = N'D:\Program Files (x86) from C\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OnlineQuizSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OnlineQuizSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineQuizSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineQuizSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineQuizSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineQuizSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineQuizSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineQuizSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineQuizSystem] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineQuizSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineQuizSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineQuizSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineQuizSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineQuizSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineQuizSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OnlineQuizSystem] SET QUERY_STORE = OFF
GO
USE [OnlineQuizSystem]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[answerId] [int] IDENTITY(1,1) NOT NULL,
	[questionId] [int] NOT NULL,
	[answerContent] [nvarchar](max) NOT NULL,
	[isCorrect] [bit] NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[answerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blogId] [int] IDENTITY(1,1) NOT NULL,
	[blogTitle] [nvarchar](50) NOT NULL,
	[blogCategoryId] [int] NOT NULL,
	[blogThumbnail] [nvarchar](max) NULL,
	[lastUpdated] [datetime] NULL,
	[author] [int] NOT NULL,
	[briefInfo] [nvarchar](max) NULL,
	[blogDetail] [nvarchar](max) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[blogCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[blogCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BlogCategory] PRIMARY KEY CLUSTERED 
(
	[blogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[catId] [int] IDENTITY(1,1) NOT NULL,
	[catName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[catId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerQuiz]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerQuiz](
	[quizTakeId] [int] IDENTITY(1,1) NOT NULL,
	[quizId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[point] [float] NOT NULL,
	[time] [int] NOT NULL,
	[submitted] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerQuiz] PRIMARY KEY CLUSTERED 
(
	[quizTakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension](
	[dimensionId] [int] IDENTITY(1,1) NOT NULL,
	[dimensionName] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[typeId] [int] NOT NULL,
	[subjectID] [int] NULL,
 CONSTRAINT [PK_Dimension] PRIMARY KEY CLUSTERED 
(
	[dimensionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimensionType]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimensionType](
	[typeId] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DimensionType] PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expert]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expert](
	[userId] [int] NOT NULL,
	[subjectId] [int] NOT NULL,
 CONSTRAINT [PK_Expert] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[lessonId] [int] IDENTITY(1,1) NOT NULL,
	[subjectId] [int] NOT NULL,
	[lessonName] [nvarchar](255) NOT NULL,
	[lessonOrder] [int] NOT NULL,
	[lessonTypeId] [int] NOT NULL,
	[videoLink] [varchar](1024) NULL,
	[content] [nvarchar](max) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[lessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonType]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonType](
	[lessonTypeId] [int] IDENTITY(1,1) NOT NULL,
	[lessonTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LessonType] PRIMARY KEY CLUSTERED 
(
	[lessonTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePackage]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePackage](
	[packageId] [int] IDENTITY(1,1) NOT NULL,
	[packageName] [varchar](50) NOT NULL,
	[listPrice] [money] NOT NULL,
	[salePrice] [money] NULL,
	[status] [bit] NOT NULL,
	[subjectId] [int] NOT NULL,
	[duration] [int] NULL,
 CONSTRAINT [PK_PricePackage] PRIMARY KEY CLUSTERED 
(
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[subjectId] [int] NOT NULL,
	[questionContent] [varchar](max) NULL,
	[dimensionId] [int] NULL,
	[lessonId] [int] NULL,
	[status] [bit] NULL,
	[image] [varchar](max) NULL,
	[audio] [varchar](max) NULL,
	[video] [varchar](max) NULL,
	[explanation] [nvarchar](max) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizId] [int] IDENTITY(1,1) NOT NULL,
	[quizName] [varchar](50) NOT NULL,
	[quizTypeId] [int] NOT NULL,
	[levelId] [int] NOT NULL,
	[quizContent] [nvarchar](max) NOT NULL,
	[numOfQuestion] [int] NOT NULL,
	[passRate] [int] NULL,
	[duration] [int] NOT NULL,
	[subjectId] [int] NOT NULL,
	[maximum answers per ques] [int] NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[quizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizLevel]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizLevel](
	[levelId] [int] IDENTITY(1,1) NOT NULL,
	[levelName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_QuizLevel] PRIMARY KEY CLUSTERED 
(
	[levelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizQuestion]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizQuestion](
	[quizId] [int] NOT NULL,
	[questionId] [int] NOT NULL,
 CONSTRAINT [PK_QuizQuestion] PRIMARY KEY CLUSTERED 
(
	[quizId] ASC,
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizType]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizType](
	[quizTypeId] [int] IDENTITY(1,1) NOT NULL,
	[quizTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuizType] PRIMARY KEY CLUSTERED 
(
	[quizTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[regId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[regTime] [datetime] NOT NULL,
	[packageId] [int] NOT NULL,
	[cost] [float] NOT NULL,
	[validFrom] [datetime] NOT NULL,
	[validTo] [datetime] NOT NULL,
	[lastUpdatedBy] [int] NOT NULL,
	[note] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[isAccepted] [bit] NULL,
	[subjectId] [int] NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[regId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[subjectId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[QuizID] [int] NOT NULL,
	[SettingTypeID] [int] NOT NULL,
	[SettingName] [nvarchar](255) NOT NULL,
	[QuizContent] [nvarchar](255) NULL,
	[QuizDuration] [int] NULL,
	[NumberOfQuestion] [int] NULL,
	[Status] [bit] NOT NULL,
	[MaxNumAnswersPerQuest] [int] NOT NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting_Type]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting_Type](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Setting_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[sliderId] [int] IDENTITY(1,1) NOT NULL,
	[sliderTitle] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NULL,
	[backlink] [int] NOT NULL,
	[note] [nvarchar](255) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[sliderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[subCateId] [int] IDENTITY(1,1) NOT NULL,
	[catId] [int] NOT NULL,
	[subCateName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[subCateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectId] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[thumbnailURL] [varchar](255) NOT NULL,
	[featured] [bit] NOT NULL,
	[status] [bit] NOT NULL,
	[updatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectCategory]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectCategory](
	[catId] [int] NOT NULL,
	[subjectId] [int] NOT NULL,
 CONSTRAINT [PK_SubjectCategory] PRIMARY KEY CLUSTERED 
(
	[catId] ASC,
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[tagId] [int] IDENTITY(1,1) NOT NULL,
	[tagName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag_Subject]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag_Subject](
	[tagId] [int] NOT NULL,
	[subjectId] [int] NOT NULL,
 CONSTRAINT [PK_Tag_Subject] PRIMARY KEY CLUSTERED 
(
	[tagId] ASC,
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TakeAnswer]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TakeAnswer](
	[takeAnswerId] [int] IDENTITY(1,1) NOT NULL,
	[quizTakeId] [int] NOT NULL,
	[questionId] [int] NOT NULL,
	[answerId] [int] NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_TakeAnswer] PRIMARY KEY CLUSTERED 
(
	[takeAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](63) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[roleId] [int] NOT NULL,
	[profilePic] [nvarchar](255) NULL,
	[email] [nvarchar](255) NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [nchar](10) NOT NULL,
	[status] [bit] NULL,
	[address] [nvarchar](255) NULL,
	[token] [nvarchar](50) NULL,
	[createdTimeResetToken] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 7/31/2022 2:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](30) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (1, 6, N'I', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (2, 6, N'You', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (3, 6, N'Friend', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (4, 6, N'Foe', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (5, 7, N'Cat', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (6, 7, N'Dog', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (7, 7, N'Ant', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (8, 7, N'Elephant', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (9, 8, N'Good Morning', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (10, 8, N'Ring', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (11, 8, N'Television', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (12, 8, N'Work', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (13, 10, N'You', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (14, 10, N'Snake', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (15, 10, N'Dice', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (16, 10, N'Brain', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (17, 11, N'Good Night', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (18, 11, N'Ten', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (19, 11, N'Sky', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (20, 11, N'Castle', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (21, 12, N'Thank you', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (22, 12, N'Sorry', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (23, 12, N'Angry', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (24, 12, N'Happy', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (25, 13, N'Short', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (26, 13, N'Long', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (27, 13, N'Straight', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (28, 13, N'Curved', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (29, 14, N'Clock', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (30, 14, N'Dishes', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (31, 14, N'Meet', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (32, 14, N'Chicken', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (37, 15, N'Hair', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (38, 15, N'Finger', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (39, 15, N'Foot', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (40, 15, N'Food', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (93, 33, N'Strain', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (94, 33, N'Undefined', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (95, 33, N'Two', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (96, 33, N'String', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (97, 34, N'Sigma', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (98, 34, N'Undefined', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (99, 34, N'Paralell', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (100, 34, N'Double', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (101, 36, N'Strain', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (102, 36, N'Undefined', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (103, 36, N'Two', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (104, 36, N'String', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (105, 37, N'Sigma', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (106, 37, N'Undefined', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (107, 37, N'Paralell', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (108, 37, N'Double', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (109, 38, N'Strain', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (110, 38, N'Undefined', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (111, 38, N'Two', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (112, 38, N'String', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (113, 39, N'Sigma', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (114, 39, N'Undefined', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (115, 39, N'Paralell', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (116, 39, N'Double', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (117, 40, N'Strain', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (118, 40, N'Undefined', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (119, 40, N'Two', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (120, 40, N'String', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (121, 41, N'Sigma', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (122, 41, N'Undefined', 1, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (123, 41, N'Paralell', 0, 1)
INSERT [dbo].[Answer] ([answerId], [questionId], [answerContent], [isCorrect], [status]) VALUES (124, 41, N'Double', 0, 1)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([blogId], [blogTitle], [blogCategoryId], [blogThumbnail], [lastUpdated], [author], [briefInfo], [blogDetail], [status]) VALUES (1, N'Rita Way: Why is it so Effective?', 1, N'u_1_japan.png', CAST(N'2022-07-21T00:00:00.000' AS DateTime), 14, N'The Rita Way', N'RMC Learning Solutions was founded in 1991 by Rita Mulcahy, who spent years working as a trainer and consultant. What started off as a project management training company with the intention of helping people pass the PMPÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ® exam eventually grew into what it is today: a trusted and proven resource for training and exam prep courses led by renowned experts in their field.
Using our unique Accelerated Learning Theory, RMC will teach you more in much less time. RMCÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs guidance, tools, and techniques are used around the world, in a variety of industries from software development and financial services, to construction, to government agencies.', 1)
INSERT [dbo].[Blog] ([blogId], [blogTitle], [blogCategoryId], [blogThumbnail], [lastUpdated], [author], [briefInfo], [blogDetail], [status]) VALUES (2, N'Write Useful Comments', 1, N'rmc.jpg', CAST(N'2022-06-17T00:00:00.000' AS DateTime), 14, N'Userfull comment is very important', N'Comments are crucial. You wonÃÂÃÂ¢ÃÂÃÂÃÂÃÂt appreciate them until you leave your thousand-line script for a couple of days and return to and try and make sense of it. Useful comments make life easier for yourself and those after you who have to maintain your code.
Write meaningful, single line comments for vague lines; write full parameter and functionality descriptions for functions and methods; for tricky logic blocks, describe the logic in words before it if necessary. And donÃÂÃÂ¢ÃÂÃÂÃÂÃÂt forget, always keep your comments up to date!', 0)
INSERT [dbo].[Blog] ([blogId], [blogTitle], [blogCategoryId], [blogThumbnail], [lastUpdated], [author], [briefInfo], [blogDetail], [status]) VALUES (3, N'Decision Making: Going Forward in Reverse', 1, N'Rita.jpg', CAST(N'2022-06-17T00:00:00.000' AS DateTime), 15, N'Decision making skill', N'Busy managers analyze many situations and make hundreds of decisions every day. Why, for example, are sales up in one city but down in another? Would an investment in new equipment mean higher productivity or greater confusion? Is now a good time to look for a joint venture partner, or is it better to wait? Rarely, however, do we stop to think about how we think.
Each decision is the outcome of a complex process that usually involves two different kinds of thinking: looking backward to understand the past and looking forward to predict the future.', 1)
INSERT [dbo].[Blog] ([blogId], [blogTitle], [blogCategoryId], [blogThumbnail], [lastUpdated], [author], [briefInfo], [blogDetail], [status]) VALUES (4, N'What is Agile?', 1, N'chess.jpg', CAST(N'2022-06-17T00:00:00.000' AS DateTime), 16, N'Agile process', N'Agile is an iterative approach to project management and software development that helps teams deliver value to their customers faster and with fewer headaches. Instead of betting everything on a "big bang" launch, an agile team delivers work in small, but consumable, increments. Requirements, plans, and results are evaluated continuously so teams have a natural mechanism for responding to change quickly', 1)
INSERT [dbo].[Blog] ([blogId], [blogTitle], [blogCategoryId], [blogThumbnail], [lastUpdated], [author], [briefInfo], [blogDetail], [status]) VALUES (5, N'Why is it important to learn English?', 5, N'rmc.jpg', CAST(N'2021-09-18T00:00:00.000' AS DateTime), 17, N'English importance', N'There are many, many reasons why learning a new language is a good idea. It allows you to communicate with new people. It helps you to see things from a different perspective, or get a deeper understanding of another culture. It helps you to become a better listener. It even has health benefits, as studies have shown that people who speak two or more languages have more active minds later in life!
Those are all reasons to learn any language – but did you know that there are 6,500 languages still spoken in the world today? With such an enormous number to choose from, why pick English?
Here are five big reasons that learning English can improve your life.', 0)
INSERT [dbo].[Blog] ([blogId], [blogTitle], [blogCategoryId], [blogThumbnail], [lastUpdated], [author], [briefInfo], [blogDetail], [status]) VALUES (6, N'Donald Trump is the king of USA ', 1, N'chess.jpg', CAST(N'2022-06-15T00:00:00.000' AS DateTime), 16, N'Donald Trumple ', N'He is alive', 0)
INSERT [dbo].[Blog] ([blogId], [blogTitle], [blogCategoryId], [blogThumbnail], [lastUpdated], [author], [briefInfo], [blogDetail], [status]) VALUES (9, N'aksdkal', 3, N'Rita.jpg', CAST(N'2022-06-17T00:00:00.000' AS DateTime), 17, N'asdasd', N'asdasd', 0)
INSERT [dbo].[Blog] ([blogId], [blogTitle], [blogCategoryId], [blogThumbnail], [lastUpdated], [author], [briefInfo], [blogDetail], [status]) VALUES (10, N'demo', 4, N'Rita.jpg', CAST(N'2022-06-17T00:00:00.000' AS DateTime), 16, N'demo', N'demo', 0)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogCategory] ON 

INSERT [dbo].[BlogCategory] ([blogCategoryId], [blogCategoryName]) VALUES (1, N'LifeStyle')
INSERT [dbo].[BlogCategory] ([blogCategoryId], [blogCategoryName]) VALUES (2, N'Fitness')
INSERT [dbo].[BlogCategory] ([blogCategoryId], [blogCategoryName]) VALUES (3, N'Fashion')
INSERT [dbo].[BlogCategory] ([blogCategoryId], [blogCategoryName]) VALUES (4, N'Social Media')
INSERT [dbo].[BlogCategory] ([blogCategoryId], [blogCategoryName]) VALUES (5, N'Food')
SET IDENTITY_INSERT [dbo].[BlogCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([catId], [catName]) VALUES (1, N'Marketing')
INSERT [dbo].[Category] ([catId], [catName]) VALUES (2, N'English')
INSERT [dbo].[Category] ([catId], [catName]) VALUES (3, N'Soft Skills')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerQuiz] ON 

INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (1, 1, 1, 90, 120, CAST(N'2022-05-27T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (2, 1, 1, 80, 120, CAST(N'2022-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (3, 1, 1, 60, 100, CAST(N'2022-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (4, 2, 1, 70, 100, CAST(N'2022-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (5, 2, 1, 75, 120, CAST(N'2022-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (6, 3, 1, 85, 120, CAST(N'2022-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (7, 3, 1, 50, 120, CAST(N'2022-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (8, 3, 1, 65, 100, CAST(N'2022-05-27T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (9, 2, 1, 80, 100, CAST(N'2022-05-27T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (10, 2, 1, 70, 100, CAST(N'2022-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (11, 4, 5, 70, 100, CAST(N'2022-05-29T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (12, 5, 5, 85, 120, CAST(N'2022-05-29T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (13, 6, 5, 90, 100, CAST(N'2022-05-29T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (14, 4, 1, 70, 120, CAST(N'2022-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (15, 2, 1, 0, 24, CAST(N'2022-06-30T23:21:38.413' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (16, 1, 1, 0, 62, CAST(N'2022-06-30T23:22:48.333' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (17, 1, 1, 0, 60, CAST(N'2022-06-30T23:23:56.490' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (18, 1, 1, 0, 98, CAST(N'2022-06-30T23:25:42.503' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (19, 1, 1, 0, 2, CAST(N'2022-06-30T23:51:34.447' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (20, 1, 1, 75, 24, CAST(N'2022-06-30T23:52:04.320' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (21, 1, 1, 75, 59, CAST(N'2022-06-30T23:55:51.437' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (22, 1, 1, 100, 59, CAST(N'2022-06-30T23:59:19.043' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (23, 1, 1, 66.666671752929688, 36, CAST(N'2022-07-01T00:03:33.860' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (24, 2, 1, 66.666671752929688, 17, CAST(N'2022-07-01T00:04:44.757' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (25, 1, 1, 0, 1, CAST(N'2022-07-01T07:36:41.337' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (26, 1, 1, 0, 37, CAST(N'2022-07-01T07:37:28.303' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (27, 1, 1, 0, 5, CAST(N'2022-07-01T07:38:52.680' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (28, 1, 1, 100, 59, CAST(N'2022-07-01T07:45:07.540' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (29, 1, 1, 0, 11, CAST(N'2022-07-01T07:47:23.600' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (30, 1, 1, 0, 59, CAST(N'2022-07-01T08:21:13.753' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (31, 1, 8, 0, 60, CAST(N'2022-07-01T08:43:26.727' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (32, 1, 1, 100, 25, CAST(N'2022-07-07T11:28:27.210' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (33, 1, 1, 0, 4, CAST(N'2022-07-07T11:47:09.537' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (34, 1, 1, 100, 0, CAST(N'2022-07-22T01:36:02.620' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (35, 1, 1, 100, 26, CAST(N'2022-07-22T01:36:02.643' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (36, 1, 1, 0, 0, CAST(N'2022-07-22T01:36:59.540' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (37, 1, 1, 0, 22, CAST(N'2022-07-22T01:36:59.557' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (38, 1, 1, 0, 60, CAST(N'2022-07-22T01:39:48.073' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (39, 1, 1, 0, 121, CAST(N'2022-07-22T01:45:17.407' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (40, 1, 1, 0, 452, CAST(N'2022-07-22T01:53:15.200' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (41, 1, 1, 25, 43, CAST(N'2022-07-22T01:55:09.233' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (42, 1, 1, 0, 548, CAST(N'2022-07-22T02:04:38.160' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (43, 1, 1, 100, 0, CAST(N'2022-07-22T02:07:44.690' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (44, 1, 1, 100, 32, CAST(N'2022-07-22T02:07:45.007' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (45, 1, 1, 0, 113, CAST(N'2022-07-22T02:09:46.917' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (46, 1, 1, 0, 0, CAST(N'2022-07-22T02:13:02.447' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (47, 1, 1, 0, 16, CAST(N'2022-07-22T02:13:02.473' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (48, 1, 1, 100, 0, CAST(N'2022-07-22T07:54:16.203' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (49, 1, 1, 100, 21, CAST(N'2022-07-22T07:54:16.373' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (50, 1, 1, 33.333335876464844, 0, CAST(N'2022-07-22T07:55:46.257' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (51, 1, 1, 33.333335876464844, 19, CAST(N'2022-07-22T07:55:46.273' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (52, 1, 1, 0, 205, CAST(N'2022-07-22T07:59:25.117' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (53, 1, 1, 0, 0, CAST(N'2022-07-22T08:29:07.960' AS DateTime))
INSERT [dbo].[CustomerQuiz] ([quizTakeId], [quizId], [userId], [point], [time], [submitted]) VALUES (54, 1, 1, 0, 428, CAST(N'2022-07-22T08:29:08.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[CustomerQuiz] OFF
GO
SET IDENTITY_INSERT [dbo].[Dimension] ON 

INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (1, N'Java Programming ', N'It fun', 2, 1)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (2, N'Japanese', N'abc', 2, 2)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (3, N'Physics', N'abc', 1, 3)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (4, N'Graphics Design', N'abc', 2, 4)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (5, N'Business high level', N'abc', 2, 5)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (7, N'Japanese', N'abc', 2, 7)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (11, N'private', N'this is dimension', 1, 12)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (12, N'Protected', N'<p><b><u>This is dimension 2</u></b></p>', 2, 3)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (14, N'Marketing', N'<p><b>Marketing is the best</b></p>', 1, 5)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (15, N'Software', N'<p>Software is fun</p>', 2, 12)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (16, N'Domain', N'', 1, 1)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (17, N'', N'<p><b>a</b></p>', 2, 2)
INSERT [dbo].[Dimension] ([dimensionId], [dimensionName], [description], [typeId], [subjectID]) VALUES (18, N'Japanese', N'<p>Hello</p>', 1, 1)
SET IDENTITY_INSERT [dbo].[Dimension] OFF
GO
SET IDENTITY_INSERT [dbo].[DimensionType] ON 

INSERT [dbo].[DimensionType] ([typeId], [typeName]) VALUES (1, N'Domain')
INSERT [dbo].[DimensionType] ([typeId], [typeName]) VALUES (2, N'Group')
SET IDENTITY_INSERT [dbo].[DimensionType] OFF
GO
INSERT [dbo].[Expert] ([userId], [subjectId]) VALUES (6, 2)
INSERT [dbo].[Expert] ([userId], [subjectId]) VALUES (6, 3)
INSERT [dbo].[Expert] ([userId], [subjectId]) VALUES (6, 19)
INSERT [dbo].[Expert] ([userId], [subjectId]) VALUES (7, 3)
INSERT [dbo].[Expert] ([userId], [subjectId]) VALUES (7, 15)
INSERT [dbo].[Expert] ([userId], [subjectId]) VALUES (16, 4)
INSERT [dbo].[Expert] ([userId], [subjectId]) VALUES (16, 14)
INSERT [dbo].[Expert] ([userId], [subjectId]) VALUES (19, 1)
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (2, 1, N'Introduction of Management', 1, 1, N'', N'<u style="">Everyday Excel, Part 1" is aimed at learners who are seeking to learn Excel from the ground up. No experience with Excel is necessary. While this course is meant for beginners of Excel, advanced users will undoubtedly pick up new skills and tools.</u>', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (3, 1, N'4 main ideas of OOP in Java', 2, 2, N'4 main ideas of OOP in Java', N'<b><u>"Everyday Excel, Part 1" is aimed at learners who are seeking to learn Excel from the ground up.  No experience with Excel is necessary.  While this course is meant for beginners of Excel, advanced users will undoubtedly pick up new skills and tools.</u></b><br><p></p>', 1)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (4, 1, N'Quiz: 4 main ideas of OOP in Java', 3, 3, NULL, N'First quiz, but dont be too afraid.', 1)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (5, 2, N'Introduction', 1, 1, NULL, N'Japanese for the absolute beginners, whether for academic purposes, work or if you just admire Japan and its culture', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (6, 2, N'Hiragana', 2, 2, N'', N'<b>This course is the first part of a three-part series and Specialization that focuses on teaching introductory through very advanced techniques and tools in Excel.  In this course (Part 1), you will: 1) learn how to effectively navigate around the Excel environment; 2) edit and format Excel </b></span><br></p>">', 1)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (7, 2, N'Basic Greetings', 3, 2, NULL, N'NKonnichiwa (Hi; Good afternoon.)
Ohayo gozaimasu/ Ohayo (Good morning [formal/informal])
Konbanwa (Good evening)
Hajimemashite. (How do you do?)
O-genki desu ka. (How are you? [formal])
Genki? (How are you? [informal])
Maiku-san wa? (How about you, Mike?)
Hai, genki desu. (Yes, I’m fine.)
E, mama desu. (Well, so-so.)
Hai, watashi mo genki desu. (Yes, I’m fine, too.)
Mata ashita. (See you tomorrow.)
Sayonara. (Goodbye.)
Oyasumi nasai. (Good night.)
ULL', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (8, 2, N'Small Quiz', 4, 3, N'Small Quiz', N'', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (9, 2, N'See you again', 5, 1, NULL, N'Keep on learning!', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (10, 3, N'Introduction', 1, 1, N'Introduction', N'', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (11, 3, N'Basics', 2, 2, NULL, N'Physics programmers create software that forms the basis of crashes, collisions and other things that move. When, for example, a car drives through water or bursts into flames, the effect needs to be similar to what would happen in real life. Physics programmers write the code, based on the laws of physics, to make this happen. It requires high-level knowledge of both physics and programming. It also requires a sense of gameplay and the right blend of realism and fun.', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (12, 3, N'Small Quiz', 3, 3, NULL, N'Its not done yet, more lessons are on their way.', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (13, 4, N'Introduction', 1, 1, NULL, N'Learn how to photoshop for your own needs, and for higher, professional jobs.', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (14, 4, N'Some crucial skills needed in photoshop', 2, 2, NULL, N'The key to photoshop is patience.', 1)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (15, 4, N'Small Quiz', 3, 3, NULL, N'Just the basics so far.', 1)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (16, 2, N'Welcome to Japanese 3', 1, 2, N'Welcome to Japanese 3', N'<p>We organise what we write into sentences and paragraphs. A paragraph begins on a new line within the text and there is often a blank line between paragraphs. AAAAAAAAAAAAAAAA<br></p>"&gt;', 1)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (17, 2, N'Past simple', 3, 2, N'', N'<p><span style="color: rgb(29, 42, 87); font-family: Arial, Helvetica, sans-serif; font-size: 16px;">We organise what we write into sentences and paragraphs. A paragraph begins on a new line within the text and there is often a blank line between paragraphs.</span><br></p>', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (18, 3, N'Future simple', 5, 2, N'', N'This lesson is about future simple', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (19, 3, N'Continuous future simple', 3, 2, N'', N'<p>Let''s start with continuous simple</p>', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (27, 3, N'Future simple', 3, 2, N'Future simple', N'<span style="color: rgb(31, 31, 31); font-family: OpenSans, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;"><b>New to Excel?  That is entirely fine!  This course is meant to be fun, thought-provoking, and appeal to a wide audience.  No prior knowledge in programming nor advanced math skills are necessary.  The course is organized into 5 Weeks (modules). </b></span>', 1)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (29, 4, N'Software Requirement', 2, 2, N'', N'<p><b>This is requirement</b></p>', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (30, 4, N'Future simple', 1, 2, N'', N'<p>This is lesson</p>', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (31, 4, N'Future simple', 1, 2, N'', N'<p>This is lesson</p>', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (32, 3, N'Past simple', 1, 2, N'', N'<p>abc</p>', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (33, 3, N'Past simple', 1, 2, N'', N'<p>abc</p>', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (34, 2, N'Past simple', 2, 2, N'', N'<p>abccc</p>', 0)
INSERT [dbo].[Lesson] ([lessonId], [subjectId], [lessonName], [lessonOrder], [lessonTypeId], [videoLink], [content], [status]) VALUES (35, 2, N'Past simple', 1, 2, N'ASDASD', N'<p>Simple past</p>', 0)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[LessonType] ON 

INSERT [dbo].[LessonType] ([lessonTypeId], [lessonTypeName]) VALUES (1, N'Subject-Topic')
INSERT [dbo].[LessonType] ([lessonTypeId], [lessonTypeName]) VALUES (2, N'Lesson')
INSERT [dbo].[LessonType] ([lessonTypeId], [lessonTypeName]) VALUES (3, N'Quiz')
SET IDENTITY_INSERT [dbo].[LessonType] OFF
GO
SET IDENTITY_INSERT [dbo].[PricePackage] ON 

INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (1, N'3 months', 20.0000, 7.0000, 1, 1, 3)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (2, N'6 months', 20.0000, 15.0000, 1, 1, 6)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (3, N'Lifetime', 100.0000, 90.0000, 1, 1, NULL)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (4, N'3 months', 15.0000, NULL, 1, 2, 3)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (5, N'6 months', 80.0000, 50.0000, 1, 2, 6)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (6, N'LifeTime', 65.0000, NULL, 1, 2, NULL)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (7, N'3 months', 89.0000, 70.0000, 1, 3, 3)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (8, N'6 months', 55.0000, 40.0000, 1, 3, 6)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (9, N'Lifetime', 123.0000, 100.0000, 1, 3, NULL)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (10, N'3 months', 188.0000, 100.0000, 1, 4, 3)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (11, N'6 months', 179.0000, 160.0000, 1, 4, 6)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (12, N'Lifetime', 110.0000, 90.0000, 1, 4, NULL)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (13, N'3 months', 88.0000, 50.0000, 1, 5, 3)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (14, N'6 months', 200.0000, 150.0000, 1, 5, 6)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (15, N'Lifetime', 149.0000, 139.0000, 1, 5, NULL)
INSERT [dbo].[PricePackage] ([packageId], [packageName], [listPrice], [salePrice], [status], [subjectId], [duration]) VALUES (16, N'3 months', 15.0000, 10.0000, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[PricePackage] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (6, 1, N'watashi', 2, 5, 1, N'upload_6_pexels-fauxels-3183132.jpg', N'', N'', N'nihongo')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (7, 1, N't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 2, 5, 1, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'nihongo')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (8, 1, N'ohayo', 2, 5, 1, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'nihongo')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (10, 2, N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the', 2, 5, 1, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'nihongo')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (11, 3, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae fringilla est. Donec non ullamcorper ipsum, ut pharetra sem. Suspendisse et vestibulum metus. Sed sollicitudin enim eget suscipit elementum. Quisque mattis malesuada nisl vel commodo. Vivamus hendrerit tincidunt porttitor. Etiam nulla est, dapibus quis tempor et, convallis et felis. Phasellus porta nisl id sem feugiat consequat.', 2, 5, 1, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'nihongo')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (12, 7, N'arigatou gozaimasu', 2, 5, 1, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'nihongo')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (13, 1, N'Duis egestas sollicitudin sem, nec vulputate nisi eleifend at. Sed pulvinar eros eget mauris viverra maximus. Curabitur feugiat libero a orci consectetur convallis. Aliquam pretium, turpis et ultrices tempor, quam est pellentesque lacus, fringilla pellentesque diam erat nec arcu. Etiam ultrices tristique consectetur. Curabitur non finibus diam. Integer accumsan, neque eu condimentum commodo, odio orci elementum nisi, eu malesuada neque purus ac diam. Sed eget elit pharetra eros tristique ullamcorper. Mauris interdum convallis ornare. Fusce ultricies sapien vel ipsum bibe', 2, 5, 1, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'nihongo')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (14, 4, N'Phasellus in ex non diam pretium aliquet. In convallis eros sit amet risus hendrerit, in ultricies eros dapibus. Proin lobortis lorem nec nunc faucibus sagittis. Suspendisse potenti. Integer fringilla sem id neque lacinia, sed eleifend sapien dapibus. Sed eget scelerisque magna, eu feugiat mauris. Nullam eu magna felis. Nulla lacus metus, semper non consequat a, pretium facilisis sapien. Maecenas tortor lacus, iaculis id mi sed, scelerisque euismod velit. Curabitur lorem quam, accumsan non arcu eu, blandit tempus leo.Phasellus in ex non diam pretium aliquet. In convallis eros sit amet risus hendrerit, in ultricies eros dapibus. Proin lobortis lorem nec nunc faucibus sagittis. Suspendisse potenti. Integer fringilla sem id neque lacinia, sed eleifend sapien dapibus. Sed eget scelerisque magna, eu feugiat mauris. Nullam eu magna felis. Nulla lacus metus, semper non consequat a, pretium facilisis sapien. Maecenas tortor lacus, iaculis id mi sed, scelerisque euismod velit. Curabitur lorem quam, accumsan non arcu eu, blandit tempus leo.', 2, 5, 1, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'nihongo')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (15, 5, N'Nam at arcu lacinia, rhoncus tortor at, eleifend tellus. Vestibulum lobortis, mi in faucibus hendrerit, metus velit laoreet dui, sit amet aliquet leo dui eu lectus. Aliquam neque felis, aliquet et quam sit amet, consectetur pretium ipsum. Etiam a consectetur ex, mollis ultricies metus. Sed aliquam varius lorem quis placerat. Cras porta erat id consequat elementum. Integer id lectus luctus, semper ex vitae, lacinia orci. Nullam euismod enim libero. Nunc malesuada sem sit amet congue tristique. Nulla dictum id orci a tempor. Donec iaculis hendrerit malesuada. Nulla nibh leo, posuere et rutrum a, commodo nec velit. Duis sed sollicitudin tortor, eget fermentum nibh. Fusce pretium a sapien at dictum. Vivamus risus diam, varius quis mollis sed, consequat sit amet neque. Duis volutpat quam et quam mattis molestie.', 2, 5, 1, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'nihongo')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (16, 2, N'kami', 2, 5, 1, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'nihongo')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (30, 4, N'hr', 7, 10, 0, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'a')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (31, 5, N'I', 5, 12, 0, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'b')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (32, 5, N'you', 5, 7, 1, N'upload_6_pexels-fauxels-3183132.jpg', NULL, NULL, N'c')
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (33, 1, N'49, 34, and 48 students are selected from the Sophomore, Junior, and Senior classed with 496, 348, and 481 students respectively. Identify which of these types of sampling is used: Stratified, systematic, cluster, random.', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (34, 1, N'A 99% confidence interval estimate can be interpreted to mean that (i) if all possible samples are taken and confidence interval estimates are developed, 99% of them would include the true population mean somewhere within their interval. (ii) we have 99% confidence that we have selected a sample whose interval does include the population mean.', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (36, 1, N'49, 34, and 48 students are selected from the Sophomore, Junior, and Senior classed with 496, 348, and 481 students respectively. Identify which of these types of sampling is used: Stratified, systematic, cluster, random.', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (37, 1, N'A 99% confidence interval estimate can be interpreted to mean that (i) if all possible samples are taken and confidence interval estimates are developed, 99% of them would include the true population mean somewhere within their interval. (ii) we have 99% confidence that we have selected a sample whose interval does include the population mean.', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (38, 1, N'49, 34, and 48 students are selected from the Sophomore, Junior, and Senior classed with 496, 348, and 481 students respectively. Identify which of these types of sampling is used: Stratified, systematic, cluster, random.', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (39, 1, N'A 99% confidence interval estimate can be interpreted to mean that (i) if all possible samples are taken and confidence interval estimates are developed, 99% of them would include the true population mean somewhere within their interval. (ii) we have 99% confidence that we have selected a sample whose interval does include the population mean.', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (40, 1, N'49, 34, and 48 students are selected from the Sophomore, Junior, and Senior classed with 496, 348, and 481 students respectively. Identify which of these types of sampling is used: Stratified, systematic, cluster, random.', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Question] ([questionId], [subjectId], [questionContent], [dimensionId], [lessonId], [status], [image], [audio], [video], [explanation]) VALUES (41, 1, N'A 99% confidence interval estimate can be interpreted to mean that (i) if all possible samples are taken and confidence interval estimates are developed, 99% of them would include the true population mean somewhere within their interval. (ii) we have 99% confidence that we have selected a sample whose interval does include the population mean.', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (1, N'Practice Quiz 2', 2, 2, N'...', 10, 80, 10000, 1, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (2, N'Exam Quiz', 1, 3, N'...', 16, 90, 1200, 2, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (3, N'Exam Quiz', 3, 3, N'...', 10, 80, 900, 3, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (4, N'Practice Quiz', 2, 2, N'...', 10, 80, 7200, 4, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (5, N'Exam Quiz', 3, 2, N'...', 10, 80, 900, 5, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (6, N'JPD Learn Quiz', 2, 2, N'...', 10, 60, 3600, 7, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (8, N'Practice Quiz', 1, 2, N'...', 10, 90, 360, 3, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (10, N'English Quiz', 2, 2, N'...', 10, 80, 2000, 2, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (11, N'Practice quiz', 3, 1, N'...', 20, 80, 1000, 2, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (12, N'Chinese Quiz', 2, 2, N'...', 6, 80, 167, 5, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (13, N'Exam Quiz', 2, 2, N'...', 6, 80, 4000, 2, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (22, N'Practice Quiz 2', 2, 2, N'...', 6, 80, 1900, 3, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (23, N'English Quiz', 2, 2, N'...', 6, 80, 888, 4, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (24, N'Exam Quiz', 2, 2, N'...', 10, 80, 1000, 2, NULL)
INSERT [dbo].[Quiz] ([quizId], [quizName], [quizTypeId], [levelId], [quizContent], [numOfQuestion], [passRate], [duration], [subjectId], [maximum answers per ques]) VALUES (25, N'English Quiz', 2, 2, N'...', 10, 80, 1999, 3, NULL)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[QuizLevel] ON 

INSERT [dbo].[QuizLevel] ([levelId], [levelName]) VALUES (1, N'Hard')
INSERT [dbo].[QuizLevel] ([levelId], [levelName]) VALUES (2, N'Medium')
INSERT [dbo].[QuizLevel] ([levelId], [levelName]) VALUES (3, N'Easy')
SET IDENTITY_INSERT [dbo].[QuizLevel] OFF
GO
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (1, 6)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (1, 7)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (1, 10)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (1, 11)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (1, 12)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (1, 13)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (1, 14)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (1, 15)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (2, 7)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (2, 10)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (2, 11)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (2, 12)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (2, 13)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (2, 14)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (2, 15)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (2, 16)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (3, 7)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (3, 10)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (3, 11)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (3, 12)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (3, 13)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (3, 14)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (3, 15)
INSERT [dbo].[QuizQuestion] ([quizId], [questionId]) VALUES (3, 16)
GO
SET IDENTITY_INSERT [dbo].[QuizType] ON 

INSERT [dbo].[QuizType] ([quizTypeId], [quizTypeName]) VALUES (1, N'Simulation')
INSERT [dbo].[QuizType] ([quizTypeId], [quizTypeName]) VALUES (2, N'Lesson-Quiz')
INSERT [dbo].[QuizType] ([quizTypeId], [quizTypeName]) VALUES (3, N'Practicce')
SET IDENTITY_INSERT [dbo].[QuizType] OFF
GO
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (1, 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 2, 20, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2021-06-12T00:00:00.000' AS DateTime), 21, NULL, 1, 1, 1)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (2, 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 5, 50, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2021-06-12T00:00:00.000' AS DateTime), 21, NULL, 1, 0, 2)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (3, 8, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 1, 40, CAST(N'2021-10-08T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 22, NULL, 1, 0, 1)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (4, 8, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 2, 55, CAST(N'2021-10-09T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 22, NULL, 1, 0, 3)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (5, 9, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 2, 100, CAST(N'2021-10-08T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 21, NULL, 1, 1, 4)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (6, 9, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 1, 100, CAST(N'2021-10-07T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 21, NULL, 0, 1, 1)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (7, 10, CAST(N'2022-07-05T00:00:00.000' AS DateTime), 3, 188, CAST(N'2021-10-11T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 23, NULL, 1, 1, 4)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (8, 10, CAST(N'2022-07-05T00:00:00.000' AS DateTime), 5, 188, CAST(N'2021-10-11T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 23, NULL, 0, 0, 5)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (9, 11, CAST(N'2022-07-05T00:00:00.000' AS DateTime), 5, 160, CAST(N'2021-10-11T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 22, NULL, 0, 0, 3)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (10, 11, CAST(N'2022-07-05T00:00:00.000' AS DateTime), 5, 160, CAST(N'2021-10-11T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 22, NULL, 0, 1, 2)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (11, 7, CAST(N'2022-07-05T00:00:00.000' AS DateTime), 3, 90, CAST(N'2021-10-15T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 21, NULL, 1, 1, 1)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (12, 7, CAST(N'2022-07-05T00:00:00.000' AS DateTime), 5, 100, CAST(N'2021-10-07T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 21, NULL, 0, 1, 2)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (13, 6, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 5, 65, CAST(N'2021-10-09T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 22, NULL, 1, 1, 4)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (14, 6, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 5, 15, CAST(N'2021-10-12T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 22, NULL, 0, 1, 2)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (16, 39, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 5, 15, CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'2022-07-30T00:00:00.000' AS DateTime), 22, NULL, 1, 1, 2)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (18, 39, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 5, 15, CAST(N'2022-07-10T00:00:00.000' AS DateTime), CAST(N'2022-07-15T00:00:00.000' AS DateTime), 22, NULL, 0, 0, 2)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (19, 3, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-10T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), 22, NULL, 1, 1, 3)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (20, 2, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), 22, NULL, 1, 1, 3)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (21, 5, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), 22, NULL, 0, 1, 5)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (25, 2, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-10T00:00:00.000' AS DateTime), CAST(N'2022-07-20T00:00:00.000' AS DateTime), 22, NULL, 1, 0, 5)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (26, 3, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-30T00:00:00.000' AS DateTime), 22, NULL, 0, 1, 5)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (27, 40, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), 22, NULL, 1, 1, 5)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (28, 41, CAST(N'2022-07-05T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), 22, NULL, 0, 1, 5)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (29, 42, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-10T00:00:00.000' AS DateTime), CAST(N'2022-07-20T00:00:00.000' AS DateTime), 22, NULL, 1, 0, 5)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (30, 43, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-30T00:00:00.000' AS DateTime), 22, NULL, 0, 1, 5)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (35, 40, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), 22, NULL, 1, 1, 7)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (36, 41, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), 22, NULL, 0, 1, 7)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (37, 42, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-10T00:00:00.000' AS DateTime), CAST(N'2022-07-20T00:00:00.000' AS DateTime), 22, NULL, 1, 0, 7)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (38, 43, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-30T00:00:00.000' AS DateTime), 22, NULL, 0, 1, 7)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (39, 40, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), 22, NULL, 1, 1, 1)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (40, 41, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), 22, NULL, 0, 1, 1)
INSERT [dbo].[Registration] ([regId], [userId], [regTime], [packageId], [cost], [validFrom], [validTo], [lastUpdatedBy], [note], [status], [isAccepted], [subjectId]) VALUES (41, 42, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4, 15, CAST(N'2022-07-10T00:00:00.000' AS DateTime), CAST(N'2022-07-20T00:00:00.000' AS DateTime), 22, NULL, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[Registration] OFF
GO
INSERT [dbo].[Review] ([subjectId], [userId], [content]) VALUES (1, 1, N'Very good')
INSERT [dbo].[Review] ([subjectId], [userId], [content]) VALUES (2, 2, N'Very good')
INSERT [dbo].[Review] ([subjectId], [userId], [content]) VALUES (3, 3, N'Very good')
INSERT [dbo].[Review] ([subjectId], [userId], [content]) VALUES (4, 4, N'Very bad')
GO
SET IDENTITY_INSERT [dbo].[Setting] ON 

INSERT [dbo].[Setting] ([SettingID], [QuizID], [SettingTypeID], [SettingName], [QuizContent], [QuizDuration], [NumberOfQuestion], [Status], [MaxNumAnswersPerQuest]) VALUES (1, 1, 1, N'QuizSetting1                                                                                                                                                                                                                                                   ', NULL, 15, 20, 1, 10)
INSERT [dbo].[Setting] ([SettingID], [QuizID], [SettingTypeID], [SettingName], [QuizContent], [QuizDuration], [NumberOfQuestion], [Status], [MaxNumAnswersPerQuest]) VALUES (2, 2, 2, N'Exam setting 1                                                                                                                                                                                                                                                 ', N'Abc', 20, 16, 1, 10)
INSERT [dbo].[Setting] ([SettingID], [QuizID], [SettingTypeID], [SettingName], [QuizContent], [QuizDuration], [NumberOfQuestion], [Status], [MaxNumAnswersPerQuest]) VALUES (3, 2, 1, N'Setting 3                                                                                                                                                                                                                                                      ', NULL, 15, 15, 1, 5)
INSERT [dbo].[Setting] ([SettingID], [QuizID], [SettingTypeID], [SettingName], [QuizContent], [QuizDuration], [NumberOfQuestion], [Status], [MaxNumAnswersPerQuest]) VALUES (4, 1, 2, N'fs                                                                                                                                                                                                                                                             ', NULL, -1, 11, 0, 3)
INSERT [dbo].[Setting] ([SettingID], [QuizID], [SettingTypeID], [SettingName], [QuizContent], [QuizDuration], [NumberOfQuestion], [Status], [MaxNumAnswersPerQuest]) VALUES (5, 1, 2, N'fs                                                                                                                                                                                                                                                             ', NULL, -1, 11, 0, 3)
INSERT [dbo].[Setting] ([SettingID], [QuizID], [SettingTypeID], [SettingName], [QuizContent], [QuizDuration], [NumberOfQuestion], [Status], [MaxNumAnswersPerQuest]) VALUES (6, 1, 2, N'setting                                                                                                                                                                                                                                                        ', NULL, 3, 3, 0, 5)
SET IDENTITY_INSERT [dbo].[Setting] OFF
GO
SET IDENTITY_INSERT [dbo].[Setting_Type] ON 

INSERT [dbo].[Setting_Type] ([TypeID], [TypeName]) VALUES (1, N'Quiz Setting')
INSERT [dbo].[Setting_Type] ([TypeID], [TypeName]) VALUES (2, N'Exam setting')
SET IDENTITY_INSERT [dbo].[Setting_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([sliderId], [sliderTitle], [image], [backlink], [note], [status]) VALUES (1, N'Introduction to Management', N'u_1_introToManage.png', 1, N'This is slider', 1)
INSERT [dbo].[Slider] ([sliderId], [sliderTitle], [image], [backlink], [note], [status]) VALUES (2, N'Pre-intermediate Business English', N'businessEnglish.png', 2, N'This is the slider', 0)
INSERT [dbo].[Slider] ([sliderId], [sliderTitle], [image], [backlink], [note], [status]) VALUES (3, N'Communication and In-Group Working Skills', N'communicationAndWorking.png', 3, N'This is the slider', 1)
INSERT [dbo].[Slider] ([sliderId], [sliderTitle], [image], [backlink], [note], [status]) VALUES (4, N'Human Resource Management', N'humanResource.png', 4, N'This is the slider', 1)
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([subCateId], [catId], [subCateName]) VALUES (1, 1, N'Marketing 1')
INSERT [dbo].[SubCategory] ([subCateId], [catId], [subCateName]) VALUES (2, 1, N'Marketing 2')
INSERT [dbo].[SubCategory] ([subCateId], [catId], [subCateName]) VALUES (3, 2, N'Intermediate')
INSERT [dbo].[SubCategory] ([subCateId], [catId], [subCateName]) VALUES (4, 2, N'Beginer')
INSERT [dbo].[SubCategory] ([subCateId], [catId], [subCateName]) VALUES (5, 3, N'Solving problem')
INSERT [dbo].[SubCategory] ([subCateId], [catId], [subCateName]) VALUES (6, 3, N'Communicating')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subjectId], [subjectName], [description], [thumbnailURL], [featured], [status], [updatedDate]) VALUES (1, N'Introduction to Management Senior', N'     This course is designed to help students improve their ability to communicate in English in a wide range of business situations.      ', N'img/courses/blogThum.png', 1, 0, CAST(N'2022-07-22T07:44:53.927' AS DateTime))
INSERT [dbo].[Subject] ([subjectId], [subjectName], [description], [thumbnailURL], [featured], [status], [updatedDate]) VALUES (2, N'Pre-intermediate Business English', N'This course is designed to help students improve their ability to communicate in English in a wide range of business situations. ', N'img/courses/blogThum.png', 1, 1, CAST(N'2022-07-22T07:48:01.817' AS DateTime))
INSERT [dbo].[Subject] ([subjectId], [subjectName], [description], [thumbnailURL], [featured], [status], [updatedDate]) VALUES (3, N'Communication and In-Group Working Skills', N'This course will cover both working in groups and communication skills.', N'img/courses/communication.png', 1, 1, CAST(N'2022-07-01T07:56:32.677' AS DateTime))
INSERT [dbo].[Subject] ([subjectId], [subjectName], [description], [thumbnailURL], [featured], [status], [updatedDate]) VALUES (4, N'Human Resource Management', N'This specialization provides a robust introduction to the key principles, policies, and practices of human resource management.
', N'img/courses/human.png', 1, 1, CAST(N'2022-07-01T08:12:27.003' AS DateTime))
INSERT [dbo].[Subject] ([subjectId], [subjectName], [description], [thumbnailURL], [featured], [status], [updatedDate]) VALUES (5, N'BUSINESS ENGLISH - Level: Intermediate', N'This course is designed to help students further improve their ability to communicate in English in a wide range of business and business-related situations.', N'img/courses/business.png', 1, 1, CAST(N'2022-05-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Subject] ([subjectId], [subjectName], [description], [thumbnailURL], [featured], [status], [updatedDate]) VALUES (7, N'Computer Engineering', N'This course is designed to help students further improve their ability to communicate in English in a wide range of business and business-related situations.', N'img/courses/business.png', 1, 0, CAST(N'2022-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Subject] ([subjectId], [subjectName], [description], [thumbnailURL], [featured], [status], [updatedDate]) VALUES (12, N'Introduction to Management ProMax Vip+', N'<p>Ã¡dasd</p>', N'business1.png', 1, 1, CAST(N'2022-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Subject] ([subjectId], [subjectName], [description], [thumbnailURL], [featured], [status], [updatedDate]) VALUES (14, N'Software Requirement', N'<p>Hello everybody</p>', N'computer.png', 1, 1, CAST(N'2022-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Subject] ([subjectId], [subjectName], [description], [thumbnailURL], [featured], [status], [updatedDate]) VALUES (15, N'Introduction to Management', N'<p>It''s good</p>', N'business.png', 1, 1, CAST(N'2022-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Subject] ([subjectId], [subjectName], [description], [thumbnailURL], [featured], [status], [updatedDate]) VALUES (19, N'CSD', N'<p>a</p>', N'computer.png', 1, 0, CAST(N'2022-07-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
INSERT [dbo].[SubjectCategory] ([catId], [subjectId]) VALUES (1, 1)
INSERT [dbo].[SubjectCategory] ([catId], [subjectId]) VALUES (1, 2)
INSERT [dbo].[SubjectCategory] ([catId], [subjectId]) VALUES (1, 4)
INSERT [dbo].[SubjectCategory] ([catId], [subjectId]) VALUES (1, 12)
INSERT [dbo].[SubjectCategory] ([catId], [subjectId]) VALUES (1, 19)
INSERT [dbo].[SubjectCategory] ([catId], [subjectId]) VALUES (2, 5)
INSERT [dbo].[SubjectCategory] ([catId], [subjectId]) VALUES (2, 7)
INSERT [dbo].[SubjectCategory] ([catId], [subjectId]) VALUES (2, 14)
INSERT [dbo].[SubjectCategory] ([catId], [subjectId]) VALUES (3, 3)
INSERT [dbo].[SubjectCategory] ([catId], [subjectId]) VALUES (3, 15)
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (1, N'Self-development')
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (2, N'Organization')
INSERT [dbo].[Tag] ([tagId], [tagName]) VALUES (3, N'Team management')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
INSERT [dbo].[Tag_Subject] ([tagId], [subjectId]) VALUES (1, 1)
INSERT [dbo].[Tag_Subject] ([tagId], [subjectId]) VALUES (1, 2)
INSERT [dbo].[Tag_Subject] ([tagId], [subjectId]) VALUES (1, 3)
GO
SET IDENTITY_INSERT [dbo].[TakeAnswer] ON 

INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (1, 34, 13, 25, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (2, 34, 11, 17, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (3, 34, 12, 21, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (4, 34, 12, 22, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (5, 35, 13, 25, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (6, 35, 11, 17, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (7, 35, 12, 21, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (8, 35, 12, 22, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (9, 36, 10, 13, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (10, 36, 10, 14, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (11, 37, 10, 13, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (12, 37, 10, 14, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (13, 41, 7, 5, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (14, 41, 7, 6, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (15, 41, 11, 17, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (16, 41, 11, 18, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (17, 43, 14, 29, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (18, 43, 11, 17, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (19, 43, 13, 25, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (20, 44, 14, 29, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (21, 44, 11, 17, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (22, 44, 13, 25, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (23, 48, 13, 25, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (24, 48, 10, 13, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (25, 48, 15, 39, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (26, 49, 13, 25, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (27, 49, 10, 13, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (28, 49, 15, 39, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (29, 50, 10, 13, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (30, 50, 13, 28, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (31, 50, 12, 21, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (32, 51, 10, 13, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (33, 51, 13, 28, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (34, 51, 12, 21, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (35, 53, 14, 29, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (36, 53, 14, 30, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (37, 53, 15, 38, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (38, 53, 15, 39, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (39, 54, 14, 29, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (40, 54, 14, 30, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (41, 54, 15, 38, NULL)
INSERT [dbo].[TakeAnswer] ([takeAnswerId], [quizTakeId], [questionId], [answerId], [status]) VALUES (42, 54, 15, 39, NULL)
SET IDENTITY_INSERT [dbo].[TakeAnswer] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (1, N'Kieran Weaver ', N'DuongNH', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'u_1_pexels-krisp-cut-1595437.jpg', N'duy0256@gmail.com', 1, N'0902312234', 1, NULL, N'8e7b1e00-74e7-408a-b978-9b5695f0a43e', CAST(N'2022-06-17T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (2, N'Skylar Shaffer', N'NamDH', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt.png', N'NamDHHE150519@fpt.edu.vn', 1, N'099876671 ', 1, NULL, NULL, CAST(N'2022-07-07T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (3, N'Alyssa Oconnell', N'TuanPA', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'TuanPAHE150543@fpt.edu.vn', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-07T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (4, N'Jovanny Sanford', N'ChucNV', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt3.png', N'ChucNVHE150618@fpt.edu.vn', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-07T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (5, N'Yael Schroeder', N'Admin1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt3.png', N'TungBTHE150621@fpt.edu.vn', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-07T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (6, N'Carissa Butler', N'Expert1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 4, N'avt3.png', N'Expert1@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (7, N'Finley Heath', N'Expert2', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 4, N'avt3.png', N'Expert2@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (8, N'Jenna Campbell', N'User1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 1, N'u_8_pexels-cesar-perez-733745.jpg', N'User1@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (9, N'Destinee Bryant', N'User2', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 1, N'avt2.png', N'User2@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (10, N'Miracle Nolan', N'User3', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 1, N'avt2.png', N'User3@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (11, N'Addison Jensen', N'User4', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 1, N'avt.png', N'User4@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (12, N'Asher Kaiser', N'Sale1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 3, N'avt.png', N'Sale1@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (13, N'Anahi Haney', N'AnhNM', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 1, N'avt.png', N'AnhNMHS12345@fpt.edu.vn', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (14, N'Killian Dean', N'TuBA', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 2, N'avt.png', N'TuBA@fu.edu.vn', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (15, N'Andy Garrison', N'Marketing1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 2, N'avt.png', N'Marketing1@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (16, N'Tess Colon', N'Marketing2', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 2, N'avt3.png', N'MaiNNHK12345@fpt.edu.vn', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (17, N'London Greene', N'ThangHH', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 2, N'avt3.png', N'ThangHHHS158666@fpt.edu.vn', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (18, N'Paula Serrano', N'Expert3', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 4, N'avt3.png', N'Expert3@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (19, N'Kai Noble', N'Expert4', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 4, N'avt3.png', N'Expert4@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (20, N'Skyla Arias', N'Expert5', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 4, N'avt3.png', N'Expert5@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (21, N'Selina Graves', N'Sale2', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 3, N'avt2.png', N'LienAB@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (22, N'Grant Allen', N'HungTD', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 3, N'avt2.png', N'HungTD@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (23, N'Jaidyn Sandoval', N'KhaiPM', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 3, N'avt2.png', N'KhaiPM@gmail.com', 0, N'0902312234', 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (24, N'Alex Meyer', N'haho', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'duy10256@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-10T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (25, N'Markus Sharp', N'levan', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'duy02562@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-10T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (26, N'Lamont Sheppard', N'hotung', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'duy02563@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-10T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (27, N'Emilia Fitzgerald', N'duong1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'', N'duy02564@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-10T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (28, N'Camron White', N'luyen1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'', N'duy02565@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-10T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (29, N'Carina Bowen', N'luyen1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'', N'duy02566@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-10T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (30, N'Henry Lowery', N'hung1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'', N'duy02567@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-10T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (31, N'America Webb', N'duong1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'', N'duy02568@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-10T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (32, N'Hudson Bray', N'bui1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'', N'junvu02569@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-10T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (33, N'Declan Boyle', N'abc', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'', N'duy025699@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-10T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (34, N'Hallie Terrell', N'linh1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'', N'linhvthe163140@fpt.edu.vn', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (35, N'Joy Andrade', N'linh2', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'thuylinhmaruko2709@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (36, N'Kaylah Ellison', N'tham2', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'abc@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (37, N'Agustin Hale', N'huynh1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'thainmhe153666@fpt.edu.vn', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (38, N'Shayna Santana', N'hong1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'duy0256111@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (39, N'Cierra Leach', N'hong2', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'duy02561212@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (40, N'Addison Mora', N'linh123', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'duy02561111@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (41, N'Aaden Bradley', N'linhha', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'avt2.png', N'duy0256111222333@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (42, N'Bradyn Giles', N'buihuan', N'CF27D4F5EC85EC42C766BF33F85502D80F0DE1DE2BD09DE34AAF18A99EEE6468', 5, N'avt2.png', N'duy02561231231@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (43, N'Ali Mathis', N'quynh1', N'ADED5D4814C8A828359594DF08DA059FB696818263C165FA2E0B24F8153C75D6', 5, N'avt2.png', N'duy0256888@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (44, N'Kane Schmitt', N'hoa1', N'AC459A7E5C593CF63CC629E27C2EF1528E9175FD7D1721CD580E04692D0E9376', 5, N'avt2.png', N'duy025612312312@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (45, N'Uriah Booth', N'hoangA', N'C7730EB1B3C26F51AD5FAF442E0194FB1E856419CB7492F33648C90CF261568B', 5, N'avt2.png', N'duy025609@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (46, N'Holden Gardner', N'hoangC', N'C7730EB1B3C26F51AD5FAF442E0194FB1E856419CB7492F33648C90CF261568B', 5, N'u_46_pexels-krisp-cut-1595437.jpg', N'duy02561111@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (47, N'Tia Sosa', N'hoang1123', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'u_47_pexels-anastasia-shuraeva-4210037.jpg', N'duy025644@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-01T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (48, N'Elle Jones', N'kong12', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'img/logo/avt2.png', N'duy0256fa@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-05T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (49, N'Maxwell Nicholson', N'tham1', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'img/logo/avt2.png', N'duy0256vvv@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-05T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (50, N'Elle Jones', N'buihuan', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'u_50_pexels-fauxels-3183132.jpg', N'duy0256112@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-05T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (51, N'Elle Jones', N'duongnt', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 5, N'img/logo/avt2.png', N'junvu0256123@gmail.com', 0, N'0902312234', 1, NULL, NULL, CAST(N'2022-07-05T08:22:50.377' AS DateTime))
INSERT [dbo].[User] ([userId], [fullName], [userName], [password], [roleId], [profilePic], [email], [gender], [phone], [status], [address], [token], [createdTimeResetToken]) VALUES (52, N'Bui Van E', N'Enguyen', N'F91B6AEBE64E86E31DE22F4B5288616138F49CCD4941B28791983705C612F47C', 2, NULL, N'junvu025612@gmail.com', 1, N'0902312234', 1, N'Binh Duong', NULL, CAST(N'2022-07-05T08:22:50.377' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([roleId], [roleName], [status]) VALUES (1, N'Admin', 1)
INSERT [dbo].[UserRole] ([roleId], [roleName], [status]) VALUES (2, N'Marketing', 1)
INSERT [dbo].[UserRole] ([roleId], [roleName], [status]) VALUES (3, N'Sale', 1)
INSERT [dbo].[UserRole] ([roleId], [roleName], [status]) VALUES (4, N'Expert', 1)
INSERT [dbo].[UserRole] ([roleId], [roleName], [status]) VALUES (5, N'Customer', 1)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [DF__Subject__updated__395884C4]  DEFAULT (getdate()) FOR [updatedDate]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_BlogCategory] FOREIGN KEY([blogCategoryId])
REFERENCES [dbo].[BlogCategory] ([blogCategoryId])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_BlogCategory]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_User] FOREIGN KEY([author])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_User]
GO
ALTER TABLE [dbo].[CustomerQuiz]  WITH CHECK ADD  CONSTRAINT [FK_CustomerQuiz_Quiz] FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[CustomerQuiz] CHECK CONSTRAINT [FK_CustomerQuiz_Quiz]
GO
ALTER TABLE [dbo].[CustomerQuiz]  WITH CHECK ADD  CONSTRAINT [FK_CustomerQuiz_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[CustomerQuiz] CHECK CONSTRAINT [FK_CustomerQuiz_User]
GO
ALTER TABLE [dbo].[Dimension]  WITH CHECK ADD  CONSTRAINT [FK_Dimension_DimensionType] FOREIGN KEY([typeId])
REFERENCES [dbo].[DimensionType] ([typeId])
GO
ALTER TABLE [dbo].[Dimension] CHECK CONSTRAINT [FK_Dimension_DimensionType]
GO
ALTER TABLE [dbo].[Dimension]  WITH CHECK ADD  CONSTRAINT [FK_Dimension_Subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Dimension] CHECK CONSTRAINT [FK_Dimension_Subject]
GO
ALTER TABLE [dbo].[Expert]  WITH CHECK ADD  CONSTRAINT [FK_Expert_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Expert] CHECK CONSTRAINT [FK_Expert_Subject]
GO
ALTER TABLE [dbo].[Expert]  WITH CHECK ADD  CONSTRAINT [FK_Expert_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Expert] CHECK CONSTRAINT [FK_Expert_User]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_LessonType] FOREIGN KEY([lessonTypeId])
REFERENCES [dbo].[LessonType] ([lessonTypeId])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_LessonType]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Subject]
GO
ALTER TABLE [dbo].[PricePackage]  WITH CHECK ADD  CONSTRAINT [FK_PricePackage_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[PricePackage] CHECK CONSTRAINT [FK_PricePackage_Subject]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Dimension] FOREIGN KEY([dimensionId])
REFERENCES [dbo].[Dimension] ([dimensionId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Dimension]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Lesson] FOREIGN KEY([lessonId])
REFERENCES [dbo].[Lesson] ([lessonId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Lesson]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_QuizLevel] FOREIGN KEY([levelId])
REFERENCES [dbo].[QuizLevel] ([levelId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_QuizLevel]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_QuizType] FOREIGN KEY([quizTypeId])
REFERENCES [dbo].[QuizType] ([quizTypeId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_QuizType]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Subject]
GO
ALTER TABLE [dbo].[QuizQuestion]  WITH CHECK ADD  CONSTRAINT [FK_QuizQuestion_Question] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[QuizQuestion] CHECK CONSTRAINT [FK_QuizQuestion_Question]
GO
ALTER TABLE [dbo].[QuizQuestion]  WITH CHECK ADD  CONSTRAINT [FK_QuizQuestion_Quiz] FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[QuizQuestion] CHECK CONSTRAINT [FK_QuizQuestion_Quiz]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_PricePackage] FOREIGN KEY([packageId])
REFERENCES [dbo].[PricePackage] ([packageId])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_PricePackage]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Subject]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_User]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_User1] FOREIGN KEY([lastUpdatedBy])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_User1]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Subject]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_User]
GO
ALTER TABLE [dbo].[Setting]  WITH CHECK ADD  CONSTRAINT [FK_Setting_Quiz] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[Setting] CHECK CONSTRAINT [FK_Setting_Quiz]
GO
ALTER TABLE [dbo].[Setting]  WITH CHECK ADD  CONSTRAINT [FK_Setting_Setting_Type] FOREIGN KEY([SettingTypeID])
REFERENCES [dbo].[Setting_Type] ([TypeID])
GO
ALTER TABLE [dbo].[Setting] CHECK CONSTRAINT [FK_Setting_Setting_Type]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [FK_Slider_Subject] FOREIGN KEY([backlink])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [FK_Slider_Subject]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([catId])
REFERENCES [dbo].[Category] ([catId])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[SubjectCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubjectCategory_Category] FOREIGN KEY([catId])
REFERENCES [dbo].[Category] ([catId])
GO
ALTER TABLE [dbo].[SubjectCategory] CHECK CONSTRAINT [FK_SubjectCategory_Category]
GO
ALTER TABLE [dbo].[SubjectCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubjectCategory_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[SubjectCategory] CHECK CONSTRAINT [FK_SubjectCategory_Subject]
GO
ALTER TABLE [dbo].[Tag_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Subject_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Tag_Subject] CHECK CONSTRAINT [FK_Tag_Subject_Subject]
GO
ALTER TABLE [dbo].[Tag_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Subject_Tag] FOREIGN KEY([tagId])
REFERENCES [dbo].[Tag] ([tagId])
GO
ALTER TABLE [dbo].[Tag_Subject] CHECK CONSTRAINT [FK_Tag_Subject_Tag]
GO
ALTER TABLE [dbo].[TakeAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TakeAnswer_Answer] FOREIGN KEY([answerId])
REFERENCES [dbo].[Answer] ([answerId])
GO
ALTER TABLE [dbo].[TakeAnswer] CHECK CONSTRAINT [FK_TakeAnswer_Answer]
GO
ALTER TABLE [dbo].[TakeAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TakeAnswer_CustomerQuiz] FOREIGN KEY([quizTakeId])
REFERENCES [dbo].[CustomerQuiz] ([quizTakeId])
GO
ALTER TABLE [dbo].[TakeAnswer] CHECK CONSTRAINT [FK_TakeAnswer_CustomerQuiz]
GO
ALTER TABLE [dbo].[TakeAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TakeAnswer_Question] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[TakeAnswer] CHECK CONSTRAINT [FK_TakeAnswer_Question]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([roleId])
REFERENCES [dbo].[UserRole] ([roleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserRole]
GO
USE [master]
GO
ALTER DATABASE [OnlineQuizSystem] SET  READ_WRITE 
GO
