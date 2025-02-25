USE [master]
GO
/****** Object:  Database [Laptev_OXTA]    Script Date: 07.12.2024 19:54:34 ******/
CREATE DATABASE [Laptev_OXTA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Laptev_OXTA', FILENAME = N'D:\sql\MSSQL14.MSSQLSERVER\MSSQL\DATA\Laptev_OXTA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Laptev_OXTA_log', FILENAME = N'D:\sql\MSSQL14.MSSQLSERVER\MSSQL\DATA\Laptev_OXTA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Laptev_OXTA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Laptev_OXTA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Laptev_OXTA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET ARITHABORT OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Laptev_OXTA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Laptev_OXTA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Laptev_OXTA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Laptev_OXTA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET RECOVERY FULL 
GO
ALTER DATABASE [Laptev_OXTA] SET  MULTI_USER 
GO
ALTER DATABASE [Laptev_OXTA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Laptev_OXTA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Laptev_OXTA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Laptev_OXTA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Laptev_OXTA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Laptev_OXTA', N'ON'
GO
ALTER DATABASE [Laptev_OXTA] SET QUERY_STORE = OFF
GO
USE [Laptev_OXTA]
GO
/****** Object:  Table [dbo].[City]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Forename] [nvarchar](50) NOT NULL,
	[SeriesPassport] [int] NOT NULL,
	[NumberPassport] [int] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[MailIndex] [int] NOT NULL,
	[idCity] [int] NOT NULL,
	[IdStreet] [int] NOT NULL,
	[Home] [nvarchar](50) NOT NULL,
	[Flat] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] NOT NULL,
	[idPost] [int] NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Forename] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryEmployee]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryEmployee](
	[idEmployee] [int] NOT NULL,
	[DateInput] [datetime] NULL,
	[idInput] [int] NOT NULL,
	[idHistory] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [nvarchar](50) NOT NULL,
	[DateCreate] [date] NOT NULL,
	[TimeOrder] [time](7) NOT NULL,
	[idClient] [int] NOT NULL,
	[idStatus] [int] NOT NULL,
	[DateClose] [date] NULL,
	[TimeRental] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[idService] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[CodeService] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceOrder]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOrder](
	[idOrder] [nvarchar](50) NOT NULL,
	[DateCreate] [date] NOT NULL,
	[idService] [int] NOT NULL,
	[NumberOrder] [nvarchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeInput]    Script Date: 07.12.2024 19:54:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeInput](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Title]) VALUES (1, N'г. Санкт-Петербург')
INSERT [dbo].[City] ([Id], [Title]) VALUES (2, N'г. Челябинск')
INSERT [dbo].[City] ([Id], [Title]) VALUES (3, N'г. Минск')
INSERT [dbo].[City] ([Id], [Title]) VALUES (4, N'г. Уфа')
INSERT [dbo].[City] ([Id], [Title]) VALUES (5, N'г. Троицк')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462526, N'Фролов', N'Андрей', N'Иванович', 1180, 176596, CAST(N'2001-07-14' AS Date), 344288, 1, 44, N'1', N'34', N'gohufreilagrau-3818@yopmail.com', N'cl12345')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462527, N'Николаев', N'Даниил', N'Всеволодович', 2280, 223523, CAST(N'2001-02-10' AS Date), 614164, 1, 41, N'30', N'75', N'xawugosune-1385@yopmail.com', N'cl12346')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462528, N'Снегирев', N'Макар', N'Иванович', 4560, 354155, CAST(N'1998-05-21' AS Date), 394242, 1, 15, N'43', N'57', N'satrahuddusei-4458@yopmail.com', N'cl12347')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462529, N'Иванов', N'Иван', N'Ильич', 9120, 554296, CAST(N'1998-10-01' AS Date), 660540, 1, 39, N'25', N'78', N'boippaxeufrepra-7093@yopmail.com', N'cl12348')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462530, N'Филиппова', N'Анна', N'Глебовна', 2367, 558134, CAST(N'1976-05-31' AS Date), 125837, 1, 47, N'40', N'92', N'zapramaxesu-7741@yopmail.com', N'cl12349')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462531, N'Иванов', N'Михаил', N'Владимирович', 7101, 669343, CAST(N'1985-11-04' AS Date), 125703, 1, 30, N'49', N'84', N'rouzecroummegre-3899@yopmail.com', N'cl12350')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462532, N'Власов', N'Дмитрий', N'Александрович', 3455, 719630, CAST(N'1998-08-17' AS Date), 625283, 1, 32, N'46', N'7', N'ziyeuddocrabri-4748@yopmail.com', N'cl12351')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462533, N'Серова', N'Екатерина', N'Львовна', 2377, 871623, CAST(N'1984-10-24' AS Date), 614611, 1, 23, N'50', N'78', N'ketameissoinnei-1951@yopmail.com', N'cl12352')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462534, N'Борисова', N'Ирина', N'Ивановна', 8755, 921148, CAST(N'1976-10-14' AS Date), 454311, 1, 27, N'19', N'78', N'yipraubaponou-5849@yopmail.com', N'cl12353')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462535, N'Зайцев', N'Никита', N'Артёмович', 4355, 104594, CAST(N'1999-10-14' AS Date), 660007, 1, 28, N'19', N'42', N'crapedocouca-3572@yopmail.com', N'cl12354')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462536, N'Медведев', N'Святослав', N'Евгеньевич', 2791, 114390, CAST(N'1985-07-13' AS Date), 603036, 1, 35, N'4', N'13', N'ceigoixakaunni-9227@yopmail.com', N'cl12355')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462537, N'Коротков', N'Кирилл', N'Алексеевич', 5582, 126286, CAST(N'1976-05-26' AS Date), 450983, 1, 16, N'26', N'60', N'yeimmeiwauzomo-7054@yopmail.com', N'cl12356')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462538, N'Калашникова', N'Арина', N'Максимовна', 2978, 133653, CAST(N'1999-08-13' AS Date), 394782, 1, 44, N'3', N'14', N'poleifenevi-1560@yopmail.com', N'cl12357')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462539, N'Минина', N'Таисия', N'Кирилловна', 7512, 141956, CAST(N'1985-10-13' AS Date), 603002, 1, 9, N'28', N'56', N'kauprezofautei-6607@yopmail.com', N'cl12358')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462540, N'Наумов', N'Серафим', N'Романович', 5046, 158433, CAST(N'1999-04-15' AS Date), 450558, 1, 24, N'30', N'71', N'quaffaullelourei-1667@yopmail.com', N'cl12359')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462541, N'Воробьева', N'Василиса', N'Евгеньевна', 2460, 169505, CAST(N'1999-01-13' AS Date), 394060, 1, 42, N'43', N'79', N'jsteele@rojas-robinson.net', N'cl12360')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462542, N'Калинин', N'Александр', N'Андреевич', 3412, 174593, CAST(N'1999-01-07' AS Date), 410661, 1, 46, N'50', N'53', N'vhopkins@lewis-mullen.com', N'cl12361')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462543, N'Кузнецова', N'Милана', N'Владиславовна', 4950, 183034, CAST(N'1999-01-24' AS Date), 625590, 1, 15, N'20', N'34', N'nlewis@yahoo.com', N'cl12362')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462544, N'Фирсов', N'Егор', N'Романович', 5829, 219464, CAST(N'1993-09-02' AS Date), 625683, 1, 1, N'20', N'21', N'garciadavid@mckinney-mcbride.com', N'cl12363')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462545, N'Зимина', N'Агния', N'Александровна', 6443, 208059, CAST(N'1998-09-03' AS Date), 400562, 1, 13, N'32', N'67', N'cbradley@castro.com', N'cl12364')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462546, N'Титов', N'Андрей', N'Глебович', 7079, 213265, CAST(N'1985-10-23' AS Date), 614510, 1, 20, N'47', N'72', N'cuevascatherine@carlson.biz', N'cl12365')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462547, N'Орлов', N'Николай', N'Егорович', 8207, 522702, CAST(N'1985-07-27' AS Date), 410542, 1, 37, N'46', N'82', N'thomasmoore@wilson-singh.net', N'cl12366')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462548, N'Кузнецова', N'Аиша', N'Михайловна', 9307, 232158, CAST(N'1998-10-04' AS Date), 620839, 1, 43, N'8', N'100', N'jessica84@hotmail.com', N'cl12367')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462549, N'Куликов', N'Никита', N'Георгиевич', 1357, 242839, CAST(N'1999-04-23' AS Date), 443890, 1, 15, N'1', N'10', N'jessicapark@hotmail.com', N'cl12368')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462550, N'Карпова', N'София', N'Егоровна', 1167, 256636, CAST(N'1993-10-01' AS Date), 603379, 1, 40, N'46', N'95', N'ginaritter@schneider-buchanan.com', N'cl12369')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462551, N'Смирнова', N'Дарья', N'Макаровна', 1768, 266986, CAST(N'1976-03-22' AS Date), 603721, 1, 7, N'41', N'57', N'stephen99@yahoo.com', N'cl12370')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462552, N'Абрамова', N'Александра', N'Мироновна', 1710, 427875, CAST(N'1999-03-26' AS Date), 410172, 1, 38, N'13', N'86', N'lopezlisa@hotmail.com', N'cl12371')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462553, N'Наумов', N'Руслан', N'Михайлович', 1806, 289145, CAST(N'1999-10-11' AS Date), 420151, 1, 4, N'32', N'81', N'lori17@hotmail.com', N'cl12372')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462554, N'Бочаров', N'Никита', N'Матвеевич', 1587, 291249, CAST(N'1997-06-29' AS Date), 125061, 1, 33, N'8', N'74', N'campbellkevin@gardner.com', N'cl12373')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462555, N'Соловьев', N'Давид', N'Ильич', 1647, 306372, CAST(N'1984-03-06' AS Date), 630370, 1, 47, N'24', N'81', N'morganhoward@clark.com', N'cl12374')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462556, N'Васильева', N'Валерия', N'Дмитриевна', 1742, 316556, CAST(N'1999-09-30' AS Date), 614753, 1, 34, N'35', N'39', N'carsontamara@gmail.com', N'cl12375')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462557, N'Макарова', N'Василиса', N'Андреевна', 1474, 326347, CAST(N'1999-04-08' AS Date), 426030, 1, 20, N'44', N'93', N'kevinpatel@gmail.com', N'cl12376')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462558, N'Алексеев', N'Матвей', N'Викторович', 1452, 339539, CAST(N'1998-08-02' AS Date), 450375, 1, 14, N'44', N'80', N'sethbishop@yahoo.com', N'cl12377')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462559, N'Никитина', N'Полина', N'Александровна', 2077, 443480, CAST(N'1976-09-19' AS Date), 625560, 1, 26, N'12', N'66', N'drollins@schultz-soto.net', N'cl12378')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462560, N'Окулова', N'Олеся', N'Алексеевна', 2147, 357518, CAST(N'1999-04-03' AS Date), 630201, 1, 16, N'17', N'25', N'pblack@copeland-winters.org', N'cl12379')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462561, N'Захарова', N'Полина', N'Яновна', 2687, 363884, CAST(N'1976-04-21' AS Date), 190949, 1, 22, N'26', N'93', N'johnathon.oberbrunner@yahoo.com', N'cl12380')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462562, N'Зайцев', N'Владимир', N'Давидович', 2376, 443711, CAST(N'1998-01-26' AS Date), 350501, 1, 29, N'2', N'7', N'bradly29@gmail.com', N'cl12381')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462563, N'Иванов', N'Виталий', N'Даниилович', 2568, 386237, CAST(N'1976-08-11' AS Date), 450048, 1, 15, N'21', N'3', N'stark.cristina@hilpert.biz', N'cl12382')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462564, N'Захаров', N'Матвей', N'Романович', 2556, 439376, CAST(N'1993-07-12' AS Date), 644921, 1, 46, N'46', N'37', N'bruen.eleanore@yahoo.com', N'cl12383')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462565, N'Иванов', N'Степан', N'Степанович', 2737, 407501, CAST(N'1998-09-19' AS Date), 614228, 1, 10, N'36', N'54', N'percival.halvorson@yahoo.com', N'cl12384')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462566, N'Ткачева', N'Милана', N'Тимуровна', 2581, 441645, CAST(N'1998-05-24' AS Date), 350940, 1, 31, N'23', N'2', N'javonte71@kuhlman.biz', N'cl12385')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462567, N'Семенов', N'Даниил', N'Иванович', 2675, 427933, CAST(N'1976-01-04' AS Date), 344990, 1, 18, N'19', N'92', N'vconnelly@kautzer.com', N'cl12386')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462568, N'Виноградов', N'Вячеслав', N'Дмитриевич', 2967, 434531, CAST(N'1976-07-12' AS Date), 410248, 1, 45, N'11', N'75', N'anabelle07@schultz.info', N'cl12387')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462569, N'Соболева', N'Николь', N'Фёдоровна', 3070, 449655, CAST(N'1976-05-02' AS Date), 400839, 1, 1, N'46', N'44', N'nitzsche.katlynn@yahoo.com', N'cl12388')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462570, N'Тихонова', N'Анна', N'Львовна', 3108, 451174, CAST(N'1985-03-23' AS Date), 450539, 1, 11, N'3', N'81', N'corine16@von.com', N'cl12389')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462571, N'Кузнецова', N'Ульяна', N'Савельевна', 3250, 464705, CAST(N'1999-06-03' AS Date), 614591, 1, 43, N'20', N'40', N'otha.wisozk@lubowitz.org', N'cl12390')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462572, N'Смирнова', N'Анна', N'Германовна', 3392, 471644, CAST(N'1997-07-18' AS Date), 400260, 1, 2, N'30', N'53', N'may.kirlin@hotmail.com', N'cl12391')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462573, N'Черепанова', N'Анна', N'Давидовна', 3497, 487819, CAST(N'1985-11-06' AS Date), 660924, 1, 23, N'32', N'59', N'bryana.kautzer@yahoo.com', N'cl12392')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462574, N'Григорьев', N'Максим', N'Кириллович', 3560, 491260, CAST(N'1999-05-26' AS Date), 644133, 1, 6, N'28', N'69', N'deborah.christiansen@quigley.biz', N'cl12393')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462575, N'Голубев', N'Даниэль', N'Александрович', 3620, 506034, CAST(N'1999-06-14' AS Date), 450698, 1, 5, N'14', N'37', N'connelly.makayla@yahoo.com', N'cl12394')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462576, N'Миронов', N'Юрий', N'Денисович', 3774, 511438, CAST(N'1985-01-26' AS Date), 620653, 1, 12, N'15', N'25', N'tatum.collins@fay.org', N'cl12395')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462577, N'Терехов', N'Михаил', N'Андреевич', 3862, 521377, CAST(N'1976-07-06' AS Date), 644321, 1, 14, N'32', N'10', N'itzel73@anderson.com', N'cl12396')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462578, N'Орлова', N'Алиса', N'Михайловна', 3084, 535966, CAST(N'1997-02-24' AS Date), 603653, 1, 23, N'2', N'45', N'arjun39@hotmail.com', N'cl12397')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462579, N'Кулаков', N'Константин', N'Даниилович', 4021, 541528, CAST(N'1993-06-20' AS Date), 410181, 1, 21, N'16', N'74', N'ohara.rebeka@yahoo.com', N'cl12398')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462580, N'Кудрявцев', N'Максим', N'Романович', 4109, 554053, CAST(N'1998-05-10' AS Date), 394207, 1, 36, N'31', N'28', N'danika58@rath.com', N'cl12399')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462581, N'Соболева', N'Кира', N'Фёдоровна', 4537, 564868, CAST(N'1998-03-14' AS Date), 420633, 1, 19, N'18', N'41', N'janae.bogan@gmail.com', N'cl12400')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462582, N'Коновалов', N'Арсений', N'Максимович', 4914, 572471, CAST(N'1985-02-18' AS Date), 445720, 1, 19, N'50', N'67', N'vern91@yahoo.com', N'cl12401')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462583, N'Гусев', N'Михаил', N'Дмитриевич', 4445, 581302, CAST(N'1999-11-23' AS Date), 400646, 1, 28, N'47', N'65', N'mariana.leannon@larkin.net', N'cl12402')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462584, N'Суханова', N'Варвара', N'Матвеевна', 4743, 598180, CAST(N'1993-09-13' AS Date), 644410, 1, 17, N'17', N'69', N'vmoore@gmail.com', N'cl12403')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462585, N'Орлова', N'Ясмина', N'Васильевна', 4741, 601821, CAST(N'1984-06-24' AS Date), 400750, 1, 46, N'36', N'71', N'damon.mcclure@mills.com', N'cl12404')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462586, N'Васильева', N'Ксения', N'Константиновна', 4783, 612567, CAST(N'1999-08-01' AS Date), 660590, 1, 8, N'37', N'70', N'grady.reilly@block.com', N'cl12405')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462587, N'Борисова', N'Тамара', N'Данииловна', 4658, 621200, CAST(N'1993-05-29' AS Date), 426083, 1, 21, N'41', N'26', N'boyd.koss@yahoo.com', N'cl12406')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462588, N'Дмитриев', N'Мирон', N'Ильич', 4908, 634613, CAST(N'1985-04-13' AS Date), 410569, 1, 29, N'36', N'17', N'obartell@franecki.info', N'cl12407')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462589, N'Лебедева', N'Анна', N'Александровна', 5092, 642468, CAST(N'1985-03-30' AS Date), 443375, 1, 9, N'50', N'95', N'reina75@ferry.net', N'cl12408')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462590, N'Пономарев', N'Артём', N'Маркович', 5155, 465274, CAST(N'1984-06-02' AS Date), 614316, 1, 31, N'48', N'31', N'karson28@hotmail.com', N'cl12409')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462591, N'Борисова', N'Елена', N'Михайловна', 5086, 666893, CAST(N'1976-05-23' AS Date), 445685, 1, 13, N'7', N'47', N'damaris61@okon.com', N'cl12410')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462592, N'Моисеев', N'Камиль', N'Максимович', 5333, 675375, CAST(N'1999-06-17' AS Date), 614505, 1, 25, N'37', N'31', N'carroll.jerod@hotmail.com', N'cl12411')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462593, N'Герасимова', N'Дарья', N'Константиновна', 5493, 684572, CAST(N'1984-10-13' AS Date), 426629, 1, 3, N'32', N'46', N'ron.treutel@quitzon.com', N'cl12412')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462594, N'Михайлова', N'Мария', N'Марковна', 5150, 696226, CAST(N'1976-12-02' AS Date), 603743, 1, 19, N'19', N'20', N'olen79@yahoo.com', N'cl12413')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462595, N'Коршунов', N'Кирилл', N'Максимович', 1308, 703305, CAST(N'1985-05-22' AS Date), 450750, 1, 14, N'23', N'90', N'pacocha.robbie@yahoo.com', N'cl12414')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462596, N'Иванов', N'Иван', N'Иванович', 3155, 123456, CAST(N'2015-06-10' AS Date), 412412, 5, 47, N'4', N'66', N'ivanov@gmail.com', N'cl12415')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462597, N'Винидиктов', N'Виван', N'Виванович', 3123, 312312, CAST(N'2023-11-27' AS Date), 333332, 2, 16, N'2', N'3', N'оыо@masd.ru', N'cl12416')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462598, N'Каюков', N'Алексей', N'Николаевич', 1221, 312312, CAST(N'2023-11-28' AS Date), 312312, 2, 16, N'3213', N'312', N'kjaty@masdu.ru', N'cl12417')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (45462599, N'sda', N'dsa', N'asd', 3213, 123123, CAST(N'2023-11-28' AS Date), 3123, 2, 12, N'3123', N'3213', N'31@das.ru', N'cl12418')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Forename], [SeriesPassport], [NumberPassport], [DateOfBirth], [MailIndex], [idCity], [IdStreet], [Home], [Flat], [Email], [Password]) VALUES (77777777, N'Кокорин', N'Дмитрий', N'Сергеевич', 7777, 777777, CAST(N'2005-02-26' AS Date), 777777, 4, 1, N'52', N'52', N'korka@mail.ru', N'525252')
GO
INSERT [dbo].[Employee] ([Id], [idPost], [Surname], [Name], [Forename], [Login], [Password]) VALUES (101, 2, N'Иванов', N'Иван', N'Иванович', N'Ivanov@namecomp.ru', N'2L6KZG')
INSERT [dbo].[Employee] ([Id], [idPost], [Surname], [Name], [Forename], [Login], [Password]) VALUES (102, 2, N'Петров', N'Петр', N'Петрович', N'petrov@namecomp.ru', N'uzWC67')
INSERT [dbo].[Employee] ([Id], [idPost], [Surname], [Name], [Forename], [Login], [Password]) VALUES (103, 1, N'Федоров', N'Федор', N'Федорович', N'fedorov@namecomp.ru', N'8ntwUp')
INSERT [dbo].[Employee] ([Id], [idPost], [Surname], [Name], [Forename], [Login], [Password]) VALUES (104, 3, N'Миронов', N'Вениамин', N'Куприянович', N'mironov@namecomp.ru', N'YOyhfR')
INSERT [dbo].[Employee] ([Id], [idPost], [Surname], [Name], [Forename], [Login], [Password]) VALUES (105, 3, N'Ширяев', N'Ермолай', N'Вениаминович', N'shiryev@namecomp.ru', N'RSbvHv')
INSERT [dbo].[Employee] ([Id], [idPost], [Surname], [Name], [Forename], [Login], [Password]) VALUES (106, 3, N'Игнатов', N'Кассиан', N'Васильевич', N'ignatov@namecomp.ru', N'rwVDh9')
INSERT [dbo].[Employee] ([Id], [idPost], [Surname], [Name], [Forename], [Login], [Password]) VALUES (107, 2, N'Хохлов', N'Владимир', N'Мэлсович', N'hohlov@namecomp.ru', N'LdNyos')
INSERT [dbo].[Employee] ([Id], [idPost], [Surname], [Name], [Forename], [Login], [Password]) VALUES (108, 2, N'Стрелков', N'Мстислав', N'Георгьевич', N'strelkov@namecomp.ru', N'gynQMT')
INSERT [dbo].[Employee] ([Id], [idPost], [Surname], [Name], [Forename], [Login], [Password]) VALUES (109, 2, N'Беляева', N'Лилия', N'Наумовна', N'belyeva@@namecomp.ru', N'AtnDjr')
INSERT [dbo].[Employee] ([Id], [idPost], [Surname], [Name], [Forename], [Login], [Password]) VALUES (110, 2, N'Смирнова', N'Ульяна', N'Гордеевна', N'smirnova@@namecomp.ru', N'JlFRCZ')
GO
SET IDENTITY_INSERT [dbo].[HistoryEmployee] ON 

INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (102, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (106, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 1, 4)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 2, 5)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 2, 6)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 1, 7)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 2, 8)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 2, 9)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (109, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 2, 10)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 1, 11)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-27T00:00:00.000' AS DateTime), 2, 12)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-28T00:00:00.000' AS DateTime), 2, 13)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (110, CAST(N'2023-11-28T00:00:00.000' AS DateTime), 1, 14)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-28T00:00:00.000' AS DateTime), 2, 15)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (104, CAST(N'2023-11-28T00:00:00.000' AS DateTime), 1, 16)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (104, CAST(N'2023-11-28T00:00:00.000' AS DateTime), 2, 17)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-28T00:00:00.000' AS DateTime), 2, 18)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (106, CAST(N'2023-11-29T00:00:00.000' AS DateTime), 1, 19)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-11-29T00:00:00.000' AS DateTime), 2, 20)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (102, CAST(N'2023-12-02T00:00:00.000' AS DateTime), 2, 21)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2023-12-02T00:00:00.000' AS DateTime), 2, 22)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2023-12-02T00:00:00.000' AS DateTime), 2, 23)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-12-02T00:00:00.000' AS DateTime), 2, 24)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2023-12-02T00:00:00.000' AS DateTime), 2, 25)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (107, CAST(N'2023-12-02T00:00:00.000' AS DateTime), 2, 26)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2023-12-02T00:00:00.000' AS DateTime), 2, 27)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 2, 28)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 2, 29)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 2, 30)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (106, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 2, 31)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 2, 32)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (106, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 2, 33)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-12-03T00:00:00.000' AS DateTime), 2, 34)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 2, 35)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 2, 36)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (104, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 2, 37)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 2, 38)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 2, 39)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 2, 40)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 2, 41)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 2, 42)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2023-12-04T00:00:00.000' AS DateTime), 2, 43)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (107, CAST(N'2024-12-07T13:05:36.000' AS DateTime), 2, 44)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (107, CAST(N'2024-12-07T13:14:32.000' AS DateTime), 2, 45)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T13:36:01.000' AS DateTime), 2, 46)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T13:37:54.000' AS DateTime), 2, 47)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T13:39:04.000' AS DateTime), 2, 48)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T13:44:30.000' AS DateTime), 2, 49)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T13:45:58.000' AS DateTime), 2, 50)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T13:47:37.000' AS DateTime), 2, 51)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T13:52:58.000' AS DateTime), 2, 52)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T13:56:50.000' AS DateTime), 2, 53)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T13:59:09.000' AS DateTime), 2, 54)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T14:00:30.000' AS DateTime), 2, 55)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T14:02:22.000' AS DateTime), 2, 56)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T14:02:49.000' AS DateTime), 1, 57)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T14:02:53.000' AS DateTime), 2, 58)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T14:03:58.000' AS DateTime), 2, 59)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:33:10.000' AS DateTime), 2, 60)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:33:55.000' AS DateTime), 2, 61)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:35:44.000' AS DateTime), 2, 62)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (102, CAST(N'2024-12-07T14:40:25.000' AS DateTime), 2, 63)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:42:26.000' AS DateTime), 2, 64)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:43:33.000' AS DateTime), 2, 65)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:44:02.000' AS DateTime), 2, 66)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:45:15.000' AS DateTime), 2, 67)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:47:01.000' AS DateTime), 2, 68)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:51:32.000' AS DateTime), 2, 69)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:53:08.000' AS DateTime), 2, 70)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T14:54:55.000' AS DateTime), 2, 71)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T15:02:02.000' AS DateTime), 2, 72)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T15:04:39.000' AS DateTime), 2, 73)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T15:05:16.000' AS DateTime), 2, 74)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T15:13:09.000' AS DateTime), 2, 75)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T15:16:59.000' AS DateTime), 2, 76)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T15:23:12.000' AS DateTime), 2, 77)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T15:23:25.000' AS DateTime), 2, 78)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T15:45:00.000' AS DateTime), 2, 79)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T15:49:10.000' AS DateTime), 2, 80)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T15:57:09.000' AS DateTime), 2, 81)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T16:01:01.000' AS DateTime), 2, 82)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T16:03:36.000' AS DateTime), 2, 83)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T16:04:15.000' AS DateTime), 2, 84)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T16:13:49.000' AS DateTime), 2, 85)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T16:17:13.000' AS DateTime), 2, 86)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2024-12-07T16:17:36.000' AS DateTime), 2, 87)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (105, CAST(N'2024-12-07T16:19:10.000' AS DateTime), 2, 88)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T16:20:43.000' AS DateTime), 2, 89)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T17:35:50.000' AS DateTime), 1, 90)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T17:36:06.000' AS DateTime), 1, 91)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T17:36:19.000' AS DateTime), 2, 92)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T17:43:34.000' AS DateTime), 2, 93)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T17:45:25.000' AS DateTime), 2, 94)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T18:14:05.000' AS DateTime), 2, 95)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T18:15:21.000' AS DateTime), 2, 96)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (103, CAST(N'2024-12-07T18:20:28.000' AS DateTime), 2, 97)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T18:27:56.000' AS DateTime), 2, 98)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T18:36:06.000' AS DateTime), 2, 99)
GO
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T18:42:04.000' AS DateTime), 2, 100)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T19:29:30.000' AS DateTime), 2, 101)
INSERT [dbo].[HistoryEmployee] ([idEmployee], [DateInput], [idInput], [idHistory]) VALUES (101, CAST(N'2024-12-07T19:32:38.000' AS DateTime), 2, 102)
SET IDENTITY_INSERT [dbo].[HistoryEmployee] OFF
GO
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'1', CAST(N'2022-03-12' AS Date), CAST(N'09:10:00' AS Time), 45462526, 2, CAST(N'2022-03-12' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'10', CAST(N'2022-03-21' AS Date), CAST(N'11:00:00' AS Time), 45462535, 2, CAST(N'2022-03-21' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'11', CAST(N'2022-03-22' AS Date), CAST(N'12:00:00' AS Time), 45462536, 2, CAST(N'2022-03-22' AS Date), 600)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'12', CAST(N'2022-03-23' AS Date), CAST(N'13:00:00' AS Time), 45462537, 2, CAST(N'2022-03-23' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'13', CAST(N'2022-03-24' AS Date), CAST(N'14:00:00' AS Time), 45462538, 2, CAST(N'2022-03-25' AS Date), 600)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'14', CAST(N'2022-03-25' AS Date), CAST(N'15:00:00' AS Time), 45462539, 2, CAST(N'2022-03-25' AS Date), 320)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'15', CAST(N'2022-03-26' AS Date), CAST(N'16:00:00' AS Time), 45462540, 2, CAST(N'2022-04-26' AS Date), 480)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'16', CAST(N'2022-03-27' AS Date), CAST(N'17:00:00' AS Time), 45462541, 2, CAST(N'2022-03-27' AS Date), 240)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'17', CAST(N'2022-03-28' AS Date), CAST(N'18:00:00' AS Time), 45462542, 2, CAST(N'2022-03-29' AS Date), 360)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'18', CAST(N'2022-03-29' AS Date), CAST(N'19:00:00' AS Time), 45462543, 2, CAST(N'2022-03-30' AS Date), 720)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'19', CAST(N'2022-03-30' AS Date), CAST(N'12:30:00' AS Time), 45462544, 2, CAST(N'2022-03-30' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'2', CAST(N'2022-03-13' AS Date), CAST(N'10:10:00' AS Time), 45462527, 2, CAST(N'2022-03-13' AS Date), 600)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'20', CAST(N'2022-03-31' AS Date), CAST(N'13:30:00' AS Time), 45462545, 2, CAST(N'2022-03-31' AS Date), 600)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'21', CAST(N'2022-04-01' AS Date), CAST(N'14:30:00' AS Time), 45462546, 2, CAST(N'2022-04-01' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'22', CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), 45462547, 2, CAST(N'2022-04-03' AS Date), 600)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'23', CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), 45462548, 2, CAST(N'2022-04-03' AS Date), 320)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'24', CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), 45462549, 2, CAST(N'2022-04-05' AS Date), 480)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'25', CAST(N'2022-04-05' AS Date), CAST(N'18:30:00' AS Time), 45462550, 2, CAST(N'2022-04-05' AS Date), 240)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'26', CAST(N'2022-04-06' AS Date), CAST(N'15:30:00' AS Time), 45462551, 2, CAST(N'2022-04-06' AS Date), 360)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'27', CAST(N'2022-04-07' AS Date), CAST(N'16:30:00' AS Time), 45462552, 2, CAST(N'2022-04-08' AS Date), 720)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'28', CAST(N'2022-04-08' AS Date), CAST(N'17:30:00' AS Time), 45462553, 2, CAST(N'2022-04-08' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'29', CAST(N'2022-04-09' AS Date), CAST(N'18:30:00' AS Time), 45462554, 2, CAST(N'2022-04-10' AS Date), 600)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'3', CAST(N'2022-03-14' AS Date), CAST(N'11:10:00' AS Time), 45462528, 2, CAST(N'2022-03-14' AS Date), 180)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'30', CAST(N'2022-04-10' AS Date), CAST(N'19:30:00' AS Time), 45462555, 2, CAST(N'2022-04-10' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'31', CAST(N'2022-04-11' AS Date), CAST(N'10:30:00' AS Time), 45462556, 2, CAST(N'2022-04-11' AS Date), 600)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'32', CAST(N'2022-04-12' AS Date), CAST(N'11:30:00' AS Time), 45462557, 2, CAST(N'2022-04-12' AS Date), 320)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'33', CAST(N'2022-04-13' AS Date), CAST(N'12:30:00' AS Time), 45462558, 2, CAST(N'2022-04-13' AS Date), 480)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'34', CAST(N'2022-04-14' AS Date), CAST(N'13:30:00' AS Time), 45462559, 2, CAST(N'2022-04-14' AS Date), 240)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'35', CAST(N'2022-04-15' AS Date), CAST(N'14:30:00' AS Time), 45462560, 2, CAST(N'2022-04-15' AS Date), 360)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'36', CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), 45462561, 2, CAST(N'2022-04-03' AS Date), 720)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'37', CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), 45462562, 2, CAST(N'2022-04-03' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'38', CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), 45462563, 2, CAST(N'2022-04-04' AS Date), 600)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'39', CAST(N'2022-04-05' AS Date), CAST(N'10:15:00' AS Time), 45462564, 2, CAST(N'2022-04-05' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'4', CAST(N'2022-03-15' AS Date), CAST(N'12:10:00' AS Time), 45462529, 2, CAST(N'2022-03-15' AS Date), 600)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'40', CAST(N'2022-04-06' AS Date), CAST(N'11:15:00' AS Time), 45462565, 2, CAST(N'2022-04-06' AS Date), 600)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'41', CAST(N'2022-04-07' AS Date), CAST(N'12:15:00' AS Time), 45462566, 2, CAST(N'2022-04-07' AS Date), 320)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'42', CAST(N'2022-04-08' AS Date), CAST(N'13:15:00' AS Time), 45462567, 2, CAST(N'2022-04-08' AS Date), 480)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'43', CAST(N'2022-04-09' AS Date), CAST(N'14:15:00' AS Time), 45462568, 2, CAST(N'2022-04-09' AS Date), 240)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'44', CAST(N'2022-04-01' AS Date), CAST(N'15:15:00' AS Time), 45462569, 2, CAST(N'2022-04-01' AS Date), 360)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'45', CAST(N'2022-04-02' AS Date), CAST(N'16:15:00' AS Time), 45462570, 2, CAST(N'2022-04-03' AS Date), 720)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'46', CAST(N'2022-04-03' AS Date), CAST(N'10:45:00' AS Time), 45462571, 2, CAST(N'2022-04-03' AS Date), 480)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'47', CAST(N'2022-04-04' AS Date), CAST(N'11:45:00' AS Time), 45462572, 2, CAST(N'2022-04-04' AS Date), 320)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'48', CAST(N'2022-04-05' AS Date), CAST(N'12:45:00' AS Time), 45462573, 2, CAST(N'2022-04-05' AS Date), 480)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'49', CAST(N'2022-04-06' AS Date), CAST(N'13:45:00' AS Time), 45462574, 2, CAST(N'2022-04-06' AS Date), 240)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'5', CAST(N'2022-03-16' AS Date), CAST(N'13:10:00' AS Time), 45462530, 2, CAST(N'2022-04-16' AS Date), 320)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'50', CAST(N'2022-04-07' AS Date), CAST(N'14:45:00' AS Time), 45462575, 2, CAST(N'2022-04-07' AS Date), 360)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'51', CAST(N'2023-12-02' AS Date), CAST(N'16:37:50' AS Time), 45462597, 2, CAST(N'2023-12-02' AS Date), 200)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'52', CAST(N'2023-12-02' AS Date), CAST(N'16:40:30' AS Time), 45462532, 2, CAST(N'2023-12-02' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'53', CAST(N'2023-12-02' AS Date), CAST(N'17:00:49' AS Time), 45462529, 2, CAST(N'2023-12-02' AS Date), 40)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'54', CAST(N'2023-12-02' AS Date), CAST(N'17:01:58' AS Time), 45462557, 2, CAST(N'2023-12-03' AS Date), 720)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'55', CAST(N'2023-12-02' AS Date), CAST(N'17:05:19' AS Time), 45462531, 2, CAST(N'2023-12-02' AS Date), 40)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'56', CAST(N'2023-12-02' AS Date), CAST(N'17:05:26' AS Time), 45462532, 2, CAST(N'2023-12-02' AS Date), 40)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'57', CAST(N'2023-12-02' AS Date), CAST(N'17:07:17' AS Time), 45462528, 2, CAST(N'2023-12-02' AS Date), 40)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'58', CAST(N'2023-12-02' AS Date), CAST(N'17:07:23' AS Time), 45462530, 2, CAST(N'2023-12-02' AS Date), 40)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'59', CAST(N'2023-12-02' AS Date), CAST(N'17:10:01' AS Time), 45462530, 2, CAST(N'2023-12-02' AS Date), 80)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'6', CAST(N'2022-03-17' AS Date), CAST(N'14:10:00' AS Time), 45462531, 2, CAST(N'2022-03-17' AS Date), 480)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'60', CAST(N'2023-12-02' AS Date), CAST(N'17:10:20' AS Time), 45462534, 2, CAST(N'2023-12-03' AS Date), 440)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'61', CAST(N'2023-12-02' AS Date), CAST(N'17:15:07' AS Time), 45462530, 2, CAST(N'2023-12-03' AS Date), 680)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'62', CAST(N'2023-12-02' AS Date), CAST(N'17:22:58' AS Time), 45462526, 2, CAST(N'2023-12-02' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'63', CAST(N'2023-12-02' AS Date), CAST(N'17:24:19' AS Time), 45462532, 2, CAST(N'2023-12-02' AS Date), 200)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'64', CAST(N'2023-12-03' AS Date), CAST(N'14:05:52' AS Time), 45462527, 2, CAST(N'2023-12-03' AS Date), 80)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'65', CAST(N'2023-12-03' AS Date), CAST(N'14:25:48' AS Time), 45462528, 2, CAST(N'2023-12-03' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'66', CAST(N'2023-12-03' AS Date), CAST(N'14:39:53' AS Time), 45462532, 2, CAST(N'2023-12-03' AS Date), 560)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'67', CAST(N'2023-12-03' AS Date), CAST(N'15:23:26' AS Time), 45462530, 2, CAST(N'2023-12-03' AS Date), 40)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'68', CAST(N'2023-12-03' AS Date), CAST(N'23:00:34' AS Time), 45462527, 2, CAST(N'2023-12-04' AS Date), 160)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'69', CAST(N'2023-12-04' AS Date), CAST(N'21:10:06' AS Time), 45462531, 2, CAST(N'2023-12-04' AS Date), 160)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'7', CAST(N'2022-03-18' AS Date), CAST(N'15:10:00' AS Time), 45462532, 2, CAST(N'2022-03-18' AS Date), 240)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'70', CAST(N'2023-12-04' AS Date), CAST(N'22:36:50' AS Time), 45462532, 2, CAST(N'2023-12-05' AS Date), 280)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'71', CAST(N'2023-12-04' AS Date), CAST(N'22:39:06' AS Time), 45462528, 3, CAST(N'2023-12-05' AS Date), 120)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'8', CAST(N'2022-03-19' AS Date), CAST(N'16:10:00' AS Time), 45462533, 2, CAST(N'2022-03-19' AS Date), 360)
INSERT [dbo].[Orders] ([Id], [DateCreate], [TimeOrder], [idClient], [idStatus], [DateClose], [TimeRental]) VALUES (N'9', CAST(N'2022-03-20' AS Date), CAST(N'10:00:00' AS Time), 45462534, 2, CAST(N'2022-03-20' AS Date), 720)
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Title]) VALUES (1, N'Администратор')
INSERT [dbo].[Post] ([Id], [Title]) VALUES (2, N'Продавец')
INSERT [dbo].[Post] ([Id], [Title]) VALUES (3, N'Старший смены')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (0, N'Подъем на 5 уровень', N'vbfbjckt', 2000.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (31, N'Прокат сноуборда', N'JUR8R', 1200.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (34, N'Прокат обуви для сноуборда', N'JKFBJ09', 400.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (44, N'Прокат салазок', N'DHBGFY563', 450.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (45, N'Прокат защитных подушек для сноубордистов', N'JFH7382', 300.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (57, N'Подъем на 1 уровень', N'JHVSJF6', 300.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (88, N'Подъем на 2  уровень', N'DJHGBS982', 700.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (89, N'Прокат очков для лыжников', N'OIJNB12', 150.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (92, N'Прокат санок', N'HJBUJE21J', 300.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (98, N'Прокат шлема', N'63748HF', 300.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (99, N'Прокат вартушки', N'BSFBHV63', 100.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (123, N'Подъем на 3 уровень', N'638VVNQ3', 1200.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (336, N'Прокат лыж', N'8HFJHG443', 800.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (353, N'Прокат лыжных палок', N'87FDJKHJ', 100.0000)
INSERT [dbo].[Service] ([idService], [Title], [CodeService], [Price]) VALUES (354, N'Подъем на 4 уровень', N'1MHC1Q', 1500.0000)
GO
SET IDENTITY_INSERT [dbo].[ServiceOrder] ON 

INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462526/12.03.2022', CAST(N'2022-03-12' AS Date), 34, N'1', 1)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462526/12.03.2022', CAST(N'2022-03-12' AS Date), 31, N'1', 2)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462526/12.03.2022', CAST(N'2022-03-12' AS Date), 353, N'1', 3)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462526/12.03.2022', CAST(N'2022-03-12' AS Date), 336, N'1', 4)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462527/13.03.2022', CAST(N'2022-03-13' AS Date), 98, N'2', 5)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462527/13.03.2022', CAST(N'2022-03-13' AS Date), 45, N'2', 6)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462527/13.03.2022', CAST(N'2022-03-13' AS Date), 89, N'2', 7)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462527/13.03.2022', CAST(N'2022-03-13' AS Date), 99, N'2', 8)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462527/13.03.2022', CAST(N'2022-03-13' AS Date), 123, N'2', 9)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462528/14.03.2022', CAST(N'2022-03-14' AS Date), 92, N'3', 10)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462528/14.03.2022', CAST(N'2022-03-14' AS Date), 45, N'3', 11)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462528/14.03.2022', CAST(N'2022-03-14' AS Date), 57, N'3', 12)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462528/14.03.2022', CAST(N'2022-03-14' AS Date), 88, N'3', 13)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462529/15.03.2022', CAST(N'2022-03-15' AS Date), 92, N'4', 14)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462529/15.03.2022', CAST(N'2022-03-15' AS Date), 45, N'4', 15)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462529/15.03.2022', CAST(N'2022-03-15' AS Date), 57, N'4', 16)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462529/15.03.2022', CAST(N'2022-03-15' AS Date), 88, N'4', 17)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462529/15.03.2022', CAST(N'2022-03-15' AS Date), 44, N'4', 18)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462530/16.03.2022', CAST(N'2022-03-16' AS Date), 98, N'5', 19)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462530/16.03.2022', CAST(N'2022-03-16' AS Date), 45, N'5', 20)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462530/16.03.2022', CAST(N'2022-03-16' AS Date), 89, N'5', 21)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462530/16.03.2022', CAST(N'2022-03-16' AS Date), 353, N'5', 22)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462530/16.03.2022', CAST(N'2022-03-16' AS Date), 336, N'5', 23)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462530/16.03.2022', CAST(N'2022-03-16' AS Date), 34, N'5', 24)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462531/17.03.2022', CAST(N'2022-03-17' AS Date), 34, N'6', 25)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462531/17.03.2022', CAST(N'2022-03-17' AS Date), 31, N'6', 26)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462531/17.03.2022', CAST(N'2022-03-17' AS Date), 353, N'6', 27)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462532/18.03.2022', CAST(N'2022-03-18' AS Date), 98, N'7', 28)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462532/18.03.2022', CAST(N'2022-03-18' AS Date), 45, N'7', 29)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462532/18.03.2022', CAST(N'2022-03-18' AS Date), 89, N'7', 30)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462532/18.03.2022', CAST(N'2022-03-18' AS Date), 99, N'7', 31)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462533/19.03.2022', CAST(N'2022-03-19' AS Date), 92, N'8', 32)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462533/19.03.2022', CAST(N'2022-03-19' AS Date), 45, N'8', 33)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462533/19.03.2022', CAST(N'2022-03-19' AS Date), 57, N'8', 34)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462533/19.03.2022', CAST(N'2022-03-19' AS Date), 89, N'8', 35)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462534/20.03.2022', CAST(N'2022-03-20' AS Date), 92, N'9', 36)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462534/20.03.2022', CAST(N'2022-03-20' AS Date), 45, N'9', 37)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462534/20.03.2022', CAST(N'2022-03-20' AS Date), 57, N'9', 38)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462534/20.03.2022', CAST(N'2022-03-20' AS Date), 88, N'9', 39)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462534/20.03.2022', CAST(N'2022-03-20' AS Date), 45, N'9', 40)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462535/21.03.2022', CAST(N'2022-03-21' AS Date), 98, N'10', 41)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462535/21.03.2022', CAST(N'2022-03-21' AS Date), 45, N'10', 42)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462535/21.03.2022', CAST(N'2022-03-21' AS Date), 89, N'10', 43)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462535/21.03.2022', CAST(N'2022-03-21' AS Date), 353, N'10', 44)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462535/21.03.2022', CAST(N'2022-03-21' AS Date), 336, N'10', 45)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462536/22.03.2022', CAST(N'2022-03-22' AS Date), 34, N'11', 46)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462536/22.03.2022', CAST(N'2022-03-22' AS Date), 31, N'11', 47)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462536/22.03.2022', CAST(N'2022-03-22' AS Date), 353, N'11', 48)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462537/23.03.2022', CAST(N'2022-03-23' AS Date), 98, N'12', 49)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462537/23.03.2022', CAST(N'2022-03-23' AS Date), 45, N'12', 50)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462537/23.03.2022', CAST(N'2022-03-23' AS Date), 89, N'12', 51)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462537/23.03.2022', CAST(N'2022-03-23' AS Date), 99, N'12', 52)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462537/23.03.2022', CAST(N'2022-03-24' AS Date), 92, N'13', 53)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462537/23.03.2022', CAST(N'2022-03-24' AS Date), 45, N'13', 54)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462537/23.03.2022', CAST(N'2022-03-24' AS Date), 57, N'13', 55)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462539/25.03.2022', CAST(N'2022-03-25' AS Date), 92, N'14', 56)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462539/25.03.2022', CAST(N'2022-03-25' AS Date), 45, N'14', 57)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462539/25.03.2022', CAST(N'2022-03-25' AS Date), 57, N'14', 58)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462539/25.03.2022', CAST(N'2022-03-25' AS Date), 88, N'14', 59)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462540/26.03.2022', CAST(N'2022-03-26' AS Date), 98, N'15', 60)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462540/26.03.2022', CAST(N'2022-03-26' AS Date), 45, N'15', 61)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462540/26.03.2022', CAST(N'2022-03-26' AS Date), 89, N'15', 62)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462540/26.03.2022', CAST(N'2022-03-26' AS Date), 353, N'15', 63)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462540/26.03.2022', CAST(N'2022-03-26' AS Date), 336, N'15', 64)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462541/27.03.2022', CAST(N'2022-03-27' AS Date), 34, N'16', 65)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462541/27.03.2022', CAST(N'2022-03-27' AS Date), 31, N'16', 66)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462541/27.03.2022', CAST(N'2022-03-27' AS Date), 353, N'16', 67)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462542/28.03.2022', CAST(N'2022-03-28' AS Date), 98, N'17', 68)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462542/28.03.2022', CAST(N'2022-03-28' AS Date), 45, N'17', 69)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462542/28.03.2022', CAST(N'2022-03-28' AS Date), 89, N'17', 70)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462542/28.03.2022', CAST(N'2022-03-28' AS Date), 99, N'17', 71)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462543/29.03.2022', CAST(N'2022-03-29' AS Date), 92, N'18', 72)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462543/29.03.2022', CAST(N'2022-03-29' AS Date), 45, N'18', 73)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462543/29.03.2022', CAST(N'2022-03-29' AS Date), 57, N'18', 74)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462544/30.03.2022', CAST(N'2022-03-30' AS Date), 92, N'19', 75)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462544/30.03.2022', CAST(N'2022-03-30' AS Date), 45, N'19', 76)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462544/30.03.2022', CAST(N'2022-03-30' AS Date), 57, N'19', 77)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462544/30.03.2022', CAST(N'2022-03-30' AS Date), 88, N'19', 78)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462545/31.03.2022', CAST(N'2022-03-31' AS Date), 98, N'20', 79)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462545/31.03.2022', CAST(N'2022-03-31' AS Date), 45, N'20', 80)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462545/31.03.2022', CAST(N'2022-03-31' AS Date), 89, N'20', 81)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462545/31.03.2022', CAST(N'2022-03-31' AS Date), 353, N'20', 82)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462545/31.03.2022', CAST(N'2022-03-31' AS Date), 336, N'20', 83)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462546/01.04.2022', CAST(N'2022-04-01' AS Date), 34, N'21', 84)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462546/01.04.2022', CAST(N'2022-04-01' AS Date), 31, N'21', 85)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462546/01.04.2022', CAST(N'2022-04-01' AS Date), 353, N'21', 86)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462547/02.04.2022', CAST(N'2022-04-02' AS Date), 98, N'22', 87)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462547/02.04.2022', CAST(N'2022-04-02' AS Date), 45, N'22', 88)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462547/02.04.2022', CAST(N'2022-04-02' AS Date), 89, N'22', 89)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462547/02.04.2022', CAST(N'2022-04-02' AS Date), 99, N'22', 90)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462548/03.04.2022', CAST(N'2022-04-03' AS Date), 92, N'23', 91)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462548/03.04.2022', CAST(N'2022-04-03' AS Date), 45, N'23', 92)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462548/03.04.2022', CAST(N'2022-04-03' AS Date), 57, N'23', 93)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462548/03.04.2022', CAST(N'2022-04-03' AS Date), 92, N'23', 94)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462549/04.04.2022', CAST(N'2022-04-04' AS Date), 92, N'24', 95)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462549/04.04.2022', CAST(N'2022-04-04' AS Date), 45, N'24', 96)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462549/04.04.2022', CAST(N'2022-04-04' AS Date), 57, N'24', 97)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462549/04.04.2022', CAST(N'2022-04-04' AS Date), 88, N'24', 98)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462550/05.04.2022', CAST(N'2022-04-05' AS Date), 98, N'25', 99)
GO
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462550/05.04.2022', CAST(N'2022-04-05' AS Date), 45, N'25', 100)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462550/05.04.2022', CAST(N'2022-04-05' AS Date), 89, N'25', 101)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462550/05.04.2022', CAST(N'2022-04-05' AS Date), 353, N'25', 102)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462550/05.04.2022', CAST(N'2022-04-05' AS Date), 336, N'25', 103)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462551/06.04.2022', CAST(N'2022-04-06' AS Date), 34, N'26', 104)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462551/06.04.2022', CAST(N'2022-04-06' AS Date), 31, N'26', 105)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462551/06.04.2022', CAST(N'2022-04-06' AS Date), 353, N'26', 106)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462552/07.04.2022', CAST(N'2022-04-07' AS Date), 98, N'27', 107)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462552/07.04.2022', CAST(N'2022-04-07' AS Date), 45, N'27', 108)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462552/07.04.2022', CAST(N'2022-04-07' AS Date), 89, N'27', 109)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462552/07.04.2022', CAST(N'2022-04-07' AS Date), 99, N'27', 110)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462553/08.04.2022', CAST(N'2022-04-08' AS Date), 92, N'28', 111)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462553/08.04.2022', CAST(N'2022-04-08' AS Date), 45, N'28', 112)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462553/08.04.2022', CAST(N'2022-04-08' AS Date), 57, N'28', 113)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462554/09.04.2022', CAST(N'2022-04-09' AS Date), 92, N'29', 114)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462554/09.04.2022', CAST(N'2022-04-09' AS Date), 45, N'29', 115)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462554/09.04.2022', CAST(N'2022-04-09' AS Date), 57, N'29', 116)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462554/09.04.2022', CAST(N'2022-04-09' AS Date), 88, N'29', 117)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462555/10.04.2022', CAST(N'2022-04-10' AS Date), 98, N'30', 118)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462555/10.04.2022', CAST(N'2022-04-10' AS Date), 45, N'30', 119)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462555/10.04.2022', CAST(N'2022-04-10' AS Date), 89, N'30', 120)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462555/10.04.2022', CAST(N'2022-04-10' AS Date), 353, N'30', 121)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462555/10.04.2022', CAST(N'2022-04-10' AS Date), 336, N'30', 122)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462556/11.04.2022', CAST(N'2022-04-11' AS Date), 34, N'31', 123)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462556/11.04.2022', CAST(N'2022-04-11' AS Date), 31, N'31', 124)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462556/11.04.2022', CAST(N'2022-04-11' AS Date), 353, N'31', 125)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462557/12.04.2022', CAST(N'2022-04-12' AS Date), 98, N'32', 126)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462557/12.04.2022', CAST(N'2022-04-12' AS Date), 45, N'32', 127)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462557/12.04.2022', CAST(N'2022-04-12' AS Date), 89, N'32', 128)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462557/12.04.2022', CAST(N'2022-04-12' AS Date), 99, N'32', 129)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462558/13.04.2022', CAST(N'2022-04-13' AS Date), 92, N'33', 130)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462558/13.04.2022', CAST(N'2022-04-13' AS Date), 45, N'33', 131)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462558/13.04.2022', CAST(N'2022-04-13' AS Date), 57, N'33', 132)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462559/14.04.2022', CAST(N'2022-04-14' AS Date), 92, N'34', 133)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462559/14.04.2022', CAST(N'2022-04-14' AS Date), 45, N'34', 134)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462559/14.04.2022', CAST(N'2022-04-14' AS Date), 57, N'34', 135)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462559/14.04.2022', CAST(N'2022-04-14' AS Date), 88, N'34', 136)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462560/15.04.2022', CAST(N'2022-04-15' AS Date), 98, N'35', 137)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462560/15.04.2022', CAST(N'2022-04-15' AS Date), 45, N'35', 138)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462560/15.04.2022', CAST(N'2022-04-15' AS Date), 89, N'35', 139)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462560/15.04.2022', CAST(N'2022-04-15' AS Date), 353, N'35', 140)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462560/15.04.2022', CAST(N'2022-04-15' AS Date), 336, N'35', 141)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462561/02.04.2022', CAST(N'2022-04-02' AS Date), 34, N'36', 142)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462561/02.04.2022', CAST(N'2022-04-02' AS Date), 31, N'36', 143)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462561/02.04.2022', CAST(N'2022-04-02' AS Date), 353, N'36', 144)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462562/03.04.2022', CAST(N'2022-04-03' AS Date), 98, N'37', 145)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462562/03.04.2022', CAST(N'2022-04-03' AS Date), 45, N'37', 146)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462562/03.04.2022', CAST(N'2022-04-03' AS Date), 89, N'37', 147)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462562/03.04.2022', CAST(N'2022-04-03' AS Date), 99, N'37', 148)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462563/04.04.2022', CAST(N'2022-04-04' AS Date), 92, N'38', 149)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462563/04.04.2022', CAST(N'2022-04-04' AS Date), 45, N'38', 150)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462563/04.04.2022', CAST(N'2022-04-04' AS Date), 57, N'38', 151)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462564/05.04.2022', CAST(N'2022-04-05' AS Date), 92, N'39', 152)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462564/05.04.2022', CAST(N'2022-04-05' AS Date), 45, N'39', 153)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462564/05.04.2022', CAST(N'2022-04-05' AS Date), 57, N'39', 154)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462564/05.04.2022', CAST(N'2022-04-05' AS Date), 88, N'39', 155)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462565/06.04.2022', CAST(N'2022-04-06' AS Date), 98, N'40', 156)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462565/06.04.2022', CAST(N'2022-04-06' AS Date), 45, N'40', 157)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462565/06.04.2022', CAST(N'2022-04-06' AS Date), 89, N'40', 158)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462565/06.04.2022', CAST(N'2022-04-06' AS Date), 353, N'40', 159)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462565/06.04.2022', CAST(N'2022-04-06' AS Date), 336, N'40', 160)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462566/07.04.2022', CAST(N'2022-04-07' AS Date), 34, N'41', 161)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462566/07.04.2022', CAST(N'2022-04-07' AS Date), 31, N'41', 162)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462566/07.04.2022', CAST(N'2022-04-07' AS Date), 353, N'41', 163)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462567/08.04.2022', CAST(N'2022-04-08' AS Date), 98, N'42', 164)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462567/08.04.2022', CAST(N'2022-04-08' AS Date), 45, N'42', 165)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462567/08.04.2022', CAST(N'2022-04-08' AS Date), 89, N'42', 166)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462567/08.04.2022', CAST(N'2022-04-08' AS Date), 99, N'42', 167)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462568/09.04.2022', CAST(N'2022-04-09' AS Date), 92, N'43', 168)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462568/09.04.2022', CAST(N'2022-04-09' AS Date), 45, N'43', 169)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462568/09.04.2022', CAST(N'2022-04-09' AS Date), 57, N'43', 170)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462569/01.04.2022', CAST(N'2022-04-01' AS Date), 92, N'44', 171)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462569/01.04.2022', CAST(N'2022-04-01' AS Date), 45, N'44', 172)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462569/01.04.2022', CAST(N'2022-04-01' AS Date), 57, N'44', 173)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462569/01.04.2022', CAST(N'2022-04-01' AS Date), 88, N'44', 174)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462570/02.04.2022', CAST(N'2022-04-02' AS Date), 98, N'45', 175)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462570/02.04.2022', CAST(N'2022-04-02' AS Date), 45, N'45', 176)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462570/02.04.2022', CAST(N'2022-04-02' AS Date), 89, N'45', 177)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462570/02.04.2022', CAST(N'2022-04-02' AS Date), 353, N'45', 178)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462570/02.04.2022', CAST(N'2022-04-02' AS Date), 336, N'45', 179)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462570/03.04.2022', CAST(N'2022-04-03' AS Date), 34, N'46', 180)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462570/03.04.2022', CAST(N'2022-04-03' AS Date), 31, N'46', 181)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462570/03.04.2022', CAST(N'2022-04-03' AS Date), 353, N'46', 182)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462572/04.04.2022', CAST(N'2022-04-04' AS Date), 98, N'47', 183)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462572/04.04.2022', CAST(N'2022-04-04' AS Date), 45, N'47', 184)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462572/04.04.2022', CAST(N'2022-04-04' AS Date), 89, N'47', 185)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462572/04.04.2022', CAST(N'2022-04-04' AS Date), 99, N'47', 186)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462573/05.04.2022', CAST(N'2022-04-05' AS Date), 92, N'48', 187)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462573/05.04.2022', CAST(N'2022-04-05' AS Date), 45, N'48', 188)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462573/05.04.2022', CAST(N'2022-04-05' AS Date), 57, N'48', 189)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462574/06.04.2022', CAST(N'2022-04-06' AS Date), 92, N'49', 190)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462574/06.04.2022', CAST(N'2022-04-06' AS Date), 45, N'49', 191)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462574/06.04.2022', CAST(N'2022-04-06' AS Date), 57, N'49', 192)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462574/06.04.2022', CAST(N'2022-04-06' AS Date), 88, N'49', 193)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462575/07.04.2022', CAST(N'2022-04-07' AS Date), 98, N'50', 194)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462575/07.04.2022', CAST(N'2022-04-07' AS Date), 45, N'50', 195)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462575/07.04.2022', CAST(N'2022-04-07' AS Date), 89, N'50', 196)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462575/07.04.2022', CAST(N'2022-04-07' AS Date), 353, N'50', 197)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462575/07.04.2022', CAST(N'2022-04-07' AS Date), 336, N'50', 198)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462597/02.12.2023', CAST(N'2023-12-02' AS Date), 57, N'51', 199)
GO
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462597/02.12.2023', CAST(N'2023-12-02' AS Date), 354, N'51', 200)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462532/02.12.2023', CAST(N'2023-12-02' AS Date), 44, N'52', 201)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462529/02.12.2023', CAST(N'2023-12-02' AS Date), 31, N'53', 202)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462557/02.12.2023', CAST(N'2023-12-02' AS Date), 34, N'54', 203)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462531/02.12.2023', CAST(N'2023-12-02' AS Date), 34, N'55', 204)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462532/02.12.2023', CAST(N'2023-12-02' AS Date), 89, N'56', 205)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462528/02.12.2023', CAST(N'2023-12-02' AS Date), 45, N'57', 206)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462530/02.12.2023', CAST(N'2023-12-02' AS Date), 57, N'58', 207)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462530/02.12.2023', CAST(N'2023-12-02' AS Date), 57, N'59', 208)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462534/02.12.2023', CAST(N'2023-12-02' AS Date), 45, N'60', 209)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462534/02.12.2023', CAST(N'2023-12-02' AS Date), 92, N'60', 210)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462534/02.12.2023', CAST(N'2023-12-02' AS Date), 88, N'60', 211)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462530/02.12.2023', CAST(N'2023-12-02' AS Date), 31, N'61', 212)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462530/02.12.2023', CAST(N'2023-12-02' AS Date), 44, N'61', 213)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462526/02.12.2023', CAST(N'2023-12-02' AS Date), 34, N'62', 214)
INSERT [dbo].[ServiceOrder] ([idOrder], [DateCreate], [idService], [NumberOrder], [Id]) VALUES (N'45462532/02.12.2023', CAST(N'2023-12-02' AS Date), 45, N'63', 215)
SET IDENTITY_INSERT [dbo].[ServiceOrder] OFF
GO
INSERT [dbo].[Status] ([Id], [Title]) VALUES (1, N'В прокате')
INSERT [dbo].[Status] ([Id], [Title]) VALUES (2, N'Закрыт')
INSERT [dbo].[Status] ([Id], [Title]) VALUES (3, N'Новый')
GO
SET IDENTITY_INSERT [dbo].[Street] ON 

INSERT [dbo].[Street] ([Id], [Title]) VALUES (1, N'ул. 8 Марта')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (2, N'ул. Больничная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (3, N'ул. Весенняя')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (4, N'ул. Вишневая')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (5, N'ул. Вокзальная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (6, N'ул. Гагарина')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (7, N'ул. Гоголя')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (8, N'ул. Дачная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (9, N'ул. Дзержинского')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (10, N'ул. Дорожная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (11, N'ул. Заводская')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (12, N'ул. Западная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (13, N'ул. Зеленая')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (14, N'ул. Клубная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (15, N'ул. Коммунистическая')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (16, N'ул. Комсомольская')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (17, N'ул. Красная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (18, N'ул. Красноармейская')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (19, N'ул. Матросова')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (20, N'ул. Маяковского')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (21, N'ул. Механизаторов')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (22, N'ул. Мичурина')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (23, N'ул. Молодежная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (24, N'ул. Набережная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (25, N'ул. Нагорная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (26, N'ул. Некрасова')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (27, N'ул. Новая')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (28, N'ул. Октябрьская')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (29, N'ул. Парковая')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (30, N'ул. Партизанская')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (31, N'ул. Первомайская')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (32, N'ул. Победы')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (33, N'ул. Подгорная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (34, N'ул. Полевая')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (35, N'ул. Садовая')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (36, N'ул. Свердлова')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (37, N'ул. Светлая')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (38, N'ул. Северная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (39, N'ул. Солнечная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (40, N'ул. Спортивная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (41, N'ул. Степная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (42, N'ул. Фрунзе')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (43, N'ул. Цветочная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (44, N'ул. Чехова')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (45, N'ул. Чкалова')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (46, N'ул. Школьная')
INSERT [dbo].[Street] ([Id], [Title]) VALUES (47, N'ул. Шоссейная')
SET IDENTITY_INSERT [dbo].[Street] OFF
GO
INSERT [dbo].[TypeInput] ([Id], [Title]) VALUES (1, N'Неуспешно')
INSERT [dbo].[TypeInput] ([Id], [Title]) VALUES (2, N'Успешно')
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([idCity])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([IdStreet])
REFERENCES [dbo].[Street] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([idPost])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[HistoryEmployee]  WITH CHECK ADD FOREIGN KEY([idEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[HistoryEmployee]  WITH CHECK ADD FOREIGN KEY([idInput])
REFERENCES [dbo].[TypeInput] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([idClient])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([idStatus])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[ServiceOrder]  WITH CHECK ADD FOREIGN KEY([idService])
REFERENCES [dbo].[Service] ([idService])
GO
ALTER TABLE [dbo].[ServiceOrder]  WITH CHECK ADD FOREIGN KEY([NumberOrder])
REFERENCES [dbo].[Orders] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Laptev_OXTA] SET  READ_WRITE 
GO
