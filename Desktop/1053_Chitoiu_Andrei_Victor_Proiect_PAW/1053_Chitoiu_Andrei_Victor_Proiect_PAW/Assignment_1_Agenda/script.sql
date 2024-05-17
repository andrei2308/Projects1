USE [master]
GO
/****** Object:  Database [data]    Script Date: 5/16/2024 8:12:20 PM ******/
CREATE DATABASE [data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\data.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'data_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\data_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [data] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [data] SET ARITHABORT OFF 
GO
ALTER DATABASE [data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [data] SET  DISABLE_BROKER 
GO
ALTER DATABASE [data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [data] SET RECOVERY FULL 
GO
ALTER DATABASE [data] SET  MULTI_USER 
GO
ALTER DATABASE [data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [data] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [data] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'data', N'ON'
GO
ALTER DATABASE [data] SET QUERY_STORE = ON
GO
ALTER DATABASE [data] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [data]
GO
/****** Object:  Table [dbo].[Activitati]    Script Date: 5/16/2024 8:12:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activitati](
	[IdActivitate] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Denumire] [nvarchar](100) NOT NULL,
	[TimpStart] [datetime] NOT NULL,
	[TimpFinish] [datetime] NOT NULL,
	[NecesitaProiect] [bit] NULL,
	[DomeniuId] [int] NULL,
	[ProiectId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdActivitate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Domenii]    Script Date: 5/16/2024 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domenii](
	[IdDomeniu] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[DenumireDomeniu] [nvarchar](100) NOT NULL,
	[NecesitaResursa] [bit] NULL,
	[Resursa] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDomeniu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proiecte]    Script Date: 5/16/2024 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proiecte](
	[idProiect] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Denumire] [nvarchar](100) NOT NULL,
	[Coord] [nvarchar](100) NOT NULL,
	[DeadLine] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProiect] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/16/2024 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activitati]  WITH CHECK ADD FOREIGN KEY([DomeniuId])
REFERENCES [dbo].[Domenii] ([IdDomeniu])
GO
ALTER TABLE [dbo].[Activitati]  WITH CHECK ADD FOREIGN KEY([ProiectId])
REFERENCES [dbo].[Proiecte] ([idProiect])
GO
ALTER TABLE [dbo].[Activitati]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Domenii]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Proiecte]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
USE [master]
GO
ALTER DATABASE [data] SET  READ_WRITE 
GO
