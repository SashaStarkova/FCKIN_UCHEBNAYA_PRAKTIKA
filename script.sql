USE [master]
GO
/****** Object:  Database [Sasha]    Script Date: 13.05.2022 16:10:59 ******/
CREATE DATABASE [Sasha]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sasha', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLWSR\MSSQL\DATA\Sasha.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sasha_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLWSR\MSSQL\DATA\Sasha_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Sasha] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sasha].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sasha] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sasha] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sasha] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sasha] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sasha] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sasha] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sasha] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sasha] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sasha] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sasha] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sasha] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sasha] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sasha] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sasha] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sasha] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sasha] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sasha] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sasha] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sasha] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sasha] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sasha] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sasha] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sasha] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sasha] SET  MULTI_USER 
GO
ALTER DATABASE [Sasha] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sasha] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sasha] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sasha] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sasha] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sasha] SET QUERY_STORE = OFF
GO
USE [Sasha]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish](
	[Name] [varchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_DISH] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DishCompound]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DishCompound](
	[DishName] [varchar](100) NOT NULL,
	[IngName] [varchar](60) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Unit] [varchar](12) NOT NULL,
 CONSTRAINT [PK_DISHCOMPOUND] PRIMARY KEY CLUSTERED 
(
	[DishName] ASC,
	[IngName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DishSet]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DishSet](
	[Name] [varchar](255) NOT NULL,
	[Dish] [varchar](100) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_DishSet] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Dish] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DishStatus]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DishStatus](
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DISHSTATUS] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Login] [varchar](50) NOT NULL,
	[RoleNumber] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpStatus]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpStatus](
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_EmpStatus] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[Name] [varchar](60) NOT NULL,
	[Calories] [int] NOT NULL,
 CONSTRAINT [PK_INGREDIENT] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MobileOrder]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobileOrder](
	[NumberOrder] [int] NOT NULL,
	[UserID] [varchar](11) NOT NULL,
	[Address] [int] NOT NULL,
 CONSTRAINT [PK_MOBILEORDER] PRIMARY KEY CLUSTERED 
(
	[NumberOrder] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[NumberOrder] [int] NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED 
(
	[NumberOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderCompound]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCompound](
	[OrderNumber] [int] NOT NULL,
	[Dish] [varchar](100) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_OrderCompound] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC,
	[Dish] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleNumber] [int] NOT NULL,
	[RoleName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Set]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Set](
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Set] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timestamp]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timestamp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Timestamp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Name] [varchar](12) NOT NULL,
 CONSTRAINT [PK_UNIT] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 13.05.2022 16:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[TelephonNum] [varchar](12) NOT NULL,
	[Password] [varchar](10) NOT NULL,
	[UserID] [varchar](11) NOT NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Бургер КАМчикен', 99.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Бургер с гов-ной', 119.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Воппер XXL', 368.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Картофель по-деревенски', 99.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Кока-Кола 400 мл.', 69.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Кока-Кола 500 мл.', 79.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Корзина курицы 6 ножек', 249.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Молочный кок...тейль с клубникой 250 мл.', 59.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Молочный кок...тейль с клубникой 400 мл.', 99.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Молочный кок...тейль с шоколадом 250 мл.', 59.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Молочный кок...тейль с шоколадом 400 мл.', 99.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Мороженое с карамельным допингом', 89.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Мороженое с шоколадным допингом', 79.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Песпи 400 мл.', 69.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Песпи 500 мл.', 79.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Свободный картофель большой', 69.0000)
INSERT [dbo].[Dish] ([Name], [Cost]) VALUES (N'Свободный картофель маленький', 49.0000)
GO
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер КАМчикен', N'Булочка для бургера', 1, N'шт.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер КАМчикен', N'Кетчуп', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер КАМчикен', N'Котлета куриная', 80, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер КАМчикен', N'Лук', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер КАМчикен', N'Майонез', 15, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер КАМчикен', N'Салат', 10, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер КАМчикен', N'Сыр', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер с гов-ной', N'Бекон', 15, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер с гов-ной', N'Булочка для бургера', 1, N'шт.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер с гов-ной', N'Кетчуп', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер с гов-ной', N'Котлета говяжья', 100, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер с гов-ной', N'Лук', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер с гов-ной', N'Майонез', 15, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер с гов-ной', N'Салат', 10, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер с гов-ной', N'Соленый огурец', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Бургер с гов-ной', N'Сыр', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Воппер XXL', N'Бекон', 50, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Воппер XXL', N'Булочка для бургера', 1, N'шт.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Воппер XXL', N'Кетчуп', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Воппер XXL', N'Лук', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Воппер XXL', N'Майонез', 60, N'мл.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Воппер XXL', N'Салат', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Воппер XXL', N'Соленый огурец', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Воппер XXL', N'Сыр', 80, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Картофель по-деревенски', N'Картофель', 150, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Кока-Кола 400 мл.', N'Кола', 400, N'мл.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Кока-Кола 500 мл.', N'Кола', 400, N'мл.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Корзина курицы 6 ножек', N'Куриные ножки', 6, N'шт.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Корзина курицы 6 ножек', N'Панировка', 30, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с клубникой 250 мл.', N'Молоко', 150, N'мл.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с клубникой 250 мл.', N'Мороженое', 60, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с клубникой 250 мл.', N'Топпинг клубничный', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с клубникой 400 мл.', N'Молоко', 280, N'мл.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с клубникой 400 мл.', N'Мороженое', 90, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с клубникой 400 мл.', N'Топпинг клубничный', 30, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с шоколадом 250 мл.', N'Молоко', 150, N'мл.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с шоколадом 250 мл.', N'Мороженое', 60, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с шоколадом 250 мл.', N'Топпинг шоколадный', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с шоколадом 400 мл.', N'Молоко', 280, N'мл.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с шоколадом 400 мл.', N'Мороженое', 90, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Молочный кок...тейль с шоколадом 400 мл.', N'Топпинг шоколадный', 30, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Мороженое с карамельным допингом', N'Мороженое', 100, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Мороженое с карамельным допингом', N'Топпинг карамельный', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Мороженое с шоколадным допингом', N'Мороженое', 100, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Мороженое с шоколадным допингом', N'Топпинг шоколадный', 20, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Песпи 400 мл.', N'Пепси', 400, N'мл.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Песпи 500 мл.', N'Пепси', 500, N'мл.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Свободный картофель большой', N'Картофель', 120, N'г.')
INSERT [dbo].[DishCompound] ([DishName], [IngName], [Quantity], [Unit]) VALUES (N'Свободный картофель маленький', N'Картофель', 90, N'г.')
GO
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Гов-на', N'Бургер с гов-ной', 1)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Гов-на', N'Кока-Кола 400 мл.', 1)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Гов-на', N'Мороженое с шоколадным допингом', 1)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Гов-на', N'Свободный картофель большой', 1)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Для друзей', N'Бургер КАМчикен', 2)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Для друзей', N'Кока-Кола 400 мл.', 2)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Для друзей', N'Корзина курицы 6 ножек', 1)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Для друзей', N'Свободный картофель маленький', 2)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Соскамом', N'Бургер КАМчикен', 1)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Соскамом', N'Мороженое с карамельным допингом', 1)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Соскамом', N'Песпи 400 мл.', 1)
INSERT [dbo].[DishSet] ([Name], [Dish], [Count]) VALUES (N'Соскамом', N'Свободный картофель большой', 1)
GO
INSERT [dbo].[DishStatus] ([Status]) VALUES (N'В очереди')
INSERT [dbo].[DishStatus] ([Status]) VALUES (N'Готовится')
INSERT [dbo].[DishStatus] ([Status]) VALUES (N'Готово к отдаче')
INSERT [dbo].[DishStatus] ([Status]) VALUES (N'Отдано')
GO
INSERT [dbo].[Employees] ([Login], [RoleNumber], [Name], [Password], [Status]) VALUES (N'1', 1, N'Администратор', N'1', N'Раб.')
INSERT [dbo].[Employees] ([Login], [RoleNumber], [Name], [Password], [Status]) VALUES (N'2', 2, N'Добби', N'2', N'Свободен')
INSERT [dbo].[Employees] ([Login], [RoleNumber], [Name], [Password], [Status]) VALUES (N'3', 3, N'Повар', N'аа', N'Раб.')
GO
INSERT [dbo].[EmpStatus] ([Status]) VALUES (N'Раб.')
INSERT [dbo].[EmpStatus] ([Status]) VALUES (N'Свободен')
GO
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Бекон', 393)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Булочка для бургера', 100)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Картофель', 158)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Кетчуп', 80)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Кола', 40)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Котлета говяжья', 230)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Котлета куриная', 222)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Красный перец', 26)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Куриные ножки', 161)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Лук', 41)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Майонез', 627)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Молоко', 58)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Мороженое', 216)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Панировка', 288)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Пепси', 38)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Салат', 15)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Соленый огурец', 20)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Сыр', 334)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Топпинг карамельный', 323)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Топпинг клубничный', 250)
INSERT [dbo].[Ingredient] ([Name], [Calories]) VALUES (N'Топпинг шоколадный', 268)
GO
INSERT [dbo].[Roles] ([RoleNumber], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([RoleNumber], [RoleName]) VALUES (2, N'Повар')
INSERT [dbo].[Roles] ([RoleNumber], [RoleName]) VALUES (3, N'Кассир')
GO
INSERT [dbo].[Set] ([Name]) VALUES (N'Гов-на')
INSERT [dbo].[Set] ([Name]) VALUES (N'Для друзей')
INSERT [dbo].[Set] ([Name]) VALUES (N'Соскамом')
GO
SET IDENTITY_INSERT [dbo].[Timestamp] ON 

INSERT [dbo].[Timestamp] ([ID], [Time]) VALUES (1, CAST(N'2022-05-06T09:53:24.503' AS DateTime))
SET IDENTITY_INSERT [dbo].[Timestamp] OFF
GO
INSERT [dbo].[Unit] ([Name]) VALUES (N'г.')
INSERT [dbo].[Unit] ([Name]) VALUES (N'мл.')
INSERT [dbo].[Unit] ([Name]) VALUES (N'шт.')
GO
ALTER TABLE [dbo].[DishCompound]  WITH CHECK ADD  CONSTRAINT [FK_DishCompound_Dish] FOREIGN KEY([DishName])
REFERENCES [dbo].[Dish] ([Name])
GO
ALTER TABLE [dbo].[DishCompound] CHECK CONSTRAINT [FK_DishCompound_Dish]
GO
ALTER TABLE [dbo].[DishCompound]  WITH CHECK ADD  CONSTRAINT [FK_DishCompound_Ingredient] FOREIGN KEY([IngName])
REFERENCES [dbo].[Ingredient] ([Name])
GO
ALTER TABLE [dbo].[DishCompound] CHECK CONSTRAINT [FK_DishCompound_Ingredient]
GO
ALTER TABLE [dbo].[DishCompound]  WITH CHECK ADD  CONSTRAINT [FK_DishCompound_Unit] FOREIGN KEY([Unit])
REFERENCES [dbo].[Unit] ([Name])
GO
ALTER TABLE [dbo].[DishCompound] CHECK CONSTRAINT [FK_DishCompound_Unit]
GO
ALTER TABLE [dbo].[DishSet]  WITH CHECK ADD  CONSTRAINT [FK_DishSet_Dish] FOREIGN KEY([Dish])
REFERENCES [dbo].[Dish] ([Name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DishSet] CHECK CONSTRAINT [FK_DishSet_Dish]
GO
ALTER TABLE [dbo].[DishSet]  WITH CHECK ADD  CONSTRAINT [FK_DishSet_Set] FOREIGN KEY([Name])
REFERENCES [dbo].[Set] ([Name])
GO
ALTER TABLE [dbo].[DishSet] CHECK CONSTRAINT [FK_DishSet_Set]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_EmpStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[EmpStatus] ([Status])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_EmpStatus]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Roles] FOREIGN KEY([RoleNumber])
REFERENCES [dbo].[Roles] ([RoleNumber])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Roles]
GO
ALTER TABLE [dbo].[MobileOrder]  WITH CHECK ADD  CONSTRAINT [MobileOrder_fk0] FOREIGN KEY([NumberOrder])
REFERENCES [dbo].[Order] ([NumberOrder])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MobileOrder] CHECK CONSTRAINT [MobileOrder_fk0]
GO
ALTER TABLE [dbo].[MobileOrder]  WITH CHECK ADD  CONSTRAINT [MobileOrder_fk1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MobileOrder] CHECK CONSTRAINT [MobileOrder_fk1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_fk0] FOREIGN KEY([Status])
REFERENCES [dbo].[DishStatus] ([Status])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_fk0]
GO
ALTER TABLE [dbo].[OrderCompound]  WITH CHECK ADD  CONSTRAINT [FK_OrderCompound_Dish] FOREIGN KEY([Dish])
REFERENCES [dbo].[Dish] ([Name])
GO
ALTER TABLE [dbo].[OrderCompound] CHECK CONSTRAINT [FK_OrderCompound_Dish]
GO
ALTER TABLE [dbo].[OrderCompound]  WITH CHECK ADD  CONSTRAINT [FK_OrderCompound_Order] FOREIGN KEY([OrderNumber])
REFERENCES [dbo].[Order] ([NumberOrder])
GO
ALTER TABLE [dbo].[OrderCompound] CHECK CONSTRAINT [FK_OrderCompound_Order]
GO
USE [master]
GO
ALTER DATABASE [Sasha] SET  READ_WRITE 
GO
