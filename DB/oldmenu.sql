INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('个人中心', '#', '2', '0', 'menu1')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('修改密码', './page/PersonCenter/PasswordChange.aspx', '2.01', '2', 'icon icon-pencil')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('公司资料', './page/PersonCenter/CompanyInfo.aspx', '2.02', '2', 'icon icon-signal')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('个人资料', './page/PersonCenter/UserInfo.aspx', '2.03', '2', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('工作日志', './page/PersonCenter/WorkLogList.aspx', '2.04', '2', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('日程管理', './page/PersonCenter/Schedule.aspx', '2.05', '2', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('最新通知', './page/PersonCenter/HotNews.aspx', '2.06', '2', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('公司团队', '#', '3', '0', 'menu2')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('添加公司', './page/Organization/CompanyAdd.aspx', '3.03', '3', 'icon icon-fullscreen')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('公司列表', './page/Organization/CompanyList.aspx', '3.04', '3', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('添加团队', './page/Organization/TeamAdd.aspx', '3.01', '3', 'icon icon-inbox')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('团队列表', './page/Organization/TeamList.aspx', '3.02', '3', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('员工管理', '#', '4', '0', 'menu3')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('添加业务人员', './page/Employee/EmployeeAdd.aspx', '4.01', '4', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('业务人员列表', './page/Employee/EmployeeList.aspx', '4.02', '4', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('设置权限', './page/Employee/Authority.aspx', '4.03', '4', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('客户管理', '#', '5', '0', 'menu4')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('添加客户', './page/Customer/CustomerAdd.aspx', '5.01', '5', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('客户列表', './page/Customer/CustomerList.aspx', '5.02', '5', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('客户回访', './page/Customer/CustomerVisit.aspx', '5.03', '5', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('统计报表', '#', '6', '0', 'menu4')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('公司业绩排行榜', './page/Report/CompanyRankingList.aspx', '6.01', '6', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('团队业绩排行榜', './page/Report/TeamRankingList.aspx', '6.02', '6', NULL)
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('个人业绩排行榜', './page/Report/PersonRankingList.aspx', '6.03', '6', NULL)
GO

