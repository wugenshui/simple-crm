DELETE FROM dbo.Menu




INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('个人中心', '#', '2', '0', 'icon icon-person')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('修改密码', 'PasswordChange', '2.01', '2', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('公司资料', 'CompanyInfo', '2.02', '2', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('个人资料', 'UserInfo', '2.03', '2', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('工作日志', 'WorkLogList', '2.04', '2', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('日程管理', 'Schedule', '2.05', '2', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('最新通知', 'HotNews', '2.06', '2', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('公司团队', '#', '3', '0', 'icon icon-company')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('添加公司', 'CompanyAdd', '3.03', '3', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('公司列表', 'CompanyList', '3.04', '3', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('添加团队', 'TeamAdd', '3.01', '3', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('团队列表', 'TeamList', '3.02', '3', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('员工管理', '#', '4', '0', 'icon icon-user')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('添加业务人员', 'EmployeeAdd', '4.01', '4', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('业务人员列表', 'EmployeeList', '4.02', '4', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('设置权限', 'Authority', '4.03', '4', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('客户管理', '#', '5', '0', 'icon icon-customer')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('添加客户', 'CustomerAdd', '5.01', '5', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('客户列表', 'CustomerList', '5.02', '5', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('客户回访', 'CustomerVisit', '5.03', '5', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('统计报表', '#', '6', '0', 'icon icon-report')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('公司业绩排行榜', 'CompanyRankingList', '6.01', '6', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('团队业绩排行榜', 'TeamRankingList', '6.02', '6', '')
GO

INSERT INTO dbo.Menu (MenuName, MenuUrl, MenuId, MenuPid, Class)
VALUES ('个人业绩排行榜', 'PersonRankingList', '6.03', '6', '')
GO

