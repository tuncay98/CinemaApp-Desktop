/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [CinemaApp]    Script Date: 6/8/2018 9:23:07 PM ******/
CREATE DATABASE [CinemaApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CinemaApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SERVER2018\MSSQL\DATA\CinemaApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CinemaApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SERVER2018\MSSQL\DATA\CinemaApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CinemaApp] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CinemaApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CinemaApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CinemaApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CinemaApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CinemaApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CinemaApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [CinemaApp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CinemaApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CinemaApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CinemaApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CinemaApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CinemaApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CinemaApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CinemaApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CinemaApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CinemaApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CinemaApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CinemaApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CinemaApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CinemaApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CinemaApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CinemaApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CinemaApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CinemaApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CinemaApp] SET  MULTI_USER 
GO
ALTER DATABASE [CinemaApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CinemaApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CinemaApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CinemaApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CinemaApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CinemaApp] SET QUERY_STORE = OFF
GO
USE [CinemaApp]
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
USE [CinemaApp]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 6/8/2018 9:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountriesFilms]    Script Date: 6/8/2018 9:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountriesFilms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NULL,
	[FilmId] [int] NULL,
 CONSTRAINT [PK_CountriesFilms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Films]    Script Date: 6/8/2018 9:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Films](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Duration] [int] NULL,
	[Year] [int] NULL,
	[About] [ntext] NULL,
 CONSTRAINT [PK_Films] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmsGenres]    Script Date: 6/8/2018 9:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmsGenres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilmId] [int] NULL,
	[GenreId] [int] NULL,
 CONSTRAINT [PK_FilmsGenres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 6/8/2018 9:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Halls]    Script Date: 6/8/2018 9:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Halls](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Halls] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/8/2018 9:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PosterId] [int] NULL,
	[Date] [date] NULL,
	[ActionDate] [datetime] NULL,
	[Price] [money] NULL,
	[SeatId] [int] NULL,
	[Column] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posters]    Script Date: 6/8/2018 9:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilmId] [int] NULL,
	[HallId] [int] NULL,
	[Price] [money] NULL,
	[Time] [time](7) NULL,
	[PrimaryDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_Posters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 6/8/2018 9:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HallId] [int] NULL,
	[Row] [nvarchar](10) NULL,
	[Columns] [int] NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name]) VALUES (1, N'Azerbaijan')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (2, N'USA')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (3, N'UK')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (4, N'India')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (5, N'Germany')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[CountriesFilms] ON 

INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (1, 1, 1)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (2, 2, 1)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (3, 2, 2)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (4, 3, 2)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (5, 3, 3)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (6, 4, 3)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (7, 4, 4)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (8, 5, 4)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (9, 2, 5)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (10, 4, 5)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (11, 1, 6)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (12, 3, 6)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (13, 5, 7)
INSERT [dbo].[CountriesFilms] ([Id], [CountryId], [FilmId]) VALUES (14, 4, 7)
SET IDENTITY_INSERT [dbo].[CountriesFilms] OFF
SET IDENTITY_INSERT [dbo].[Films] ON 

INSERT [dbo].[Films] ([Id], [Name], [Duration], [Year], [About]) VALUES (1, N'Avatar', 150, 2010, N'Good')
INSERT [dbo].[Films] ([Id], [Name], [Duration], [Year], [About]) VALUES (2, N'Avengers 4 ', 202, 2018, N'Impressive')
INSERT [dbo].[Films] ([Id], [Name], [Duration], [Year], [About]) VALUES (3, N'Molla and his sins', 180, 2015, N'Not bad')
INSERT [dbo].[Films] ([Id], [Name], [Duration], [Year], [About]) VALUES (4, N'Fight Club', 190, 2001, N'BadAss')
INSERT [dbo].[Films] ([Id], [Name], [Duration], [Year], [About]) VALUES (5, N'Assasin''s Creed', 150, 2017, N'Good')
INSERT [dbo].[Films] ([Id], [Name], [Duration], [Year], [About]) VALUES (6, N'Interstallar', 200, 2014, N'One of the best')
INSERT [dbo].[Films] ([Id], [Name], [Duration], [Year], [About]) VALUES (7, N'Mars', 190, 2016, N'Good')
SET IDENTITY_INSERT [dbo].[Films] OFF
SET IDENTITY_INSERT [dbo].[FilmsGenres] ON 

INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (1, 1, 1)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (2, 1, 2)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (3, 2, 2)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (4, 2, 3)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (5, 3, 3)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (6, 3, 4)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (7, 4, 1)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (8, 4, 5)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (9, 5, 2)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (10, 5, 3)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (11, 6, 5)
INSERT [dbo].[FilmsGenres] ([Id], [FilmId], [GenreId]) VALUES (12, 7, 1)
SET IDENTITY_INSERT [dbo].[FilmsGenres] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [Name]) VALUES (1, N'Action')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (2, N'Horror')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (3, N'Sci-Fi')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (4, N'Dram')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (5, N'Comedy')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[Halls] ON 

INSERT [dbo].[Halls] ([Id], [Name]) VALUES (1, N'A1')
INSERT [dbo].[Halls] ([Id], [Name]) VALUES (2, N'A2')
INSERT [dbo].[Halls] ([Id], [Name]) VALUES (3, N'B1')
INSERT [dbo].[Halls] ([Id], [Name]) VALUES (4, N'B2')
INSERT [dbo].[Halls] ([Id], [Name]) VALUES (5, N'C1')
INSERT [dbo].[Halls] ([Id], [Name]) VALUES (6, N'C2')
SET IDENTITY_INSERT [dbo].[Halls] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (1, 1, CAST(N'2018-06-15' AS Date), CAST(N'2018-06-03T00:00:00.000' AS DateTime), 10.0000, 1, 5)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (2, 2, CAST(N'2018-06-14' AS Date), CAST(N'2018-06-05T00:00:00.000' AS DateTime), 12.0000, 2, 6)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (3, 3, CAST(N'2018-06-13' AS Date), CAST(N'2018-06-10T00:00:00.000' AS DateTime), 10.0000, 3, 4)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (4, 1, CAST(N'2018-06-15' AS Date), CAST(N'2018-06-04T00:00:00.000' AS DateTime), 10.0000, 1, 6)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (5, 1, CAST(N'2018-06-07' AS Date), CAST(N'2018-06-07T20:50:56.400' AS DateTime), 10.0000, 3, 4)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (6, 1, CAST(N'2018-06-07' AS Date), CAST(N'2018-06-07T20:50:56.410' AS DateTime), 10.0000, 2, 5)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (7, 1, CAST(N'2018-06-07' AS Date), CAST(N'2018-06-07T20:58:03.270' AS DateTime), 10.0000, 3, 10)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (9, 2, CAST(N'2018-06-07' AS Date), CAST(N'2018-06-07T20:59:43.167' AS DateTime), 12.0000, 16, 6)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (10, 2, CAST(N'2018-06-07' AS Date), CAST(N'2018-06-07T20:59:43.180' AS DateTime), 12.0000, 16, 7)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (15, 2, CAST(N'2018-06-07' AS Date), CAST(N'2018-06-07T20:59:51.000' AS DateTime), 12.0000, 15, 9)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (20, 8, CAST(N'2018-06-07' AS Date), CAST(N'2018-06-07T21:24:25.113' AS DateTime), 10.0000, 12, 7)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (29, 6, CAST(N'2018-06-08' AS Date), CAST(N'2018-06-08T14:57:04.127' AS DateTime), 10.0000, 6, 8)
INSERT [dbo].[Orders] ([Id], [PosterId], [Date], [ActionDate], [Price], [SeatId], [Column]) VALUES (36, 1, CAST(N'2018-06-08' AS Date), CAST(N'2018-06-08T17:23:56.827' AS DateTime), 10.0000, 3, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Posters] ON 

INSERT [dbo].[Posters] ([Id], [FilmId], [HallId], [Price], [Time], [PrimaryDate], [EndDate]) VALUES (1, 1, 1, 10.0000, CAST(N'15:00:00' AS Time), CAST(N'2018-06-02' AS Date), CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Posters] ([Id], [FilmId], [HallId], [Price], [Time], [PrimaryDate], [EndDate]) VALUES (2, 2, 6, 12.0000, CAST(N'16:30:00' AS Time), CAST(N'2018-05-15' AS Date), CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Posters] ([Id], [FilmId], [HallId], [Price], [Time], [PrimaryDate], [EndDate]) VALUES (3, 3, 2, 10.0000, CAST(N'12:00:00' AS Time), CAST(N'2018-05-20' AS Date), CAST(N'2018-07-05' AS Date))
INSERT [dbo].[Posters] ([Id], [FilmId], [HallId], [Price], [Time], [PrimaryDate], [EndDate]) VALUES (4, 4, 3, 15.0000, CAST(N'13:00:00' AS Time), CAST(N'2018-06-02' AS Date), CAST(N'2018-09-01' AS Date))
INSERT [dbo].[Posters] ([Id], [FilmId], [HallId], [Price], [Time], [PrimaryDate], [EndDate]) VALUES (5, 5, 4, 9.0000, CAST(N'10:00:00' AS Time), CAST(N'2018-05-01' AS Date), CAST(N'2018-08-16' AS Date))
INSERT [dbo].[Posters] ([Id], [FilmId], [HallId], [Price], [Time], [PrimaryDate], [EndDate]) VALUES (6, 6, 2, 10.0000, CAST(N'19:00:00' AS Time), CAST(N'2018-05-29' AS Date), CAST(N'2018-07-15' AS Date))
INSERT [dbo].[Posters] ([Id], [FilmId], [HallId], [Price], [Time], [PrimaryDate], [EndDate]) VALUES (7, 7, 5, 18.0000, CAST(N'15:00:00' AS Time), CAST(N'2018-05-19' AS Date), CAST(N'2018-06-29' AS Date))
INSERT [dbo].[Posters] ([Id], [FilmId], [HallId], [Price], [Time], [PrimaryDate], [EndDate]) VALUES (8, 2, 4, 10.0000, CAST(N'12:00:00' AS Time), CAST(N'2018-05-15' AS Date), CAST(N'2018-07-10' AS Date))
SET IDENTITY_INSERT [dbo].[Posters] OFF
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (1, 1, N'A', 10)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (2, 1, N'B', 15)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (3, 1, N'C', 15)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (4, 2, N'A', 10)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (5, 2, N'B', 15)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (6, 2, N'C', 15)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (7, 3, N'A', 10)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (8, 3, N'B', 15)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (9, 3, N'C', 15)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (10, 4, N'A', 10)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (11, 4, N'B', 15)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (12, 4, N'C', 15)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (13, 5, N'A', 10)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (14, 5, N'B', 10)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (15, 6, N'A', 10)
INSERT [dbo].[Seats] ([Id], [HallId], [Row], [Columns]) VALUES (16, 6, N'B', 10)
SET IDENTITY_INSERT [dbo].[Seats] OFF
ALTER TABLE [dbo].[CountriesFilms]  WITH CHECK ADD  CONSTRAINT [FK_CountriesFilms_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[CountriesFilms] CHECK CONSTRAINT [FK_CountriesFilms_Countries]
GO
ALTER TABLE [dbo].[CountriesFilms]  WITH CHECK ADD  CONSTRAINT [FK_CountriesFilms_Films] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Films] ([Id])
GO
ALTER TABLE [dbo].[CountriesFilms] CHECK CONSTRAINT [FK_CountriesFilms_Films]
GO
ALTER TABLE [dbo].[FilmsGenres]  WITH CHECK ADD  CONSTRAINT [FK_FilmsGenres_Films] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Films] ([Id])
GO
ALTER TABLE [dbo].[FilmsGenres] CHECK CONSTRAINT [FK_FilmsGenres_Films]
GO
ALTER TABLE [dbo].[FilmsGenres]  WITH CHECK ADD  CONSTRAINT [FK_FilmsGenres_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[FilmsGenres] CHECK CONSTRAINT [FK_FilmsGenres_Genres]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Posters] FOREIGN KEY([PosterId])
REFERENCES [dbo].[Posters] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Posters]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Seats] FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seats] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Seats]
GO
ALTER TABLE [dbo].[Posters]  WITH CHECK ADD  CONSTRAINT [FK_Posters_Films] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Films] ([Id])
GO
ALTER TABLE [dbo].[Posters] CHECK CONSTRAINT [FK_Posters_Films]
GO
ALTER TABLE [dbo].[Posters]  WITH CHECK ADD  CONSTRAINT [FK_Posters_Halls] FOREIGN KEY([HallId])
REFERENCES [dbo].[Halls] ([Id])
GO
ALTER TABLE [dbo].[Posters] CHECK CONSTRAINT [FK_Posters_Halls]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Halls] FOREIGN KEY([HallId])
REFERENCES [dbo].[Halls] ([Id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_Halls]
GO
USE [master]
GO
ALTER DATABASE [CinemaApp] SET  READ_WRITE 
GO
