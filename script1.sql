USE [master]
GO
/****** Object:  Database [AracKiralamaSistemi]    Script Date: 30.07.2018 15:46:47 ******/
CREATE DATABASE [AracKiralamaSistemi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AracKiralamaSistemi', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AracKiralamaSistemi.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AracKiralamaSistemi_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AracKiralamaSistemi_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AracKiralamaSistemi] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AracKiralamaSistemi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AracKiralamaSistemi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET ARITHABORT OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AracKiralamaSistemi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AracKiralamaSistemi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AracKiralamaSistemi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AracKiralamaSistemi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AracKiralamaSistemi] SET  MULTI_USER 
GO
ALTER DATABASE [AracKiralamaSistemi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AracKiralamaSistemi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AracKiralamaSistemi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AracKiralamaSistemi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [AracKiralamaSistemi]
GO
/****** Object:  Table [dbo].[Arac]    Script Date: 30.07.2018 15:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arac](
	[sasiNo] [nvarchar](50) NOT NULL,
	[marka] [nvarchar](50) NOT NULL,
	[model] [nvarchar](50) NOT NULL,
	[modelYili] [int] NOT NULL,
	[plaka] [nvarchar](50) NOT NULL,
	[renk] [nvarchar](50) NOT NULL,
	[tip] [nvarchar](50) NOT NULL,
	[gunlukUcret] [money] NOT NULL,
 CONSTRAINT [PK_Arac] PRIMARY KEY CLUSTERED 
(
	[sasiNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 30.07.2018 15:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[kullaniciAdi] [nvarchar](50) NOT NULL,
	[sifre] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 30.07.2018 15:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[TCKN] [int] NOT NULL,
	[musteriAdi] [nvarchar](50) NOT NULL,
	[unvan] [nvarchar](50) NULL,
	[cinsiyet] [nvarchar](50) NULL,
	[dogumTarihi] [date] NULL,
	[vergiNo] [int] NULL,
	[vergiDairesi] [nvarchar](50) NULL,
	[adres] [nvarchar](50) NULL,
	[telefon] [int] NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[TCKN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AracEkle]    Script Date: 30.07.2018 15:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AracEkle]
(
@marka nvarchar (50),
@model nvarchar(50),
@modelyili int,
@plaka nvarchar(50),
@sasino nvarchar(50),
@renk nvarchar(50),
@tip nvarchar(50),
@gunlukucret money
)
AS
BEGIN
	
	SET NOCOUNT ON;
    insert into[dbo].[Arac](marka,model,modelYili,plaka,sasiNo,renk,tip,gunlukUcret)
	values(
	@marka,
	@model,
	@modelyili,
	@plaka,
	@sasino,
	@renk,
	@tip,
	@gunlukucret
	);
END
GO
/****** Object:  StoredProcedure [dbo].[KullaniciKontrol]    Script Date: 30.07.2018 15:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[KullaniciKontrol] @kullaniciAdi varchar(50)='',@sifre varchar(50)=''
as
begin
if exists(select * from [dbo].[Kullanici]where kullaniciAdi=@kullaniciAdi and sifre=@sifre)
begin
select * from [dbo].[Kullanici] where kullaniciAdi=@kullaniciAdi;
end
end
GO
/****** Object:  StoredProcedure [dbo].[KullaniciKontroll]    Script Date: 30.07.2018 15:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[KullaniciKontroll] @kullaniciAdi varchar(50)='',@sifre varchar(50)=''
as
begin
if exists(select * from [dbo].[Kullanici]where kullaniciAdi=@kullaniciAdi and sifre=@sifre)
begin
select * from [dbo].[Kullanici] where kullaniciAdi=@kullaniciAdi;
end
end
GO
/****** Object:  StoredProcedure [dbo].[MusteriEkle]    Script Date: 30.07.2018 15:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MusteriEkle] (
	@name nvarchar(50),
	@tc int,
	@unvan nvarchar(50),
	@cinsiyet nvarchar(50),
	@dogumtarihi date,
	@vergino int,
	@vergidairesi nvarchar(50),
	@adres nvarchar(50),
	@telefon int
	
	)
AS
BEGIN

	SET NOCOUNT ON;
	insert into [dbo].[Musteri](musteriAdi,TCKN,unvan,cinsiyet,dogumTarihi,vergiNo,vergiDairesi,adres,telefon) values (@name,@tc,@unvan,
	@cinsiyet,
	@dogumtarihi,
	@vergino,
	@vergidairesi,
	@adres,
	@telefon
	);

END
GO
USE [master]
GO
ALTER DATABASE [AracKiralamaSistemi] SET  READ_WRITE 
GO
