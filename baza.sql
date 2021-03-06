USE [master]
GO
/****** Object:  Database [news_blog]    Script Date: 19-Jun-21 4:33:07 PM ******/
CREATE DATABASE [news_blog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'news_blog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\news_blog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'news_blog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\news_blog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [news_blog] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [news_blog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [news_blog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [news_blog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [news_blog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [news_blog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [news_blog] SET ARITHABORT OFF 
GO
ALTER DATABASE [news_blog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [news_blog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [news_blog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [news_blog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [news_blog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [news_blog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [news_blog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [news_blog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [news_blog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [news_blog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [news_blog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [news_blog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [news_blog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [news_blog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [news_blog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [news_blog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [news_blog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [news_blog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [news_blog] SET  MULTI_USER 
GO
ALTER DATABASE [news_blog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [news_blog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [news_blog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [news_blog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [news_blog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [news_blog] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [news_blog] SET QUERY_STORE = OFF
GO
USE [news_blog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19-Jun-21 4:33:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 19-Jun-21 4:33:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 19-Jun-21 4:33:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](255) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostRatings]    Script Date: 19-Jun-21 4:33:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostRatings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_PostRatings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 19-Jun-21 4:33:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[MainImg] [varchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 19-Jun-21 4:33:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[PostId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_PostTags] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 19-Jun-21 4:33:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 19-Jun-21 4:33:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19-Jun-21 4:33:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](255) NOT NULL,
	[Username] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 19-Jun-21 4:33:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210531122005_initial_setup', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210610051653_added_is_admin_to_users', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210610092812_changed_mainImg_column_type', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210610094630_removed_roles_table', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210611082826_added_parent_comment_to_comments', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210611095606_changed_parentId_to_allow_null', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210612064823_added_tag_and_postTags_tables', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210612131232_removed_reading_lists_table', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210619143028_changed_content_to_varchar_on_postsTable', N'5.0.7')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1, N'IT', 1, CAST(N'2021-06-10T06:20:06.5337660' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (2, N'Sport', 1, CAST(N'2021-06-10T06:20:06.5340967' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (3, N'Cooking', 1, CAST(N'2021-06-10T06:20:06.5340980' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (4, N'Welness', 1, CAST(N'2021-06-10T06:20:06.5340986' AS DateTime2), NULL)
INSERT [dbo].[Categories] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (5, N'Lifestyle', 1, CAST(N'2021-06-10T06:20:06.5340991' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Text], [PostId], [UserId], [IsActive], [CreatedAt], [UpdatedAt], [ParentId]) VALUES (1014, N'Ovo je prvi komentar', 62, 1011, 1, CAST(N'2021-06-17T17:47:20.9744062' AS DateTime2), NULL, NULL)
INSERT [dbo].[Comments] ([Id], [Text], [PostId], [UserId], [IsActive], [CreatedAt], [UpdatedAt], [ParentId]) VALUES (1015, N'Ovo je prvi child komentar', 62, 1011, 1, CAST(N'2021-06-17T17:48:04.8563199' AS DateTime2), NULL, 1014)
INSERT [dbo].[Comments] ([Id], [Text], [PostId], [UserId], [IsActive], [CreatedAt], [UpdatedAt], [ParentId]) VALUES (1016, N'Ovo je drugi komentar', 63, 1011, 1, CAST(N'2021-06-17T17:48:26.5834847' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[PostRatings] ON 

INSERT [dbo].[PostRatings] ([Id], [Rating], [UserId], [PostId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (3, 5, 1011, 62, 1, CAST(N'2021-06-17T17:49:00.1925248' AS DateTime2), NULL)
INSERT [dbo].[PostRatings] ([Id], [Rating], [UserId], [PostId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (5, 5, 1011, 63, 1, CAST(N'2021-06-17T17:50:43.8446603' AS DateTime2), NULL)
INSERT [dbo].[PostRatings] ([Id], [Rating], [UserId], [PostId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (9, 3, 1010, 62, 1, CAST(N'2021-06-17T18:05:15.0827129' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[PostRatings] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (62, N'test', N'asdasdasdadasdasdasad', N'83635690-0541-45f3-bf92-11dcd9a0fc7d.PNG', 6, 3, 1, CAST(N'2021-06-11T06:06:56.5344216' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (63, N'test 2', N'ASJD ASJDgdashdgashgas hdasgdhasgh', N'ec3120c8-c7ee-4480-a04f-74a8796233b6.PNG', 6, 3, 1, CAST(N'2021-06-11T06:22:45.5424485' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1002, N'novi post v2', N'ASJD ASJDgdashdgashgas hdasgdhasgh', N'580b4054-26ef-4b22-9067-c2da79c6ff7b.PNG', 6, 4, 1, CAST(N'2021-06-17T16:56:24.5417659' AS DateTime2), CAST(N'2021-06-17T17:14:14.6228726' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1003, N'Velit facilis dolor.', N'Repellendus natus non incidunt. Non cum error ratione ab non unde fugiat aut consequuntur. Ut atque velit dolor similique quia fugit molestiae laborum. Quis ipsa qui ex soluta consequatur optio impedit voluptatem. Magni aut repudiandae quas et odit in consequatur assumenda. Libero veniam sapiente quia distinctio neque.

Id est dignissimos veniam et ipsum molestiae quidem. Temporibus consequatur cupiditate at. Beatae quis maxime. Sunt optio ipsam praesentium mollitia aut sequi. Sequi alias vitae eius. Occaecati voluptatem maiores aut velit qui nulla ex.

Tempora itaque temporibus quidem dolore in perspiciatis. Tempore et sunt deserunt. Qui ratione aut sit magni. Perferendis et omnis hic sunt pariatur. Accusamus sit libero saepe eveniet numquam eum.', N'476217ca-0364-4134-af33-6fc289f7d591.jpg', 6, 3, 1, CAST(N'2021-06-19T12:22:05.2478527' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1004, N'Dicta cupiditate consequatur.', N'Est est et velit temporibus est non id officia a. Veritatis quo et qui expedita cum. Optio temporibus quod nihil cupiditate provident dolor sed debitis omnis. Enim fuga sed eos.

Voluptate quia eos neque atque sint voluptas minima veritatis. Eum sit nostrum aspernatur praesentium. Provident aut soluta dolorem ut dicta.

Magnam qui dolorem sunt ad suscipit velit sed. Aspernatur quia sed sed dolorem numquam. Reiciendis molestiae laudantium voluptatem hic aliquid officia distinctio nihil. Sunt sunt dolor inventore et voluptatem at molestias voluptates facere.', N'213eb192-e6a6-4119-a474-904404230d60.jpg', 6, 4, 1, CAST(N'2021-06-19T12:22:05.2481852' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1005, N'Consectetur alias est architecto et est consectetur omnis molestiae.', N'Eveniet consequatur amet voluptatum dolorum alias nobis ut. Quas et autem dolore. Voluptatem iusto quia. Soluta accusantium repudiandae. Sed temporibus nihil quod consectetur voluptatem. Qui rerum omnis doloremque vel consectetur quis accusamus.

At dolorem aut laborum dolore quia et voluptatum. Id aliquam perferendis omnis dolore nulla autem odio est qui. Aut consequatur commodi. Placeat dolorum sunt ut.

Et error minus corporis eum sed et pariatur accusamus laudantium. Voluptatem tempora porro voluptate vel odit provident sit qui. Soluta rem reprehenderit illum ipsa laudantium est eos et. Veniam est ab hic. Veniam voluptatum quam facilis necessitatibus deserunt illum recusandae. Et qui facilis fugiat quis.', N'24a64ae5-8d05-4ad0-98d3-a7f6d550d099.jpg', 6, 2, 1, CAST(N'2021-06-19T12:22:05.2481886' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1006, N'Natus neque veniam neque aut sunt laboriosam.', N'Id dolores maiores et tempora excepturi expedita quia voluptas. Explicabo et aut ut optio neque eos ut. Velit blanditiis illum earum. Fugit cum sed quia necessitatibus reiciendis.

Asperiores harum et possimus id in nihil placeat sapiente velit. Fugit minima rerum ducimus fuga officia repellat aut omnis quia. Voluptas sint consectetur dolores magni. Reprehenderit sit veniam repellendus sed ratione quidem. Harum itaque iste quis fugiat eum.

Itaque dolorem non. Tempora dolores id necessitatibus. Quae quod impedit nemo maiores error aut ducimus voluptatem.', N'8b0ee0fd-689f-4be7-b393-89a6efaf735d.jpg', 6, 2, 1, CAST(N'2021-06-19T12:22:05.2481903' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1007, N'Harum consequuntur explicabo asperiores magni.', N'Asperiores est dignissimos qui porro qui quae veniam reiciendis consequatur. Ut quia eveniet deserunt reprehenderit. Architecto ea molestiae ipsum facilis autem dignissimos voluptas nobis doloremque. Et nulla eum vitae aut quaerat et.

Ab voluptas et nam voluptatem aut. Eum perspiciatis eum blanditiis. Minus dolor et.

Et ut ad repellat reiciendis. Temporibus odio commodi. Sed sed molestiae et. Quas rerum et maxime atque voluptatem. Quidem quia et ullam.', N'0af7db71-be72-4032-9ac3-39cc4a59e333.jpg', 6, 4, 1, CAST(N'2021-06-19T12:22:05.2481916' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1008, N'Sunt similique amet nam voluptates ex est blanditiis sequi.', N'Quasi exercitationem magni modi distinctio officiis. Et dolorum omnis veritatis sed repellendus ipsam dolor. Veritatis expedita quo aspernatur. Soluta dolor numquam accusamus quia rem. Pariatur ad laborum et est et autem ducimus. Eaque atque voluptas sint maiores.

Excepturi aperiam in. Qui aut qui et dignissimos. Veritatis reprehenderit fugit repudiandae aliquid corrupti in doloremque. Nisi voluptatem illum nulla quis occaecati qui necessitatibus accusantium. Rerum qui qui alias.

Quo omnis consequuntur eveniet id est consequatur et. Iusto ea suscipit odio nobis repellat consequatur atque quia suscipit. Optio amet fugit eum alias modi natus et dolores dolores.', N'08318b6f-8e5d-4877-a472-1282a8c682e2.jpg', 6, 2, 1, CAST(N'2021-06-19T12:22:05.2481929' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1009, N'Reprehenderit accusantium non sint impedit ad magni ipsa.', N'Sit officiis pariatur sed qui. Laboriosam ipsum culpa aspernatur amet nam. Aut est nam exercitationem. Sint magni dolor corporis voluptas est aut nemo tempora dolorem. Explicabo aliquid dolorem soluta mollitia.

Voluptatem impedit id est eius. Sint aperiam deleniti est debitis sed. Quae reiciendis ut non cupiditate neque porro doloremque beatae. Dicta modi ipsum. Corrupti maxime voluptatem voluptatibus omnis sit sit in officia nostrum.

Est iure aut exercitationem veniam et accusantium ullam et fugit. Rerum nesciunt iusto. Veniam amet animi sint omnis quae sunt molestiae nostrum blanditiis. Quia accusamus sed est iure earum repellendus laborum. Sit tempora repellendus dolorem expedita adipisci.', N'af0b77f4-e356-4e38-baba-742dfb8dff4e.jpg', 6, 3, 1, CAST(N'2021-06-19T12:22:05.2481940' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1010, N'Rerum quis et eum dolorem sed quis quae non.', N'Consectetur eos voluptatem a sint quo ut odit sequi. Deserunt qui quia at perspiciatis asperiores harum inventore ea. Eos ex quia non inventore distinctio architecto et sed. Quos iusto in ipsum deserunt facere nostrum. Impedit rerum veniam unde ipsa. Ab facilis qui.

Quia quod doloribus consequatur numquam. Quo est eius eveniet at voluptas dolorum et et enim. Voluptas consequatur voluptatem autem. Quaerat ut blanditiis quos enim enim et aut. Non perspiciatis rerum beatae omnis et.

Quaerat facere et quasi. Vero sit nam facilis iure quo. Ipsam ducimus voluptatem corrupti quam deleniti rerum aliquid est animi. Dolorum laboriosam atque facilis eius reiciendis dolorem. Assumenda provident qui maxime excepturi est quidem repellendus quos ad.', N'f6d2a78e-48d0-4937-ac22-6bb0e3c1c19d.jpg', 6, 2, 1, CAST(N'2021-06-19T12:22:05.2481960' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1011, N'Libero et tempora doloribus aut omnis minima voluptatem distinctio.', N'Ad laudantium expedita tempora dignissimos minus doloribus numquam delectus. Illum dolores et ea ipsum cumque facere omnis. Optio voluptatem beatae eveniet recusandae id reprehenderit ut eum. Itaque dolorem dolorem et voluptates quaerat soluta sunt veniam veniam.

Minima enim eos pariatur nihil neque harum non inventore. Reprehenderit debitis culpa quo adipisci error est. Ab iure est sit accusantium vero et. Sequi aut corrupti laborum totam deleniti debitis et officiis assumenda. Vitae dolor incidunt quo qui dolorem velit iusto nostrum. Velit veritatis fugit.

Incidunt sint sit hic veniam veniam velit perspiciatis. Provident odio dignissimos. Voluptates repellat tempore. Molestiae consequatur rerum odio qui tempore nesciunt quas et.', N'4bb829b1-b2c2-4002-9e9b-f90dda67e864.jpg', 6, 2, 1, CAST(N'2021-06-19T12:22:05.2481973' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1012, N'Ea nulla a eaque autem dolore.', N'Commodi est et corrupti. Aut quidem modi sit aut vel. Non nostrum commodi ex quidem. Est tempora voluptate voluptas voluptatem. Libero eos quo optio quae quos. Velit aliquam distinctio.

Sint itaque suscipit possimus et animi quos ratione consequuntur voluptatem. Quasi atque animi ea et cupiditate in voluptas occaecati nihil. Illum et ipsa earum quia est. Dolor aspernatur et expedita esse odio optio aut delectus nihil. Ut officiis voluptatem ea delectus assumenda non ducimus sunt.

Cum illum fugit et iusto sed porro porro. Nihil aut sed rerum dolorem doloremque velit quasi neque. Explicabo iste sequi doloremque quia eum neque esse. Ad qui qui animi rerum quas quam quae. Ipsum alias in aliquam magnam natus iure. Tempore quis labore recusandae ea eos quis.', N'7bc02c19-2746-4cfc-ac05-d7ae70dbb2b8.jpg', 6, 1, 1, CAST(N'2021-06-19T12:22:05.2481986' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1013, N'Et voluptatem voluptatem repellat sint amet maiores quisquam ducimus eos.', N'Tempore ullam earum dolores unde veritatis aut eum dolorem et. Rerum voluptatem molestias facere quisquam quo neque dolorum. Qui incidunt ut nam nam numquam illum et sapiente. Doloremque omnis minus consequuntur mollitia dolorum tempora. Dolorum blanditiis fugit distinctio.

Distinctio voluptatem id consequatur. Voluptatem aut quis et impedit corrupti. Doloremque ad rem sit dolore sit. Id in eveniet numquam eos voluptates. Dolores nam ut dolorem. Autem nihil beatae alias ut deleniti consequatur corrupti.

Maxime sint voluptatem quidem voluptatem officia hic cumque. Quia recusandae labore quia temporibus. Odit mollitia explicabo ullam assumenda eius maxime beatae voluptatem. Voluptatem hic enim consequuntur pariatur odio optio quisquam. Et vel consectetur et omnis perspiciatis perspiciatis sapiente magnam a.', N'4f5ff5f6-bafb-4fdc-b320-253fba1ea4b4.jpg', 7, 3, 1, CAST(N'2021-06-19T12:22:56.9588523' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1014, N'Omnis numquam nostrum labore et aut quo amet recusandae.', N'Odio repellat earum magni quidem cum in odio assumenda labore. Veniam dolores vel repudiandae explicabo suscipit facere. Aliquam quos quia ut. Aut distinctio aperiam aut.

Molestias temporibus praesentium expedita earum consectetur natus et. Accusamus iure vel amet sint eaque recusandae sequi vero voluptas. Autem iusto impedit non molestias voluptatem qui quibusdam quia. Facilis eligendi totam quae qui est dolorem deleniti odio est. Nihil nulla aliquid accusamus cum recusandae facere. Officiis molestias quia.

Ut architecto vitae dolore. Dolorum praesentium voluptas nemo. Modi eligendi ut qui repellendus enim aut tempore quam id. Libero officia ex nisi eum. Reiciendis eligendi qui totam rem eos.', N'87843645-5d57-4261-a2e4-9270da1618e0.jpg', 7, 3, 1, CAST(N'2021-06-19T12:22:56.9591941' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1015, N'Optio expedita facilis in sit.', N'Assumenda in repudiandae magni quia. Autem ut autem omnis fugiat. Hic recusandae soluta atque est et voluptatem labore atque. Vero praesentium facere. Veritatis ducimus consequuntur libero provident laboriosam animi. Deleniti enim tempore tempora dolorem.

Aut ut est quidem porro consectetur ut. Quia et libero. Culpa dolor optio. Qui vel fuga enim ut voluptas consequuntur.

Voluptatem est blanditiis voluptate consequatur dolores. Qui facilis rem ipsum dolorem dolorem aperiam commodi. Et tenetur maxime eos voluptas voluptatem natus dolor.', N'6abb5730-07d4-4620-80e5-3502c86ddf3c.jpg', 7, 2, 1, CAST(N'2021-06-19T12:22:56.9591963' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1016, N'Eius pariatur perspiciatis tempora dolore dolorem est praesentium.', N'Culpa saepe est commodi nihil non adipisci. Nemo non autem et nisi voluptatem iste sint rerum vel. Dolorem magni ab tempore soluta.

Velit deserunt in corporis qui nihil soluta totam. Illum qui deserunt voluptatem recusandae magni dicta magnam aliquam. Deserunt quas minima tempore voluptas. Qui explicabo voluptatibus iusto provident. Non est omnis minus.

Alias magni tempore hic debitis atque quod. Exercitationem inventore et. Ipsa quibusdam quam. Repellat qui sint et architecto. Alias laborum cumque.', N'c87e4840-1d69-44ed-ac3b-b587f3b8f431.jpg', 7, 2, 1, CAST(N'2021-06-19T12:22:56.9591976' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1017, N'Magnam mollitia saepe.', N'Velit non omnis dolore quia soluta facilis. Quibusdam non incidunt doloribus suscipit distinctio rerum reprehenderit. Aut animi est quidem illum soluta praesentium voluptatibus. Veritatis magnam pariatur ut. Sed rem occaecati ut. Corrupti omnis exercitationem est ex sint sed.

Aperiam nam hic facere quidem sint autem nostrum quae. Eum nulla explicabo ut asperiores dolorum qui omnis error repellendus. Sint illum molestiae. Ut sit molestias hic quam sed. Eligendi dolorum rerum laudantium aut dolores non porro. Voluptates molestiae laborum at distinctio.

Ullam doloremque sapiente quod iste. Vel occaecati pariatur occaecati. Minus suscipit veniam nisi fuga. Nobis sequi rem voluptatem provident molestias eveniet error pariatur.', N'4d36f92e-e62c-4ab5-9a1f-9f3277eda22a.jpg', 7, 2, 1, CAST(N'2021-06-19T12:22:56.9591989' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1018, N'Sed dicta sed in omnis quas.', N'Sint praesentium vel qui. Consequatur molestiae et deserunt dolor voluptatum. Quasi similique et eum dolorem quas. Delectus assumenda cupiditate veritatis quia nihil assumenda eligendi et facilis. Sed tempora odio architecto nihil dolorem voluptate perspiciatis libero nam. Repudiandae sint porro sunt totam commodi omnis quis autem voluptate.

Recusandae iusto qui qui sed iusto quisquam. Repellat ut facilis. Dolore earum asperiores qui harum nihil fuga quo. Architecto vero est nisi dicta.

Qui ratione enim ut ut est. Quidem accusantium est sed odit hic unde. Rerum enim beatae voluptas non quis voluptate et tenetur dolor.', N'caebe63c-1416-43c3-bff7-44e41d26c022.jpg', 7, 2, 1, CAST(N'2021-06-19T12:22:56.9592001' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1019, N'Quia eos culpa temporibus ab sed.', N'Aut at cumque odit autem. Iusto ex sed eos eius sint necessitatibus. Dolor voluptates suscipit ut dolore impedit aperiam id.

Possimus eum quia est inventore. Quisquam dicta voluptates harum. Ipsa et dolorem cumque labore explicabo perferendis. Autem minus ut perspiciatis est.

Blanditiis repellendus accusamus corrupti minima labore ea eum. Perspiciatis ad repellendus ullam aut. Dolores est aliquam dolores. Libero dolorem similique aut. Voluptatem ducimus cumque qui quos quis quo.', N'9042c57b-7b24-461a-bb88-6fa1f0bf94c5.jpg', 7, 2, 1, CAST(N'2021-06-19T12:22:56.9592013' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1020, N'Iure dolor itaque numquam nihil ex laboriosam soluta eos illum.', N'Nemo quo voluptate est mollitia expedita nostrum voluptatum perspiciatis alias. Numquam eos accusamus quaerat autem. Et vero quaerat natus qui repudiandae aspernatur sed.

Ut quibusdam blanditiis consequatur. Velit ab enim nemo eaque. Maiores fugiat asperiores. Quam eum quos quisquam. Omnis explicabo perspiciatis voluptatem veritatis. Saepe in atque quibusdam enim dignissimos cum voluptatum iure cum.

Itaque et vel natus. Facere est vel accusantium ut quia in provident est atque. Et aut magnam et placeat reprehenderit occaecati.', N'5be3416c-a254-4cf1-bfb3-0c3675344752.jpg', 7, 1, 1, CAST(N'2021-06-19T12:22:56.9592038' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1021, N'Dolorem excepturi qui id enim ea est error.', N'Iste sint ut asperiores. Autem esse dolore recusandae. Beatae dicta ut nihil sapiente odit nulla culpa. Distinctio ducimus perspiciatis veniam neque minus.

Alias quas libero. Omnis quasi nisi ab similique doloremque harum distinctio. Sit et praesentium saepe sunt id. Accusantium facilis sed excepturi.

Libero quod aut quidem. Voluptatem nihil voluptas velit maxime voluptatem. Ipsam sit molestiae et reprehenderit beatae non sint delectus facilis.', N'37afd52b-64c8-43ac-ba67-7da039583426.jpg', 7, 2, 1, CAST(N'2021-06-19T12:22:56.9592050' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1022, N'Dicta reprehenderit officia asperiores velit alias ea ullam sequi harum.', N'Animi ipsa recusandae et quis a. Est facere velit et aliquam quisquam voluptatem quis. Consequuntur ullam odit ipsum accusantium. Et dolore repellendus ut molestias voluptas ab dignissimos odit. Eligendi et quia est praesentium.

Sapiente enim aperiam adipisci necessitatibus totam sit ad debitis. Odit quia at cupiditate qui quis consequatur sed. Accusamus odit ducimus non iste enim sunt qui. Odit asperiores voluptas temporibus cumque laudantium ratione.

Animi aperiam omnis qui doloribus et dolores earum ut aliquam. Et dolore sint corrupti est omnis minus excepturi laboriosam. Aut et aut assumenda ipsum rerum. Voluptatem voluptatum reprehenderit autem omnis vel non dicta voluptates. Fugit qui quibusdam laborum quae quo. Quia eos deleniti minima perferendis ratione qui quidem natus.', N'081812e9-8fd0-483f-a874-2711c007debb.jpg', 7, 4, 1, CAST(N'2021-06-19T12:22:56.9592063' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1023, N'Sed dolor nobis perspiciatis.', N'Voluptas dicta odio cum blanditiis quos cupiditate nihil aperiam. Nostrum sequi ipsa odit quod ipsum explicabo. Ut veritatis id ut. Ut est tempore consequatur laudantium. Voluptas voluptatem ipsum enim ex accusantium numquam adipisci. Sequi tenetur ea enim id.

Corporis quidem ut esse commodi dicta. Sunt optio numquam inventore omnis quia. Dolor quia veritatis aut consectetur reprehenderit sed rerum nobis beatae. Reiciendis minus quae sit cumque exercitationem provident. Eos quam eaque aut ab consequatur facere libero animi.

Delectus iusto doloribus velit. Eum ullam laboriosam perspiciatis qui. Quam hic consectetur necessitatibus iure. Iusto omnis asperiores et non. Nisi provident maxime.', N'02d79543-6c69-4b8b-ba8f-96e9dda96eed.jpg', 8, 1, 1, CAST(N'2021-06-19T12:24:07.9756590' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1024, N'Perferendis id iusto.', N'Ipsam perspiciatis aut sunt doloribus voluptatem tempore. Ea tenetur doloribus et. Alias dicta repudiandae nesciunt voluptatibus in ut. In eius odio. Facilis aut fuga consequatur quis minus.

Id aut voluptate beatae quibusdam qui. Omnis commodi deserunt. Sed autem quod non distinctio odit at fuga eaque corrupti.

Voluptas libero distinctio ut odio ab vel fugit. Aut quia accusamus ut. Fugiat commodi qui consequatur voluptatum soluta voluptatibus aliquam. Illo ut aliquid delectus cumque iusto aut quasi itaque voluptatem.', N'cf77f4cb-d80d-43f4-9201-55118228781a.jpg', 8, 3, 1, CAST(N'2021-06-19T12:24:07.9759890' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1025, N'Beatae voluptate dolores ab mollitia.', N'Deleniti maxime et ipsum officiis et voluptatibus enim corrupti eaque. Aut autem possimus architecto voluptas est dignissimos dicta. Soluta soluta aut. Enim id ut animi molestiae tempora provident assumenda voluptas. Quas molestias magnam aut doloremque est voluptatibus molestiae.

In molestiae totam. Consequatur facilis non est molestias et corporis. Quidem voluptas ut ut dicta eum nulla quaerat molestias. Dolore explicabo aliquam error sint est esse commodi aspernatur magnam. Eaque esse nisi dolores itaque deserunt dolor cumque. Voluptatem dolores qui nihil officiis voluptate voluptatibus omnis quidem animi.

Error dolores cum quis ut dignissimos consequuntur et. Ratione non illo et. Nihil iste magni voluptatem temporibus veritatis iste. Quidem fugit cumque omnis eligendi aut maxime. Est et libero quae voluptatum sint libero omnis.', N'8acfe910-b116-475d-a66c-efffe9ff088b.jpg', 8, 1, 1, CAST(N'2021-06-19T12:24:07.9759906' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1026, N'Voluptatem expedita ut minus sed est laboriosam.', N'Voluptatibus molestiae et corrupti consequatur. Magni reiciendis eos error tempore autem placeat. Inventore ut quam. Eum voluptatem sed. Rerum consequatur natus rerum voluptate expedita at.

Ea repudiandae esse consequuntur ipsam accusantium ut. Voluptatem sint et inventore aut sunt quibusdam in. Nulla consectetur optio culpa a et nesciunt voluptatum. Quaerat non ipsum fugit rem consequuntur nisi. Enim debitis sit.

Excepturi sit laboriosam ut aut dolorum ducimus dolor. Omnis labore voluptas vel distinctio. Molestiae ea ullam quaerat est omnis voluptas nemo occaecati. Dignissimos quis porro. Dolor sint et. Aut cum excepturi labore quisquam excepturi ut accusantium.', N'a59a7417-097d-4fa3-a53f-f99fff612295.jpg', 8, 2, 1, CAST(N'2021-06-19T12:24:07.9759915' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1027, N'Voluptatibus dolorem non ut expedita totam occaecati magni et.', N'Et delectus placeat. Qui velit expedita dolore minus id et nulla quia perferendis. Voluptatibus nemo est nobis repellendus porro dolorum sit. Eos deserunt est temporibus et adipisci repudiandae officiis laboriosam. Quas eos non quidem quam occaecati at nostrum exercitationem sit.

Facere sit rerum atque numquam. Modi autem ea fuga hic sapiente. Tempora excepturi accusamus nisi sed dolorem et molestias. Excepturi in ab tempore.

Recusandae molestiae voluptas repellat. Illum quo ex voluptas nihil. Totam est perspiciatis harum aut amet delectus saepe consectetur aut. Hic possimus adipisci vero illum sunt qui quis et ut.', N'1ca36d65-4543-4fad-a56a-db7f69dfef78.jpg', 8, 2, 1, CAST(N'2021-06-19T12:24:07.9759922' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1028, N'Inventore eos non ullam.', N'Molestiae reprehenderit sequi doloremque et iste ea reiciendis. Unde et iure vitae omnis architecto sequi hic voluptatum similique. Ducimus repellat voluptatem sed totam doloribus odio nostrum deserunt. Cumque qui labore nemo ut et vero tenetur. Sed fugiat debitis. Voluptatem adipisci maiores aliquid voluptas aut et repudiandae blanditiis.

Numquam molestiae consequuntur et. Non fugit et iure ad nulla ipsa. Omnis consequatur ad ullam. Ducimus consequatur ut similique qui labore nisi deleniti quidem cum. Nobis est dolore at.

Quae cum labore. Aspernatur dicta assumenda corrupti culpa dolor. Voluptas sunt tenetur dolorem.', N'd285717c-0c6a-4e58-bd1b-7d5dd651c3a8.jpg', 8, 1, 1, CAST(N'2021-06-19T12:24:07.9759931' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1029, N'Sint consequatur commodi quia est dolor rerum.', N'Exercitationem iusto debitis. Et animi amet illo est omnis mollitia inventore. Ut minima sed beatae error veritatis adipisci. Et quisquam commodi vitae vero et quos sint.

Temporibus delectus nemo aut est. Temporibus beatae culpa sapiente repellendus rerum consectetur tempora perspiciatis enim. Vitae aut similique numquam qui vitae dignissimos tempora. Excepturi dolorum facilis ex optio dolores dolore et.

Exercitationem perspiciatis et. Nostrum corrupti atque incidunt at. Non dolores sed perspiciatis. Voluptate rerum officiis quae delectus rerum et. Recusandae vel ipsum et modi ut et. Eligendi quam qui perferendis fugit blanditiis nam minima.', N'cbf0a1c5-c82a-4b1d-99a6-76aa75311792.jpg', 8, 1, 1, CAST(N'2021-06-19T12:24:07.9759938' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1030, N'Laboriosam pariatur officia quae amet autem vitae aspernatur.', N'Consectetur quis qui voluptas non. Ut eligendi molestiae quia illo voluptatem. Sed perspiciatis quo porro dicta non rem tenetur minima mollitia. Et aperiam ad non placeat. Dicta sit ducimus. Laudantium ut et in labore qui ratione omnis quod nesciunt.

Rerum iure quas. Distinctio repellat sunt corporis suscipit. Omnis dolores numquam dolor sequi odio rerum et eaque quisquam. Doloribus quod minima mollitia eos nulla rerum voluptas consectetur. Iusto facilis omnis ratione necessitatibus accusantium in.

Omnis ratione rerum. Corrupti odit commodi veritatis molestiae nihil illum. Quia tenetur quaerat eveniet est tempora facere occaecati sequi. Reiciendis ratione autem laboriosam quos distinctio doloremque.', N'6bb3cfce-5172-417c-b578-97486fceeaf3.jpg', 8, 2, 1, CAST(N'2021-06-19T12:24:07.9759953' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1031, N'Velit perspiciatis in hic sapiente.', N'Consectetur autem corrupti omnis dolor. Dolorum autem quisquam ipsam eligendi exercitationem magnam. Et facilis dolorem non. Dolorem dolores quia ratione. Nihil doloremque neque nostrum ad et ipsum.

Unde blanditiis iusto ut maxime quis odit. Assumenda expedita accusantium quibusdam commodi. Voluptatem laborum eveniet placeat voluptatem qui quas at sit. Accusamus quasi placeat ex voluptas aut voluptatum ratione. Nihil nihil repellendus consequatur vel beatae iste doloremque. Est occaecati sed illum laboriosam aliquam qui soluta autem.

Ipsum dicta optio odio. Qui tempore fuga facere doloremque libero dolor aut aspernatur. Architecto labore dolore occaecati tempore laudantium temporibus eligendi. Et cupiditate ab minus.', N'dcc3b39a-755f-41ac-ae2f-271f8c0bb090.jpg', 8, 4, 1, CAST(N'2021-06-19T12:24:07.9759961' AS DateTime2), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [MainImg], [UserId], [CategoryId], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1032, N'Numquam est est maiores repellat non.', N'Nisi culpa voluptatibus. Recusandae minima dolor illo laboriosam labore. Soluta dolor et iusto vero qui soluta vel. Similique earum voluptatem ut earum consequuntur. Eum rerum adipisci rerum similique eaque et.

Ut ut provident excepturi voluptates architecto nesciunt quis. Illo voluptatem enim numquam accusamus. Ipsam voluptatem tempora odio. Ipsam harum laudantium consequatur quod in. Qui ex voluptatem. Aut perferendis voluptas voluptatem omnis voluptatem accusamus atque.

Reiciendis perferendis rerum aut incidunt dolorem architecto doloremque similique. Vel et corrupti aliquid et et. Assumenda excepturi delectus perferendis non sit esse non. Ducimus omnis laborum neque veniam.', N'e64cae39-6ae4-4f04-b608-516bf000e609.jpg', 8, 3, 1, CAST(N'2021-06-19T12:24:07.9759969' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1009, 1)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (62, 2)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1004, 2)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1013, 2)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1018, 2)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1022, 2)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1031, 2)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (62, 3)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1002, 3)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1003, 3)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1006, 3)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1007, 3)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1012, 3)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1025, 3)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1027, 3)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1016, 4)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1023, 4)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1002, 5)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1011, 5)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1019, 5)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1020, 5)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1024, 5)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1017, 6)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1021, 7)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1005, 8)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1008, 8)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1014, 8)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1015, 8)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1028, 8)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1029, 8)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1030, 8)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1010, 9)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1026, 9)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1032, 9)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1013, 10)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1006, 11)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1016, 11)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1025, 11)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1012, 12)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1026, 12)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1031, 12)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1003, 13)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1020, 14)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1027, 14)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1018, 15)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1032, 15)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1004, 16)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1005, 17)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1011, 17)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1014, 17)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1017, 17)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1019, 18)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1007, 19)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1021, 19)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1030, 19)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1008, 20)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1024, 20)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1029, 20)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1028, 21)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1022, 22)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1002, 23)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1009, 23)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1010, 23)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1015, 23)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1023, 23)
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (1, N'molestias', 1, CAST(N'2021-06-12T06:55:29.1473682' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (2, N'ipsum', 1, CAST(N'2021-06-12T06:55:29.1477235' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (3, N'fuga', 1, CAST(N'2021-06-12T06:55:29.1477228' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (4, N'autem', 1, CAST(N'2021-06-12T06:55:29.1477221' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (5, N'veniam', 1, CAST(N'2021-06-12T06:55:29.1477214' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (6, N'commodi', 1, CAST(N'2021-06-12T06:55:29.1477206' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (7, N'dolore', 1, CAST(N'2021-06-12T06:55:29.1477200' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (8, N'quidem', 1, CAST(N'2021-06-12T06:55:29.1477194' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (9, N'est', 1, CAST(N'2021-06-12T06:55:29.1477188' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (10, N'reprehenderit', 1, CAST(N'2021-06-12T06:55:29.1477182' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (11, N'in', 1, CAST(N'2021-06-12T06:55:29.1477177' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (12, N'laboriosam', 1, CAST(N'2021-06-12T06:55:29.1477241' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (13, N'illum', 1, CAST(N'2021-06-12T06:55:29.1477170' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (14, N'ducimus', 1, CAST(N'2021-06-12T06:55:29.1477157' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (15, N'autem', 1, CAST(N'2021-06-12T06:55:29.1477151' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (16, N'atque', 1, CAST(N'2021-06-12T06:55:29.1477144' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (17, N'nisi', 1, CAST(N'2021-06-12T06:55:29.1477130' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (18, N'sunt', 1, CAST(N'2021-06-12T06:55:29.1477124' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (19, N'rerum', 1, CAST(N'2021-06-12T06:55:29.1477116' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (20, N'error', 1, CAST(N'2021-06-12T06:55:29.1477109' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (21, N'asperiores', 1, CAST(N'2021-06-12T06:55:29.1477085' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (22, N'at', 1, CAST(N'2021-06-12T06:55:29.1477076' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (23, N'rem', 1, CAST(N'2021-06-12T06:55:29.1477059' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (24, N'ut', 1, CAST(N'2021-06-12T06:55:29.1477164' AS DateTime2), NULL)
INSERT [dbo].[Tags] ([Id], [Name], [IsActive], [CreatedAt], [UpdatedAt]) VALUES (25, N'nisi', 1, CAST(N'2021-06-12T06:55:29.1477247' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1, CAST(N'2021-06-10T05:20:12.6212152' AS DateTime2), N'User Registration', N'{"FirstName":"Ale","LastName":"Madic","Username":"alemadic","Email":"info@alemadic.com","Password":"sifra123","IsAdmin":true,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (2, CAST(N'2021-06-10T05:22:57.4547348' AS DateTime2), N'User Registration', N'{"FirstName":"Pink","LastName":"Panter","Username":"panter","Email":"panter@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (3, CAST(N'2021-06-10T05:28:00.4032386' AS DateTime2), N'User Registration', N'{"FirstName":"Pink","LastName":"Panter","Username":"panter","Email":"panter@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (4, CAST(N'2021-06-10T05:39:20.9360879' AS DateTime2), N'User Registration', N'{"FirstName":"Laza","LastName":"Lazic","Username":"lazalazic","Email":"lazic@gmail.com","Password":"Sifra123","IsAdmin":true,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (5, CAST(N'2021-06-10T09:43:34.8644048' AS DateTime2), N'User Registration', N'{"FirstName":"Laza","LastName":"Lazic","Username":"lazalazic","Email":"lazic@gmail.com","Password":"Sifra123","IsAdmin":true,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (6, CAST(N'2021-06-10T09:49:27.6984731' AS DateTime2), N'User Registration', N'{"FirstName":"Ale","LastName":"Madic","Username":"alemadic","Email":"info@alemadic.com","Password":"sifra123","IsAdmin":true,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (7, CAST(N'2021-06-10T09:50:15.8491218' AS DateTime2), N'User Registration', N'{"FirstName":"Laza","LastName":"Lazic","Username":"lazalazic","Email":"lazic@gmail.com","Password":"sifra123","IsAdmin":true,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (8, CAST(N'2021-06-10T09:50:35.6914027' AS DateTime2), N'User Registration', N'{"FirstName":"Mika","LastName":"Mikic","Username":"mikamikic","Email":"mikic@gmail.com","Password":"sifra123","IsAdmin":true,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (9, CAST(N'2021-06-10T09:50:52.7822602' AS DateTime2), N'User Registration', N'{"FirstName":"Pink","LastName":"Panter","Username":"panter","Email":"panter@gmail.com","Password":"sifra123","IsAdmin":true,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (10, CAST(N'2021-06-10T09:51:21.1851848' AS DateTime2), N'User Registration', N'{"FirstName":"Zika","LastName":"Zikic","Username":"zika","Email":"zikic@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (11, CAST(N'2021-06-10T10:24:03.3939034' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (12, CAST(N'2021-06-10T10:25:22.4556662' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (13, CAST(N'2021-06-10T10:32:50.6642073' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (14, CAST(N'2021-06-10T10:35:38.0075989' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (15, CAST(N'2021-06-10T10:47:28.1889716' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (16, CAST(N'2021-06-10T10:51:43.1522608' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (17, CAST(N'2021-06-10T10:55:37.7668469' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (18, CAST(N'2021-06-10T10:58:38.6475354' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (19, CAST(N'2021-06-10T11:06:16.8866252' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (20, CAST(N'2021-06-10T11:07:46.1656169' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (21, CAST(N'2021-06-10T11:09:42.6085822' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (22, CAST(N'2021-06-10T11:27:00.7060311' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (23, CAST(N'2021-06-10T11:29:47.9427455' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (24, CAST(N'2021-06-10T11:31:56.0440670' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (25, CAST(N'2021-06-10T11:44:07.0786130' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (26, CAST(N'2021-06-10T11:48:03.9047835' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (27, CAST(N'2021-06-10T11:57:01.0663578' AS DateTime2), N'Get one post', N'23', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (28, CAST(N'2021-06-10T11:58:50.3607410' AS DateTime2), N'Get one post', N'23', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (29, CAST(N'2021-06-10T11:59:17.2464957' AS DateTime2), N'Get one post', N'23', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (30, CAST(N'2021-06-10T12:34:58.2238089' AS DateTime2), N'Get one post', N'23', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (31, CAST(N'2021-06-10T12:36:50.7695606' AS DateTime2), N'Get one post', N'23', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (32, CAST(N'2021-06-10T12:38:13.7157656' AS DateTime2), N'Get one post', N'23', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (33, CAST(N'2021-06-10T12:40:41.5513556' AS DateTime2), N'Get one post', N'23', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (34, CAST(N'2021-06-11T06:04:38.9419500' AS DateTime2), N'Create Post', N'{"Title":"test","Content":"asdasdasdadasdasdasad","MainImg":null,"Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"kdm box.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"kdm box.PNG\""],"Content-Type":["image/png"]},"Length":213541,"Name":"image","FileName":"kdm box.PNG"},"UserId":6,"CategoryId":3}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (35, CAST(N'2021-06-11T06:06:40.4186622' AS DateTime2), N'Create Post', N'{"Title":"test","Content":"asdasdasdadasdasdasad","MainImg":null,"Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"kdm box.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"kdm box.PNG\""],"Content-Type":["image/png"]},"Length":213541,"Name":"image","FileName":"kdm box.PNG"},"UserId":6,"CategoryId":3}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (36, CAST(N'2021-06-11T06:22:28.7741249' AS DateTime2), N'Create Post', N'{"Title":"test 2","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"kdm box.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"kdm box.PNG\""],"Content-Type":["image/png"]},"Length":213541,"Name":"image","FileName":"kdm box.PNG"},"UserId":6,"CategoryId":3}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (37, CAST(N'2021-06-11T09:29:58.7080933' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi komentar","PostId":23,"UserId":33,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (38, CAST(N'2021-06-11T09:54:07.5664603' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi komentar","PostId":23,"UserId":33,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (39, CAST(N'2021-06-11T09:57:37.4454281' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi komentar","PostId":23,"UserId":33,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (40, CAST(N'2021-06-11T10:12:52.7483517' AS DateTime2), N'Delete comment', N'2', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (41, CAST(N'2021-06-11T10:13:29.1134067' AS DateTime2), N'Delete comment', N'2', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (42, CAST(N'2021-06-11T10:25:14.7569443' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (43, CAST(N'2021-06-11T10:26:12.9521748' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je drugi komentar","PostId":25,"UserId":27,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (44, CAST(N'2021-06-11T10:26:31.5690446' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je drugi komentar","PostId":23,"UserId":35,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (45, CAST(N'2021-06-11T10:26:59.4099690' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":23,"ParentId":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (46, CAST(N'2021-06-11T10:27:17.9441113' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (47, CAST(N'2021-06-11T10:44:08.4846733' AS DateTime2), N'Get one comment', N'3', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (48, CAST(N'2021-06-11T10:44:55.2298726' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je drugi komentar","PostId":23,"UserId":35,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (49, CAST(N'2021-06-11T11:01:34.6537552' AS DateTime2), N'Get categories', N'{"Name":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (50, CAST(N'2021-06-11T11:06:16.2658792' AS DateTime2), N'Get one category', N'3', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (51, CAST(N'2021-06-11T11:06:32.1824885' AS DateTime2), N'Get one category', N'3', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1002, CAST(N'2021-06-11T16:54:28.9186132' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"MaxRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1003, CAST(N'2021-06-11T16:56:43.3172215' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"MinRating":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1004, CAST(N'2021-06-11T16:58:37.8835819' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1005, CAST(N'2021-06-11T17:05:25.7212625' AS DateTime2), N'Get one post', N'23', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1006, CAST(N'2021-06-11T17:06:49.2148165' AS DateTime2), N'Get one post', N'23', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1007, CAST(N'2021-06-12T07:12:15.6685124' AS DateTime2), N'Get one post', N'62', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1008, CAST(N'2021-06-12T07:13:48.9345727' AS DateTime2), N'Get one post', N'62', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1009, CAST(N'2021-06-12T07:14:43.5099809' AS DateTime2), N'Get one post', N'62', N'Unregistred user', 0, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1010, CAST(N'2021-06-12T13:18:36.3578501' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1011, CAST(N'2021-06-12T13:20:19.7878509' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1012, CAST(N'2021-06-12T13:21:22.5610020' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1013, CAST(N'2021-06-12T13:22:29.1463742' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1014, CAST(N'2021-06-12T13:22:35.0308616' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1015, CAST(N'2021-06-12T13:23:07.7283929' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1016, CAST(N'2021-06-12T14:26:48.0810696' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1017, CAST(N'2021-06-12T14:28:50.6595314' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1018, CAST(N'2021-06-12T14:29:36.5305994' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1019, CAST(N'2021-06-12T14:33:36.7926148' AS DateTime2), N'Get tags', N'{"Name":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1020, CAST(N'2021-06-12T14:34:05.1983635' AS DateTime2), N'Get one tag', N'23', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1021, CAST(N'2021-06-12T14:54:03.0305307' AS DateTime2), N'Get one tag', N'23', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1022, CAST(N'2021-06-12T14:54:18.2940365' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1023, CAST(N'2021-06-13T06:48:27.9468604' AS DateTime2), N'Get categories', N'{"Name":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1024, CAST(N'2021-06-13T07:17:33.1167959' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1025, CAST(N'2021-06-13T07:18:03.4924861' AS DateTime2), N'Get User use cases', N'{"UserId":0,"UseCaseId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1026, CAST(N'2021-06-13T07:18:47.2687774' AS DateTime2), N'Get categories', N'{"Name":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1027, CAST(N'2021-06-13T07:25:50.8104013' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1028, CAST(N'2021-06-13T07:27:26.7228913' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1029, CAST(N'2021-06-13T07:29:58.0417187' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1030, CAST(N'2021-06-14T15:59:39.1754056' AS DateTime2), N'Get categories', N'{"Name":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1031, CAST(N'2021-06-14T16:00:04.2221546' AS DateTime2), N'Get one category', N'3', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1032, CAST(N'2021-06-14T16:00:44.0323228' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1033, CAST(N'2021-06-14T16:00:56.1556321' AS DateTime2), N'Get one comment', N'4', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1034, CAST(N'2021-06-14T16:01:06.1484404' AS DateTime2), N'Get post ratings', N'{"PostId":0,"UserId":0,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1035, CAST(N'2021-06-14T16:01:38.8001011' AS DateTime2), N'Get tags', N'{"Name":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1036, CAST(N'2021-06-14T16:01:42.0213992' AS DateTime2), N'Get one tag', N'23', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1037, CAST(N'2021-06-14T16:01:50.1729312' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1038, CAST(N'2021-06-14T16:06:43.4302906' AS DateTime2), N'Get one use case log', N'38', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1039, CAST(N'2021-06-14T16:07:35.5588345' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1040, CAST(N'2021-06-14T16:07:43.0306050' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1041, CAST(N'2021-06-14T16:08:21.6045224' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1042, CAST(N'2021-06-14T16:09:56.0771344' AS DateTime2), N'Get one comment', N'3', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1043, CAST(N'2021-06-14T16:29:07.3903597' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1044, CAST(N'2021-06-14T16:35:39.3284348' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1045, CAST(N'2021-06-15T06:25:39.4654251' AS DateTime2), N'Get categories', N'{"Name":null,"PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1046, CAST(N'2021-06-15T06:26:42.1179049' AS DateTime2), N'Get categories', N'{"Name":null,"PerPage":10,"Page":1,"IsActive":null}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1047, CAST(N'2021-06-15T06:51:09.3977796' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1,"IsActive":null}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1048, CAST(N'2021-06-15T07:00:06.3440358' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1,"IsActive":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1049, CAST(N'2021-06-15T07:00:52.6255177' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1,"IsActive":null}', N'alemadic', 1, NULL)
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1050, CAST(N'2021-06-15T07:01:11.3476870' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":1,"IsActive":null}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1051, CAST(N'2021-06-15T18:00:12.7958374' AS DateTime2), N'Create new comment ef', N'{"Text":"Novi komentar proba test","PostId":23,"UserId":0,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1052, CAST(N'2021-06-15T18:02:32.8016648' AS DateTime2), N'Create new comment ef', N'{"Text":"Novi komentar proba test","PostId":23,"UserId":0,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1053, CAST(N'2021-06-15T18:03:57.3874068' AS DateTime2), N'Create new comment ef', N'{"Text":"Novi komentar proba test","PostId":23,"UserId":0,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1054, CAST(N'2021-06-15T18:05:17.9183120' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":23,"Post":null,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1055, CAST(N'2021-06-15T18:07:00.2712247' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":23,"Post":null,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1056, CAST(N'2021-06-15T18:07:39.2618246' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":23,"Post":null,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1057, CAST(N'2021-06-15T20:57:37.7049641' AS DateTime2), N'Create new comment ef', N'{"Text":"neki proba test komentar","PostId":23,"UserId":0,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1058, CAST(N'2021-06-15T20:58:33.1761857' AS DateTime2), N'Create new comment ef', N'{"Text":"neki proba test komentar","PostId":23,"UserId":0,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1059, CAST(N'2021-06-15T20:59:30.7245545' AS DateTime2), N'Create new comment ef', N'{"Text":"neki proba test komentar","PostId":23,"UserId":0,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1060, CAST(N'2021-06-15T21:02:13.1706987' AS DateTime2), N'Create new comment ef', N'{"Text":"neki proba test komentar","PostId":23,"UserId":0,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1061, CAST(N'2021-06-15T21:02:58.4554173' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1,"IsActive":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1062, CAST(N'2021-06-15T21:03:38.7341633' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1,"IsActive":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1063, CAST(N'2021-06-15T21:03:47.3186020' AS DateTime2), N'Create new comment ef', N'{"Text":"prvi kom na postu 25","PostId":25,"UserId":0,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1064, CAST(N'2021-06-16T08:19:03.4076876' AS DateTime2), N'User Registration', N'{"FirstName":"Pera","LastName":"Detlic","Username":"peradetlic","Email":"detlic@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1065, CAST(N'2021-06-16T08:24:22.4905323' AS DateTime2), N'User Registration', N'{"FirstName":"John","LastName":"Doe","Username":"johndoe","Email":"john@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1066, CAST(N'2021-06-16T08:31:31.9422139' AS DateTime2), N'User Registration', N'{"FirstName":"John","LastName":"Doe","Username":"johndoe","Email":"john@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1067, CAST(N'2021-06-16T08:56:33.8420866' AS DateTime2), N'User Registration', N'{"FirstName":"John","LastName":"Doe","Username":"johndoe","Email":"john@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1068, CAST(N'2021-06-16T09:06:22.9312188' AS DateTime2), N'Update user', N'{"FirstName":"John","LastName":"Doe verzija 2","Username":"johndoe","Email":"john@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1069, CAST(N'2021-06-16T09:06:57.9144049' AS DateTime2), N'Update user', N'{"FirstName":"John","LastName":"Doe verzija 2","Username":"johndoe","Email":"john@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'johndoe', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1070, CAST(N'2021-06-16T09:11:51.8875186' AS DateTime2), N'Update user', N'{"FirstName":"John","LastName":"Doe verzija 2","Username":"johndoe","Email":"john@gmail.com","Password":"sifra123","IsAdmin":false,"Id":1009,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'johndoe', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1071, CAST(N'2021-06-16T09:44:30.6947012' AS DateTime2), N'Delete user', N'0', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1072, CAST(N'2021-06-16T09:44:55.2816277' AS DateTime2), N'Delete user', N'0', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1073, CAST(N'2021-06-16T09:45:21.7031028' AS DateTime2), N'Delete user', N'1009', N'johndoe', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1074, CAST(N'2021-06-16T10:03:00.0218962' AS DateTime2), N'Admin update user', N'{"FirstName":"John","LastName":"Doe","Username":"johndoe","Email":"johndoe@gmail.com","Password":"sifra123","IsAdmin":false,"Id":1009,"IsActive":true,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'zika', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1075, CAST(N'2021-06-16T10:03:29.0560447' AS DateTime2), N'Admin update user', N'{"FirstName":"John","LastName":"Doe","Username":"johndoe","Email":"johndoe@gmail.com","Password":"sifra123","IsAdmin":false,"Id":1009,"IsActive":true,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1076, CAST(N'2021-06-16T10:03:54.3140104' AS DateTime2), N'Admin update user', N'{"FirstName":"John","LastName":"Doe","Username":"johndoe","Email":"johndoe@gmail.com","Password":"sifra123","IsAdmin":false,"Id":1009,"IsActive":true,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1077, CAST(N'2021-06-16T10:05:46.1152195' AS DateTime2), N'Admin update user', N'{"FirstName":"John","LastName":"Doe","Username":"johndoe","Email":"johndoe@gmail.com","Password":"sifra123","IsAdmin":false,"Id":1009,"IsActive":true,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1078, CAST(N'2021-06-16T11:06:48.6178441' AS DateTime2), N'Contact through form', N'{"Subject":"test","Content":"Ovo je prvi content madic","SendFrom":"aleksmadic00@gmail.com"}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1079, CAST(N'2021-06-16T11:07:34.1346501' AS DateTime2), N'Contact through form', N'{"Subject":"test","Content":"Ovo je prvi content madic","SendFrom":"aleksmadic00@gmail.com"}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1080, CAST(N'2021-06-16T11:10:31.5766609' AS DateTime2), N'Contact through form', N'{"Subject":"test","Content":"Ovo je prvi content madic","SendFrom":"aleksmadic00@gmail.com"}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1081, CAST(N'2021-06-16T11:16:15.9861975' AS DateTime2), N'Contact through form', N'{"Subject":"test","Content":"Ovo je prvi content madic","SendFrom":"aleksmadic00@gmail.com"}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1082, CAST(N'2021-06-17T05:19:41.1735709' AS DateTime2), N'User Registration', N'{"FirstName":"Blake","LastName":"Smith","Username":"blake","Email":"blake@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1083, CAST(N'2021-06-17T05:24:11.2941662' AS DateTime2), N'Create Post', N'{"Title":null,"Content":null,"MainImg":null,"Image":null,"UserId":0,"CategoryId":0}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1084, CAST(N'2021-06-17T05:24:49.5609084' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":1}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1085, CAST(N'2021-06-17T05:25:07.2082896' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":1}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1086, CAST(N'2021-06-17T05:27:02.0047805' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":1}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1087, CAST(N'2021-06-17T05:30:25.2382495' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":1}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1088, CAST(N'2021-06-17T05:31:33.4500717' AS DateTime2), N'Get one post', N'21', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1089, CAST(N'2021-06-17T05:31:46.0705145' AS DateTime2), N'Get one post', N'21', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1090, CAST(N'2021-06-17T05:32:19.2916173' AS DateTime2), N'Get one post', N'21', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1091, CAST(N'2021-06-17T05:33:44.2715044' AS DateTime2), N'Get categories', N'{"Name":null,"PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1092, CAST(N'2021-06-17T05:34:24.8757731' AS DateTime2), N'Get categories', N'{"Name":null,"PerPage":10,"Page":1}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1093, CAST(N'2021-06-17T05:34:38.2619259' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1094, CAST(N'2021-06-17T05:34:48.8455521' AS DateTime2), N'Get one comment', N'1002', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1095, CAST(N'2021-06-17T05:35:04.9694202' AS DateTime2), N'Get one category', N'3', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1096, CAST(N'2021-06-17T05:35:12.8391662' AS DateTime2), N'Get one category', N'3', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1097, CAST(N'2021-06-17T05:35:56.3262440' AS DateTime2), N'Get one category', N'3', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1098, CAST(N'2021-06-17T05:38:10.5589543' AS DateTime2), N'Get one category', N'3', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1099, CAST(N'2021-06-17T05:38:32.3679760' AS DateTime2), N'Get one comment', N'1003', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1100, CAST(N'2021-06-17T05:38:42.3299607' AS DateTime2), N'Get one comment', N'1003', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1101, CAST(N'2021-06-17T05:39:04.9704549' AS DateTime2), N'Get one comment', N'1003', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1102, CAST(N'2021-06-17T05:39:30.2984805' AS DateTime2), N'Get one comment', N'1005', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1103, CAST(N'2021-06-17T05:40:11.3368240' AS DateTime2), N'Get one comment', N'1003', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1104, CAST(N'2021-06-17T05:40:29.5659471' AS DateTime2), N'Get one comment', N'1005', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1105, CAST(N'2021-06-17T05:40:43.8509588' AS DateTime2), N'Get post ratings', N'{"PostId":0,"UserId":0,"PerPage":10,"Page":1}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1106, CAST(N'2021-06-17T05:41:24.3382945' AS DateTime2), N'Get post ratings', N'{"PostId":0,"UserId":0,"PerPage":10,"Page":1}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1107, CAST(N'2021-06-17T05:42:06.3225108' AS DateTime2), N'Get post ratings', N'{"PostId":0,"UserId":0,"PerPage":10,"Page":1}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1108, CAST(N'2021-06-17T06:11:02.9127980' AS DateTime2), N'Get post ratings', N'{"PostId":0,"UserId":0,"PerPage":10,"Page":1}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1109, CAST(N'2021-06-17T06:11:28.4955773' AS DateTime2), N'Get post ratings', N'{"PostId":0,"UserId":0,"PerPage":10,"Page":1}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1110, CAST(N'2021-06-17T06:14:39.2054740' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1111, CAST(N'2021-06-17T06:15:06.8758148' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1112, CAST(N'2021-06-17T06:16:07.5020555' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1113, CAST(N'2021-06-17T06:22:07.1711400' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":"0001-01-01T00:00:00","DateFrom":"0001-01-01T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1114, CAST(N'2021-06-17T06:24:22.8756758' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":null,"DateFrom":null,"PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1115, CAST(N'2021-06-17T06:24:43.2352203' AS DateTime2), N'Get post ratings', N'{"PostId":null,"UserId":null,"PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1116, CAST(N'2021-06-17T15:15:34.7306470' AS DateTime2), N'Get post ratings', N'{"PostId":null,"UserId":null,"PerPage":10,"Page":1}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1117, CAST(N'2021-06-17T15:15:59.8923404' AS DateTime2), N'User Registration', N'{"FirstName":"John","LastName":"Doe","Username":"johndoe","Email":"johndoe@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1118, CAST(N'2021-06-17T15:16:33.2558865' AS DateTime2), N'User Registration', N'{"FirstName":"Mike","LastName":"Amiri","Username":"mike","Email":"mikeamiri@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1119, CAST(N'2021-06-17T15:16:48.3617619' AS DateTime2), N'Get categories', N'{"Name":null,"PerPage":10,"Page":1}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1120, CAST(N'2021-06-17T15:17:10.8369753' AS DateTime2), N'Get categories', N'{"Name":null,"PerPage":10,"Page":1}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1121, CAST(N'2021-06-17T15:17:26.1421724' AS DateTime2), N'Get one category', N'3', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1122, CAST(N'2021-06-17T15:17:41.4555693' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":1}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1123, CAST(N'2021-06-17T15:17:58.6482419' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":3}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1124, CAST(N'2021-06-17T15:18:11.8098405' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":4}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1125, CAST(N'2021-06-17T15:18:28.7292838' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":5}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1126, CAST(N'2021-06-17T15:18:42.6193247' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":6}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1127, CAST(N'2021-06-17T15:19:28.6702349' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1128, CAST(N'2021-06-17T15:23:22.2636496' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1129, CAST(N'2021-06-17T15:23:47.8944057' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1130, CAST(N'2021-06-17T15:24:20.8440658' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1131, CAST(N'2021-06-17T15:25:52.9210316' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1132, CAST(N'2021-06-17T15:27:34.7032819' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1133, CAST(N'2021-06-17T15:28:19.2070701' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1134, CAST(N'2021-06-17T15:28:38.6486705' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1135, CAST(N'2021-06-17T15:28:54.3083937' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1136, CAST(N'2021-06-17T15:29:06.5954581' AS DateTime2), N'Get Comments', N'{"UserId":null,"PostId":null,"ParentId":null,"PerPage":10,"Page":1}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1137, CAST(N'2021-06-17T15:29:16.2734849' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1138, CAST(N'2021-06-17T15:58:04.4896971' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1139, CAST(N'2021-06-17T15:58:29.5501739' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1140, CAST(N'2021-06-17T15:59:05.8820072' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1141, CAST(N'2021-06-17T16:00:08.8760821' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1142, CAST(N'2021-06-17T16:01:16.3434112' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1143, CAST(N'2021-06-17T16:04:16.5142148' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1144, CAST(N'2021-06-17T16:24:46.0176492' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":25,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1145, CAST(N'2021-06-17T16:25:08.5757260' AS DateTime2), N'Create new comment ef', N'{"Text":"ovo je prvi child komentar na 1005","PostId":23,"UserId":0,"ParentId":1005,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1146, CAST(N'2021-06-17T16:25:26.4632284' AS DateTime2), N'Get one comment', N'1005', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1147, CAST(N'2021-06-17T16:26:25.4247336' AS DateTime2), N'Create post rating', N'{"Rating":4,"PostId":25,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1148, CAST(N'2021-06-17T16:38:23.9653812' AS DateTime2), N'Create Post', N'{"Title":"novi post","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"kdm box.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"kdm box.PNG\""],"Content-Type":["image/png"]},"Length":213541,"Name":"image","FileName":"kdm box.PNG"},"UserId":0,"CategoryId":4,"PostTags":[]}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1149, CAST(N'2021-06-17T16:39:06.2867285' AS DateTime2), N'Create Post', N'{"Title":"novi post","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"kdm box.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"kdm box.PNG\""],"Content-Type":["image/png"]},"Length":213541,"Name":"image","FileName":"kdm box.PNG"},"UserId":0,"CategoryId":4,"PostTags":[]}', N'alemadic', 1, NULL)
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1150, CAST(N'2021-06-17T16:41:01.4188283' AS DateTime2), N'Create Post', N'{"Title":"novi post","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"kdm box.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"kdm box.PNG\""],"Content-Type":["image/png"]},"Length":213541,"Name":"image","FileName":"kdm box.PNG"},"UserId":0,"CategoryId":4,"PostTags":[]}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1151, CAST(N'2021-06-17T16:51:53.3155195' AS DateTime2), N'Create Post', N'{"Title":"novi post","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"kdm box.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"kdm box.PNG\""],"Content-Type":["image/png"]},"Length":213541,"Name":"image","FileName":"kdm box.PNG"},"UserId":0,"CategoryId":4,"PostTags":[]}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1152, CAST(N'2021-06-17T16:52:29.3726205' AS DateTime2), N'Create Post', N'{"Title":"novi post","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"kdm box.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"kdm box.PNG\""],"Content-Type":["image/png"]},"Length":213541,"Name":"image","FileName":"kdm box.PNG"},"UserId":0,"CategoryId":4,"PostTags":[3,5]}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1153, CAST(N'2021-06-17T16:56:00.1272696' AS DateTime2), N'Create Post', N'{"Title":"novi post","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":{"ContentDisposition":"form-data; name=\"image\"; filename=\"kdm box.PNG\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"image\"; filename=\"kdm box.PNG\""],"Content-Type":["image/png"]},"Length":213541,"Name":"image","FileName":"kdm box.PNG"},"UserId":0,"CategoryId":4,"PostTags":[3,5]}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1154, CAST(N'2021-06-17T17:05:43.4520112' AS DateTime2), N'Update post', N'{"Title":"novi post v2","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"UserId":0,"CategoryId":4,"Ratings":[],"CategoryName":null,"PostTags":[],"Comments":[],"AverageRating":0.0,"Id":1002,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1155, CAST(N'2021-06-17T17:10:20.5405766' AS DateTime2), N'Update post', N'{"Id":1002,"Title":"novi post v2","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":null,"UserId":0,"CategoryId":4,"PostTags":[3,5,100032]}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1156, CAST(N'2021-06-17T17:11:43.9407791' AS DateTime2), N'Update post', N'{"Id":1002,"Title":"novi post v2","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":null,"UserId":0,"CategoryId":4,"PostTags":[3,5,100032]}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1157, CAST(N'2021-06-17T17:12:12.3844738' AS DateTime2), N'Update post', N'{"Id":1002,"Title":"novi post v2","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":null,"UserId":0,"CategoryId":4,"PostTags":[3,5,23]}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1158, CAST(N'2021-06-17T17:14:12.5273858' AS DateTime2), N'Update post', N'{"Id":1002,"Title":"novi post v2","Content":"ASJD ASJDgdashdgashgas hdasgdhasgh","MainImg":null,"Image":null,"UserId":0,"CategoryId":4,"PostTags":[3,5,23]}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1159, CAST(N'2021-06-17T17:16:25.2405141' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":null,"DateFrom":null,"PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1160, CAST(N'2021-06-17T17:17:34.4723045' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":null,"DateFrom":"2021-06-10T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1161, CAST(N'2021-06-17T17:18:22.8077588' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":null,"DateFrom":"2021-06-10T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1162, CAST(N'2021-06-17T17:19:15.9969788' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":null,"DateFrom":"2021-06-17T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1163, CAST(N'2021-06-17T17:20:15.7460826' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":null,"DateFrom":"2021-06-16T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1164, CAST(N'2021-06-17T17:25:14.0494264' AS DateTime2), N'Get use case logs', N'{"User":"1011","UseCaseName":null,"DateTo":null,"DateFrom":"2021-06-16T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1165, CAST(N'2021-06-17T17:25:23.9503300' AS DateTime2), N'Get use case logs', N'{"User":"1011","UseCaseName":null,"DateTo":null,"DateFrom":"2021-06-16T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1166, CAST(N'2021-06-17T17:25:39.1145686' AS DateTime2), N'Get use case logs', N'{"User":"1011","UseCaseName":null,"DateTo":null,"DateFrom":null,"PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1167, CAST(N'2021-06-17T17:27:11.7144700' AS DateTime2), N'Get use case logs', N'{"User":"1011","UseCaseName":null,"DateTo":null,"DateFrom":null,"PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1168, CAST(N'2021-06-17T17:27:25.7224337' AS DateTime2), N'Get use case logs', N'{"User":null,"UseCaseName":null,"DateTo":null,"DateFrom":"2021-06-16T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1169, CAST(N'2021-06-17T17:28:49.1243370' AS DateTime2), N'Get use case logs', N'{"User":"mike","UseCaseName":null,"DateTo":null,"DateFrom":"2021-06-16T00:00:00","PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1170, CAST(N'2021-06-17T17:30:36.6154463' AS DateTime2), N'Get categories', N'{"Name":"spo","PerPage":10,"Page":1}', N'Unregistred user', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1171, CAST(N'2021-06-17T17:30:48.6860747' AS DateTime2), N'Get categories', N'{"Name":"spo","PerPage":10,"Page":1}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1172, CAST(N'2021-06-17T17:32:36.7868223' AS DateTime2), N'Get tags', N'{"Name":"ab","PerPage":10,"Page":1}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1173, CAST(N'2021-06-17T17:32:43.3697397' AS DateTime2), N'Get tags', N'{"Name":"ab","PerPage":10,"Page":1}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1174, CAST(N'2021-06-17T17:33:48.2856053' AS DateTime2), N'Get tags', N'{"Name":"ab","PerPage":10,"Page":1}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1175, CAST(N'2021-06-17T17:34:00.6179601' AS DateTime2), N'Get tags', N'{"Name":"a","PerPage":10,"Page":1}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1176, CAST(N'2021-06-17T17:47:18.1144013' AS DateTime2), N'Create new comment ef', N'{"Text":"Ovo je prvi komentar","PostId":62,"UserId":0,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1177, CAST(N'2021-06-17T17:48:03.5184846' AS DateTime2), N'Create new comment ef', N'{"Text":"Ovo je prvi child komentar","PostId":62,"UserId":0,"ParentId":1014,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1178, CAST(N'2021-06-17T17:48:25.1274267' AS DateTime2), N'Create new comment ef', N'{"Text":"Ovo je drugi komentar","PostId":63,"UserId":0,"ParentId":null,"ChildrenComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1179, CAST(N'2021-06-17T17:48:58.2599914' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'mike', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1180, CAST(N'2021-06-17T17:49:56.7282418' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1181, CAST(N'2021-06-17T17:50:42.3571917' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":63,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1182, CAST(N'2021-06-17T17:54:32.0799796' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1183, CAST(N'2021-06-17T17:55:15.9454669' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1184, CAST(N'2021-06-17T17:55:26.9032644' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1185, CAST(N'2021-06-17T17:56:24.4519249' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1186, CAST(N'2021-06-17T17:59:08.4613908' AS DateTime2), N'Create post rating', N'{"Rating":5,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1187, CAST(N'2021-06-17T18:01:22.8028865' AS DateTime2), N'Create post rating', N'{"Rating":3,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1188, CAST(N'2021-06-17T18:04:09.2992475' AS DateTime2), N'Create post rating', N'{"Rating":3,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1189, CAST(N'2021-06-17T18:04:57.3572086' AS DateTime2), N'Create post rating', N'{"Rating":3,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1190, CAST(N'2021-06-17T18:05:17.7550639' AS DateTime2), N'Create post rating', N'{"Rating":3,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1191, CAST(N'2021-06-17T18:06:09.7731197' AS DateTime2), N'Create post rating', N'{"Rating":3,"PostId":62,"UserId":0,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1192, CAST(N'2021-06-19T11:44:25.2852050' AS DateTime2), N'Get users', N'{"Keyword":null,"PerPage":10,"Page":1}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1193, CAST(N'2021-06-19T11:46:09.6672386' AS DateTime2), N'Admin create User', N'{"FirstName":"Pera","LastName":"Peric","Username":"pera","Email":"peraperic@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1194, CAST(N'2021-06-19T11:46:35.9747622' AS DateTime2), N'Get one user', N'1012', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1195, CAST(N'2021-06-19T11:49:42.6865027' AS DateTime2), N'Admin delete user', N'1012', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1196, CAST(N'2021-06-19T11:52:26.3219845' AS DateTime2), N'Admin update user', N'{"FirstName":"Pera","LastName":"Peric","Username":"pera","Email":"peraperic@gmail.com","Password":"sifra123","IsAdmin":false,"IsActive":true,"Id":1012,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', N'alemadic', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1197, CAST(N'2021-06-19T11:53:41.6131972' AS DateTime2), N'Get post ratings', N'{"PostId":null,"UserId":null,"PerPage":10,"Page":1}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1198, CAST(N'2021-06-19T14:12:36.3596908' AS DateTime2), N'Create Post', N'{"Id":null,"Title":null,"Content":null,"MainImg":null,"Image":null,"UserId":0,"CategoryId":0,"PostTags":[]}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1199, CAST(N'2021-06-19T14:12:57.9146920' AS DateTime2), N'Create Post', N'{"Id":null,"Title":null,"Content":null,"MainImg":null,"Image":null,"UserId":0,"CategoryId":0,"PostTags":[]}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1200, CAST(N'2021-06-19T14:14:32.7768732' AS DateTime2), N'Create Post', N'{"Id":null,"Title":null,"Content":null,"MainImg":null,"Image":null,"UserId":0,"CategoryId":0,"PostTags":[]}', N'blake', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1201, CAST(N'2021-06-19T14:15:03.2205710' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":1}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1202, CAST(N'2021-06-19T14:15:14.9373300' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":3}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1203, CAST(N'2021-06-19T14:15:41.2407042' AS DateTime2), N'Get Posts', N'{"Keyword":"as","CategoryId":null,"PerPage":10,"Page":3}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1204, CAST(N'2021-06-19T14:15:50.1894745' AS DateTime2), N'Get Posts', N'{"Keyword":"as","CategoryId":null,"PerPage":10,"Page":3}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1205, CAST(N'2021-06-19T14:16:01.5727165' AS DateTime2), N'Get Posts', N'{"Keyword":"as","CategoryId":null,"PerPage":10,"Page":1}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1206, CAST(N'2021-06-19T14:16:52.0643489' AS DateTime2), N'Get Posts', N'{"Keyword":null,"CategoryId":null,"PerPage":10,"Page":1}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1207, CAST(N'2021-06-19T14:17:13.1178930' AS DateTime2), N'Get Posts', N'{"Keyword":"as","CategoryId":null,"PerPage":10,"Page":1}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1208, CAST(N'2021-06-19T14:20:35.9593808' AS DateTime2), N'Get Posts', N'{"Keyword":"as","CategoryId":null,"PerPage":10,"Page":1}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1209, CAST(N'2021-06-19T14:21:45.4207994' AS DateTime2), N'Get Posts', N'{"Keyword":"as","CategoryId":null,"PerPage":10,"Page":1}', N'pera', 1, NULL)
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [UseCaseName], [Data], [Actor], [IsActive], [UpdatedAt]) VALUES (1210, CAST(N'2021-06-19T14:31:43.7103307' AS DateTime2), N'Get Posts', N'{"Keyword":"as","CategoryId":null,"PerPage":10,"Page":1}', N'pera', 1, NULL)
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Username], [IsActive], [CreatedAt], [UpdatedAt], [IsAdmin]) VALUES (6, N'Ale', N'Madic', N'info@alemadic.com', N'$2a$11$gqqdO65gFcPsT3ZHkOMev.b/3gSyNBvLFF2oqpkR5YBc/cWJDySnW', N'alemadic', 1, CAST(N'2021-06-10T09:49:37.8692203' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Username], [IsActive], [CreatedAt], [UpdatedAt], [IsAdmin]) VALUES (7, N'Laza', N'Lazic', N'lazic@gmail.com', N'$2a$11$yYFSHLaq1Tu6sMJgKnTaCevMD2ntMcl8T/wjoIKrncy8DGaDxhGV.', N'lazalazic', 1, CAST(N'2021-06-10T09:50:17.7726871' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Username], [IsActive], [CreatedAt], [UpdatedAt], [IsAdmin]) VALUES (8, N'Mika', N'Mikic', N'mikic@gmail.com', N'$2a$11$P9dSyIpv2DSs11OW.KytpOkRA9BmkUzRfzohSoaprt.VLAuBnCp.e', N'mikamikic', 1, CAST(N'2021-06-10T09:50:37.8396134' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Username], [IsActive], [CreatedAt], [UpdatedAt], [IsAdmin]) VALUES (9, N'Pink', N'Panter', N'panter@gmail.com', N'$2a$11$Q6qMfXDTgwyqADGEK9bIIe1Cg2ZB6ye/UXa0jx3ymKg8KoBnGnR8.', N'panter', 1, CAST(N'2021-06-10T09:50:54.9985508' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Username], [IsActive], [CreatedAt], [UpdatedAt], [IsAdmin]) VALUES (10, N'Zika', N'Zikic', N'zikic@gmail.com', N'$2a$11$yxpo/vFdD/jIm6Zn6ePepeM4pq.gI90Zkg1VZLd44jldJnXYwN05S', N'zika', 1, CAST(N'2021-06-10T09:51:23.1136067' AS DateTime2), NULL, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Username], [IsActive], [CreatedAt], [UpdatedAt], [IsAdmin]) VALUES (1009, N'John', N'Doe', N'johndoe@gmail.com', N'$2a$11$FrB0Sp0eZQ5GA/HVxG36mOdWTb7a1RmGVN8iLzyKRCziK9M1/rSs2', N'johndoe', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-16T10:05:53.8947508' AS DateTime2), 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Username], [IsActive], [CreatedAt], [UpdatedAt], [IsAdmin]) VALUES (1010, N'Blake', N'Smith', N'blake@gmail.com', N'$2a$11$df78npFDDJcJ4O32aQu4duyzVjbjkY.z3XffkKHpymPsbeeZI/vU6', N'blake', 1, CAST(N'2021-06-17T05:20:05.9778720' AS DateTime2), NULL, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Username], [IsActive], [CreatedAt], [UpdatedAt], [IsAdmin]) VALUES (1011, N'Mike', N'Amiri', N'mikeamiri@gmail.com', N'$2a$11$83WPL88awPQ43c1rTPOcQuLLYhGaiJO2aXwVCLQKM7EbK6TCAS5Y.', N'mike', 1, CAST(N'2021-06-17T15:16:35.9048150' AS DateTime2), NULL, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Username], [IsActive], [CreatedAt], [UpdatedAt], [IsAdmin]) VALUES (1012, N'Pera', N'Peric', N'peraperic@gmail.com', N'$2a$11$WKvw9NNHAKZHNTGroYem9eT/1tniZrsyJH14VEzAx/9VdlkSqhU5S', N'pera', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-19T11:52:34.8255611' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (20, 10, 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (21, 10, 29, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (22, 10, 27, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (23, 10, 28, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (24, 10, 26, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (25, 10, 20, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (26, 10, 19, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (27, 10, 17, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (28, 10, 30, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (29, 10, 18, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (30, 10, 15, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (31, 10, 14, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (32, 10, 10, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (33, 10, 9, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (34, 10, 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (35, 10, 4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (36, 10, 3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (37, 10, 16, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (38, 10, 51, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1058, 1009, 2, CAST(N'2021-06-16T08:57:39.0477982' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1059, 1009, 30, CAST(N'2021-06-16T08:57:39.0478036' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1060, 1009, 29, CAST(N'2021-06-16T08:57:39.0478032' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1061, 1009, 27, CAST(N'2021-06-16T08:57:39.0478029' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1062, 1009, 28, CAST(N'2021-06-16T08:57:39.0478026' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1063, 1009, 26, CAST(N'2021-06-16T08:57:39.0478022' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1064, 1009, 20, CAST(N'2021-06-16T08:57:39.0478019' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1065, 1009, 19, CAST(N'2021-06-16T08:57:39.0478016' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1066, 1009, 17, CAST(N'2021-06-16T08:57:39.0478012' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1067, 1009, 18, CAST(N'2021-06-16T08:57:39.0478009' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1068, 1009, 16, CAST(N'2021-06-16T08:57:39.0478005' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1069, 1009, 15, CAST(N'2021-06-16T08:57:39.0478001' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1070, 1009, 14, CAST(N'2021-06-16T08:57:39.0477998' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1071, 1009, 10, CAST(N'2021-06-16T08:57:39.0477993' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1072, 1009, 9, CAST(N'2021-06-16T08:57:39.0477990' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1073, 1009, 3, CAST(N'2021-06-16T08:57:39.0477986' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1074, 1009, 39, CAST(N'2021-06-16T08:57:39.0478039' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1075, 1009, 40, CAST(N'2021-06-16T08:57:39.0478042' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1076, 1010, 2, CAST(N'2021-06-17T05:20:05.9778747' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1077, 1010, 39, CAST(N'2021-06-17T05:20:05.9778821' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1078, 1010, 30, CAST(N'2021-06-17T05:20:05.9778816' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1079, 1010, 29, CAST(N'2021-06-17T05:20:05.9778812' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1080, 1010, 27, CAST(N'2021-06-17T05:20:05.9778807' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1081, 1010, 28, CAST(N'2021-06-17T05:20:05.9778803' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1082, 1010, 26, CAST(N'2021-06-17T05:20:05.9778798' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1083, 1010, 20, CAST(N'2021-06-17T05:20:05.9778794' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1084, 1010, 40, CAST(N'2021-06-17T05:20:05.9778825' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1085, 1010, 19, CAST(N'2021-06-17T05:20:05.9778789' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1086, 1010, 18, CAST(N'2021-06-17T05:20:05.9778780' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1087, 1010, 16, CAST(N'2021-06-17T05:20:05.9778775' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1088, 1010, 15, CAST(N'2021-06-17T05:20:05.9778771' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1089, 1010, 14, CAST(N'2021-06-17T05:20:05.9778766' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1090, 1010, 10, CAST(N'2021-06-17T05:20:05.9778762' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1091, 1010, 9, CAST(N'2021-06-17T05:20:05.9778757' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1092, 1010, 3, CAST(N'2021-06-17T05:20:05.9778752' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1093, 1010, 17, CAST(N'2021-06-17T05:20:05.9778785' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1094, 1010, 81, CAST(N'2021-06-17T05:20:05.9778830' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1095, 1011, 2, CAST(N'2021-06-17T15:16:35.9048177' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1096, 1011, 39, CAST(N'2021-06-17T15:16:35.9048229' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1097, 1011, 30, CAST(N'2021-06-17T15:16:35.9048226' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1098, 1011, 29, CAST(N'2021-06-17T15:16:35.9048223' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1099, 1011, 27, CAST(N'2021-06-17T15:16:35.9048220' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1100, 1011, 28, CAST(N'2021-06-17T15:16:35.9048216' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1101, 1011, 26, CAST(N'2021-06-17T15:16:35.9048213' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1102, 1011, 20, CAST(N'2021-06-17T15:16:35.9048210' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1103, 1011, 40, CAST(N'2021-06-17T15:16:35.9048232' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1104, 1011, 19, CAST(N'2021-06-17T15:16:35.9048207' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1105, 1011, 18, CAST(N'2021-06-17T15:16:35.9048201' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1106, 1011, 16, CAST(N'2021-06-17T15:16:35.9048198' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1107, 1011, 15, CAST(N'2021-06-17T15:16:35.9048195' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1108, 1011, 14, CAST(N'2021-06-17T15:16:35.9048192' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1109, 1011, 10, CAST(N'2021-06-17T15:16:35.9048189' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1110, 1011, 9, CAST(N'2021-06-17T15:16:35.9048184' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1111, 1011, 3, CAST(N'2021-06-17T15:16:35.9048181' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1112, 1011, 17, CAST(N'2021-06-17T15:16:35.9048204' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1113, 1011, 81, CAST(N'2021-06-17T15:16:35.9048235' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1114, 1012, 2, CAST(N'2021-06-19T11:46:18.7575501' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1115, 1012, 39, CAST(N'2021-06-19T11:46:18.7575565' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1116, 1012, 30, CAST(N'2021-06-19T11:46:18.7575561' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1117, 1012, 29, CAST(N'2021-06-19T11:46:18.7575557' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1118, 1012, 27, CAST(N'2021-06-19T11:46:18.7575553' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1119, 1012, 28, CAST(N'2021-06-19T11:46:18.7575549' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1120, 1012, 26, CAST(N'2021-06-19T11:46:18.7575545' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1121, 1012, 20, CAST(N'2021-06-19T11:46:18.7575541' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1122, 1012, 40, CAST(N'2021-06-19T11:46:18.7575569' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1123, 1012, 19, CAST(N'2021-06-19T11:46:18.7575537' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1124, 1012, 18, CAST(N'2021-06-19T11:46:18.7575529' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1125, 1012, 16, CAST(N'2021-06-19T11:46:18.7575526' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1126, 1012, 15, CAST(N'2021-06-19T11:46:18.7575521' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1127, 1012, 14, CAST(N'2021-06-19T11:46:18.7575518' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1128, 1012, 10, CAST(N'2021-06-19T11:46:18.7575514' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1129, 1012, 9, CAST(N'2021-06-19T11:46:18.7575510' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1130, 1012, 3, CAST(N'2021-06-19T11:46:18.7575506' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1131, 1012, 17, CAST(N'2021-06-19T11:46:18.7575533' AS DateTime2), 1, NULL)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId], [CreatedAt], [IsActive], [UpdatedAt]) VALUES (1132, 1012, 81, CAST(N'2021-06-19T11:46:18.7575573' AS DateTime2), 1, NULL)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_ParentId]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_ParentId] ON [dbo].[Comments]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_PostId]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_PostId] ON [dbo].[Comments]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostRatings_PostId]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostRatings_PostId] ON [dbo].[PostRatings]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostRatings_UserId]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostRatings_UserId] ON [dbo].[PostRatings]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_CategoryId]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_CategoryId] ON [dbo].[Posts]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostTags_TagId]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostTags_TagId] ON [dbo].[PostTags]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)
WHERE ([Username] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 19-Jun-21 4:33:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UseCaseLogs] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[UserUseCases] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[UserUseCases] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comments_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Comments_ParentId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[PostRatings]  WITH CHECK ADD  CONSTRAINT [FK_PostRatings_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostRatings] CHECK CONSTRAINT [FK_PostRatings_Posts_PostId]
GO
ALTER TABLE [dbo].[PostRatings]  WITH CHECK ADD  CONSTRAINT [FK_PostRatings_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostRatings] CHECK CONSTRAINT [FK_PostRatings_Users_UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Posts_PostId]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tags_TagId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [news_blog] SET  READ_WRITE 
GO
