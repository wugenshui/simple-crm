USE [CRM]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2018/5/5 13:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Owner] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Website] [nvarchar](100) NULL,
	[CreateTime] [date] NULL,
	[BusinessLicence] [nvarchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2018/5/5 13:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerType] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerPhone] [nvarchar](50) NULL,
	[CustomerQQ] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Idcard] [nvarchar](50) NULL,
	[HomeAddress] [nvarchar](50) NULL,
	[Owner] [nvarchar](50) NULL,
	[Contract] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[CreaterId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerOperate]    Script Date: 2018/5/5 13:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerOperate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [varchar](50) NULL,
	[OperatorId] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Remark] [varchar](250) NULL,
	[OperatorTime] [datetime] NULL,
 CONSTRAINT [PK_CustomerLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2018/5/5 13:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MenuUrl] [nvarchar](50) NOT NULL,
	[MenuId] [nvarchar](50) NOT NULL,
	[MenuPid] [nvarchar](50) NOT NULL,
	[Class] [nvarchar](50) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2018/5/5 13:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NULL,
	[ReceiverId] [int] NULL,
	[Subject] [nvarchar](50) NULL,
	[Content] [text] NULL,
	[SendTime] [datetime] NULL,
	[State] [int] NULL,
	[Num] [nvarchar](50) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2018/5/5 13:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Detail] [text] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_MyRiCheng] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 2018/5/5 13:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Leader] [nvarchar](50) NOT NULL,
	[LeaderPhone] [nvarchar](50) NOT NULL,
	[Slogan] [nvarchar](50) NOT NULL,
	[CompanyId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2018/5/5 13:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[LoginName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
	[Post] [nvarchar](50) NULL,
	[Supervisor] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[WorkStartDate] [date] NULL,
	[Photo] [image] NULL,
	[State] [int] NOT NULL,
	[IsEnable] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAuthority]    Script Date: 2018/5/5 13:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAuthority](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[MenuId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserAuthority] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkLog]    Script Date: 2018/5/5 13:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [text] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_WorkLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [CompanyName], [Owner], [Phone], [Website], [CreateTime], [BusinessLicence]) VALUES (1, N'爱国者12', N'辰辰', N'07138150052', N'http://www.com.com.cn', CAST(N'2015-04-30' AS Date), N'asd123')
INSERT [dbo].[Company] ([Id], [CompanyName], [Owner], [Phone], [Website], [CreateTime], [BusinessLicence]) VALUES (2, N'A', N'A21', N'A', N'http://www.com.com.cn', CAST(N'2015-05-01' AS Date), N'A')
INSERT [dbo].[Company] ([Id], [CompanyName], [Owner], [Phone], [Website], [CreateTime], [BusinessLicence]) VALUES (3, N'总公司', N'小砸', N' 0713 815 0052', N' www.ww.ww', CAST(N'2015-05-19' AS Date), N' 11111')
INSERT [dbo].[Company] ([Id], [CompanyName], [Owner], [Phone], [Website], [CreateTime], [BusinessLicence]) VALUES (4, N'teamA', N'11', N'0713 815 0052', N'www', CAST(N'2015-04-22' AS Date), N'11111')
INSERT [dbo].[Company] ([Id], [CompanyName], [Owner], [Phone], [Website], [CreateTime], [BusinessLicence]) VALUES (5, N'A1', N'A2', N'A3', N'111', CAST(N'2015-01-01' AS Date), N'123')
INSERT [dbo].[Company] ([Id], [CompanyName], [Owner], [Phone], [Website], [CreateTime], [BusinessLicence]) VALUES (6, N'teamB', N'11', N'0713 815 0052', N'Mr.', CAST(N'2015-04-22' AS Date), N'11111')
INSERT [dbo].[Company] ([Id], [CompanyName], [Owner], [Phone], [Website], [CreateTime], [BusinessLicence]) VALUES (7, N'分公司A', N'三', N'11', N'www', CAST(N'2015-04-22' AS Date), N'111')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(1 AS Numeric(18, 0)), N'客户单子', N'A', N'07138150052', N'11111', N'123@123.com', N'1212121', N'111111111111', N'A', N'', N'new', CAST(N'2015-04-23T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(2 AS Numeric(18, 0)), N'客户单子', N'A', N'07138150052', N'11111', N'123@123.com', N'1212121', N'111111111111', N'A', N'', N'new', CAST(N'2015-04-23T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(3 AS Numeric(18, 0)), N'员工单子', N'1', N'07138150052', N'11111', N'123@123.com', N'1212121', N'111111111111', N'A', N'', N'queren', CAST(N'2015-04-23T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(4 AS Numeric(18, 0)), N'商家单子', N'张三', N'400220220', N'2222365', N'aaa@163.com', N'1212121212', N'北京市地安门xx大街', N'B', N'', N'已作废', CAST(N'2015-05-02T23:45:31.837' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(5 AS Numeric(18, 0)), N'商城单子', N'客户1', N'123123', N'2222365222', N'aaa@163.com', N'1212121212', N'北京市地安门xx大街111', N'B', N'', N'已完成', CAST(N'2015-05-03T11:22:25.400' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(6 AS Numeric(18, 0)), N'客户单子', N'A', N'123123', N'SSS', N'123@123.com', N'1212121', N'北京市地安门xx大街', N'C', N'', N'已分配', CAST(N'2015-05-03T15:36:48.773' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(7 AS Numeric(18, 0)), N'客户单子', N'A', N'123123', N'SSS', N'123@123.com', N'1212121', N'北京市地安门xx大街', N'C', N'', N'已分配', CAST(N'2015-05-03T15:37:00.320' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(8 AS Numeric(18, 0)), N'客户单子', N'客户7', N'123123', N'2222365222', N'aaa1111@163.com', N'12121212121111', N'北京市地安门xx大街111', N'B', N'', N'已完成', CAST(N'2015-05-03T22:28:23.080' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(9 AS Numeric(18, 0)), N'客户单子', N'酷虎', N'123123111', N'2222365222', N'123@123.com', N'12121212121111', N'北京市地安门xx大街111', N'C', N'', N'已确认', CAST(N'2015-05-03T22:32:28.903' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(10 AS Numeric(18, 0)), N'员工单子', N'cust1', N'12580111', N'121212', N'111@111.com', N'1112223433', N'地址1', N't1', N'4519R631L20.xlsx', N'未确认', CAST(N'2015-05-11T14:17:59.643' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(20013 AS Numeric(18, 0)), N'客户单子', N'9', N'9', N'9', N'9', N'9', N'9', N'1', N'', N'未确认', CAST(N'2015-05-24T10:53:53.267' AS DateTime), N'1')
INSERT [dbo].[Customer] ([Id], [CustomerType], [CustomerName], [CustomerPhone], [CustomerQQ], [Mail], [Idcard], [HomeAddress], [Owner], [Contract], [State], [CreateTime], [CreaterId]) VALUES (CAST(20014 AS Numeric(18, 0)), N'客户单子', N'90', N'1', N'0', N'0', N'0', N'0', N'1', N'', N'未确认', CAST(N'2015-05-24T10:55:05.493' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerOperate] ON 

INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (1, N'2', N'1', N'zuofei', N'223', CAST(N'2015-05-02T10:34:15.827' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (2, N'3', N'1', N'zuofei', N'23', CAST(N'2015-05-02T10:35:11.420' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (3, N'3', N'1', N'zuofei', N'36', CAST(N'2015-05-02T10:36:29.873' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (4, N'3', N'1', N'genjin', N'11', CAST(N'2015-05-02T10:37:33.037' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (5, N'3', N'1', N'zuofei', N'111', CAST(N'2015-05-02T10:37:47.763' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (6, N'3', N'1', N'queren', N'', CAST(N'2015-05-02T11:21:02.880' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (7, N'4', N'1', N'已确认', N'', CAST(N'2015-05-03T00:26:52.637' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (8, N'4', N'1', N'已作废', N'', CAST(N'2015-05-03T11:10:25.780' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (9, N'5', N'1', N'已分配', N'', CAST(N'2015-05-03T11:23:00.470' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (10, N'8', N'1', N'已确认', N'', CAST(N'2015-05-03T22:38:11.490' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (11, N'9', N'1', N'已确认', N'', CAST(N'2015-05-03T22:41:48.917' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (12, N'8', N'1', N'已分配', N'', CAST(N'2015-05-03T22:45:53.190' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (13, N'8', N'1', N'已完成', N'121212', CAST(N'2015-05-04T00:13:42.280' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (14, N'5', N'1', N'已完成2', N'223', CAST(N'2015-05-04T00:26:52.653' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (15, N'8', N'1', N'回访', N'已回访', CAST(N'2015-05-04T06:46:25.547' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (16, N'7', N'1', N'已分配', N'', CAST(N'2015-05-11T17:54:00.807' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (17, N'20014', N'1', N'已添加', N' ', CAST(N'2015-05-24T10:55:05.507' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (18, N'6', N'1', N'已分配回访', N'11', CAST(N'2015-05-25T09:38:48.407' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (19, N'', N'1', N'暂不联系', N'', CAST(N'2015-05-25T12:38:18.160' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (20, N'', N'1', N'暂不联系', N'', CAST(N'2015-05-25T12:38:20.713' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (21, N' 5 ', N'1', N'暂不联系', N'1111', CAST(N'2015-05-25T20:45:43.020' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (22, N' 5 ', N'1', N'暂不联系', N'111', CAST(N'2015-05-25T20:54:04.980' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (23, N'5', N'1', N'已确认', N'', CAST(N'2015-05-03T11:22:41.830' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (24, N'6', N'1', N'已确认', N'', CAST(N'2015-05-03T15:48:30.970' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (25, N'5', N'1', N'已联系', N'222', CAST(N'2015-05-03T23:27:22.597' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (26, N'8', N'1', N'已联系', N'123123', CAST(N'2015-05-03T23:30:10.840' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (27, N'5', N'1', N'已完成', N'2222', CAST(N'2015-05-04T00:13:36.753' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (28, N'5', N'1', N'已完成2', N'222', CAST(N'2015-05-04T00:27:09.127' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (29, N'8', N'1', N'回访', N'已回访', CAST(N'2015-05-04T06:47:53.890' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (30, N'7', N'1', N'已确认', N'', CAST(N'2015-05-04T06:48:46.297' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (31, N'6', N'1', N'回访', N'22', CAST(N'2015-05-04T06:50:15.883' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (32, N'8', N'1', N'已完成回访', N'', CAST(N'2015-05-04T01:02:42.577' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (33, N'6', N'1', N'已分配', N'', CAST(N'2015-05-04T06:48:59.820' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (34, N'6', N'1', N'已分配回访', N'666', CAST(N'2015-05-04T06:49:33.953' AS DateTime))
INSERT [dbo].[CustomerOperate] ([Id], [CustomerId], [OperatorId], [State], [Remark], [OperatorTime]) VALUES (35, N' 2015/5/3 11:22:25 ', N'1', N'暂不联系', N'', CAST(N'2015-05-25T20:40:20.740' AS DateTime))
SET IDENTITY_INSERT [dbo].[CustomerOperate] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (1, N'个人中心', N'#', N'2', N'0', N'./image/default/menu1.png')
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (2, N'修改密码', N'./page/PersonCenter/PasswordChange.aspx', N'2.01', N'2', N'icon icon-pencil')
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (3, N'公司资料', N'./page/PersonCenter/CompanyInfo.aspx', N'2.02', N'2', N'icon icon-signal')
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (4, N'个人资料', N'./page/PersonCenter/UserInfo.aspx', N'2.03', N'2', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (5, N'工作日志', N'./page/PersonCenter/WorkLogList.aspx', N'2.04', N'2', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (6, N'日程管理', N'./page/PersonCenter/Schedule.aspx', N'2.05', N'2', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (7, N'最新通知', N'./page/PersonCenter/HotNews.aspx', N'2.06', N'2', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (8, N'公司团队', N'#', N'3', N'0', N'./image/default/menu2.png')
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (9, N'添加公司', N'./page/Organization/CompanyAdd.aspx', N'3.03', N'3', N'icon icon-fullscreen')
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (10, N'公司列表', N'./page/Organization/CompanyList.aspx', N'3.04', N'3', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (11, N'添加团队', N'./page/Organization/TeamAdd.aspx', N'3.01', N'3', N'icon icon-inbox')
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (12, N'团队列表', N'./page/Organization/TeamList.aspx', N'3.02', N'3', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (13, N'员工管理', N'#', N'4', N'0', N'./image/default/menu3.png')
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (14, N'添加业务人员', N'./page/Employee/EmployeeAdd.aspx', N'4.01', N'4', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (15, N'业务人员列表', N'./page/Employee/EmployeeList.aspx', N'4.02', N'4', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (16, N'设置权限', N'./page/Employee/Authority.aspx', N'4.03', N'4', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (17, N'客户管理', N'#', N'5', N'0', N'./image/default/menu4.png')
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (18, N'添加客户', N'./page/Customer/CustomerAdd.aspx', N'5.01', N'5', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (19, N'客户列表', N'./page/Customer/CustomerList.aspx', N'5.02', N'5', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (20, N'客户回访', N'./page/Customer/CustomerVisit.aspx', N'5.03', N'5', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (21, N'统计报表', N'#', N'6', N'0', N'./image/default/menu4.png')
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (22, N'公司业绩排行榜', N'./page/Report/CompanyRankingList.aspx', N'6.01', N'6', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (23, N'团队业绩排行榜', N'./page/Report/TeamRankingList.aspx', N'6.02', N'6', NULL)
INSERT [dbo].[Menu] ([Id], [MenuName], [MenuUrl], [MenuId], [MenuPid], [Class]) VALUES (24, N'个人业绩排行榜', N'./page/Report/PersonRankingList.aspx', N'6.03', N'6', NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([Id], [SenderId], [ReceiverId], [Subject], [Content], [SendTime], [State], [Num]) VALUES (1004, 1, 2, N'subject1', N'content1', CAST(N'2015-05-13T07:43:27.163' AS DateTime), 0, N'20150513074327')
INSERT [dbo].[Message] ([Id], [SenderId], [ReceiverId], [Subject], [Content], [SendTime], [State], [Num]) VALUES (1005, 1, 2, N'subject2', N'content2!!!!@@@##$%%^^&*()', CAST(N'2015-05-13T07:43:52.757' AS DateTime), 0, N'20150513074352')
INSERT [dbo].[Message] ([Id], [SenderId], [ReceiverId], [Subject], [Content], [SendTime], [State], [Num]) VALUES (1006, 1, 2, N'subject2', N'content2!!!!@@@##$%%^^&*()', CAST(N'2015-05-13T07:43:52.763' AS DateTime), 0, N'20150513074352')
INSERT [dbo].[Message] ([Id], [SenderId], [ReceiverId], [Subject], [Content], [SendTime], [State], [Num]) VALUES (1007, 1, 2, N'回复:subject2', N'content2!!!!@@@##$%%^^&*()', CAST(N'2015-05-13T12:45:12.337' AS DateTime), 0, N'20150513124511')
INSERT [dbo].[Message] ([Id], [SenderId], [ReceiverId], [Subject], [Content], [SendTime], [State], [Num]) VALUES (1008, 1, 2, N'回复:subject2', N'content2!!!!@@@##$%%^^&*()', CAST(N'2015-05-13T12:45:19.090' AS DateTime), 0, N'20150513124519')
INSERT [dbo].[Message] ([Id], [SenderId], [ReceiverId], [Subject], [Content], [SendTime], [State], [Num]) VALUES (1013, 1, 2, N'回复:回复:subject2', N'content2!!!!@@@##$%%^^&*()', CAST(N'2015-05-13T12:58:48.150' AS DateTime), 0, N'20150513125838')
INSERT [dbo].[Message] ([Id], [SenderId], [ReceiverId], [Subject], [Content], [SendTime], [State], [Num]) VALUES (2007, 1, 2, N'', N'', CAST(N'2015-05-16T06:55:12.003' AS DateTime), 0, N'20150516065511')
INSERT [dbo].[Message] ([Id], [SenderId], [ReceiverId], [Subject], [Content], [SendTime], [State], [Num]) VALUES (2008, 1, 2, N'', N'', CAST(N'2015-05-16T06:55:21.320' AS DateTime), 0, N'20150516065521')
INSERT [dbo].[Message] ([Id], [SenderId], [ReceiverId], [Subject], [Content], [SendTime], [State], [Num]) VALUES (2009, 1, 2, N'回复:回复:回复:subject2', N'::::::content2!!!!@@@##$%%^^&*()', CAST(N'2015-05-19T14:51:58.250' AS DateTime), 0, N'20150519025157')
SET IDENTITY_INSERT [dbo].[Message] OFF
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([Id], [Subject], [Time], [Address], [Detail], [UserId], [CreateTime]) VALUES (1, N'开会1', CAST(N'2015-05-16T00:00:00.000' AS DateTime), N'A222', N'1.会有会有<br>2.回忆回忆', 1, CAST(N'2015-05-16T07:43:10.370' AS DateTime))
INSERT [dbo].[Schedule] ([Id], [Subject], [Time], [Address], [Detail], [UserId], [CreateTime]) VALUES (2, N'开会1', CAST(N'2015-05-16T00:00:00.000' AS DateTime), N'A222', N'1.会有会有<br>2.回忆回忆', 1, CAST(N'2015-05-16T07:43:10.370' AS DateTime))
SET IDENTITY_INSERT [dbo].[Schedule] OFF
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([Id], [Name], [Leader], [LeaderPhone], [Slogan], [CompanyId]) VALUES (1, N'teamV', N'ACC', N'07138150052', N'222CC', N'1')
INSERT [dbo].[Team] ([Id], [Name], [Leader], [LeaderPhone], [Slogan], [CompanyId]) VALUES (2, N'teamG', N't1', N'114', N'GGG', N'1')
INSERT [dbo].[Team] ([Id], [Name], [Leader], [LeaderPhone], [Slogan], [CompanyId]) VALUES (3, N'teamC', N'A', N'07138150052', N'222', N'1')
SET IDENTITY_INSERT [dbo].[Team] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [LoginName], [Password], [CompanyId], [TeamId], [Post], [Supervisor], [PhoneNumber], [WorkStartDate], [Photo], [State], [IsEnable]) VALUES (1, N'陈博', N'cb', N'C4CA4238A0B923820DCC509A6F75849B', 1, 1, N'sell', N'2', N'9999', CAST(N'2015-04-13' AS Date), NULL, 0, 1)
INSERT [dbo].[User] ([Id], [UserName], [LoginName], [Password], [CompanyId], [TeamId], [Post], [Supervisor], [PhoneNumber], [WorkStartDate], [Photo], [State], [IsEnable]) VALUES (2, N'A', N'', N'C4CA4238A0B923820DCC509A6F75849B', 1, 1, N'主管', N'A', N'123123', CAST(N'2015-04-16' AS Date), NULL, 0, 1)
INSERT [dbo].[User] ([Id], [UserName], [LoginName], [Password], [CompanyId], [TeamId], [Post], [Supervisor], [PhoneNumber], [WorkStartDate], [Photo], [State], [IsEnable]) VALUES (3, N'B', N'', N'C4CA4238A0B923820DCC509A6F75849B', 1, 1, N'业务', N'C', N'SSS', CAST(N'2015-04-22' AS Date), NULL, 0, 1)
INSERT [dbo].[User] ([Id], [UserName], [LoginName], [Password], [CompanyId], [TeamId], [Post], [Supervisor], [PhoneNumber], [WorkStartDate], [Photo], [State], [IsEnable]) VALUES (4, N'teamA', N'', N'C4CA4238A0B923820DCC509A6F75849B', 1, 1, N'业务', N'A', N'13584918359', CAST(N'2015-04-22' AS Date), NULL, 0, 1)
INSERT [dbo].[User] ([Id], [UserName], [LoginName], [Password], [CompanyId], [TeamId], [Post], [Supervisor], [PhoneNumber], [WorkStartDate], [Photo], [State], [IsEnable]) VALUES (5, N't1', N'', N'C4CA4238A0B923820DCC509A6F75849B', 1, 1, N'业务', N'总公司', N'119', CAST(N'2015-04-22' AS Date), NULL, 0, 1)
INSERT [dbo].[User] ([Id], [UserName], [LoginName], [Password], [CompanyId], [TeamId], [Post], [Supervisor], [PhoneNumber], [WorkStartDate], [Photo], [State], [IsEnable]) VALUES (6, N't2', N'', N'C4CA4238A0B923820DCC509A6F75849B', 1, 1, N'业务', N't1', N'12580', CAST(N'2015-04-22' AS Date), NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserAuthority] ON 

INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (1, 1, N'2.01')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (2, 1, N'2.02')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (3, 1, N'3.01')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (4, 1, N'3.02')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (5, 1, N'2')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (6, 1, N'3')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (7, 1, N'3.03')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (8, 1, N'3.04')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (9, 1, N'4')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (10, 1, N'4.01')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (11, 1, N'4.02')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (12, 1, N'5')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (13, 1, N'5.01')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (14, 1, N'5.02')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (15, 1, N'5.03')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (16, 1, N'6')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (17, 1, N'6.01')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (18, 1, N'6.02')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (19, 1, N'6.03')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (20, 1, N'2.03')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (21, 1, N'2.04')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (22, 1, N'2.05')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (23, 1, N'2.06')
INSERT [dbo].[UserAuthority] ([Id], [UserId], [MenuId]) VALUES (24, 1, N'4.03')
SET IDENTITY_INSERT [dbo].[UserAuthority] OFF
SET IDENTITY_INSERT [dbo].[WorkLog] ON 

INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (22, 1, N'2015-05-16 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2015-05-16T07:14:03.607' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (23, 1, N'2018-04-08 工作日志', N'<b>2018-04-08 工作日志</b>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (24, 1, N'2018-04-08 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (25, 1, N'2015-05-16 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2015-05-16T07:14:03.607' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (26, 1, N'2018-04-08 工作日志', N'<b>2018-04-08 工作日志</b>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (27, 1, N'2018-04-08 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (28, 1, N'2015-05-16 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2015-05-16T07:14:03.607' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (29, 1, N'2018-04-08 工作日志', N'<b>2018-04-08 工作日志</b>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (30, 1, N'2018-04-08 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (31, 1, N'2015-05-16 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2015-05-16T07:14:03.607' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (32, 1, N'2015-05-16 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2015-05-16T07:14:03.607' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (33, 1, N'2018-04-08 工作日志', N'<b>2018-04-08 工作日志</b>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (34, 1, N'2018-04-08 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (35, 1, N'2015-05-16 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2015-05-16T07:14:03.607' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (36, 1, N'2018-04-08 工作日志', N'<b>2018-04-08 工作日志</b>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (37, 1, N'2018-04-08 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (38, 1, N'2015-05-16 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2015-05-16T07:14:03.607' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (39, 1, N'2018-04-08 工作日志', N'<b>2018-04-08 工作日志</b>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (40, 1, N'2018-04-08 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2018-04-08T16:48:43.007' AS DateTime))
INSERT [dbo].[WorkLog] ([Id], [UserId], [Title], [Content], [CreateTime]) VALUES (41, 1, N'2015-05-16 工作日志', N'<ol><li>干什么</li><li>干什么去</li><li>不去干什么</li></ol>', CAST(N'2015-05-16T07:14:03.607' AS DateTime))
SET IDENTITY_INSERT [dbo].[WorkLog] OFF
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_Employee_LoginName]  DEFAULT ('') FOR [LoginName]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_Employee_Password]  DEFAULT ('') FOR [Password]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'法人代表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'Owner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'Website'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'营业执照' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'BusinessLicence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户类型（0=客户单子,1=员工单子,2=商家单子,3=商城单子）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CustomerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CustomerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CustomerPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CustomerQQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Mail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Idcard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家庭住址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'HomeAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属业务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Owner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Contract'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态：(0=未确认,1=已确认,2=已分配,3=已完成,4=已作废)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CreaterId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顾客ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerOperate', @level2type=N'COLUMN',@level2name=N'CustomerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerOperate', @level2type=N'COLUMN',@level2name=N'OperatorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerOperate', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerOperate', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerOperate', @level2type=N'COLUMN',@level2name=N'OperatorTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'MenuName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'MenuUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接PID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'MenuPid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接class' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'SenderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'ReceiverId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息状态（0=未读,1=已读）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'Num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule', @level2type=N'COLUMN',@level2name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule', @level2type=N'COLUMN',@level2name=N'Detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日程表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'团队名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Team', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'负责人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Team', @level2type=N'COLUMN',@level2name=N'Leader'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'负责人电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Team', @level2type=N'COLUMN',@level2name=N'LeaderPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'口号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Team', @level2type=N'COLUMN',@level2name=N'Slogan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Team', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'团队ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'TeamId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Post'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主管' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Supervisor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入职时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'WorkStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserAuthority', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserAuthority', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkLog', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkLog', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkLog', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkLog', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
