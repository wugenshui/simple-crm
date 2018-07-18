UPDATE dbo.Customer SET Owner = '1'


/*
   2018年7月18日22:21:04
   用户: 
   服务器: .
   数据库: CRM
   应用程序: 
*/

/* 为了防止任何可能出现的数据丢失问题，您应该先仔细检查此脚本，然后再在数据库设计器的上下文之外运行此脚本。*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Customer
	(
	Id numeric(18, 0) NOT NULL IDENTITY (1, 1),
	CustomerType int NULL,
	CustomerName nvarchar(50) NULL,
	CustomerPhone nvarchar(50) NULL,
	CustomerQQ nvarchar(50) NULL,
	Mail nvarchar(50) NULL,
	Idcard nvarchar(50) NULL,
	HomeAddress nvarchar(50) NULL,
	OwnerID int NULL,
	Contract nvarchar(50) NULL,
	State int NULL,
	CreateTime datetime NULL,
	CreaterId nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Customer SET (LOCK_ESCALATION = TABLE)
GO
DECLARE @v sql_variant 
SET @v = N'客户类型（0=客户单子,1=员工单子,2=商家单子,3=商城单子）'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'CustomerType'
GO
DECLARE @v sql_variant 
SET @v = N'客户名称'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'CustomerName'
GO
DECLARE @v sql_variant 
SET @v = N'电话'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'CustomerPhone'
GO
DECLARE @v sql_variant 
SET @v = N'QQ'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'CustomerQQ'
GO
DECLARE @v sql_variant 
SET @v = N'邮箱'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'Mail'
GO
DECLARE @v sql_variant 
SET @v = N'身份证号码'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'Idcard'
GO
DECLARE @v sql_variant 
SET @v = N'家庭住址'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'HomeAddress'
GO
DECLARE @v sql_variant 
SET @v = N'所属业务人员ID'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'OwnerID'
GO
DECLARE @v sql_variant 
SET @v = N'合同附件'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'Contract'
GO
DECLARE @v sql_variant 
SET @v = N'状态：(0=未确认,1=已确认,2=已分配,3=已完成,4=已作废)'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'State'
GO
DECLARE @v sql_variant 
SET @v = N'创建时间'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'CreateTime'
GO
DECLARE @v sql_variant 
SET @v = N'创建人ID'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Customer', N'COLUMN', N'CreaterId'
GO
ALTER TABLE dbo.Tmp_Customer ADD CONSTRAINT
	DF_Customer_OwnerID DEFAULT 0 FOR OwnerID
GO
SET IDENTITY_INSERT dbo.Tmp_Customer ON
GO
IF EXISTS(SELECT * FROM dbo.Customer)
	 EXEC('INSERT INTO dbo.Tmp_Customer (Id, CustomerType, CustomerName, CustomerPhone, CustomerQQ, Mail, Idcard, HomeAddress, OwnerID, Contract, State, CreateTime, CreaterId)
		SELECT Id, CustomerType, CustomerName, CustomerPhone, CustomerQQ, Mail, Idcard, HomeAddress, CONVERT(int, Owner), Contract, State, CreateTime, CreaterId FROM dbo.Customer WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Customer OFF
GO
DROP TABLE dbo.Customer
GO
EXECUTE sp_rename N'dbo.Tmp_Customer', N'Customer', 'OBJECT' 
GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	PK_Customer PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
