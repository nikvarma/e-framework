USE [master]
GO
/****** Object:  Database [hapy]    Script Date: 1/17/2018 1:46:02 PM ******/
CREATE DATABASE [hapy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hapy', FILENAME = N'E:\SQLServer\MSSQL14.SQLEXPRESS\MSSQL\DATA\hapy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hapy_log', FILENAME = N'E:\SQLServer\MSSQL14.SQLEXPRESS\MSSQL\DATA\hapy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [hapy] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hapy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hapy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hapy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hapy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hapy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hapy] SET ARITHABORT OFF 
GO
ALTER DATABASE [hapy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [hapy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hapy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hapy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hapy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hapy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hapy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hapy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hapy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hapy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [hapy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hapy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hapy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hapy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hapy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hapy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hapy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hapy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hapy] SET  MULTI_USER 
GO
ALTER DATABASE [hapy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hapy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hapy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hapy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hapy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hapy] SET QUERY_STORE = OFF
GO
USE [hapy]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [hapy]
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 1/17/2018 1:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[chid] [uniqueidentifier] NOT NULL,
	[chdbid] [int] NOT NULL,
	[chfrom] [uniqueidentifier] NOT NULL,
	[chto] [uniqueidentifier] NOT NULL,
	[chisgroup] [bit] NOT NULL,
	[chgroupid] [uniqueidentifier] NOT NULL,
	[chreadstatus] [bit] NOT NULL,
	[chreadcount] [int] NOT NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[chid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatsGroup]    Script Date: 1/17/2018 1:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatsGroup](
	[gid] [uniqueidentifier] NOT NULL,
	[gname] [nvarchar](50) NOT NULL,
	[gcreateddate] [date] NOT NULL,
	[gisactive] [bit] NOT NULL,
	[timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ChatsGroup] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citys]    Script Date: 1/17/2018 1:46:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citys](
	[ccid] [int] NOT NULL,
	[ccname] [nvarchar](50) NULL,
	[cccode] [nchar](10) NULL,
	[sid] [int] NOT NULL,
	[ccisactive] [bit] NOT NULL,
 CONSTRAINT [PK_Citys_1] PRIMARY KEY CLUSTERED 
(
	[ccid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countrys]    Script Date: 1/17/2018 1:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countrys](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
	[cisactive] [bit] NOT NULL,
	[cinitialcode] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Countrys] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 1/17/2018 1:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[lid] [int] IDENTITY(1,1) NOT NULL,
	[ccid] [int] NOT NULL,
	[ldbid] [int] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 1/17/2018 1:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[mid] [uniqueidentifier] NOT NULL,
	[mfrom] [uniqueidentifier] NOT NULL,
	[mto] [uniqueidentifier] NOT NULL,
	[mstatus] [bit] NOT NULL,
	[mreadstatus] [bit] NOT NULL,
	[mreadcount] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 1/17/2018 1:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](50) NULL,
	[scode] [nchar](10) NULL,
	[sisactive] [bit] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_Citys] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/17/2018 1:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[uid] [uniqueidentifier] NOT NULL,
	[uname] [nvarchar](50) NOT NULL,
	[ulname] [nvarchar](50) NULL,
	[ufname] [nvarchar](50) NULL,
	[udoj] [date] NOT NULL,
	[uemailid] [nvarchar](50) NULL,
	[uconfignumber] [numeric](18, 0) NOT NULL,
	[uconfigemailid] [nvarchar](50) NOT NULL,
	[createddate] [date] NOT NULL,
	[ip] [numeric](18, 0) NULL,
	[uisactive] [bit] NOT NULL,
	[timestamp] [timestamp] NOT NULL,
	[cid] [int] NOT NULL,
	[uisblocked] [bit] NOT NULL,
	[ureferid] [uniqueidentifier] NULL,
	[ureferby] [nvarchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chats] ADD  CONSTRAINT [DF_Chats_chid]  DEFAULT (newid()) FOR [chid]
GO
ALTER TABLE [dbo].[Chats] ADD  CONSTRAINT [DF_Chats_chisgroup]  DEFAULT ((0)) FOR [chisgroup]
GO
ALTER TABLE [dbo].[Chats] ADD  CONSTRAINT [DF_Chats_chreadstatus]  DEFAULT ((0)) FOR [chreadstatus]
GO
ALTER TABLE [dbo].[Chats] ADD  CONSTRAINT [DF_Chats_chreadcount]  DEFAULT ((0)) FOR [chreadcount]
GO
ALTER TABLE [dbo].[ChatsGroup] ADD  CONSTRAINT [DF_chatsgroup_gcreateddate]  DEFAULT (getdate()) FOR [gcreateddate]
GO
ALTER TABLE [dbo].[ChatsGroup] ADD  CONSTRAINT [DF_chatsgroup_gisactive]  DEFAULT ((0)) FOR [gisactive]
GO
ALTER TABLE [dbo].[Citys] ADD  CONSTRAINT [DF_Citys_ccisactive]  DEFAULT ((0)) FOR [ccisactive]
GO
ALTER TABLE [dbo].[Countrys] ADD  CONSTRAINT [DF_Countrys_cisactive]  DEFAULT ((0)) FOR [cisactive]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_mstatus]  DEFAULT ((0)) FOR [mstatus]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_mreadstatus]  DEFAULT ((0)) FOR [mreadstatus]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_mreadcount]  DEFAULT ((0)) FOR [mreadcount]
GO
ALTER TABLE [dbo].[States] ADD  CONSTRAINT [DF_Citys_sisactive]  DEFAULT ((0)) FOR [sisactive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_uid]  DEFAULT (newid()) FOR [uid]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_udoj]  DEFAULT (getdate()) FOR [udoj]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_createddate]  DEFAULT (getdate()) FOR [createddate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_uisactive]  DEFAULT ((0)) FOR [uisactive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_uisblocked]  DEFAULT ((0)) FOR [uisblocked]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_1_ChatsGroup] FOREIGN KEY([chgroupid])
REFERENCES [dbo].[ChatsGroup] ([gid])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_1_ChatsGroup]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_From_1_Users] FOREIGN KEY([chfrom])
REFERENCES [dbo].[Users] ([uid])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_From_1_Users]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_To_1_Users] FOREIGN KEY([chto])
REFERENCES [dbo].[Users] ([uid])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_To_1_Users]
GO
ALTER TABLE [dbo].[Citys]  WITH CHECK ADD  CONSTRAINT [FK_Citys_1_States] FOREIGN KEY([sid])
REFERENCES [dbo].[States] ([sid])
GO
ALTER TABLE [dbo].[Citys] CHECK CONSTRAINT [FK_Citys_1_States]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_1_Citys] FOREIGN KEY([ccid])
REFERENCES [dbo].[Citys] ([ccid])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_1_Citys]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_message_1_Users] FOREIGN KEY([mfrom])
REFERENCES [dbo].[Users] ([uid])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_message_1_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_message_1_Users1] FOREIGN KEY([mto])
REFERENCES [dbo].[Users] ([uid])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_message_1_Users1]
GO
ALTER TABLE [dbo].[States]  WITH CHECK ADD  CONSTRAINT [FK_States_2_Countrys] FOREIGN KEY([cid])
REFERENCES [dbo].[Countrys] ([cid])
GO
ALTER TABLE [dbo].[States] CHECK CONSTRAINT [FK_States_2_Countrys]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_1_Countrys] FOREIGN KEY([cid])
REFERENCES [dbo].[Countrys] ([cid])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_1_Countrys]
GO
USE [master]
GO
ALTER DATABASE [hapy] SET  READ_WRITE 
GO
