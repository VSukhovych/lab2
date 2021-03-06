USE [master]
GO
/****** Object:  Database [transportation]    Script Date: 10/31/2018 4:37:01 PM ******/
CREATE DATABASE [transportation] ON  PRIMARY 
( NAME = N'transportation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\transportation.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'transportation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\transportation_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [transportation] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [transportation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [transportation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [transportation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [transportation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [transportation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [transportation] SET ARITHABORT OFF 
GO
ALTER DATABASE [transportation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [transportation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [transportation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [transportation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [transportation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [transportation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [transportation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [transportation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [transportation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [transportation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [transportation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [transportation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [transportation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [transportation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [transportation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [transportation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [transportation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [transportation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [transportation] SET  MULTI_USER 
GO
ALTER DATABASE [transportation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [transportation] SET DB_CHAINING OFF 
GO
USE [transportation]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 10/31/2018 4:37:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companies](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[employees_number] [int] NULL,
 CONSTRAINT [PK_companies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transits]    Script Date: 10/31/2018 4:37:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transits](
	[id] [int] NOT NULL,
	[goods] [varchar](50) NULL,
	[weight] [float] NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_transits] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transport]    Script Date: 10/31/2018 4:37:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transport](
	[id] [int] NOT NULL,
	[model] [varchar](50) NULL,
	[company_id] [int] NULL,
	[transit_id] [int] NULL,
 CONSTRAINT [PK_transport] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[transport]  WITH CHECK ADD  CONSTRAINT [FK_transport_companies] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[transport] CHECK CONSTRAINT [FK_transport_companies]
GO
ALTER TABLE [dbo].[transport]  WITH CHECK ADD  CONSTRAINT [FK_transport_transits] FOREIGN KEY([transit_id])
REFERENCES [dbo].[transits] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[transport] CHECK CONSTRAINT [FK_transport_transits]
GO
USE [master]
GO
ALTER DATABASE [transportation] SET  READ_WRITE 
GO
